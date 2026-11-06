package app.morphe.extension.playbooks.fonts;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Adjusts the reader engine (assets/compiled.js).
 *
 * <p>The engine has its own font override: when a font family is chosen in the reader, it injects
 * {@code * { font-family: "<family>" !important; }}, puts the family first in every publisher rule
 * and deletes every other @font-face rule. The custom font is served for the bundled "literata"
 * files, so pinning the override to "literata" shows the custom font through that same mechanism,
 * for layout and display alike.
 *
 * <ul>
 * <li>Force over publisher fonts: the override is always "literata", even when no font is chosen.</li>
 * <li>Replace every reader font: any font chosen in the reader becomes "literata".</li>
 * <li>Removes the bold/italic @font-face rules of replaced families when no matching custom face
 * exists, so the browser synthesizes them from the regular custom font.</li>
 * <li>Optionally keeps code and preformatted text out of the injected override rule.</li>
 * </ul>
 *
 * Every step is a text match. If a future engine no longer contains a pattern the step does
 * nothing and the reader's bundled font files are still replaced by the request interceptor.
 */
public final class CompiledJsRewriter {
    private static final Pattern FONT_FACE = Pattern.compile("@font-face\\s*\\{[^{}]*\\}");
    private static final Pattern FONT_URL = Pattern.compile("url\\(\\s*[\"']?/fonts/([^\"')\\s]+)");

    /**
     * Font settings constructor: {@code b&&(b=Ag(b,"\"'"),b=b=="serif"?"literata":b);this.Z=b;}
     * Group 1 is the family parameter, group 2 the field holding the override.
     */
    private static final Pattern OVERRIDE_ASSIGNMENT = Pattern.compile(
            "(\\w+)&&\\(\\1=\\w+\\(\\1,\"\\\\\"'\"\\),\\1=\\1==\"serif\"\\?\"literata\":\\1\\);this\\.(\\w+)=\\1;");

    /**
     * Builder of the @font-face rules the app passes in at runtime (e.g. "gpb-literata" bold and
     * italic faces, used with the publisher default font): {@code J(c,function(d){b.push(["@font-face {",}
     * Group 1 is the font descriptor, group 2 the rule list.
     */
    private static final Pattern DYNAMIC_FACE_BUILDER = Pattern.compile(
            "function\\((\\w+)\\)\\{(\\w+)\\.push\\(\\[\"@font-face \\{\",");

    /** Start of the per-rule style processing: {@code a=a.style;if(!a)return f;} */
    private static final Pattern RULE_STYLE = Pattern.compile("(\\w+)=\\1\\.style;if\\(!\\1\\)return \\w+;");

    /** First check of the same function: {@code if(b.Z&&a.constructor.name==="CSSFontFaceRule"} */
    private static final Pattern RULE_OVERRIDE_FIELD = Pattern.compile(
            "if\\((\\w+)\\.(\\w+)&&(\\w+)\\.constructor\\.name===\"CSSFontFaceRule\"");

    /**
     * Helpers prepended to the engine. Publishers often make text bold with a separate bold font
     * family (e.g. "XxxBold") instead of font-weight. The override replaces that family with the
     * custom font, so the weight is lost. These helpers remember which publisher families are bold
     * and log the fonts a book uses (logcat tag BooksJS, enable with
     * {@code adb shell setprop log.tag.BooksJS DEBUG}).
     */
    /** Matches Chromium's synthetic bold for typical text (measured with RIDIBatang). */
    static final String BOLD_STROKE_EM = "0.025";
    static final String BOLD_STROKE_WIDTH = BOLD_STROKE_EM + "em";

    static final String BOLD_HELPERS = "window.__bp=window.__bp||{seen:{},fam:{},"
            // Numeric value of a font-weight declaration, 0 if unset.
            + "w:function(v){v=String(v||\"\").trim();return v===\"bold\"||v===\"bolder\"?700:"
            + "v===\"normal\"||v===\"lighter\"?400:parseInt(v,10)||0},"
            // Weight implied by a family or file name: words (Light, Medium, Bold, ...) or a trailing
            // weight code after a lowercase letter or digit, as in KoPub "KOPUSMjB" (B = bold).
            + "wn:function(x){x=String(x||\"\").replace(/[\"']/g,\"\").replace(/^.*\\//,\"\").replace(/\\.[A-Za-z0-9]+([?#].*)?$/,\"\").trim();"
            + "var r=[[/(extra|ultra)[\\s_-]?bold|heavy|black/i,800],[/(semi|demi)[\\s_-]?bold/i,600],[/bold/i,700],"
            + "[/medium/i,500],[/(extra|ultra)[\\s_-]?light|thin|hairline/i,200],[/light/i,300],[/regular|book/i,400]];"
            + "for(var i=0;i<r.length;i++)if(r[i][0].test(x))return r[i][1];"
            + "var m=/(?:[a-z0-9]|[\\s_-])(EB|XB|UB|SB|DB|EL|UL|B|M|L|R|T|H)$/.exec(x);"
            + "return m?{EB:800,XB:800,UB:800,SB:600,DB:600,EL:200,UL:200,B:700,M:500,L:300,R:400,T:100,H:900}[m[1]]:0},"
            + "log:function(m){if(this.seen[m])return;this.seen[m]=1;try{bridge.logD(\"BooksPiko \"+m)}catch(e){}},"
            + "clean:function(f){return String(f||\"\").replace(/[\"']/g,\"\").trim()},"
            // Each publisher family keeps its faces: d = declared font-weight (400 if unset), a = actual
            // weight of the file, from its file name, the family name or the declaration.
            + "face:function(r){var s=r.style,f=this.clean(s.getPropertyValue(\"font-family\")),"
            + "w=s.getPropertyValue(\"font-weight\"),src=s.getPropertyValue(\"src\")||\"\","
            + "u=/url\\(\\s*[\"']?([^\"')]+)/.exec(src),d=this.w(w)||400,a=(u?this.wn(u[1]):0)||this.wn(f)||d,"
            + "k=f.toLowerCase(),l=this.fam[k]=this.fam[k]||[];"
            + "l.some(function(x){return x.d===d&&x.a===a})||l.push({d:d,a:a});"
            + "this.log(\"face family=\"+f+\" weight=\"+(w||\"-\")+\" actual=\"+a+\" src=\"+src.slice(0,160))},"
            // Face the browser would pick for a requested weight (CSS font matching, simplified).
            + "pick:function(fs,e){var b=null;for(var i=0;i<fs.length;i++){var x=fs[i];"
            + "if(!b){b=x;continue}var dx=Math.abs(x.d-e),db=Math.abs(b.d-e);"
            + "if(dx<db||dx===db&&(e>=500?x.d>b.d:x.d<b.d))b=x}return b},"
            // Weight the publisher meant for a rule: the matching face of its first known family
            // (requested weight: the rule's, or normal), bold-synthesized if no bold face exists.
            + "weight:function(s){var ff=s.fontFamily,e=this.w(s.fontWeight),r=0,fs=null,n=0;"
            + "if(ff){var l=ff.split(\",\");for(var i=0;i<l.length&&!fs&&!n;i++){var x=this.clean(l[i]);"
            + "fs=this.fam[x.toLowerCase()];if(!fs)n=this.wn(x)}}"
            + "if(fs){var q=e||400,p=this.pick(fs,q);r=q>=600&&p.d<600?Math.max(p.a,q):p.a}"
            + "else r=n?Math.max(n,e>=600?e:0):e;"
            + "if(ff||e)this.log(\"rule family=\"+(ff||\"-\")+\" weight=\"+(s.fontWeight||\"-\")+\" resolved=\"+(r||\"-\"));return r},"
            // Stroke width that imitates the weight: 0.025em for bold (700), proportional above 400.
            + "apply:function(s){var r=this.weight(s);if(!r)return;"
            + "s.setProperty(\"-webkit-text-stroke-width\",r>400?(Math.min(r,900)-400)/300*" + BOLD_STROKE_EM + "+\"em\":\"0\")}};\n";

    /** The injected override rule: {@code '* { font-family: "'+a+'" !important; }'} */
    private static final Pattern CHOSEN_FONT_RULE = Pattern.compile("'\\* \\{ font-family: \"'\\+(\\w+)\\+'\"");

    /** Bold by default in the user agent style sheet, or bold inline styles. Zero specificity. */
    static final String DEFAULT_BOLD_RULE = "* { font-synthesis: style; } "
            + ":where(b, strong, h1, h2, h3, h4, h5, h6, th, dt, [style*=\"font-weight: bold\" i], "
            + "[style*=\"font-weight:bold\" i], [style*=\"font-weight: 700\"], [style*=\"font-weight:700\"]) "
            + "{ -webkit-text-stroke-width: " + BOLD_STROKE_WIDTH + "; } ";

    static final String DEFAULT_BODY_RULE = "body { font-family: literata; }";
    static final String CHOSEN_FONT_RULE_START = "'* { font-family: \"'";

    static final String MONOSPACE_SAFE_SELECTOR =
            "*:not(pre):not(code):not(kbd):not(samp):not(tt):not(pre *):not(code *)";

    private CompiledJsRewriter() {
    }

    public static final class Result {
        public final String js;
        public final String summary;

        Result(String js, String summary) {
            this.js = js;
            this.summary = summary;
        }
    }

    public static Result rewrite(String js, FontConfig config) {
        StringBuilder summary = new StringBuilder();

        // Bold/italic faces without a custom file.
        StringBuffer result = new StringBuffer(js.length());
        Matcher face = FONT_FACE.matcher(js);
        int removedFaces = 0;
        while (face.find()) {
            String block = face.group();
            String replacement = block;

            Matcher url = FONT_URL.matcher(block);
            if (url.find()) {
                String file = url.group(1);
                FontVariant variant = FontVariant.ofFileName(file);
                if (config.replaces(file) && variant != FontVariant.REGULAR
                        && !config.availableVariants.contains(variant)) {
                    replacement = "";
                    removedFaces++;
                }
            }

            face.appendReplacement(result, Matcher.quoteReplacement(replacement));
        }
        face.appendTail(result);
        String rewritten = result.toString();
        summary.append("removedFaces=").append(removedFaces);

        // Same rule for the faces built at runtime.
        Matcher builder = DYNAMIC_FACE_BUILDER.matcher(rewritten);
        if (builder.find()) {
            String descriptor = builder.group(1);
            String rules = builder.group(2);
            String replacement = "function(" + descriptor + "){" + skipFaceExpression(config, descriptor + ".url")
                    + "||" + rules + ".push([\"@font-face {\",";
            rewritten = rewritten.substring(0, builder.start()) + replacement + rewritten.substring(builder.end());
            summary.append(" dynamicFaces=filtered");
        } else {
            summary.append(" dynamicFaces=NOT_FOUND");
        }

        // Pin the engine's font override to the replaced default family.
        if (config.forceOverPublisherFonts || config.replaceAllFamilies) {
            Matcher override = OVERRIDE_ASSIGNMENT.matcher(rewritten);
            if (override.find()) {
                String family = override.group(1);
                String field = override.group(2);
                String replacement = config.forceOverPublisherFonts
                        ? "this." + field + "=\"literata\";"
                        : family + "&&(" + family + "=\"literata\");this." + field + "=" + family + ";";
                rewritten = rewritten.substring(0, override.start()) + replacement + rewritten.substring(override.end());
                summary.append(" override=").append(config.forceOverPublisherFonts ? "always" : "chosen");
            } else {
                summary.append(" override=NOT_FOUND");
            }
        }

        // Some WebViews do not synthesize bold for web fonts. Draw bold text with a stroke instead,
        // only while the custom font is the override ("literata").
        if (config.strokeBold && !config.availableVariants.contains(FontVariant.BOLD)) {
            Matcher field = RULE_OVERRIDE_FIELD.matcher(rewritten);
            Matcher style = RULE_STYLE.matcher(rewritten);
            Matcher chosen = CHOSEN_FONT_RULE.matcher(rewritten);
            if (field.find() && style.find(field.end()) && chosen.find()) {
                String settings = field.group(1) + "." + field.group(2);
                String declaration = style.group(1);
                String hook = settings + "===\"literata\"&&__bp.apply(" + declaration + ");";
                String faceHook = "window.__bp&&" + field.group(3) + ".constructor.name===\"CSSFontFaceRule\"&&__bp.face("
                        + field.group(3) + ");";
                String family = chosen.group(1);
                String rule = "(" + family + "==\"literata\"?'" + DEFAULT_BOLD_RULE + "':'')+" + chosen.group();

                // Edit from the end so earlier offsets stay valid.
                int[][] edits = {
                        {field.start(), field.start()},
                        {style.end(), style.end()},
                        {chosen.start(), chosen.end()},
                };
                String[] texts = {faceHook, hook, rule};
                Integer[] order = {0, 1, 2};
                java.util.Arrays.sort(order, new java.util.Comparator<Integer>() {
                    @Override
                    public int compare(Integer a, Integer b) {
                        return edits[b][0] - edits[a][0];
                    }
                });
                StringBuilder edited = new StringBuilder(rewritten);
                for (int index : order) {
                    edited.replace(edits[index][0], edits[index][1], texts[index]);
                }
                rewritten = BOLD_HELPERS + edited;
                summary.append(" strokeBold=on");
            } else {
                summary.append(" strokeBold=NOT_FOUND");
            }
        }

        if (config.keepMonospace && rewritten.contains(CHOSEN_FONT_RULE_START)) {
            rewritten = rewritten.replace(CHOSEN_FONT_RULE_START, "'" + MONOSPACE_SAFE_SELECTOR + " { font-family: \"'");
            summary.append(" monospace=kept");
        }

        // Fallback for engines where the override assignment was not found.
        if (config.forceOverPublisherFonts && rewritten.contains(DEFAULT_BODY_RULE)) {
            String selector = config.keepMonospace ? MONOSPACE_SAFE_SELECTOR : "*";
            rewritten = rewritten.replace(DEFAULT_BODY_RULE, selector + " { font-family: literata !important; }");
            summary.append(" bodyRule=forced");
        }

        return new Result(rewritten, summary.toString());
    }

    /**
     * JavaScript expression that is true for a bold/italic face of a replaced family without a
     * custom file. Mirrors {@link FontVariant#ofFileName} and {@link FontConfig#replaces}.
     */
    static String skipFaceExpression(FontConfig config, String urlExpression) {
        return "(function(u){var m=/\\/fonts\\/([^\\/?#]+)/.exec(u||\"\");if(!m)return!1;"
                + "var f=m[1].toLowerCase(),b=f.indexOf(\"bold\")>=0,i=f.indexOf(\"italic\")>=0;"
                + "if(!(b||i))return!1;"
                + (config.replaceAllFamilies ? "" : "if(f.indexOf(\"" + FontConfig.DEFAULT_FAMILY_FILE_PREFIX + "\")!=0)return!1;")
                + "return b&&i?" + js(!config.availableVariants.contains(FontVariant.BOLD_ITALIC))
                + ":b?" + js(!config.availableVariants.contains(FontVariant.BOLD))
                + ":" + js(!config.availableVariants.contains(FontVariant.ITALIC))
                + "})(" + urlExpression + ")";
    }

    private static String js(boolean value) {
        return value ? "!0" : "!1";
    }
}
