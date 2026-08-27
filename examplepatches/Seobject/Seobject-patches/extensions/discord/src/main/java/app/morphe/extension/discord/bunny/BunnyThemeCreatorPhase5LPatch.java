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

        verifyShippingRuntime(patched);
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
