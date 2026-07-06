package ee.morphe.patches.hypnobox.pro

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val enableProPatch = rawResourcePatch(
    name = "Enable Pro",
    description = "Forces HypnoBox subscription entitlement checks to always pass.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val bundlePath = "assets/js/general/IapHandler.js"
        val bundle = get(bundlePath, true)

        if (!bundle.exists()) {
            throw PatchException("Could not find HypnoBox JS bundle at $bundlePath")
        }

        val bytesResult = runCatching { bundle.readBytes() }
        if (bytesResult.isFailure) {
            val errorName = bytesResult.exceptionOrNull()?.javaClass?.simpleName ?: "UnknownError"
            throw PatchException("Could not read $bundlePath ($errorName)")
        }
        val bytes = bytesResult.getOrThrow()

        if (bytes.contains(0.toByte())) {
            throw PatchException("Cannot patch binary/NUL-encoded file at $bundlePath")
        }

        val textResult = runCatching { bytes.toString(Charsets.UTF_8) }
        if (textResult.isFailure) {
            val errorName = textResult.exceptionOrNull()?.javaClass?.simpleName ?: "UnknownError"
            throw PatchException("Could not decode $bundlePath as UTF-8 ($errorName)")
        }
        val original = textResult.getOrThrow()

        var patched = original
        var coreMutations = 0

        val (afterCheckPatch, checkPatchName) = replaceFunctionBody(
            source = patched,
            functionNames = listOf(
                "IapHandlerClass.checkSubscriptions",
                "checkSubscriptions"
            ),
            replacementBody = """
                refreshFromStore = refreshFromStore || false;

                const storedSubscriptions = StorageHandler.get( STORAGE_SUBSCRIPTION_FILE_NAME );

                if( !subscriptionsToCheck ) {
                    subscriptionsToCheck = [];

                    for( let iapId in storedSubscriptions ) {
                        const storedSubscription = storedSubscriptions[iapId];
                        if( storedSubscription ) subscriptionsToCheck.push( [ storedSubscription.id, iapId, storedSubscription.type ] );
                    }
                }

                const updatedSubscriptions = [];

                for( let subscriptionInfo of subscriptionsToCheck ) {
                    const productId = subscriptionInfo[0];
                    const subscriptionIapID = helperGetIapId( subscriptionInfo[1] );
                    const productType = subscriptionInfo[2];

                    if( !subscriptionIapID ) continue;

                    let activeSubscription = storedSubscriptions[subscriptionIapID];

                    if( !activeSubscription ) {
                        activeSubscription = {
                            needsRefreshing: false,
                            id: productId,
                            type: productType,
                            state: SUBSCRIPTION_NEVERPURCHASED,
                        };
                        storedSubscriptions[subscriptionIapID] = activeSubscription;
                    }

                    activeSubscription.id = productId;
                    activeSubscription.type = productType;
                    activeSubscription.state = SUBSCRIPTION_PURCHASED;
                    activeSubscription.needsRefreshing = false;
                    activeSubscription.purchased = activeSubscription.purchased || new Date().toString();

                    updatedSubscriptions.push( [ productId, subscriptionIapID, true, SUBSCRIPTION_PURCHASED, productType ] );
                }

                StorageHandler.store( STORAGE_SUBSCRIPTION_FILE_NAME );

                if( callback ) callback( true, updatedSubscriptions );

                return updatedSubscriptions.map( function( info ) { return [ info[0], info[1], info[4] ]; } );
            """.trimIndent()
        )
        if (checkPatchName != null) {
            patched = afterCheckPatch
            coreMutations++
        }

        val (afterProductActivePatch, productActivePatchName) = replaceFunctionBody(
            source = patched,
            functionNames = listOf(
                "IapHandlerClass.productActive",
                "productActive"
            ),
            replacementBody = """
                if( isSubscription === true ) {
                    const iapId = helperGetIapId( productIapIds );
                    return iapId ? true : false;
                }

                const product = StorageHandler.get( STORAGE_PRODUCTS_FILE_NAME )[ helperGetIapId( productIapIds ) ];

                if( 
                    product && 
                    product.purchased &&
                    ( !purchasedBefore || new Date( product.purchased ).getTime() < purchasedBefore.getTime() )
                ) {
                    return true;
                }

                return false;
            """.trimIndent()
        )
        if (productActivePatchName != null) {
            patched = afterProductActivePatch
            coreMutations++
        }

        val (afterHasPurchasedPatch, hasPurchasedPatchName) = replaceFunctionBody(
            source = patched,
            functionNames = listOf(
                "IapHandlerClass.hasPurchasedSubscriptions",
                "hasPurchasedSubscriptions"
            ),
            replacementBody = "return true;"
        )
        if (hasPurchasedPatchName != null) {
            patched = afterHasPurchasedPatch
            coreMutations++
        }

        if (coreMutations == 0) {
            throw PatchException(
                "Could not find HypnoBox subscription anchors in $bundlePath"
            )
        }

        if (patched != original) {
            bundle.writeText(patched)
        }
    }
}

private fun replaceFunctionBody(
    source: String,
    functionNames: List<String>,
    replacementBody: String
): Pair<String, String?> {
    for (functionName in functionNames) {
        val openingBraceIndex = findFunctionBodyOpeningBrace(source, functionName) ?: continue

        val closingBraceIndex = findMatchingClosingBrace(source, openingBraceIndex)
        val patched = buildString(source.length - (closingBraceIndex - openingBraceIndex - 1) + replacementBody.length) {
            append(source, 0, openingBraceIndex + 1)
            append(replacementBody)
            append(source, closingBraceIndex, source.length)
        }
        return patched to functionName
    }
    return source to null
}

private fun findFunctionBodyOpeningBrace(source: String, functionName: String): Int? {
    val escapedName = Regex.escape(functionName)
    val declarationPatterns = listOf(
        Regex("""function\s+$escapedName\s*\([^)]*\)\s*\{"""),
        Regex("""\b$escapedName\s*:\s*function\s*\([^)]*\)\s*\{"""),
        Regex("""\b$escapedName\s*=\s*function\s*\([^)]*\)\s*\{"""),
        Regex("""\b(?:const|let|var)\s+$escapedName\s*=\s*\([^)]*\)\s*=>\s*\{"""),
        Regex("""\b$escapedName\s*:\s*\([^)]*\)\s*=>\s*\{"""),
        Regex("""\b$escapedName\s*=\s*\([^)]*\)\s*=>\s*\{"""),
        Regex("""\b$escapedName\s*\([^)]*\)\s*\{""")
    )

    var bestMatchStart = Int.MAX_VALUE
    var bestOpeningBraceIndex: Int? = null

    for (pattern in declarationPatterns) {
        val match = pattern.find(source) ?: continue
        val braceOffset = match.value.lastIndexOf('{')
        if (braceOffset < 0) continue

        val openingBraceIndex = match.range.first + braceOffset
        if (match.range.first < bestMatchStart) {
            bestMatchStart = match.range.first
            bestOpeningBraceIndex = openingBraceIndex
        }
    }

    return bestOpeningBraceIndex
}

private fun findMatchingClosingBrace(source: String, openingBraceIndex: Int): Int {
    if (openingBraceIndex !in source.indices || source[openingBraceIndex] != '{') {
        throw PatchException("Expected '{' at index $openingBraceIndex while patching JS bundle.")
    }

    var depth = 0
    var index = openingBraceIndex

    var inSingleQuote = false
    var inDoubleQuote = false
    var inTemplateQuote = false
    var inLineComment = false
    var inBlockComment = false

    while (index < source.length) {
        val current = source[index]
        val next = if (index + 1 < source.length) source[index + 1] else '\u0000'

        when {
            inLineComment -> {
                if (current == '\n' || current == '\r') {
                    inLineComment = false
                }
                index++
            }

            inBlockComment -> {
                if (current == '*' && next == '/') {
                    inBlockComment = false
                    index += 2
                } else {
                    index++
                }
            }

            inSingleQuote -> {
                if (current == '\\') {
                    index += 2
                } else {
                    if (current == '\'') {
                        inSingleQuote = false
                    }
                    index++
                }
            }

            inDoubleQuote -> {
                if (current == '\\') {
                    index += 2
                } else {
                    if (current == '"') {
                        inDoubleQuote = false
                    }
                    index++
                }
            }

            inTemplateQuote -> {
                if (current == '\\') {
                    index += 2
                } else {
                    if (current == '`') {
                        inTemplateQuote = false
                    }
                    index++
                }
            }

            current == '/' && next == '/' -> {
                inLineComment = true
                index += 2
            }

            current == '/' && next == '*' -> {
                inBlockComment = true
                index += 2
            }

            current == '\'' -> {
                inSingleQuote = true
                index++
            }

            current == '"' -> {
                inDoubleQuote = true
                index++
            }

            current == '`' -> {
                inTemplateQuote = true
                index++
            }

            current == '{' -> {
                depth++
                index++
            }

            current == '}' -> {
                depth--
                if (depth == 0) {
                    return index
                }
                index++
            }

            else -> index++
        }
    }

    throw PatchException(
        "Could not find the closing brace for JS function body starting at index $openingBraceIndex."
    )
}
