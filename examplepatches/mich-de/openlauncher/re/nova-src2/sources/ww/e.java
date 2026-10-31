package ww;

import com.stripe.android.financialconnections.model.Balance;
import com.stripe.android.financialconnections.model.BalanceRefresh;
import com.stripe.android.financialconnections.model.OwnershipRefresh;
import com.stripe.android.view.BecsDebitBsbEditText;
import com.stripe.android.view.CardNumberEditText;
import com.stripe.android.view.CvcEditText;
import com.stripe.android.view.ExpiryDateEditText;
import com.stripe.android.view.PaymentAuthWebView;
import com.teslacoilsw.launcher.novawidget.WeatherWidget;
import e10.y2;
import java.lang.annotation.Annotation;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.reflect.KProperty;
import kotlinx.serialization.internal.EnumsKt;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94765a;

    public /* synthetic */ e(int i5) {
        this.f94765a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f94765a) {
            case 0:
                int i5 = BecsDebitBsbEditText.f45426y;
                return Unit.f71706a;
            case 1:
                int i11 = CardNumberEditText.L;
                return Unit.f71706a;
            case 2:
                int i12 = CvcEditText.f45474x;
                return Unit.f71706a;
            case 3:
                KProperty[] kPropertyArr = ExpiryDateEditText.f45477z;
                return Unit.f71706a;
            case 4:
                int i13 = PaymentAuthWebView.f45485b;
                return Unit.f71706a;
            case 5:
                return Balance.Type._init_$_anonymous_();
            case 6:
                return BalanceRefresh.BalanceRefreshStatus._init_$_anonymous_();
            case 7:
                return OwnershipRefresh.Status._init_$_anonymous_();
            case 8:
                return Unit.f71706a;
            case 9:
                return Unit.f71706a;
            case 10:
                return Unit.f71706a;
            case 11:
                return Unit.f71706a;
            case 12:
                return Unit.f71706a;
            case 13:
                return Unit.f71706a;
            case 14:
                return Unit.f71706a;
            case 15:
                int i14 = WeatherWidget.C;
                return new wa0.b();
            case 16:
                return Unit.f71706a;
            case 17:
                return "\n<!DOCTYPE HTML>\n<html lang=\"en\">\n<head>\n    <title>hCaptcha Android</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\"/>\n    <style>\n        * {\n            padding: 0;\n            margin: 0;\n        }\n        html {\n            height: 100%;\n        }\n        body {\n            display: table;\n            width: 100%;\n            height: 100%;\n            text-align: center;\n        }\n        #hcaptcha-container {\n            margin-top: 5px;\n            display: table-cell;\n            vertical-align: middle;\n        }\n        /* overwrite hCaptcha iframe overlay which adds a #FFF background with opacity 0.05 */\n        div > div:nth-child(2) {\n            opacity: 0 !important;\n        }\n    </style>\n</head>\n<body>\n<div id=\"hcaptcha-container\"></div>\n<script type=\"text/javascript\">\n    if (window.JSDI) {\n        JSON.parse(window.JSDI.getDebugInfo()).forEach(function (v) { window[v] = true; });\n        window.sysDebug = JSON.parse(window.JSDI.getSysDebug());\n    }\n</script>\n<script type=\"text/javascript\">\n    // Android will inject this bridge object as `JSInterface`\n    // Browser is missing it, so we mock it\n    var BridgeObject = window.JSInterface || {\n        getConfig: function getConfig() {\n            return JSON.stringify({\n                siteKey: '10000000-ffff-ffff-ffff-000000000001',\n                locale: 'ro',\n                size: 'compact',\n                orientation: 'portrait',\n                theme: 'dark',\n                sentry: true,\n                rqdata: null,\n                jsSrc: 'https://js.hcaptcha.com/1/api.js',\n                endpoint: null,\n                assethost: null,\n                imghost: null,\n                reportapi: null\n            });\n        },\n        onPass: function onPass(token) {\n            return console.log(\"pass: token \".concat(token));\n        },\n        onError: function onError(errCode) {\n            return console.log(\"error: code \".concat(errCode));\n        },\n        onLoaded: function onLoaded() {\n            return console.log('cb: api is loaded');\n        },\n        onOpen: function onOpen() {\n            return console.log('cb: challenge is visible');\n        }\n    };\n    var bridgeConfig = JSON.parse(BridgeObject.getConfig());\n    var hCaptchaID = null;\n    /**\n     * Called programmatically from HCaptchaWebViewHelper.\n     */\n    function resetAndExecute() {\n        hcaptcha.reset();\n        hcaptcha.execute(hCaptchaID);\n    }\n    function reset() {\n        hcaptcha.reset();\n    }\n    function getTheme(bridgeConfig) {\n        var theme = bridgeConfig.theme;\n        var customTheme = bridgeConfig.customTheme;\n        if (customTheme) {\n            try {\n                return JSON.parse(customTheme);\n            } catch (e) {\n                console.error(e);\n                BridgeObject.onError(32);\n            }\n        }\n        return theme;\n    }\n    function getRenderConfig() {\n        return {\n            sitekey: bridgeConfig.siteKey,\n            size: bridgeConfig.size,\n            orientation: bridgeConfig.orientation,\n            theme: getTheme(bridgeConfig),\n            callback: function callback(token) {\n                return BridgeObject.onPass(token);\n            },\n            'chalexpired-callback': function chalexpiredCallback() {\n                return BridgeObject.onError(15);\n            },\n            'close-callback': function closeCallback() {\n                return BridgeObject.onError(30);\n            },\n            'error-callback': function errorCallback(error) {\n                switch(error) {\n                    case \"rate-limited\":\n                        return BridgeObject.onError(31);\n                    case \"network-error\":\n                        return BridgeObject.onError(7);\n                    case \"invalid-data\":\n                        return BridgeObject.onError(8);\n                    case \"challenge-error\":\n                        return BridgeObject.onError(9);\n                    case \"internal-error\":\n                        return BridgeObject.onError(10);\n                    default:\n                        // Error not handled? Log it for debugging purposes\n                        console.error(error);\n                        return BridgeObject.onError(29);\n                }\n            },\n            'open-callback': function openCallback() {\n                return BridgeObject.onOpen();\n            }\n        };\n    }\n    function onHcaptchaLoaded() {\n        try {\n            var renderConfig = getRenderConfig();\n            hCaptchaID = hcaptcha.render('hcaptcha-container', renderConfig);\n            BridgeObject.onLoaded();\n            var rqdata = bridgeConfig.rqdata;\n            if (rqdata) {\n                hcaptcha.setData(hCaptchaID, { rqdata: rqdata });\n            }\n            if (renderConfig.size === 'invisible' && !bridgeConfig.hideDialog) {\n                // We want to auto execute in case of `invisible` checkbox.\n                // But not in case of `hideDialog` since verification process\n                // might be desired to happen at a later time.\n                hcaptcha.execute(hCaptchaID);\n            }\n        } catch (e) {\n            console.error(e);\n            BridgeObject.onError(29);\n        }\n    }\n    function addQueryParamIfDefined(url, queryName, queryValue) {\n        if (queryValue !== undefined && queryValue !== null) {\n            var link = url.indexOf('?') !== -1 ? '&' : '?';\n            return url + link + queryName + '=' + encodeURIComponent(queryValue);\n        }\n        return url;\n    }\n    function loadApi() {\n        var siteKey = bridgeConfig.siteKey;\n        var locale = bridgeConfig.locale;\n        var sentry = bridgeConfig.sentry;\n        var jsSrc = bridgeConfig.jsSrc;\n        var endpoint = bridgeConfig.endpoint;\n        var assethost = bridgeConfig.assethost;\n        var imghost = bridgeConfig.imghost;\n        var reportapi = bridgeConfig.reportapi;\n        var host = bridgeConfig.host || siteKey + '.android-sdk.hcaptcha.com';\n        var scriptSrc = jsSrc + '?render=explicit&onload=' + onHcaptchaLoaded.name;\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'recaptchacompat', 'off');\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'hl', locale);\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'host', host);\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'sentry', sentry);\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'endpoint', endpoint);\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'assethost', assethost);\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'imghost', imghost);\n        scriptSrc = addQueryParamIfDefined(scriptSrc, 'reportapi', reportapi);\n        if (bridgeConfig.customTheme) {\n            scriptSrc = addQueryParamIfDefined(scriptSrc, 'custom', 'true');\n        }\n        var script = document.createElement('script');\n        script.async = true;\n        script.src = scriptSrc;\n        script.onerror = function () {\n            // network issue\n            BridgeObject.onError(7);\n        };\n        document.head.appendChild(script);\n    }\n    var container = document.getElementById(\"hcaptcha-container\");\n    container.addEventListener(\"click\", function () {\n        if (window.hcaptcha) {\n            // Allows dismissal of checkbox view\n            window.hcaptcha.close();\n        } else {\n            BridgeObject.onError(30);\n        }\n    });\n    loadApi();\n</script>\n</body>\n</html>\n";
            case 18:
                y2.f51877a.getClass();
                Boolean bool = (Boolean) y2.j().l();
                bool.getClass();
                return bool;
            case 19:
                y2.f51877a.getClass();
                Boolean bool2 = (Boolean) y2.j().l();
                bool2.getClass();
                return bool2;
            case 20:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 21:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.hcaptcha.config.HCaptchaOrientation", zw.f.values(), new String[]{"portrait", "landscape"}, new Annotation[][]{null, null}, null);
            case 22:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.hcaptcha.config.HCaptchaSize", zw.h.values(), new String[]{"invisible", "normal", "compact"}, new Annotation[][]{null, null, null}, null);
            default:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.hcaptcha.config.HCaptchaTheme", zw.j.values(), new String[]{"dark", "light", "contrast"}, new Annotation[][]{null, null, null}, null);
        }
    }
}
