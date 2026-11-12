package app.dongmin8350.patches.fmkorea

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private object MainWebViewStartedFingerprint : Fingerprint(
    name = "onPageStarted",
    returnType = "V",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Ljava/lang/String;",
        "Landroid/graphics/Bitmap;"
    ),
    strings = listOf("onPageStarted-external")
)

private const val EARLY_AD_HIDE_SCRIPT = "(function(){var d=document,s=d.getElementById('dongmin-prehide');if(!s){s=d.createElement('style');s.id='dongmin-prehide';s.textContent=`.fmad_wrapper,div[id^=fmad_]+div[style^=height][class],div[id^=fm_read_vote_sq_],.adpost{display:none!important;height:0!important;min-height:0!important;max-height:0!important;margin:0!important;padding:0!important;border:0!important;overflow:hidden!important}`;(d.head||d.documentElement).appendChild(s)}})()"

private val BLOCKED_AD_URL_PARTS = listOf(
    "doubleclick.net",
    "googlesyndication.com",
    "googleadservices.com",
    "adservice.google.com",
    "adnmore.co.kr",
    "adison.co",
    "m.fmkorea.com/_adpage/",
    "loader.fmkorea.com/",
    "loader2.fmkorea.com/_myphp/adpost/content_new.php",
    "static.fmkorea.com/modules/fmad/tpl/",
    "naver_power_link",
    "image.fmkorea.com/images/ad/",
    "module=fmad",
    "act=procFmad"
)

private fun buildUrlChecks(urlRegister: String, tempRegister: String, resultRegister: String): String =
    BLOCKED_AD_URL_PARTS.joinToString("\n") { part ->
        """
        const-string $tempRegister, "$part"
        invoke-virtual { $urlRegister, $tempRegister }, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
        move-result $resultRegister
        if-nez $resultRegister, :block
        """.trimIndent()
    }

/**
 * Removes FMKorea web advertising without requiring AdGuard.
 *
 * v1.3.5 keeps the initial fmad slot at zero with a Smali-safe minimal early CSS script, while the full List-KR-style cleanup remains in custom.css/custom.js.
 */
@Suppress("unused")
val collapseFmkoreaAdSpacesPatch = patch(
    name = "Remove FMKorea ads and spaces",
    description = "Makes FMKorea ad slots zero-height from initial page/layout setup, blocks ad requests, and removes fallback containers without AdGuard.",
    default = false
) {
    compatibleWith(FMKOREA_COMPATIBILITY)

    execute {
        val scriptFile = resourceFile("assets/custom.js")
        val cssFile = resourceFile("assets/custom.css")

        if (!scriptFile.isFile || !cssFile.isFile) {
            throw PatchException(
                "FMKorea custom WebView CSS/JS hooks were not found; this app version needs inspection."
            )
        }

        val originalScript = scriptFile.readText()
        if (!originalScript.contains("FMAppBridge") || !originalScript.contains("fmapp")) {
            throw PatchException(
                "Unrecognized FMKorea custom.js; refusing to replace an unrelated asset."
            )
        }

        val previousJsBlock = Regex(
            "// FMKOREA_AD_SPACES_BEGIN[^\\n]*[\\s\\S]*?// FMKOREA_AD_SPACES_END"
        )
        val previousCssBlock = Regex(
            "/\\* FMKOREA_AD_CSS_BEGIN[^*]*\\*/[\\s\\S]*?/\\* FMKOREA_AD_CSS_END \\*/"
        )

        val cleanScript = originalScript.replace(previousJsBlock, "").trimEnd()
        val cleanCss = cssFile.readText().replace(previousCssBlock, "").trimEnd()

        scriptFile.writeText(cleanScript + "\n\n" + FMKOREA_AD_SPACE_SCRIPT + "\n")
        cssFile.writeText(cleanCss + "\n\n" + FMKOREA_AD_CSS + "\n")

        val clientClass = MainWebViewStartedFingerprint.classDef
        val onPageStarted = MainWebViewStartedFingerprint.method.addFreeRegisters(2).first
        onPageStarted.addInstructions(
            0,
            """
                const-string v0, "$EARLY_AD_HIDE_SCRIPT"
                const/4 v1, 0x0
                invoke-virtual { p1, v0, v1 }, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
            """
        )

        resourceXml("res/layout/admob_empty_layout.xml").use { layout ->
            layout.root.setAttribute("android:layout_width", "0dp")
            layout.root.setAttribute("android:layout_height", "0dp")
            layout.root.setAttribute("android:visibility", "gone")
        }

        resourceXml("res/layout/activity_main.xml").use { layout ->
            layout.elements().forEach { element ->
                val id = element.attribute("android:id").orEmpty().lowercase()
                val tag = element.tag.lowercase()
                val nativeAdSlot =
                    tag.endsWith(".adview") ||
                    id.contains("admob") ||
                    id.contains("ad_view") ||
                    id.contains("adview") ||
                    id.contains("ad_container") ||
                    id.contains("banner_ad")

                if (nativeAdSlot) {
                    element.setAttribute("android:layout_width", "0dp")
                    element.setAttribute("android:layout_height", "0dp")
                    element.setAttribute("android:minHeight", "0dp")
                    element.setAttribute("android:visibility", "gone")

                    element.parent?.let { parent ->
                        parent.setAttribute("android:layout_width", "0dp")
                        parent.setAttribute("android:layout_height", "0dp")
                        parent.setAttribute("android:minHeight", "0dp")
                        parent.setAttribute("android:visibility", "gone")
                    }
                }
            }
        }


        fun addRequestInterceptor(parameterType: String, urlSetup: String, superCall: String) {
            if (clientClass.methods.any { method ->
                    method.name == "shouldInterceptRequest" &&
                        method.parameterTypes.map { it.toString() } == listOf(
                            "Landroid/webkit/WebView;",
                            parameterType
                        )
                }
            ) {
                throw PatchException(
                    "FMKorea now implements shouldInterceptRequest itself; inspect the new version before patching."
                )
            }

            clientClass.methods.add(
                ImmutableMethod(
                    clientClass.type,
                    "shouldInterceptRequest",
                    listOf(
                        ImmutableMethodParameter("Landroid/webkit/WebView;", null, null),
                        ImmutableMethodParameter(parameterType, null, null)
                    ),
                    "Landroid/webkit/WebResourceResponse;",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(8)
                ).toMutable().apply {
                    addInstructionsWithLabels(
                        0,
                        """
                            $urlSetup
                            if-eqz v1, :allow
                            ${buildUrlChecks("v1", "v2", "v3")}

                            :allow
                            $superCall
                            move-result-object v0
                            return-object v0

                            :block
                            new-instance v0, Landroid/webkit/WebResourceResponse;
                            const-string v1, "text/plain"
                            const-string v2, "UTF-8"
                            const/4 v3, 0x0
                            new-array v3, v3, [B
                            new-instance v4, Ljava/io/ByteArrayInputStream;
                            invoke-direct { v4, v3 }, Ljava/io/ByteArrayInputStream;-><init>([B)V
                            invoke-direct { v0, v1, v2, v4 }, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
                            return-object v0
                        """
                    )
                }
            )
        }

        addRequestInterceptor(
            "Landroid/webkit/WebResourceRequest;",
            """
                invoke-interface { p2 }, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :allow
                invoke-virtual { v0 }, Landroid/net/Uri;->toString()Ljava/lang/String;
                move-result-object v1
            """.trimIndent(),
            "invoke-super { p0, p1, p2 }, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;"
        )

        addRequestInterceptor(
            "Ljava/lang/String;",
            "move-object v1, p2",
            "invoke-super { p0, p1, p2 }, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;"
        )
    }
}

internal val FMKOREA_AD_CSS = """
/* FMKOREA_AD_CSS_BEGIN v1.3.4 */
[class$="_ad"],
div[class^="ad"],
div[id^="ad"],
.fmad_wrapper,
div[id^="fmad_"] + div[style^="height:"][class],
div[id^="fm_read_vote_sq_"],
.adpost,
ins.adsbygoogle,
[id^="google_ads_"],
iframe[src*="doubleclick.net"],
iframe[src*="googlesyndication.com"],
iframe[src*="googleadservices.com"],
iframe[src*="adnmore.co.kr"],
iframe[src*="adison.co"],
iframe[src*="m.fmkorea.com/_adpage/"],
iframe[src*="loader.fmkorea.com/"][src*="_loader/"],
iframe[src*="loader2.fmkorea.com/_myphp/adpost/content_new.php"],
.fm_vote ~ div[style*="max-width:"],
.rd_ft > div[style^="margin:"][style*="max-width:"],
[data-dongmin-fmkorea-ad-space] {
    display: none !important;
    height: 0 !important;
    min-height: 0 !important;
    max-height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    overflow: hidden !important;
}

/*
 * This is the cosmetic rule that previously removed the user's persistent
 * article-footer ad gap. Keep vote/navigation/button/sign controls intact.
 */
.rd_ft > div:not(.rd_vote):not([class*="vote"]):not([class*="nav"]):not([class*="btn"]):not([class*="sign"]) {
    display: none !important;
    height: 0 !important;
    min-height: 0 !important;
    max-height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    overflow: hidden !important;
}
/* FMKOREA_AD_CSS_END */
""".trimIndent()

internal val FMKOREA_AD_SPACE_SCRIPT = """
// FMKOREA_AD_SPACES_BEGIN v1.3.4
(function () {
    'use strict';

    if (!/(^|\.)fmkorea\.com$/.test(location.hostname)) return;
    if (window.__dongminFmkoreaAdsV134) return;
    window.__dongminFmkoreaAdsV134 = true;

    var marker = 'data-dongmin-fmkorea-ad-space';
    var styleId = 'dongmin-fmkorea-ad-spaces-style-v134';
    var queued = false;

    var collapsedStyle = {
        'display': 'none',
        'height': '0px',
        'min-height': '0px',
        'max-height': '0px',
        'margin': '0px',
        'padding': '0px',
        'border': '0px',
        'overflow': 'hidden'
    };

    var hardAdSelector = [
        '[class$="_ad"]',
        'div[class^="ad"]',
        'div[id^="ad"]',
        '.fmad_wrapper',
        'div[id^="fmad_"] + div[style^="height:"][class]',
        'div[id^="fm_read_vote_sq_"]',
        '.adpost',
        'ins.adsbygoogle',
        '[id^="google_ads_"]',
        'iframe[src*="doubleclick.net"]',
        'iframe[src*="googlesyndication.com"]',
        'iframe[src*="googleadservices.com"]',
        'iframe[src*="adnmore.co.kr"]',
        'iframe[src*="adison.co"]',
        'iframe[src*="m.fmkorea.com/_adpage/"]',
        'iframe[src*="loader.fmkorea.com/"][src*="_loader/"]',
        'iframe[src*="loader2.fmkorea.com/_myphp/adpost/content_new.php"]',
        '.fm_vote ~ div[style*="max-width:"]',
        '.rd_ft > div[style^="margin:"][style*="max-width:"]'
    ].join(',');

    var protectedSelector = [
        '#comment',
        '#bd_capture',
        'form[action="./"]',
        '.rd_vote',
        '[class*="vote"]',
        '[class*="nav"]',
        '[class*="btn"]',
        '[class*="sign"]'
    ].join(',');

    function collapse(node) {
        if (!node || node.nodeType !== 1) return;
        if (!node.hasAttribute(marker)) node.setAttribute(marker, '');

        Object.keys(collapsedStyle).forEach(function (property) {
            var value = collapsedStyle[property];
            if (node.style.getPropertyValue(property) !== value ||
                node.style.getPropertyPriority(property) !== 'important') {
                node.style.setProperty(property, value, 'important');
            }
        });
    }

    function pxAtMostFive(value) {
        var n = parseFloat(value);
        return Number.isFinite(n) && n >= 0 && n <= 5;
    }

    function hasSmallMarginPadding(node) {
        var c = window.getComputedStyle(node);
        return [
            c.marginTop, c.marginRight, c.marginBottom, c.marginLeft,
            c.paddingTop, c.paddingRight, c.paddingBottom, c.paddingLeft
        ].every(pxAtMostFive);
    }

    function containsProtectedContent(node) {
        return !!node.querySelector(protectedSelector);
    }

    function isAdOnlyWrapper(node) {
        if (!node || containsProtectedContent(node)) return false;

        var meaningful = Array.prototype.filter.call(node.children || [], function (child) {
            return child.tagName !== 'SCRIPT' && child.tagName !== 'STYLE' && child.tagName !== 'LINK';
        });

        if (!meaningful.length) return true;

        return meaningful.every(function (child) {
            return child.hasAttribute(marker) ||
                (child.matches && child.matches(hardAdSelector));
        });
    }

    function collapseAdAndWrapper(node) {
        collapse(node);

        var parent = node.parentElement;
        var depth = 0;
        while (parent && parent !== document.body && depth++ < 4) {
            if (containsProtectedContent(parent)) break;

            var className = typeof parent.className === 'string' ? parent.className : '';
            var knownWrapper =
                /(^|\s)bd_mobile(\s|$)/.test(className) ||
                /(^|[_-])(ad|ads)([_-]|$)/i.test(className) ||
                /(^|[_-])(ad|ads)([_-]|$)/i.test(parent.id || '') ||
                isAdOnlyWrapper(parent);

            if (!knownWrapper) break;
            collapse(parent);
            parent = parent.parentElement;
        }
    }

    function suppressPowerLinkFactory() {
        var noop = function () {};
        try {
            Object.defineProperty(window, '_make_power_link_identifier', {
                configurable: true,
                enumerable: false,
                get: function () { return noop; },
                set: function () {}
            });
        } catch (e) {
            try { window._make_power_link_identifier = noop; } catch (_) {}
        }
    }

    function collapseKnownMobileContainers() {
        document.querySelectorAll('section.fmWidgetStyle2019.bd_mobile.bd').forEach(function (node) {
            if (!containsProtectedContent(node) && hasSmallMarginPadding(node)) collapse(node);
        });

        document.querySelectorAll('script ~ div.bd_mobile.bd').forEach(function (node) {
            if (!containsProtectedContent(node) && hasSmallMarginPadding(node)) collapse(node);
        });
    }

    function collapseLegacyFooterGaps() {
        document.querySelectorAll(
            '.rd_ft > div:not(.rd_vote):not([class*="vote"]):not([class*="nav"]):not([class*="btn"]):not([class*="sign"])'
        ).forEach(function (node) {
            if (!containsProtectedContent(node)) collapse(node);
        });
    }

    function hasListKrSpacerPadding(node) {
        var c = window.getComputedStyle(node);
        var h = parseFloat(c.height);
        return c.paddingTop === '5px' &&
            c.paddingRight === '10px' &&
            c.paddingBottom === '20px' &&
            c.paddingLeft === '10px' &&
            Number.isFinite(h) && h >= 10 && h < 1000;
    }

    function collapseListKrFmkoreaSpacers() {
        document.querySelectorAll(
            'body[class*="mac_os"] div.hd ~ *[id][class*=" "], ' +
            'header.hd ~ .fmad_wrapper ~ *[class], ' +
            'body div.bd div[style] > *[class*=" "], ' +
            'body div.hd div[style] > *[class*=" "]'
        ).forEach(function (node) {
            if (!containsProtectedContent(node) && hasListKrSpacerPadding(node)) collapse(node);
        });

        document.querySelectorAll('.bd.bd_mobile').forEach(function (node) {
            if (!node.children.length && !node.textContent.trim()) collapse(node);
        });
    }

    function sweep() {
        queued = false;
        if (!document.documentElement) return;

        suppressPowerLinkFactory();

        if (!document.getElementById(styleId)) {
            var style = document.createElement('style');
            style.id = styleId;
            style.textContent =
                '[' + marker + '],' + hardAdSelector + '{' +
                'display:none!important;height:0!important;min-height:0!important;' +
                'max-height:0!important;margin:0!important;padding:0!important;' +
                'border:0!important;overflow:hidden!important;}';
            (document.head || document.documentElement).appendChild(style);
        }

        document.querySelectorAll(hardAdSelector).forEach(collapseAdAndWrapper);

        document.querySelectorAll('div[style], [' + marker + ']').forEach(function (node) {
            var s = node.style;
            var isSpacer = node.tagName === 'DIV' &&
                s.getPropertyValue('display') === 'block' &&
                s.getPropertyPriority('display') === 'important' &&
                s.getPropertyValue('visibility') === 'hidden' &&
                parseFloat(s.getPropertyValue('height')) > 0;

            if (isSpacer || node.hasAttribute(marker)) collapse(node);
        });

        collapseKnownMobileContainers();
        collapseListKrFmkoreaSpacers();
        collapseLegacyFooterGaps();
    }

    function schedule() {
        if (!queued) {
            queued = true;
            (window.requestAnimationFrame || function (fn) {
                return setTimeout(fn, 16);
            })(sweep);
        }
    }

    function start() {
        if (!document.documentElement) return;

        suppressPowerLinkFactory();
        sweep();

        new MutationObserver(schedule).observe(document.documentElement, {
            childList: true,
            subtree: true,
            attributes: true,
            attributeFilter: ['style', 'class', 'id', 'src']
        });

        window.addEventListener('pageshow', schedule);
    }

    if (document.documentElement) start();
    else document.addEventListener('DOMContentLoaded', start, { once: true });
})();
// FMKOREA_AD_SPACES_END
""".trimIndent()
