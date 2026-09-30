/*
 * Auto Expand for X
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.autoexpand.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.Locale
import java.util.logging.Logger

private const val EXTENSION = "Lapp/morphe/extension/autoexpand"
private const val CURSOR_CLASS = "$EXTENSION/AutoExpandCursor;"
private const val GAP_FILL_CLASS = "$EXTENSION/GapFill;"
private const val OBJECT_TYPE = "Ljava/lang/Object;"
private const val STRING_TYPE = "Ljava/lang/String;"
private const val GAP_VIEW = "Lcom/twitter/android/widget/GapView;"

/** 動作を確かめたのは、この版だけ。 */
private val X =
    Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "12.19.1-release.0")),
    )

/** アプリの onCreate。アプリ自身のコードが最初に動く所。 */
private object AppCreatedFingerprint : Fingerprint(
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    custom = { _, classDef -> classDef.superclass == "Landroid/app/Application;" },
)

// タイムラインのギャップは、古い仕組みの部品で描かれる。GapView は名前の短縮 (難読化) の
// 後も名前が残るが、クリックの処理を持つバインダーは名前が変わってしまう。
//
// ラベルはコンストラクタで読むレイアウトの属性から付き、バインダーがラベルを設定する
// メソッドを呼ぶのはサーバーから送られたラベルの時だけである。そのため、ギャップが画面に
// 付くのを拡張が見張れるのは、部品が作られた時点になる。
private object GapViewConstructorFingerprint : Fingerprint(
    definingClass = GAP_VIEW,
    name = "<init>",
)

private object GapViewLabelFingerprint : Fingerprint(
    definingClass = GAP_VIEW,
    name = "setGapTextView",
)

// バインダーはバインドのたびにスピナーを設定する。一覧がその場で使い回した行に気付けるのは
// ここだけである。取得が始まった時や終わった時にも、バインドされたままの行すべてに対して
// (画面の中でも外でも) 設定する。
private object GapViewSpinnerFingerprint : Fingerprint(
    definingClass = GAP_VIEW,
    name = "setSpinnerActive",
)

// バインダーがギャップの行をバインドする所。ギャップのカーソルが取得中かを調べ、それに合わせて
// スピナーを設定し、続けてクリックの処理を設定する。一覧は行を別のギャップに使い回すが、
// それが分かるのはカーソルだけである。
private object GapBindFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.implementation?.instructions?.let { code ->
            code.any { it.callsGapView("setSpinnerActive") } &&
                code.any { it.opcode == Opcode.INVOKE_VIRTUAL && it.ref<MethodReference>()?.name == "setOnClickListener" }
        } == true
    },
)

// タイムラインのギャップをタップした時の処理。エラー報告にこの文言が残っている。中身には、
// 取得に要る型がすべて出てくる。ギャップの項目とそのカーソル、カーソルから作る取得の指示、
// 一覧の取得の経路、取得中のカーソルの記録である。
private object GapClickFingerprint : Fingerprint(
    name = "onClick",
    strings = listOf("ANDROID-27052: Handling gap click with null gap view"),
)

// 一覧が新しい項目を受け取る所。ここで報告する読み込みの状態は名前が残っている。項目を
// 渡す先のメソッドは、ホームのタイムラインを含む、すべての一覧で共通である。
private object ListItemsLoadedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters =
        listOf(
            fieldAccess(name = "loaded", opcode = Opcode.SGET_OBJECT),
            fieldAccess(name = "active", opcode = Opcode.SGET_OBJECT, location = InstructionLocation.MatchAfterImmediately()),
        ),
)

// タイムラインのカーソルの全行を、読み込みのスレッドで、項目になる前に一度ずつ読む所。
private object TimelineRowsReadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("ads_spacing_client_fallback_minimum_spacing", "ranked_following"),
)

private val logger = Logger.getLogger("AutoExpandPatch")

/**
 * パッチの管理アプリ (Manager) が動いている端末の言語に合わせて、文章を選ぶ。Manager は
 * バンドルを読み込む時に、文章も含めてパッチを組み立てるので、文章は端末の言語設定に従う。
 * パッチ名とオプションのキーは、どちらの言語でも同じ。
 */
private fun text(japanese: String, english: String) = if (Locale.getDefault().language == "ja") japanese else english

@Suppress("unused")
val autoExpandPatch =
    bytecodePatch(
        name = "Auto expand hidden posts (standalone)",
        description =
            text(
                "「ポストをさらに表示」の中身をタイムラインの読み込み時に裏で取得し、ボタンを非表示にします。",
                "Fetches the posts behind \"Show more posts\" in the background as a timeline loads, and hides the button.",
            ),
    ) {
        val hideGaps by booleanOption(
            key = "hideGaps",
            default = true,
            title = text("「ポストをさらに表示」を隠す", "Hide \"Show more posts\""),
            description =
                text(
                    "X は読み込むものが無くなってもボタンを残すため、裏での取得が動いている時はボタンを非表示にします。",
                    "X keeps the button even when nothing is left to load, so it is hidden while background loading runs.",
                ),
        )
        val logToFile by booleanOption(
            key = "logToFile",
            default = false,
            title = text("診断ログを記録する", "Record a diagnostic log"),
            description =
                text(
                    "ギャップの処理内容を Download/AutoExpand/AutoExpand-Log.txt に追記します。" +
                        "X を入れ直した後は AutoExpand-Log-2.txt のように番号の付いたファイルに書きます。",
                    "Adds what is done with each gap to Download/AutoExpand/AutoExpand-Log.txt. " +
                        "Once X is installed again, it writes to a numbered file such as AutoExpand-Log-2.txt.",
                ),
        )
        val showToasts by booleanOption(
            key = "showToasts",
            default = false,
            title = text("動作時にトーストを表示する", "Show toasts"),
            description =
                text(
                    "裏でポストを取得した時や、ボタンを隠した時・自動でタップして読み込んだ時に、画面に短いメッセージを出します。",
                    "Shows a short message when posts are loaded in the background, when the button is hidden, " +
                        "or when an automatic tap loads posts.",
                ),
        )
        val tapOnly by booleanOption(
            key = "tapOnly",
            default = false,
            title = text("裏での取得を使わず、自動タップだけにする", "Tap only, without background loading"),
            description =
                text(
                    "裏での取得に問題がある時の予備です。ボタンの行が画面の端に入った時点で自動でタップし、" +
                        "読み込みが始まったのを確かめてから隠します。",
                    "A fallback for when background loading has trouble. The button is tapped as soon as its row " +
                        "reaches the edge of the screen, and hidden once loading has started.",
                ),
        )

        compatibleWith(X)
        extendWith("extensions/autoexpand.mpe")

        execute {
            setPlaceholder(CURSOR_CLASS, "autoexpand:opt:hideGaps", (hideGaps == true).toString())
            setPlaceholder(CURSOR_CLASS, "autoexpand:opt:logToFile", (logToFile == true).toString())
            setPlaceholder(CURSOR_CLASS, "autoexpand:opt:showToasts", (showToasts == true).toString())
            setPlaceholder(CURSOR_CLASS, "autoexpand:opt:tapOnly", (tapOnly == true).toString())

            // ギャップの部品が無いと何もできないので、これだけは必ず見つかる必要がある。
            val gapView =
                GapViewConstructorFingerprint.methodOrNull
                    ?: throw PatchException("GapView was not found in this version of X")
            listOfNotNull(
                Triple(gapView, "p0", "onGapCreated(Ljava/lang/Object;)V"),
                GapViewLabelFingerprint.methodOrNull?.let { Triple(it, "p0", "onGapShown(Ljava/lang/Object;)V") },
                GapViewSpinnerFingerprint.methodOrNull?.let {
                    Triple(it, "p0, p1", "onGapSpinner(Ljava/lang/Object;Z)V")
                },
            ).forEach { (method, registers, callback) ->
                val returnIndex = method.instructions.last { it.opcode == Opcode.RETURN_VOID }.location.index
                method.addInstruction(returnIndex, "invoke-static {$registers}, $CURSOR_CLASS->$callback")
            }

            // これが無いと、一覧から外れて戻ってきた行を別のギャップとみなす。タップが
            // 1回無駄になるが、何かを隠してしまうことはない。
            try {
                hookGapBind()
            } catch (ex: Exception) {
                logger.warning("Gap bind hook skipped: $ex")
            }

            // 自動タップを予備として残すので、裏の取得が読み取れない版でも、パッチ全体を
            // 失敗させずに自動タップが使える。
            try {
                hookGapFill()
            } catch (ex: Exception) {
                logger.warning("Background gap fill skipped: $ex")
            }

            // 起動ごとにログへ1行書く。ログが無いのか、フックが動いていないのかを見分けるため。
            AppCreatedFingerprint.methodOrNull?.addInstruction(
                0,
                "invoke-static/range {p0 .. p0}, $CURSOR_CLASS->onAppStart(Ljava/lang/Object;)V",
            )
        }
    }

private inline fun <reified T : Reference> Instruction.ref(): T? = (this as? ReferenceInstruction)?.reference as? T

private fun Instruction.callsGapView(name: String) =
    opcode == Opcode.INVOKE_VIRTUAL &&
        ref<MethodReference>()?.let { it.definingClass == GAP_VIEW && it.name == name } == true

/** 型の記述子を、Class.forName に渡す Java の名前に直す。 */
private fun javaName(descriptor: String) = descriptor.substring(1, descriptor.length - 1).replace('/', '.')

/**
 * 拡張の中の仮の文字列を、それが表す値に置き換える。拡張はこれらを値として渡すだけなので、
 * R8 が畳み込むものは無い。
 */
private fun BytecodePatchContext.setPlaceholder(
    extensionClass: String,
    placeholder: String,
    value: String,
) {
    val method =
        object : Fingerprint(definingClass = extensionClass, strings = listOf(placeholder)) {}.methodOrNull
            ?: throw PatchException("Placeholder $placeholder is missing from the extension")
    val index =
        method.instructions.indexOfFirst {
            (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                it.ref<StringReference>()?.string == placeholder
        }
    val register = (method.instructions.elementAt(index) as OneRegisterInstruction).registerA
    method.replaceInstruction(index, "const-string v$register, \"$value\"")
}

/**
 * 行がどのギャップにバインドされたかを拡張に知らせ、別のギャップに使い回された行を
 * やり直せるようにする。ギャップはカーソルで見分ける。カーソルは、バインダーがスピナーを
 * 設定する直前に、取得中かを調べる処理へ渡している。
 */
private fun BytecodePatchContext.hookGapBind() {
    fun skip(reason: String) = logger.warning("Gap bind hook skipped: $reason")

    val bind = GapBindFingerprint.methodOrNull ?: return skip("gap binder not found")
    val code: List<Instruction> = bind.instructions.toList()
    val spinnerIndex = code.indexOfFirst { it.callsGapView("setSpinnerActive") }
    val spinner = code[spinnerIndex] as FiveRegisterInstruction
    val gapRegister = spinner.registerC

    // setSpinnerActive(check(cursor)) の形。取得中かの確認、その結果、スピナーの設定の順に並ぶ。
    val result = code.getOrNull(spinnerIndex - 1)
    if (result?.opcode != Opcode.MOVE_RESULT || (result as OneRegisterInstruction).registerA != spinner.registerD) {
        return skip("spinner state is not a call's result")
    }
    val checkIndex = spinnerIndex - 2
    val check = code.getOrNull(checkIndex)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }
    val checkMethod = check?.ref<MethodReference>()
    if (checkMethod == null || checkMethod.returnType != "Z" || checkMethod.parameterTypes.size != 1) {
        return skip("in-flight check not found")
    }
    val cursorRegister = (check as FiveRegisterInstruction).registerD
    val cursorType = checkMethod.parameterTypes.single().toString()

    // 呼び出しは確認の前に差し込む。その時点で両方のレジスタに想定どおりの値が入って
    // いないと、メソッドが検証 (verify) を通らなくなる。
    val before = code.subList(0, checkIndex)
    if (before.any { it.opcode.name.startsWith("IF_") || it.opcode.name.startsWith("GOTO") }) {
        return skip("gap binder branches before the check")
    }
    fun loadedAs(register: Int, type: String) =
        before
            .lastOrNull {
                val written = (it as? OneRegisterInstruction)?.registerA
                it.opcode.setsRegister() &&
                    (written == register || (it.opcode.setsWideRegister() && written == register - 1))
            }?.takeIf { it.opcode == Opcode.IGET_OBJECT }
            ?.ref<FieldReference>()
            ?.type == type
    if (!loadedAs(gapRegister, GAP_VIEW)) return skip("gap view register")
    if (!loadedAs(cursorRegister, cursorType)) return skip("cursor register")
    if (gapRegister > 15 || cursorRegister > 15) return skip("registers out of reach")

    bind.addInstruction(
        checkIndex,
        "invoke-static {v$gapRegister, v$cursorRegister}, $CURSOR_CLASS->onGapBound(Ljava/lang/Object;Ljava/lang/Object;)V",
    )
    logger.info("Gap bind hooked: ${bind.definingClass}->${bind.name}, cursor $cursorType")
}

/**
 * タイムラインのギャップを、画面に出る前に拡張が取得できるようにする。何かを変える前に
 * すべての名前を解決するので、読み取れない版はそのままの状態で残る。
 */
private fun BytecodePatchContext.hookGapFill() {
    fun skip(reason: String) = logger.warning("Background gap fill skipped: $reason")

    val click = GapClickFingerprint.methodOrNull ?: return skip("gap tap handler not found")
    val clickCode: List<Instruction> = click.instructions.toList()

    val emitIndex =
        clickCode.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_INTERFACE &&
                instruction.ref<MethodReference>()?.let {
                    it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT_TYPE)
                } == true
        }
    if (emitIndex < 0) return skip("fetch channel call not found")
    val emit = clickCode[emitIndex].ref<MethodReference>()!!
    val beforeEmit = clickCode.subList(0, emitIndex)

    val channelField =
        beforeEmit.lastOrNull { it.opcode == Opcode.IGET_OBJECT }?.ref<FieldReference>()
            ?: return skip("fetch channel field not found")
    val fetchClass =
        beforeEmit.lastOrNull { it.opcode == Opcode.NEW_INSTANCE }?.ref<TypeReference>()?.type
            ?: return skip("fetch descriptor not found")
    val cursorClass =
        beforeEmit.firstNotNullOfOrNull { instruction ->
            instruction
                .takeIf { it.opcode == Opcode.INVOKE_DIRECT }
                ?.ref<MethodReference>()
                ?.takeIf { it.definingClass == fetchClass && it.name == "<init>" && it.parameterTypes.size == 1 }
                ?.parameterTypes
                ?.first()
                ?.toString()
        } ?: return skip("fetch descriptor constructor not found")

    val gapItemCursor = fieldRead(clickCode) { it.type == cursorClass } ?: return skip("gap item cursor not found")
    val cursorKey =
        fieldRead(clickCode) { it.definingClass == cursorClass && it.type == STRING_TYPE }
            ?: return skip("cursor key not found")

    val inFlightIndex =
        clickCode.indexOfFirst {
            it.opcode == Opcode.IGET_OBJECT && it.ref<FieldReference>()?.type == "Ljava/util/LinkedHashSet;"
        }
    if (inFlightIndex !in 0 until emitIndex) return skip("in-flight record not found")
    val inFlight = clickCode[inFlightIndex].ref<FieldReference>()!!
    val binderRepository =
        fieldRead(clickCode) { it.definingClass == channelField.definingClass && it.type == inFlight.definingClass }
            ?: return skip("binder repository not found")
    val inFlightKeyClass =
        clickCode.subList(inFlightIndex, emitIndex).firstNotNullOfOrNull { instruction ->
            instruction
                .takeIf { it.opcode == Opcode.INVOKE_DIRECT }
                ?.ref<MethodReference>()
                ?.takeIf { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(STRING_TYPE) }
                ?.definingClass
        } ?: return skip("in-flight key not found")

    val loaded = ListItemsLoadedFingerprint.methodOrNull ?: return skip("list load handler not found")
    // 条件は2つの列挙定数の名前だけなので、取得の経路を持つ一覧であることを確かめる。
    if (classDefByOrNull(loaded.definingClass)?.fields?.none { it.type == channelField.type } != false) {
        return skip("list load handler ${loaded.definingClass} has no fetch channel")
    }
    val itemsClass = loaded.parameterTypes.singleOrNull()?.toString() ?: return skip("list load handler parameters")
    val handOff =
        loaded.instructions.firstNotNullOfOrNull { instruction ->
            instruction
                .takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }
                ?.ref<MethodReference>()
                ?.takeIf {
                    it.definingClass == loaded.definingClass && it.name != loaded.name && it.returnType == "V" &&
                        it.parameterTypes.map(CharSequence::toString) == listOf(itemsClass)
                }
        } ?: return skip("list item hand-off not found")
    val handOffMethod =
        mutableClassDefBy(loaded.definingClass).methods.firstOrNull {
            it.name == handOff.name && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(itemsClass)
        } ?: return skip("list item hand-off method not found")

    val itemsMethods = classDefByOrNull(itemsClass)?.methods ?: return skip("item collection $itemsClass not found")
    val itemAt =
        itemsMethods.singleOrNull {
            it.returnType == OBJECT_TYPE && it.parameterTypes.map(CharSequence::toString) == listOf("I")
        } ?: return skip("item accessor not found")
    val size =
        itemsMethods.singleOrNull { it.returnType == "I" && it.parameterTypes.isEmpty() }
            ?: return skip("item count not found")

    val rowsRead = TimelineRowsReadFingerprint.methodOrNull ?: return skip("timeline row reader not found")
    val rowCode: List<Instruction> = rowsRead.instructions.toList()
    val typeColumn =
        rowCode
            .asSequence()
            .filter { it.opcode == Opcode.SGET }
            .mapNotNull { it.ref<FieldReference>()?.definingClass }
            .distinct()
            .firstNotNullOfOrNull { columnIndexField(it, "timeline_data_type") }
            ?: return skip("row type column not found")
    val typeReads =
        rowCode.indices.filter { index ->
            rowCode[index].opcode == Opcode.SGET &&
                rowCode[index].ref<FieldReference>()?.let {
                    it.definingClass == typeColumn.definingClass && it.name == typeColumn.name
                } == true
        }
    // 位置は読んだ回数を数えて出すので、この列は1行につきちょうど1回読まれる必要がある。
    val typeRead = typeReads.singleOrNull() ?: return skip("row type read ${typeReads.size} times")
    val columnRegister = (rowCode[typeRead] as? OneRegisterInstruction)?.registerA ?: return skip("row type column register")
    val getIntIndex =
        (typeRead + 1 until rowCode.size).firstOrNull { index ->
            rowCode[index].opcode == Opcode.INVOKE_INTERFACE &&
                rowCode[index].ref<MethodReference>()?.name == "getInt"
        } ?: return skip("row type getInt not found")
    if ((rowCode[getIntIndex] as? FiveRegisterInstruction)?.registerD != columnRegister) {
        return skip("row type getInt reads another column")
    }
    val typeRegister =
        (rowCode.getOrNull(getIntIndex + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction)
            ?.registerA ?: return skip("row type result not found")

    // すべての名前が分かった。ここで初めて書き換えを始める。
    mapOf(
        "autoexpand:gap:fetchClass" to javaName(fetchClass),
        "autoexpand:gap:cursorClass" to javaName(cursorClass),
        "autoexpand:gap:gapItemClass" to javaName(gapItemCursor.definingClass),
        "autoexpand:gap:gapItemCursorField" to gapItemCursor.name,
        "autoexpand:gap:cursorKeyField" to cursorKey.name,
        "autoexpand:gap:channelClass" to javaName(channelField.type),
        "autoexpand:gap:emitClass" to javaName(emit.definingClass),
        "autoexpand:gap:emitMethod" to emit.name,
        "autoexpand:gap:binderClass" to javaName(channelField.definingClass),
        "autoexpand:gap:binderChannelField" to channelField.name,
        "autoexpand:gap:binderRepositoryField" to binderRepository.name,
        "autoexpand:gap:repositoryClass" to javaName(inFlight.definingClass),
        "autoexpand:gap:repositoryInFlightField" to inFlight.name,
        "autoexpand:gap:inFlightKeyClass" to javaName(inFlightKeyClass),
        "autoexpand:gap:itemsClass" to javaName(itemsClass),
        "autoexpand:gap:itemAtMethod" to itemAt.name,
        "autoexpand:gap:sizeMethod" to size.name,
    ).forEach { (placeholder, name) -> setPlaceholder(GAP_FILL_CLASS, placeholder, name) }

    // 範囲指定の呼び出しなら、この版のメソッドがどのレジスタ番号を使っていても動く。
    // 後ろ側を先に差し込むので、前側の位置はずれない。
    rowsRead.addInstruction(
        getIntIndex + 2,
        "invoke-static/range {v$typeRegister .. v$typeRegister}, $GAP_FILL_CLASS->onRowType(I)V",
    )
    rowsRead.addInstruction(0, "invoke-static/range {p0 .. p0}, $GAP_FILL_CLASS->onRowsStart(Ljava/lang/Object;)V")

    handOffMethod.addInstruction(
        0,
        "invoke-static/range {p0 .. p1}, $GAP_FILL_CLASS->onItems(Ljava/lang/Object;Ljava/lang/Object;)V",
    )

    mutableClassDefBy(channelField.definingClass).methods.filter { it.name == "<init>" }.forEach { constructor ->
        constructor.instructions
            .withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
            .reversed()
            .forEach { index ->
                constructor.addInstruction(
                    index,
                    "invoke-static/range {p0 .. p0}, $GAP_FILL_CLASS->onBinderCreated(Ljava/lang/Object;)V",
                )
            }
    }

    logger.info(
        "Background gap fill hooked: rows ${rowsRead.definingClass}->${rowsRead.name}, " +
            "items ${handOffMethod.definingClass}->${handOffMethod.name}",
    )
}

private fun fieldRead(
    code: List<Instruction>,
    predicate: (FieldReference) -> Boolean,
): FieldReference? =
    code.firstNotNullOfOrNull { instruction ->
        instruction.takeIf { it.opcode == Opcode.IGET_OBJECT }?.ref<FieldReference>()?.takeIf(predicate)
    }

/** 列の一覧のクラスは、各列の番号を static な int に持ち、列名を調べた直後に代入している。 */
private fun BytecodePatchContext.columnIndexField(
    projection: String,
    column: String,
): FieldReference? {
    val initializer = classDefByOrNull(projection)?.methods?.firstOrNull { it.name == "<clinit>" } ?: return null
    val code = initializer.instructions.toList()
    val nameIndex =
        code.indexOfFirst {
            (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                it.ref<StringReference>()?.string == column
        }
    if (nameIndex < 0) return null
    return code.drop(nameIndex).firstOrNull { it.opcode == Opcode.SPUT }?.ref<FieldReference>()
}
