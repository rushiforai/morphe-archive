package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.common.ui.Ezz.Plbho;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y5d {
    public static final y5d AUTO_DETECT;
    public static final y5d BASH;
    public static final y5d C;
    public static final y5d CSS;
    public static final y5d C_PLUS_PLUS;
    public static final y5d C_SHARP;
    public static final x5d Companion;
    public static final y5d DART;
    public static final y5d DIFF;
    public static final y5d DISABLE_HIGHLIGHT;
    public static final y5d GO;
    public static final y5d GRAPHQL;
    public static final y5d INI;
    public static final y5d JAVA;
    public static final y5d JAVA_SCRIPT;
    public static final y5d JSON;
    public static final y5d KOTLIN;
    public static final y5d LESS;
    public static final y5d LUA;
    public static final y5d MAKEFILE;
    public static final y5d MARKDOWN;
    public static final y5d OBJECTIVE_C;
    public static final y5d PERL;
    public static final y5d PHP;
    public static final y5d PHP_TEMPLATE;
    public static final y5d PLAIN_TEXT;
    public static final y5d PYTHON;
    public static final y5d PYTHON_REPL;
    public static final y5d R;
    public static final y5d RUBY;
    public static final y5d RUST;
    public static final y5d SCSS;
    public static final y5d SHELL;
    public static final y5d SQL;
    public static final y5d SWIFT;
    public static final y5d TYPE_SCRIPT;
    public static final y5d VB_NET;
    public static final y5d WASM;
    public static final y5d XML;
    public static final y5d YAML;
    public static final /* synthetic */ y5d[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    public y5d(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static y5d valueOf(String str) {
        return (y5d) Enum.valueOf(y5d.class, str);
    }

    public static y5d[] values() {
        return (y5d[]) b.clone();
    }

    public final String getLanguageName() {
        return this.a;
    }

    static {
        y5d y5dVar = new y5d("DISABLE_HIGHLIGHT", 0, "no-highlight");
        DISABLE_HIGHLIGHT = y5dVar;
        y5d y5dVar2 = new y5d("AUTO_DETECT", 1, null);
        AUTO_DETECT = y5dVar2;
        y5d y5dVar3 = new y5d("BASH", 2, "bash");
        BASH = y5dVar3;
        y5d y5dVar4 = new y5d("C", 3, "c");
        C = y5dVar4;
        y5d y5dVar5 = new y5d("CSS", 4, "css");
        CSS = y5dVar5;
        y5d y5dVar6 = new y5d("C_PLUS_PLUS", 5, "cpp");
        C_PLUS_PLUS = y5dVar6;
        y5d y5dVar7 = new y5d("C_SHARP", 6, "csharp");
        C_SHARP = y5dVar7;
        y5d y5dVar8 = new y5d("DART", 7, "dart");
        DART = y5dVar8;
        y5d y5dVar9 = new y5d("DIFF", 8, "diff");
        DIFF = y5dVar9;
        y5d y5dVar10 = new y5d("GO", 9, "go");
        GO = y5dVar10;
        y5d y5dVar11 = new y5d("GRAPHQL", 10, Plbho.YDKUOpYTBOMm);
        GRAPHQL = y5dVar11;
        y5d y5dVar12 = new y5d("INI", 11, "ini");
        INI = y5dVar12;
        y5d y5dVar13 = new y5d("JAVA", 12, "java");
        JAVA = y5dVar13;
        y5d y5dVar14 = new y5d("JAVA_SCRIPT", 13, "javascript");
        JAVA_SCRIPT = y5dVar14;
        y5d y5dVar15 = new y5d("JSON", 14, "json");
        JSON = y5dVar15;
        y5d y5dVar16 = new y5d("KOTLIN", 15, "kotlin");
        KOTLIN = y5dVar16;
        y5d y5dVar17 = new y5d("LESS", 16, "less");
        LESS = y5dVar17;
        y5d y5dVar18 = new y5d("LUA", 17, "lua");
        LUA = y5dVar18;
        y5d y5dVar19 = new y5d("MAKEFILE", 18, "makefile");
        MAKEFILE = y5dVar19;
        y5d y5dVar20 = new y5d("MARKDOWN", 19, "markdown");
        MARKDOWN = y5dVar20;
        y5d y5dVar21 = new y5d("OBJECTIVE_C", 20, "objectivec");
        OBJECTIVE_C = y5dVar21;
        y5d y5dVar22 = new y5d("PERL", 21, "perl");
        PERL = y5dVar22;
        y5d y5dVar23 = new y5d("PHP", 22, "php");
        PHP = y5dVar23;
        y5d y5dVar24 = new y5d("PHP_TEMPLATE", 23, "php-template");
        PHP_TEMPLATE = y5dVar24;
        y5d y5dVar25 = new y5d("PLAIN_TEXT", 24, "plaintext");
        PLAIN_TEXT = y5dVar25;
        y5d y5dVar26 = new y5d("PYTHON", 25, "python");
        PYTHON = y5dVar26;
        y5d y5dVar27 = new y5d("PYTHON_REPL", 26, "python-repl");
        PYTHON_REPL = y5dVar27;
        y5d y5dVar28 = new y5d("R", 27, "r");
        R = y5dVar28;
        y5d y5dVar29 = new y5d("RUBY", 28, "ruby");
        RUBY = y5dVar29;
        y5d y5dVar30 = new y5d("RUST", 29, "rust");
        RUST = y5dVar30;
        y5d y5dVar31 = new y5d("SCSS", 30, "scss");
        SCSS = y5dVar31;
        y5d y5dVar32 = new y5d("SHELL", 31, "shell");
        SHELL = y5dVar32;
        y5d y5dVar33 = new y5d("SQL", 32, "sql");
        SQL = y5dVar33;
        y5d y5dVar34 = new y5d("SWIFT", 33, "swift");
        SWIFT = y5dVar34;
        y5d y5dVar35 = new y5d("TYPE_SCRIPT", 34, "typescript");
        TYPE_SCRIPT = y5dVar35;
        y5d y5dVar36 = new y5d("VB_NET", 35, "vbnet");
        VB_NET = y5dVar36;
        y5d y5dVar37 = new y5d("WASM", 36, "wasm");
        WASM = y5dVar37;
        y5d y5dVar38 = new y5d("XML", 37, "xml");
        XML = y5dVar38;
        y5d y5dVar39 = new y5d(peNPu.ZPqFUMIZbZBo, 38, "yaml");
        YAML = y5dVar39;
        y5d[] y5dVarArr = {y5dVar, y5dVar2, y5dVar3, y5dVar4, y5dVar5, y5dVar6, y5dVar7, y5dVar8, y5dVar9, y5dVar10, y5dVar11, y5dVar12, y5dVar13, y5dVar14, y5dVar15, y5dVar16, y5dVar17, y5dVar18, y5dVar19, y5dVar20, y5dVar21, y5dVar22, y5dVar23, y5dVar24, y5dVar25, y5dVar26, y5dVar27, y5dVar28, y5dVar29, y5dVar30, y5dVar31, y5dVar32, y5dVar33, y5dVar34, y5dVar35, y5dVar36, y5dVar37, y5dVar38, y5dVar39};
        b = y5dVarArr;
        c = new i04(y5dVarArr);
        Companion = new x5d();
    }
}
