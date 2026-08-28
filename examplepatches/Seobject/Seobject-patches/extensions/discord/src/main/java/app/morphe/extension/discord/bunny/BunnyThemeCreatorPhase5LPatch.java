package app.morphe.extension.discord.bunny;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class BunnyThemeCreatorPhase5LPatch {
    private BunnyThemeCreatorPhase5LPatch() {}

    private static final String SHIP_MARKER = "BUNNY_THEME_CREATOR_SHIP_BASIC_ONLY";
    private static final String RELEASE_MARKER = "BUNNY_FONT_POPUP_BUTTONS_DISMISS_V1";

    static String apply(String source) throws IOException {
        if (source == null || source.isEmpty()) {
            throw new IOException("Shipping bundle source is empty");
        }
        if (source.contains(RELEASE_MARKER)) {
            return source;
        }

        String patched = source;

        /* Shipping cleanup does not touch the current picker or Basic color card. */
        /* Remove Advanced from the Creator selector/runtime manifest only. */
        patched = stripAdvancedFromManifest(patched);
        patched = stripAdvancedSaveValidation(patched);
        patched = collapseBasicAdvancedSelector(patched);

        /*
         * Single edit 3: restore the same floating popup presentation for
         * both font import launchers:
         *   - Extract fonts from current theme
         *   - Import font entries from a link
         *
         * Component logic and success/dismiss behavior remain untouched.
         */
        patched = patchFontImportPopupPresentation(patched);
        patched = patchFontPopupButtonDismiss(patched);

        String pairPopupMarker = "  /* BUNNY_FONT_IMPORT_POPUPS_PAIR_V2 */";
        String buttonDismissMarker = "  /* BUNNY_FONT_POPUP_BUTTONS_DISMISS_V1 */";
        if (patched.contains(pairPopupMarker)) {
            patched = replaceExactlyOnce(
                    patched,
                    pairPopupMarker,
                    buttonDismissMarker,
                    "single edit 4 font button marker upgrade"
            );
        } else {
            patched = replaceExactlyOnce(
                    patched,
                    "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {",
                    "  /* BUNNY_THEME_CREATOR_PHASE_5L */\n" +
                            "  /* BUNNY_THEME_CREATOR_PHASE_5N_OWNER_BOUND */\n" +
                            "  /* BUNNY_THEME_CREATOR_PHASE_5O_DIRECT_ADVANCED */\n" +
                            "  /* BUNNY_THEME_CREATOR_PHASE_5P_NATIVE_ADVANCED */\n" +
                            "  /* BUNNY_THEME_CREATOR_SHIP_BASIC_ONLY */\n" +
                            "  /* BUNNY_RELEASE_FONT_IMPORT_MODAL_V1 */\n" +
                            "  /* BUNNY_FONT_POPUP_BUTTONS_DISMISS_V1 */\n" +
                            "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {",
                    "shipping font button marker"
            );
        }

        patched = patchFinalChatBackgroundMedia(patched);
        patched = patchChatBackgroundIntoNativeViewV5(patched);
        patched = patchUrlBackgroundPreview(patched);
        patched = patchUrlBackgroundImmediateLocalImportV8(patched);
        patched = patchChatBackgroundThemeLifecycleV10(patched);
        patched = patchCreatorSaveStorageResilienceV11(patched);

        verifyShippingRuntime(patched);
        verifyFinalBackgroundFix(patched);
        return patched;
    }

    private static String stripAdvancedFromManifest(String source) throws IOException {
        String startAnchor = "  function bunnyCreatorManifest(draft) {\n";
        String endAnchor = "  function bunnyHsvToHex(";

        int sourceStart = source.indexOf(startAnchor);
        if (sourceStart < 0) return source;
        if (source.indexOf(startAnchor, sourceStart + startAnchor.length()) >= 0) {
            throw new IOException("shipping creator manifest start anchor ambiguous");
        }

        int sourceEnd = source.indexOf(endAnchor, sourceStart + startAnchor.length());
        if (sourceEnd < 0) return source;

        String manifest = source.substring(sourceStart, sourceEnd);
        String advancedStart = "    bunnyCreatorAdvancedFlat().forEach((definition) => {";
        int start = manifest.indexOf(advancedStart);
        if (start < 0) return source;
        if (manifest.indexOf(advancedStart, start + advancedStart.length()) >= 0) {
            throw new IOException("shipping advanced manifest loop ambiguous");
        }

        String afterAnchor = "\n\n    if (backgroundMedia?.url) manifest.background = backgroundMedia;";
        int end = manifest.indexOf(afterAnchor, start + advancedStart.length());
        if (end < 0) return source;

        manifest = manifest.substring(0, start) + manifest.substring(end);

        return source.substring(0, sourceStart) + manifest + source.substring(sourceEnd);
    }

    private static String stripAdvancedSaveValidation(String source) throws IOException {
        String creatorStart = "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {";
        String creatorEnd = "  function Themes() {";
        String creator = extractRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                "shipping Theme Creator validation"
        );

        creator = replaceRegexOptionalOnce(
                creator,
                "\\s*&&\\s*Object\\.values\\(draft\\.advanced\\s*\\?\\?\\s*\\{\\}\\)\\.every\\(\\(value\\)\\s*=>\\s*/\\^#\\[0-9A-F\\]\\{6\\}\\(\\?:\\[0-9A-F\\]\\{2\\}\\)\\?\\$/\\.test\\(String\\(value\\s*\\?\\?\\s*\\\"\\\"\\)\\.trim\\(\\)\\.toUpperCase\\(\\)\\)\\)",
                "",
                "shipping hidden Advanced validation"
        );

        return replaceRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                creator,
                "shipping Theme Creator validation install"
        );
    }

    private static String collapseBasicAdvancedSelector(String source) throws IOException {
        String creatorStart = "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {";
        String creatorEnd = "  function Themes() {";
        String creator = extractRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                "shipping Theme Creator selector"
        );

        /* Rename the surviving Basic segment regardless of its current label. */
        creator = replaceRegexOptionalOnce(
                creator,
                "\\[\\s*\"basic\"\\s*,\\s*\"[^\"]*\"\\s*\\]",
                "[\"basic\", \"Colors\"]",
                "shipping Colors selector label"
        );

        /* Remove the Advanced segment independently of whitespace/layout. */
        creator = replaceRegexOptionalOnce(
                creator,
                ",\\s*\\[\\s*\"advanced\"\\s*,\\s*\"[^\"]*\"\\s*\\]",
                "",
                "shipping Advanced selector trailing item"
        );
        creator = replaceRegexOptionalOnce(
                creator,
                "\\[\\s*\"advanced\"\\s*,\\s*\"[^\"]*\"\\s*\\]\\s*,?",
                "",
                "shipping Advanced selector leading item"
        );

        /* Even if dead Advanced render code remains in the bundle, it cannot
         * become active in the shipping Creator. */
        creator = creator.replace(
                "bunnyCreatorPanel === \"advanced\"",
                "false"
        );
        creator = creator.replace(
                "\"advanced\" === bunnyCreatorPanel",
                "false"
        );

        return replaceRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                creator,
                "shipping Theme Creator selector install"
        );
    }

    private static String patchFontImportModal(String source) throws IOException {
        String fontStart =
                "  function RevengeFontsExtractor({ fonts: fonts2, setName }) {";
        String fontEnd =
                "  // globals:@shopify/react-native-skia";

        String font = extractRangeExactlyOnce(
                source,
                fontStart,
                fontEnd,
                "shipping font editor"
        );

        /*
         * Guarantee the alert registry is initialized for FontEditor. This is
         * intentionally scoped to init_FontEditor instead of relying on some
         * other settings page having initialized alerts first.
         */
        String initStart = "  var init_FontEditor = __esm({";
        int initIndex = font.indexOf(initStart);
        if (initIndex < 0) {
            throw new IOException("shipping FontEditor init anchor not found");
        }

        String initBlock = font.substring(initIndex);
        if (!initBlock.contains("init_alerts();")) {
            initBlock = replaceExactlyOnce(
                    initBlock,
                    "      init_i18n();",
                    "      init_i18n();\n" +
                            "      init_alerts();",
                    "shipping FontEditor alert init"
            );
            font = font.substring(0, initIndex) + initBlock;
        }

        /*
         * One close function owns both possible import containers. The centered
         * alert is authoritative for Import from link; hideActionSheet remains
         * fail-open compatibility for any stale sheet state.
         */
        String jsonImporter =
                "  function JsonFontImporter({ fonts: fonts2, setName, setSource }) {";

        if (!font.contains("function bunnyFontImportDismiss()")) {
            font = replaceExactlyOnce(
                    font,
                    jsonImporter,
                    "  function bunnyFontImportDismiss() {\n" +
                            "    try {\n" +
                            "      dismissAlert(\"FontEditorActionSheet\");\n" +
                            "    } catch (_) {}\n" +
                            "    try {\n" +
                            "      actionSheet2.hideActionSheet();\n" +
                            "    } catch (_) {}\n" +
                            "  }\n" +
                            jsonImporter,
                    "shipping font dismiss helper"
            );
        }

        font = replaceRegexExactlyOnce(
                font,
                "\\.then\\(\\(\\)\\s*=>\\s*actionSheet2\\.hideActionSheet\\(\\)\\)",
                ".then(() => bunnyFontImportDismiss())",
                "shipping link import success dismiss"
        );

        /*
         * Change only the JsonFontImporter row. Entry-editor and theme-extract
         * sheets still use promptActionSheet exactly as before.
         */
        font = replaceRegexExactlyOnce(
                font,
                "onPress:\\s*\\(\\)\\s*=>\\s*promptActionSheet\\(\\s*" +
                        "JsonFontImporter\\s*,\\s*fontEntries\\s*,\\s*\\{\\s*" +
                        "setName\\s*,\\s*setSource\\s*\\}\\s*\\)",
                "onPress: () => openAlert(\\\"FontEditorActionSheet\\\", " +
                        "/* @__PURE__ */ jsx(AlertModal, {\\n" +
                        "                  title: \\\"Import Font\\\",\\n" +
                        "                  content: /* @__PURE__ */ jsx(JsonFontImporter, {\\n" +
                        "                    fonts: fontEntries,\\n" +
                        "                    setName,\\n" +
                        "                    setSource\\n" +
                        "                  })\\n" +
                        "                }))",
                "shipping centered link importer"
        );

        /*
         * Bunny's local-file row is injected by the existing Bootstrap before
         * this helper runs. Close any import UI before returning from FontEditor.
         */
        font = replaceRegexExactlyOnce(
                font,
                "yield\\s+saveFont\\(fontDef\\);\\s*navigation2\\.goBack\\(\\);",
                "yield saveFont(fontDef);\\n" +
                        "                    bunnyFontImportDismiss();\\n" +
                        "                    navigation2.goBack();",
                "shipping local font success dismiss"
        );

        if (!font.contains("openAlert(\"FontEditorActionSheet\"")) {
            throw new IOException("shipping centered font alert missing");
        }
        if (!font.contains("content: /* @__PURE__ */ jsx(JsonFontImporter")) {
            throw new IOException("shipping centered JsonFontImporter content missing");
        }
        if (font.contains("promptActionSheet(JsonFontImporter")) {
            throw new IOException("shipping bottom-sheet link importer survived");
        }
        if (!font.contains(".then(() => bunnyFontImportDismiss())")) {
            throw new IOException("shipping link import dismiss hook missing");
        }
        if (!font.contains("bunnyFontImportDismiss();\n                    navigation2.goBack();")) {
            throw new IOException("shipping local import dismiss hook missing");
        }

        return replaceRangeExactlyOnce(
                source,
                fontStart,
                fontEnd,
                font,
                "shipping font editor install"
        );
    }

    private static String patchPicker(String source) throws IOException {
        String pickerStart =
                "  BunnyCreatorColorPicker =\n" +
                "    function BunnyCreatorColorPickerPhase5G({\n";
        String pickerEnd = "  function BunnyCreatorAdvancedColorRow({\n";
        String picker = extractRangeExactlyOnce(
                source,
                pickerStart,
                pickerEnd,
                "shipping Phase5G picker"
        );

        picker = replaceExactlyOnce(
                picker,
                "      var [\n" +
                        "        brightnessText,\n" +
                        "        setBrightnessText\n" +
                        "      ] =\n" +
                        "        React.useState(\"75\");\n\n" +
                        "      if (!visible)\n" +
                        "        return null;",
                "      var [\n" +
                        "        brightnessText,\n" +
                        "        setBrightnessText\n" +
                        "      ] =\n" +
                        "        React.useState(\"80\");\n\n" +
                        "      var wheelRef =\n" +
                        "        React.useRef(null);\n" +
                        "      var brightnessRef =\n" +
                        "        React.useRef(null);\n\n" +
                        "      React.useEffect(\n" +
                        "        () => {\n" +
                        "          if (visible) {\n" +
                        "            setBrightnessText(\"80\");\n" +
                        "          }\n" +
                        "        },\n" +
                        "        [visible]\n" +
                        "      );\n\n" +
                        "      if (!visible)\n" +
                        "        return null;",
                "shipping picker reopen state"
        );

        picker = replaceExactlyOnce(
                picker,
                "          : 75;",
                "          : 80;",
                "shipping picker parsed brightness fallback"
        );

        picker = replaceExactlyOnce(
                picker,
                "              : 75;",
                "              : 80;",
                "shipping picker commit brightness fallback"
        );

        String measuredPoint = """
      var bunnyPickerMeasuredPoint = (
        ref,
        event,
        fallbackX,
        fallbackY,
        callback
      ) => {
        var pageX =
          Number(
            event?.nativeEvent?.pageX
          );
        var pageY =
          Number(
            event?.nativeEvent?.pageY
          );
        var localX =
          Number(
            event?.nativeEvent?.locationX ??
            fallbackX
          );
        var localY =
          Number(
            event?.nativeEvent?.locationY ??
            fallbackY
          );
        var node = ref?.current;

        if (
          node?.measureInWindow &&
          Number.isFinite(pageX) &&
          Number.isFinite(pageY)
        ) {
          node.measureInWindow(
            (left, top) =>
              callback(
                pageX - Number(left || 0),
                pageY - Number(top || 0)
              )
          );
          return;
        }

        callback(localX, localY);
      };

""";

        String wheelBlock = measuredPoint + """
      var chooseWheelColor = (
        event,
        commit
      ) => {
        bunnyPickerMeasuredPoint(
          wheelRef,
          event,
          wheelCenter,
          wheelCenter,
          (localX, localY) => {
            var x =
              Number(localX) -
              wheelCenter;
            var y =
              Number(localY) -
              wheelCenter;

            var distance =
              Math.sqrt(
                x * x +
                y * y
              );

            if (
              distance > wheelRadius &&
              distance > 0
            ) {
              var scale =
                wheelRadius /
                distance;
              x *= scale;
              y *= scale;
              distance = wheelRadius;
            }

            var hue =
              (
                Math.atan2(y, x) *
                  180 /
                  Math.PI +
                360
              ) %
              360;

            var saturation =
              bunnyClamp(
                distance /
                  wheelRadius,
                0,
                1
              );

            var color =
              bunnyHsvToHex(
                hue,
                saturation,
                brightness
              );

            onChange(color);
            if (commit)
              onCommit?.(color);
          }
        );
      };

""";

        picker = replaceRangeExactlyOnce(
                picker,
                "      var chooseWheelColor = (\n",
                "      var selectedRadius =\n",
                wheelBlock,
                "shipping measured wheel mapping"
        );

        String brightnessBlock = """
      var chooseBrightness = (
        event,
        commit
      ) => {
        bunnyPickerMeasuredPoint(
          brightnessRef,
          event,
          wheelSize,
          0,
          (localX) => {
            var percent =
              Math.round(
                bunnyClamp(
                  Number(localX) /
                    wheelSize,
                  0,
                  1
                ) *
                100
              );

            applyBrightness(
              percent,
              commit
            );
          }
        );
      };

""";

        picker = replaceRangeExactlyOnce(
                picker,
                "      var chooseBrightness = (\n",
                "      var changeBrightnessText = (\n",
                brightnessBlock,
                "shipping measured brightness mapping"
        );

        picker = replaceRegexExactlyOnce(
                picker,
                "source:\\s*\\{\\s*uri:\\s*bunnyCreatorColorWheelHiResUri\\s*\\},",
                "ref: wheelRef,\n                            source: {\n                              uri:\n                                bunnyCreatorColorWheelHiResUri\n                            },",
                "shipping wheel ref"
        );

        picker = replaceRegexExactlyOnce(
                picker,
                "(/\\* @__PURE__ \\*/ jsx\\(import_react_native24\\.View, \\{\\s*)(style:\\s*\\{\\s*alignSelf:\\s*\\\"center\\\",\\s*width:\\s*wheelSize,\\s*height:\\s*28,)",
                "$1ref: brightnessRef,\n                    $2",
                "shipping brightness ref"
        );

        if (!picker.contains("length: 256")) {
            throw new IOException("shipping picker lost 256-step brightness renderer");
        }

        picker = replaceRegexOptionalOnce(
                picker,
                "current\\.v\\s*\\*\\s*wheelSize\\s*-\\s*2",
                "brightness * wheelSize - 2",
                "shipping brightness thumb"
        );

        if (!picker.contains("measureInWindow")) {
            throw new IOException("shipping picker measureInWindow marker missing");
        }
        if (!picker.contains("pageX") || !picker.contains("pageY")) {
            throw new IOException("shipping picker page coordinate markers missing");
        }

        return replaceRangeExactlyOnce(
                source,
                pickerStart,
                pickerEnd,
                picker,
                "shipping picker install"
        );
    }

    private static String patchFontImportPopupPresentation(String source) throws IOException {
        String fontStart = "  // src/core/ui/settings/pages/Fonts/FontEditor.tsx\n";
        String fontEnd = "  // src/core/ui/settings/pages/Fonts/index.tsx\n";

        String fontBlock = extractRangeExactlyOnce(
                source,
                fontStart,
                fontEnd,
                "single edit 3 FontEditor block"
        );

        /*
         * FontEditor already initializes the shared component registry, but
         * the alert dispatcher itself must also be initialized in this module
         * because these two rows now open AlertModal directly.
         */
        String alertInit = "      init_alerts();\n";
        int alertInitCount = countLiteral(fontBlock, alertInit);
        if (alertInitCount == 0) {
            fontBlock = replaceExactlyOnce(
                    fontBlock,
                    "      init_i18n();\n" +
                            "      init_storage();\n",
                    "      init_i18n();\n" +
                            alertInit +
                            "      init_storage();\n",
                    "single edit 3 FontEditor alert init"
            );
        } else if (alertInitCount != 1) {
            throw new IOException("single edit 3 FontEditor alert init ambiguous");
        }

        String oldExtractPress =
                "                onPress: () => promptActionSheet(RevengeFontsExtractor, fontEntries, {\n" +
                        "                  setName\n" +
                        "                })";

        String newExtractPress =
                "                onPress: () => {\n" +
                        "                  openAlert(\"FontEditorActionSheet\", /* @__PURE__ */ jsx(AlertModal, {\n" +
                        "                    title: \"Import Font\",\n" +
                        "                    content: \"\",\n" +
                        "                    extraContent: /* @__PURE__ */ jsx(ErrorBoundary, {\n" +
                        "                      children: /* @__PURE__ */ jsx(RevengeFontsExtractor, {\n" +
                        "                        fonts: fontEntries,\n" +
                        "                        setName\n" +
                        "                      })\n" +
                        "                    })\n" +
                        "                  }));\n" +
                        "                }";

        String oldLinkPress =
                "                onPress: () => promptActionSheet(JsonFontImporter, fontEntries, {\n" +
                        "                  setName,\n" +
                        "                  setSource\n" +
                        "                })";

        String newLinkPress =
                "                onPress: () => {\n" +
                        "                  openAlert(\"FontEditorActionSheet\", /* @__PURE__ */ jsx(AlertModal, {\n" +
                        "                    title: \"Import Font\",\n" +
                        "                    content: \"\",\n" +
                        "                    extraContent: /* @__PURE__ */ jsx(ErrorBoundary, {\n" +
                        "                      children: /* @__PURE__ */ jsx(JsonFontImporter, {\n" +
                        "                        fonts: fontEntries,\n" +
                        "                        setName,\n" +
                        "                        setSource\n" +
                        "                      })\n" +
                        "                    })\n" +
                        "                  }));\n" +
                        "                }";

        int oldExtractCount = countLiteral(fontBlock, oldExtractPress);
        int newExtractCount = countLiteral(fontBlock, newExtractPress);
        if (oldExtractCount == 1 && newExtractCount == 0) {
            fontBlock = replaceExactlyOnce(
                    fontBlock,
                    oldExtractPress,
                    newExtractPress,
                    "single edit 3 Extract-from-theme floating popup"
            );
        } else if (!(oldExtractCount == 0 && newExtractCount == 1)) {
            throw new IOException("single edit 3 Extract-from-theme launcher state ambiguous");
        }

        int oldLinkCount = countLiteral(fontBlock, oldLinkPress);
        int newLinkCount = countLiteral(fontBlock, newLinkPress);
        if (oldLinkCount == 1 && newLinkCount == 0) {
            fontBlock = replaceExactlyOnce(
                    fontBlock,
                    oldLinkPress,
                    newLinkPress,
                    "single edit 3 Import-from-link floating popup"
            );
        } else if (!(oldLinkCount == 0 && newLinkCount == 1)) {
            throw new IOException("single edit 3 Import-from-link launcher state ambiguous");
        }

        /*
         * Preserve both components' existing success behavior byte-for-byte.
         * Dismissal is a separate edit after popup presentation is verified.
         */
        if (!fontBlock.contains(
                "setName(fontName);\n" +
                        "              Object.assign(fonts2, themeFonts);\n" +
                        "              actionSheet2.hideActionSheet();"
        )) {
            throw new IOException("single edit 3 theme extractor behavior preservation gate failed");
        }

        if (!fontBlock.contains(
                "})().then(() => actionSheet2.hideActionSheet()).catch((e) => setError(String(e))).finally(() => setSaving(false));"
        )) {
            throw new IOException("single edit 3 link importer behavior preservation gate failed");
        }

        if (fontBlock.contains(oldExtractPress)) {
            throw new IOException("single edit 3 bottom-sheet Extract-from-theme launcher survived");
        }
        if (fontBlock.contains(oldLinkPress)) {
            throw new IOException("single edit 3 bottom-sheet Import-from-link launcher survived");
        }

        if (countLiteral(
                fontBlock,
                "openAlert(\"FontEditorActionSheet\", /* @__PURE__ */ jsx(AlertModal, {"
        ) != 2) {
            throw new IOException("single edit 3 floating popup pair count mismatch");
        }

        if (!fontBlock.contains(
                "children: /* @__PURE__ */ jsx(RevengeFontsExtractor, {"
        )) {
            throw new IOException("single edit 3 floating Extract-from-theme content missing");
        }

        if (!fontBlock.contains(
                "children: /* @__PURE__ */ jsx(JsonFontImporter, {"
        )) {
            throw new IOException("single edit 3 floating Import-from-link content missing");
        }

        if (!fontBlock.contains("      init_alerts();\n")) {
            throw new IOException("single edit 3 FontEditor alert initialization missing");
        }

        return replaceRangeExactlyOnce(
                source,
                fontStart,
                fontEnd,
                fontBlock,
                "single edit 3 FontEditor replacement"
        );
    }


    private static String patchFontPopupButtonDismiss(String source) throws IOException {
        String fontStart = "  // src/core/ui/settings/pages/Fonts/FontEditor.tsx\n";
        String fontEnd = "  // src/core/ui/settings/pages/Fonts/index.tsx\n";

        String fontBlock = extractRangeExactlyOnce(
                source,
                fontStart,
                fontEnd,
                "single edit 4 FontEditor block"
        );

        String oldExtractSuccess =
                "setName(fontName);\n" +
                        "              Object.assign(fonts2, themeFonts);\n" +
                        "              actionSheet2.hideActionSheet();";
        String newExtractSuccess =
                "setName(fontName);\n" +
                        "              Object.assign(fonts2, themeFonts);\n" +
                        "              dismissAlert(\"FontEditorActionSheet\");";

        if (countLiteral(fontBlock, oldExtractSuccess) != 1) {
            throw new IOException("single edit 4 Extract success closer anchor missing or ambiguous");
        }
        if (countLiteral(fontBlock, newExtractSuccess) != 0) {
            throw new IOException("single edit 4 Extract success closer already patched");
        }
        fontBlock = replaceExactlyOnce(
                fontBlock,
                oldExtractSuccess,
                newExtractSuccess,
                "single edit 4 Extract success alert dismiss"
        );

        String oldImportSuccess =
                "})().then(() => actionSheet2.hideActionSheet()).catch((e) => setError(String(e))).finally(() => setSaving(false));";
        String newImportSuccess =
                "})().then(() => dismissAlert(\"FontEditorActionSheet\")).catch((e) => setError(String(e))).finally(() => setSaving(false));";

        if (countLiteral(fontBlock, oldImportSuccess) != 1) {
            throw new IOException("single edit 4 Import success closer anchor missing or ambiguous");
        }
        if (countLiteral(fontBlock, newImportSuccess) != 0) {
            throw new IOException("single edit 4 Import success closer already patched");
        }
        fontBlock = replaceExactlyOnce(
                fontBlock,
                oldImportSuccess,
                newImportSuccess,
                "single edit 4 Import success alert dismiss"
        );

        if (!fontBlock.contains(newExtractSuccess)) {
            throw new IOException("single edit 4 Extract alert dismiss missing");
        }
        if (!fontBlock.contains(newImportSuccess)) {
            throw new IOException("single edit 4 Import alert dismiss missing");
        }
        if (!fontBlock.contains(
                "children: /* @__PURE__ */ jsx(RevengeFontsExtractor, {"
        )) {
            throw new IOException("single edit 4 Extract popup presentation changed unexpectedly");
        }
        if (!fontBlock.contains(
                "children: /* @__PURE__ */ jsx(JsonFontImporter, {"
        )) {
            throw new IOException("single edit 4 Import popup presentation changed unexpectedly");
        }
        if (countLiteral(
                fontBlock,
                "openAlert(\"FontEditorActionSheet\", /* @__PURE__ */ jsx(AlertModal, {"
        ) != 2) {
            throw new IOException("single edit 4 popup pair presentation count changed unexpectedly");
        }

        return replaceRangeExactlyOnce(
                source,
                fontStart,
                fontEnd,
                fontBlock,
                "single edit 4 FontEditor button dismissal replacement"
        );
    }


    private static String patchFinalChatBackgroundMedia(String source) throws IOException {
        final String marker = "BUNNY_CHAT_BACKGROUND_MEDIA_FINAL_V1";
        if (source.contains(marker)) return source;

        String replacement = """
  /* BUNNY_CHAT_BACKGROUND_MEDIA_FINAL_V1 */
  var bunnyFinalThemeBackgroundSourceCache = new Map();
  var bunnyFinalThemeBackgroundRemoteCache = new Map();
  var bunnyFinalThemeBackgroundRemotePending = new Map();

  function bunnyFinalThemeBackgroundUri(value) {
    var uri = String(value ?? "").trim();
    if (!uri) return "";
    if (/^(https?:|file:|content:|asset:|data:|ph:)/i.test(uri))
      return uri;
    if (uri.startsWith("/"))
      return "file://" + uri;
    return uri;
  }

  function bunnyFinalThemeBackgroundSource(uri) {
    var source = bunnyFinalThemeBackgroundSourceCache.get(uri);
    if (!source) {
      source = { uri };
      bunnyFinalThemeBackgroundSourceCache.set(uri, source);
      if (bunnyFinalThemeBackgroundSourceCache.size > 16) {
        var firstKey = bunnyFinalThemeBackgroundSourceCache.keys().next().value;
        if (firstKey && firstKey !== uri)
          bunnyFinalThemeBackgroundSourceCache.delete(firstKey);
      }
    }
    return source;
  }

  function bunnyFinalThemeBackgroundResolve(uri) {
    if (!/^https?:/i.test(uri))
      return Promise.resolve(uri);

    var cached = bunnyFinalThemeBackgroundRemoteCache.get(uri);
    if (cached)
      return Promise.resolve(cached);

    var pending = bunnyFinalThemeBackgroundRemotePending.get(uri);
    if (pending)
      return pending;

    /* BUNNY_URL_BACKGROUND_CONVERGENCE_V7 */
    pending = import_react_native24.Linking.openURL(
      "bunny-morphe://theme-background-url?url=" +
      encodeURIComponent(uri)
    ).then((raw) => {
      var result =
        typeof raw === "string"
          ? JSON.parse(raw)
          : raw;

      if (
        result?.status !== "success" ||
        typeof result?.name !== "string" ||
        !result.name
      ) {
        throw new Error(
          result?.message ||
          "Failed to cache chat background."
        );
      }

      bunnyFinalThemeBackgroundRemoteCache.set(
        uri,
        result.name
      );
      return result.name;
    }).finally(() => {
      bunnyFinalThemeBackgroundRemotePending.delete(uri);
    });

    bunnyFinalThemeBackgroundRemotePending.set(uri, pending);
    return pending;
  }

  function ThemeBackground({ children }) {
    useObservable([
      colorsPref
    ]);

    var background =
      _colorRef.current?.background;

    var rawUri =
      bunnyFinalThemeBackgroundUri(
        background?.url
      );

    var [resolvedUri, setResolvedUri] =
      React.useState(() => {
        if (!rawUri) return "";
        return (
          bunnyFinalThemeBackgroundRemoteCache.get(rawUri) ??
          (!/^https?:/i.test(rawUri) ? rawUri : "")
        );
      });

    React.useEffect(() => {
      var alive = true;

      if (!rawUri) {
        setResolvedUri("");
        return () => {
          alive = false;
        };
      }

      if (!/^https?:/i.test(rawUri)) {
        setResolvedUri(rawUri);
        return () => {
          alive = false;
        };
      }

      var cached =
        bunnyFinalThemeBackgroundRemoteCache.get(rawUri);

      if (cached) {
        setResolvedUri(cached);
        return () => {
          alive = false;
        };
      }

      setResolvedUri("");

      bunnyFinalThemeBackgroundResolve(rawUri)
        .then((uri) => {
          if (alive)
            setResolvedUri(uri);
        })
        .catch(() => {
          if (alive)
            setResolvedUri("");
        });

      return () => {
        alive = false;
      };
    }, [rawUri]);

    if (
      !_colorRef.current ||
      colorsPref.customBackground === "hidden" ||
      !rawUri ||
      !resolvedUri ||
      background?.blur &&
        typeof background?.blur !== "number"
    ) {
      return children;
    }

    return /* @__PURE__ */ jsx(
      import_react_native3.ImageBackground,
      {
        style: {
          flex: 1,
          flexGrow: 1,
          width: "100%",
          height: "100%",
          alignSelf: "stretch"
        },
        source:
          bunnyFinalThemeBackgroundSource(
            resolvedUri
          ),
        resizeMode: "cover",
        blurRadius: background?.blur,
        children
      }
    );
  }
""";

        String patched = replaceRangeExactlyOnce(
                source,
                "  function ThemeBackground({ children }) {\n",
                "  function patchChatBackground() {\n",
                replacement,
                "final chat background media renderer"
        );

        String oldOpacity =
                "(_colorRef.current.background?.opacity ?? 1)";
        String newOpacity =
                "(_colorRef.current.background?.opacity ?? " +
                "_colorRef.current.background?.alpha ?? 1)";

        int oldCount = countLiteral(patched, oldOpacity);
        int newCount = countLiteral(patched, newOpacity);

        if (oldCount == 1 && newCount == 0) {
            patched = replaceExactlyOnce(
                    patched,
                    oldOpacity,
                    newOpacity,
                    "final chat background opacity compatibility"
            );
        } else if (!(oldCount == 0 && newCount == 1)) {
            throw new IOException(
                    "final chat background opacity state ambiguous"
            );
        }

        return patched;
    }





    private static String patchChatBackgroundIntoNativeViewV5(
            String source
    ) throws IOException {
        final String marker =
                "BUNNY_CHAT_BACKGROUND_NATIVE_VIEW_V5";

        if (source.contains(marker)) {
            return source;
        }

        String outerWrapper = """
        return /* @__PURE__ */ jsx(ThemeBackground, {
          children: ret
        });
""";

        String plainReturn = """
        return ret;
""";

        String patched = replaceExactlyOnce(
                source,
                outerWrapper,
                plainReturn,
                "Bunny remove React chat background wrapper V5"
        );

        String functionAnchor =
                "  function patchChatBackground() {\n";

        String nativeBridgeHelpers = """
  /* BUNNY_CHAT_BACKGROUND_NATIVE_VIEW_V5 */
  var bunnyNativeChatBackgroundLastSignature = "";
  var bunnyNativeChatBackgroundPendingSignature = "";
  var bunnyNativeChatBackgroundRequestId = 0;

  function bunnySendNativeChatBackground(
    uri,
    opacity,
    signature
  ) {
    if (
      signature ===
      bunnyNativeChatBackgroundLastSignature
    ) {
      return;
    }

    bunnyNativeChatBackgroundLastSignature =
      signature;

    import_react_native3.Linking.openURL(
      "bunny-morphe://theme-chat-background-native" +
      "?url=" +
      encodeURIComponent(uri) +
      "&opacity=" +
      encodeURIComponent(String(opacity))
    ).catch(() => {
      if (
        bunnyNativeChatBackgroundLastSignature ===
        signature
      ) {
        bunnyNativeChatBackgroundLastSignature = "";
      }
    });
  }

  function bunnySyncNativeChatBackground() {
    var background =
      _colorRef.current?.background;

    var rawUri =
      bunnyFinalThemeBackgroundUri(
        background?.url
      );

    var opacity =
      Number(
        background?.opacity ??
        background?.alpha ??
        1
      );

    if (!Number.isFinite(opacity)) {
      opacity = 1;
    }

    opacity =
      Math.max(
        0,
        Math.min(1, opacity)
      );

    var signature =
      rawUri + "|" + String(opacity);

    if (!rawUri) {
      bunnyNativeChatBackgroundRequestId++;
      bunnyNativeChatBackgroundPendingSignature = "";
      bunnySendNativeChatBackground("", opacity, signature);
      return;
    }

    if (/^https?:/i.test(rawUri)) {
      if (
        signature ===
          bunnyNativeChatBackgroundLastSignature ||
        signature ===
          bunnyNativeChatBackgroundPendingSignature
      ) {
        return;
      }

      var requestId =
        ++bunnyNativeChatBackgroundRequestId;

      bunnyNativeChatBackgroundPendingSignature =
        signature;

      bunnyFinalThemeBackgroundResolve(rawUri)
        .then((localUri) => {
          if (
            requestId !==
            bunnyNativeChatBackgroundRequestId
          ) {
            return;
          }

          bunnyNativeChatBackgroundPendingSignature = "";
          bunnySendNativeChatBackground(
            localUri,
            opacity,
            signature
          );
        })
        .catch(() => {
          if (
            requestId ===
            bunnyNativeChatBackgroundRequestId
          ) {
            bunnyNativeChatBackgroundPendingSignature = "";
            bunnyNativeChatBackgroundLastSignature = "";
          }
        });

      return;
    }

    bunnyNativeChatBackgroundRequestId++;
    bunnyNativeChatBackgroundPendingSignature = "";
    bunnySendNativeChatBackground(
      rawUri,
      opacity,
      signature
    );
  }

""";

        if (countLiteral(patched, functionAnchor) != 1) {
            throw new IOException(
                    "Bunny native chat bridge function anchor was not unique"
            );
        }

        patched = patched.replace(
                functionAnchor,
                nativeBridgeHelpers + functionAnchor
        );

        String callbackAnchor = """
      after("render", Messages, (_2, ret) => {
        if (!_colorRef.current || !_colorRef.current.background?.url)
          return;
""";

        String callbackReplacement = """
      after("render", Messages, (_2, ret) => {
        bunnySyncNativeChatBackground();

        if (!_colorRef.current || !_colorRef.current.background?.url)
          return;
""";

        patched = replaceExactlyOnce(
                patched,
                callbackAnchor,
                callbackReplacement,
                "Bunny native chat background sync callback V5"
        );

        return patched;
    }

    private static String patchUrlBackgroundPreview(String source) throws IOException {
        final String marker = "BUNNY_URL_BACKGROUND_PREVIEW_CACHE_V1";
        if (source.contains(marker)) return source;

        String resolverStart =
                "  function bunnyResolveCreatorBackground(draft) {\n";
        String resolverEnd =
                "  function bunnyCreatorManifest(draft) {\n";

        String resolver = extractRangeExactlyOnce(
                source,
                resolverStart,
                resolverEnd,
                "final creator background resolver"
        );

        String oldAlpha =
                "    return { url, alpha: opacity };\n";
        String oldOpacity =
                "    return { url, opacity };\n";
        String compatible =
                "    return { url, opacity, alpha: opacity };\n";

        if (countLiteral(resolver, compatible) == 1) {
            // already compatible
        } else if (countLiteral(resolver, oldAlpha) == 1) {
            resolver = replaceExactlyOnce(
                    resolver,
                    oldAlpha,
                    compatible,
                    "final creator alpha/opacity compatibility"
            );
        } else if (countLiteral(resolver, oldOpacity) == 1) {
            resolver = replaceExactlyOnce(
                    resolver,
                    oldOpacity,
                    compatible,
                    "final creator opacity/alpha compatibility"
            );
        } else {
            throw new IOException(
                    "final creator background return shape is unsupported"
            );
        }

        source = replaceRangeExactlyOnce(
                source,
                resolverStart,
                resolverEnd,
                resolver,
                "final creator background resolver install"
        );

        String creatorStart =
                "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {\n";
        String creatorEnd =
                "  function Themes() {\n";

        String creator = extractRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                "final creator URL background preview"
        );

        String stateAnchor =
                "    var backgroundSourceRef = React.useRef(\"url\");\n";

        creator = replaceExactlyOnce(
                creator,
                stateAnchor,
                stateAnchor +
                        "    /* BUNNY_URL_BACKGROUND_PREVIEW_CACHE_V1 */\n" +
                        "    var [bunnyUrlBackgroundPreview, setBunnyUrlBackgroundPreview] =\n" +
                        "      React.useState(null);\n" +
                        "    var bunnyUrlBackgroundRequestRef = React.useRef(0);\n",
                "final URL background preview state"
        );

        String pickerAnchor =
                "    var pickLocalBackground = () => {\n";

        String effect = """
    React.useEffect(() => {
      var remoteUrl =
        String(
          draft.backgroundUrl ??
          ""
        ).trim();

      var requestId =
        ++bunnyUrlBackgroundRequestRef.current;

      if (
        draft.backgroundMode !== "url" ||
        !/^https?:\\/\\//i.test(remoteUrl)
      ) {
        setBunnyUrlBackgroundPreview(null);
        return;
      }

      var timer = setTimeout(() => {
        bunnyFinalThemeBackgroundResolve(remoteUrl)
          .then((localUrl) => {
            if (
              requestId !==
              bunnyUrlBackgroundRequestRef.current
            ) {
              return;
            }

            if (
              typeof localUrl !== "string" ||
              !localUrl
            ) {
              setBunnyUrlBackgroundPreview(null);
              return;
            }

            setBunnyUrlBackgroundPreview({
              remoteUrl,
              localUrl
            });
          })
          .catch(() => {
            if (
              requestId ===
              bunnyUrlBackgroundRequestRef.current
            ) {
              setBunnyUrlBackgroundPreview(null);
            }
          });
      }, 400);

      return () => {
        clearTimeout(timer);
      };
    }, [
      draft.backgroundMode,
      draft.backgroundUrl
    ]);

""";

        creator = replaceExactlyOnce(
                creator,
                pickerAnchor,
                effect + pickerAnchor,
                "final URL background preview downloader"
        );

        String previewManifestAnchor =
                "    var previewManifest = bunnyCreatorManifest(draft);\n";

        String previewManifestReplacement = """
    var bunnyPreviewRemoteUrl =
      String(
        draft.backgroundUrl ??
        ""
      ).trim();

    var bunnyPreviewHasResolvedUrl =
      draft.backgroundMode === "url" &&
      bunnyUrlBackgroundPreview?.remoteUrl ===
        bunnyPreviewRemoteUrl &&
      !!bunnyUrlBackgroundPreview?.localUrl;

    var bunnyPreviewDraft =
      draft.backgroundMode === "url"
        ? (
            bunnyPreviewHasResolvedUrl
              ? {
                  ...draft,
                  backgroundMode: "local",
                  backgroundPath:
                    bunnyUrlBackgroundPreview.localUrl
                }
              : {
                  ...draft,
                  backgroundMode: "none"
                }
          )
        : draft;

    var previewManifest =
      bunnyCreatorManifest(
        bunnyPreviewDraft
      );
""";

        creator = replaceExactlyOnce(
                creator,
                previewManifestAnchor,
                previewManifestReplacement,
                "final URL background live preview source"
        );

        String backgroundPreviewAnchor =
                "    var backgroundPreview = bunnyResolveCreatorBackground(draft);\n";

        creator = replaceExactlyOnce(
                creator,
                backgroundPreviewAnchor,
                "    var backgroundPreview = " +
                        "bunnyResolveCreatorBackground(bunnyPreviewDraft);\n",
                "final URL selected media preview source"
        );

        String saveAnchor = """
      if (!remoteUrl) {
        return Promise.resolve(draft);
      }

      return import_react_native24.Linking.openURL(
""";

        String saveReplacement = """
      if (!remoteUrl) {
        return Promise.resolve(draft);
      }

      if (
        bunnyUrlBackgroundPreview?.remoteUrl === remoteUrl &&
        bunnyUrlBackgroundPreview?.localUrl
      ) {
        return Promise.resolve({
          ...draft,
          backgroundMode: "local",
          backgroundPath:
            bunnyUrlBackgroundPreview.localUrl
        });
      }

      return import_react_native24.Linking.openURL(
""";

        creator = replaceExactlyOnce(
                creator,
                saveAnchor,
                saveReplacement,
                "final URL background save cache reuse"
        );

        String bunnyV7SaveFunctionStart =
                "    var bunnyPrepareBackgroundForSave = () => {\n";

        String bunnyV7SaveFunctionEnd =
                "    var save = (apply) => {\n";

        String bunnyV7SaveFunctionReplacement = """
    var bunnyPrepareBackgroundForSave = () => {
      if (draft.backgroundMode !== "url") {
        return Promise.resolve(draft);
      }

      var remoteUrl =
        String(
          draft.backgroundUrl ??
          ""
        ).trim();

      if (!remoteUrl) {
        return Promise.resolve(draft);
      }

      if (
        bunnyUrlBackgroundPreview?.remoteUrl === remoteUrl &&
        bunnyUrlBackgroundPreview?.localUrl
      ) {
        return Promise.resolve({
          ...draft,
          backgroundMode: "local",
          backgroundPath:
            bunnyUrlBackgroundPreview.localUrl
        });
      }

      return bunnyFinalThemeBackgroundResolve(
        remoteUrl
      ).then((localUrl) => {
        if (
          typeof localUrl !== "string" ||
          !localUrl
        ) {
          throw new Error(
            "Background download did not return a local file."
          );
        }

        return {
          ...draft,
          backgroundMode: "local",
          backgroundPath: localUrl
        };
      });
    };

""";

        creator = replaceRangeExactlyOnce(
                creator,
                bunnyV7SaveFunctionStart,
                bunnyV7SaveFunctionEnd,
                bunnyV7SaveFunctionReplacement,
                "final URL background save shared resolver V7C"
        );

        return replaceRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                creator,
                "final URL background creator install"
        );
    }


    private static String patchUrlBackgroundImmediateLocalImportV8(
            String source
    ) throws IOException {
        final String marker =
                "BUNNY_URL_BACKGROUND_IMMEDIATE_LOCAL_V8";

        if (source.contains(marker)) {
            return source;
        }

        /*
         * First make the shared resolver use the same React Native Linking
         * owner already used by Bunny's working local/background import UI.
         */
        String oldResolverBridge =
                "    pending = import_react_native3.Linking.openURL(\n" +
                "      \"bunny-morphe://theme-background-url?url=\" +\n";

        String newResolverBridge =
                "    pending = import_react_native24.Linking.openURL(\n" +
                "      \"bunny-morphe://theme-background-url?url=\" +\n";

        int oldResolverCount =
                countLiteral(
                        source,
                        oldResolverBridge
                );

        int newResolverCount =
                countLiteral(
                        source,
                        newResolverBridge
                );

        if (
                oldResolverCount == 1
                        && newResolverCount == 0
        ) {
            source = replaceExactlyOnce(
                    source,
                    oldResolverBridge,
                    newResolverBridge,
                    "V8 URL resolver Linking owner"
            );
        } else if (
                !(
                        oldResolverCount == 0
                                && newResolverCount == 1
                )
        ) {
            throw new IOException(
                    "V8 URL resolver bridge state is ambiguous"
            );
        }

        String creatorStart =
                "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {\n";

        String creatorEnd =
                "  function Themes() {\n";

        String creator =
                extractRangeExactlyOnce(
                        source,
                        creatorStart,
                        creatorEnd,
                        "V8 URL immediate local creator"
                );

        String stateAnchor =
                "    var backgroundSourceRef = React.useRef(\"url\");\n";

        if (countLiteral(
                creator,
                stateAnchor
        ) != 1) {
            throw new IOException(
                    "V8 URL import state anchor was not unique"
            );
        }

        creator = replaceExactlyOnce(
                creator,
                stateAnchor,
                stateAnchor
                        + "    /* BUNNY_URL_BACKGROUND_IMMEDIATE_LOCAL_V8 */\n"
                        + "    var bunnyUrlImmediateImportRequestRef = React.useRef(0);\n",
                "V8 URL immediate import state"
        );

        String pickerAnchor =
                "    var pickLocalBackground = () => {\n";

        String effect = """
    React.useEffect(() => {
      var remoteUrl =
        String(
          draft.backgroundUrl ??
          ""
        ).trim();

      var requestId =
        ++bunnyUrlImmediateImportRequestRef.current;

      if (
        draft.backgroundMode !== "url" ||
        !/^https?:\\/\\//i.test(remoteUrl)
      ) {
        return;
      }

      var timer = setTimeout(() => {
        bunnyFinalThemeBackgroundResolve(remoteUrl)
          .then((localUrl) => {
            if (
              requestId !==
              bunnyUrlImmediateImportRequestRef.current
            ) {
              return;
            }

            if (
              typeof localUrl !== "string" ||
              !localUrl
            ) {
              return;
            }

            backgroundSourceRef.current = "local";

            if (
              typeof setBunnyUrlBackgroundPreview ===
              "function"
            ) {
              setBunnyUrlBackgroundPreview({
                remoteUrl,
                localUrl
              });
            }

            setDraft((prev) => {
              var currentUrl =
                String(
                  prev.backgroundUrl ??
                  ""
                ).trim();

              if (
                prev.backgroundMode !== "url" ||
                currentUrl !== remoteUrl
              ) {
                return prev;
              }

              return {
                ...prev,
                backgroundMode: "local",
                backgroundPath: localUrl
              };
            });
          })
          .catch((error) => {
            if (
              requestId !==
              bunnyUrlImmediateImportRequestRef.current
            ) {
              return;
            }

            try {
              showToast(
                "Failed to import background URL: " +
                  (error?.message ?? String(error)),
                findAssetId("Small")
              );
            } catch (_) {
            }
          });
      }, 450);

      return () => {
        clearTimeout(timer);
      };
    }, [
      draft.backgroundMode,
      draft.backgroundUrl
    ]);

""";

        if (countLiteral(
                creator,
                pickerAnchor
        ) != 1) {
            throw new IOException(
                    "V8 URL picker anchor was not unique"
            );
        }

        creator = replaceExactlyOnce(
                creator,
                pickerAnchor,
                effect + pickerAnchor,
                "V8 URL immediate local import effect"
        );

        return replaceRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                creator,
                "V8 URL immediate local creator install"
        );
    }



    private static String patchChatBackgroundThemeLifecycleV10(
            String source
    ) throws IOException {
        final String marker =
                "BUNNY_CHAT_BACKGROUND_THEME_LIFECYCLE_V10";

        if (source.contains(marker)) {
            return source;
        }

        /*
         * First-install / first-launch hardening.
         *
         * The native V5 path is deliberately independent from React rendering,
         * but its JS handoff historically depended on Messages.render().
         * On a cold first launch, the message surface can render before the
         * active Bunny theme has populated _colorRef.current. If that render is
         * not repeated after theme hydration, native never receives the saved
         * background until a later process/install cycle changes timing.
         *
         * updateBunnyColor() is the authoritative lifecycle boundary where
         * _colorRef.current is assigned. Queue one microtask after every
         * successful assignment so the existing native bridge receives the
         * current media as soon as the theme is authoritative. The existing
         * Messages.render sync remains as a fail-open fallback.
         */
        String updateAnchor =
                "    if (update) {\n" +
                "      AppearanceManager.setShouldSyncAppearanceSettings(false);\n" +
                "      AppearanceManager.updateTheme(internalDef != null ? ref.key : ref.lastSetDiscordTheme);\n" +
                "    }\n" +
                "  }\n" +
                "  var tokenRef2, origRawColor, AppearanceManager, ThemeStore, FormDivider, _inc, _colorRef;\n";

        String updateReplacement =
                "    if (update) {\n" +
                "      AppearanceManager.setShouldSyncAppearanceSettings(false);\n" +
                "      AppearanceManager.updateTheme(internalDef != null ? ref.key : ref.lastSetDiscordTheme);\n" +
                "    }\n" +
                "\n" +
                "    /* BUNNY_CHAT_BACKGROUND_THEME_LIFECYCLE_V10 */\n" +
                "    try {\n" +
                "      Promise.resolve()\n" +
                "        .then(() => bunnySyncNativeChatBackground())\n" +
                "        .catch(() => {});\n" +
                "    } catch (_) {\n" +
                "    }\n" +
                "  }\n" +
                "  var tokenRef2, origRawColor, AppearanceManager, ThemeStore, FormDivider, _inc, _colorRef;\n";

        return replaceExactlyOnce(
                source,
                updateAnchor,
                updateReplacement,
                "Bunny chat background theme lifecycle V10"
        );
    }




    private static String patchCreatorSaveStorageResilienceV11(
            String source
    ) throws IOException {
        final String marker =
                "BUNNY_CREATOR_SAVE_STORAGE_RESILIENCE_V11";

        if (source.contains(marker)) {
            return source;
        }

        String creatorStart =
                "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {\n";
        String creatorEnd =
                "  function Themes() {\n";

        String creator = extractRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                "Creator save storage V11"
        );

        /*
         * Do not match the whole historical promise chain. Earlier Creator
         * transforms legitimately change formatting and individual statements
         * inside this range. Only the two lifecycle boundaries are owned by
         * this patch:
         *
         *   start: Creator begins persistence through awaitStorage(themes)
         *   end:   Creator begins its post-save UI/state finalization
         *
         * Both boundaries are unique inside BunnyThemeCreator.
         */
        String persistenceStart =
                "        return awaitStorage(themes).then(() => {\n";

        String persistenceEnd =
                "          initialDraftRef.current = bunnyCreatorSnapshot(saveDraft);\n";

        String newPersistence = """
        /* BUNNY_CREATOR_SAVE_STORAGE_RESILIENCE_V11 */
        var bunnyThemeBackend =
          createFileBackend("vd_mmkv/VENDETTA_THEMES");

        return Promise.resolve(
          bunnyThemeBackend.get()
        ).catch(() => ({})).then((storedThemes) => {
          var bunnyStoredThemes =
            storedThemes &&
            typeof storedThemes === "object"
              ? { ...storedThemes }
              : {};

          if (bunnySavingExistingTheme) {
            entry.selected =
              !!bunnyStoredThemes[id]?.selected;
          }

          if (apply) {
            Object.keys(bunnyStoredThemes).forEach((key) => {
              if (
                bunnyStoredThemes[key] &&
                typeof bunnyStoredThemes[key] === "object"
              ) {
                bunnyStoredThemes[key] = {
                  ...bunnyStoredThemes[key],
                  selected: key === id
                };
              }
            });
            entry.selected = true;
          }

          bunnyStoredThemes[id] = entry;

          return Promise.resolve(
            bunnyThemeBackend.set(bunnyStoredThemes)
          ).then(() => {
            /*
             * Persist first, then mirror through wrapSync immediately.
             * The fresh-storage bridge queues/replays these writes if the
             * backing themes store has not resolved yet.
             */
            Object.keys(bunnyStoredThemes).forEach((key) => {
              themes[key] = bunnyStoredThemes[key];
            });

            return bunnyStoredThemes;
          });
        }).then((bunnyStoredThemes) => {
          if (!apply) return bunnyStoredThemes;

          return Promise.resolve(
            selectTheme(entry)
          ).then(() => {
            updateBunnyColor(
              entry.data,
              { update: true }
            );
            return bunnyStoredThemes;
          });
        }).then((bunnyStoredThemes) =>
          Promise.resolve(
            bunnyThemeBackend.set(bunnyStoredThemes)
          )
        ).then(() => {

""";

        creator = replaceRangeExactlyOnce(
                creator,
                persistenceStart,
                persistenceEnd,
                newPersistence,
                "Creator save persistence V11"
        );

        if (creator.contains(persistenceStart)) {
            throw new IOException(
                    "Creator save persistence V11 old blocking start survived"
            );
        }

        if (!creator.contains(marker)) {
            throw new IOException(
                    "Creator save persistence V11 marker missing after transform"
            );
        }

        return replaceRangeExactlyOnce(
                source,
                creatorStart,
                creatorEnd,
                creator,
                "Creator save storage V11 install"
        );
    }


    private static void verifyFinalBackgroundFix(String source) throws IOException {
        String[] required = {
                "BUNNY_CHAT_BACKGROUND_MEDIA_FINAL_V1",
                "BUNNY_URL_BACKGROUND_PREVIEW_CACHE_V1",
                "BUNNY_CHAT_BACKGROUND_THEME_LIFECYCLE_V10",
                "BUNNY_CREATOR_SAVE_STORAGE_RESILIENCE_V11",
                "bunnyFinalThemeBackgroundResolve",
                "bunnyFinalThemeBackgroundRemoteCache",
                "bunnyUrlBackgroundPreview",
                "bunnyPreviewDraft",
                "theme-background-url?url=",
                "return { url, opacity, alpha: opacity };"
        };

        for (String value : required) {
            if (!source.contains(value)) {
                throw new IOException(
                        "final background verification missing: " +
                        value
                );
            }
        }

        /* BUNNY_CHAT_BACKGROUND_V3_VERIFY_COMPAT */
        boolean legacyStretchLayout =
                source.contains(
                        "width: \"100%\",\n" +
                        "          height: \"100%\",\n" +
                        "          alignSelf: \"stretch\""
                );

        boolean v3AbsoluteLayer =
                source.contains(
                        "position: \"absolute\",\n" +
                        "          top: 0,\n" +
                        "          left: 0,\n" +
                        "          right: 0,\n" +
                        "          bottom: 0,\n" +
                        "          width: \"100%\",\n" +
                        "          height: \"100%\""
                )
                && source.contains(
                        "pointerEvents: \"none\""
                )
                && source.contains(
                        "bunnyChatBackgroundImageOpacity"
                )
                && source.contains(
                        "bunny-chat-background-inner-surface-v3"
                );

        if (!legacyStretchLayout && !v3AbsoluteLayer) {
            throw new IOException(
                    "final chat background layout verification missing"
            );
        }

        if (!source.contains(
                "_colorRef.current.background?.opacity ?? " +
                "_colorRef.current.background?.alpha ?? 1"
        )) {
            throw new IOException(
                    "final chat background opacity compatibility missing"
            );
        }
    }

    private static void verifyShippingRuntime(String source) throws IOException {
        if (!source.contains(SHIP_MARKER)) {
            throw new IOException("shipping marker missing");
        }
        String creator = extractRangeExactlyOnce(
                source,
                "  function BunnyThemeCreator({ onSaved, controllerRef, onStatusChange }) {",
                "  function Themes() {",
                "shipping verification Creator"
        );
        if (Pattern.compile("\\[\\s*\"advanced\"\\s*,", Pattern.DOTALL).matcher(creator).find()) {
            throw new IOException("shipping Creator still exposes Advanced selector option");
        }
        if ((creator.contains("bunnyCreatorPanel") || creator.contains("setBunnyCreatorPanel")) &&
                !Pattern.compile("\\[\\s*\"basic\"\\s*,\\s*\"Colors\"\\s*\\]", Pattern.DOTALL).matcher(creator).find()) {
            throw new IOException("shipping Colors selector label missing");
        }
        if (creator.contains("Advanced Colors") || creator.contains("Hide Advanced Colors")) {
            throw new IOException("shipping Creator still exposes Advanced Colors");
        }
        if (Pattern.compile("\\[\\s*\\\"advanced\\\"\\s*,", Pattern.DOTALL).matcher(creator).find()) {
            throw new IOException("shipping Creator still exposes Advanced selector option");
        }

        if (!source.contains(RELEASE_MARKER)) {
            throw new IOException("single edit 4 font button marker missing");
        }
        if (countLiteral(
                source,
                "openAlert(\"FontEditorActionSheet\", /* @__PURE__ */ jsx(AlertModal, {"
        ) != 2) {
            throw new IOException("single edit 3 floating font popup pair missing");
        }
        if (source.contains(
                "onPress: () => promptActionSheet(RevengeFontsExtractor, fontEntries, {"
        )) {
            throw new IOException("single edit 3 bottom-sheet theme extractor launcher survived");
        }
        if (source.contains(
                "onPress: () => promptActionSheet(JsonFontImporter, fontEntries, {"
        )) {
            throw new IOException("single edit 3 bottom-sheet link importer launcher survived");
        }
        if (!source.contains(
                "setName(fontName);\n" +
                        "              Object.assign(fonts2, themeFonts);\n" +
                        "              dismissAlert(\"FontEditorActionSheet\");"
        )) {
            throw new IOException("single edit 4 theme extractor alert dismissal missing");
        }
        if (!source.contains(
                "})().then(() => dismissAlert(\"FontEditorActionSheet\")).catch((e) => setError(String(e))).finally(() => setSaving(false));"
        )) {
            throw new IOException("single edit 4 link importer alert dismissal missing");
        }
        if (source.contains(
                "setName(fontName);\n" +
                        "              Object.assign(fonts2, themeFonts);\n" +
                        "              actionSheet2.hideActionSheet();"
        )) {
            throw new IOException("single edit 4 old theme extractor sheet closer survived");
        }
        if (source.contains(
                "})().then(() => actionSheet2.hideActionSheet()).catch((e) => setError(String(e))).finally(() => setSaving(false));"
        )) {
            throw new IOException("single edit 4 old link importer sheet closer survived");
        }

        /*
         * Keep the already-verified Bunny Links removal intact.
         */
        if (source.contains("onPress: () => url.openURL(GITHUB)") ||
                source.contains("onPress: () => import_react_native15.Linking.openURL(GITHUB).catch(() => {})")) {
            throw new IOException("shipping Bunny GitHub Links row survived");
        }
    }

    private static int countLiteral(String source, String needle) {
        int count = 0;
        int offset = 0;
        while (true) {
            int index = source.indexOf(needle, offset);
            if (index < 0) return count;
            count++;
            offset = index + needle.length();
        }
    }

    private static String extractRangeExactlyOnce(
            String source,
            String startAnchor,
            String endAnchor,
            String label
    ) throws IOException {
        int start = source.indexOf(startAnchor);
        if (start < 0) throw new IOException(label + " start anchor not found");
        if (source.indexOf(startAnchor, start + startAnchor.length()) >= 0) {
            throw new IOException(label + " start anchor ambiguous");
        }
        int end = source.indexOf(endAnchor, start + startAnchor.length());
        if (end < 0) throw new IOException(label + " end anchor not found");
        return source.substring(start, end);
    }

    private static String replaceRangeExactlyOnce(
            String source,
            String startAnchor,
            String endAnchor,
            String replacement,
            String label
    ) throws IOException {
        int start = source.indexOf(startAnchor);
        if (start < 0) throw new IOException(label + " start anchor not found");
        if (source.indexOf(startAnchor, start + startAnchor.length()) >= 0) {
            throw new IOException(label + " start anchor ambiguous");
        }
        int end = source.indexOf(endAnchor, start + startAnchor.length());
        if (end < 0) throw new IOException(label + " end anchor not found");
        return source.substring(0, start) + replacement + source.substring(end);
    }

    private static String replaceExactlyOnce(
            String source,
            String oldValue,
            String newValue,
            String label
    ) throws IOException {
        int first = source.indexOf(oldValue);
        if (first < 0) throw new IOException(label + " anchor not found");
        if (source.indexOf(oldValue, first + oldValue.length()) >= 0) {
            throw new IOException(label + " anchor ambiguous");
        }
        return source.substring(0, first) + newValue + source.substring(first + oldValue.length());
    }

    private static String replaceRegexExactlyOnce(
            String source,
            String regex,
            String replacement,
            String label
    ) throws IOException {
        Pattern pattern = Pattern.compile(regex, Pattern.DOTALL);
        Matcher matcher = pattern.matcher(source);
        if (!matcher.find()) throw new IOException(label + " regex not found");
        int start = matcher.start();
        int end = matcher.end();
        if (matcher.find()) throw new IOException(label + " regex ambiguous");
        return source.substring(0, start) + replacement + source.substring(end);
    }

    private static String replaceRegexOptionalOnce(
            String source,
            String regex,
            String replacement,
            String label
    ) throws IOException {
        Pattern pattern = Pattern.compile(regex, Pattern.DOTALL);
        Matcher matcher = pattern.matcher(source);
        if (!matcher.find()) return source;
        int start = matcher.start();
        int end = matcher.end();
        if (matcher.find()) throw new IOException(label + " regex ambiguous");
        return source.substring(0, start) + replacement + source.substring(end);
    }
}
