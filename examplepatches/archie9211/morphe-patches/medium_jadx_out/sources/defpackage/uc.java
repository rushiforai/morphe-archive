package defpackage;

import android.text.Editable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class uc {
    public static final uc BEGIN_PUNCTUATION_SPACER;
    public static final uc EMDASH_SPACER;
    public static final uc END_PUNCTUATION_SPACER;
    public static final uc PATTERN_CONTRACTION_CLOSING_QUOTE;
    public static final uc YEAR_SHORTHAND;
    public static final /* synthetic */ uc[] a;
    public static final /* synthetic */ i04 b;

    static {
        uc ucVar = new uc() { // from class: qc
            public final Pattern c = Pattern.compile(" — ");
            public final String d = "\u200a—\u200a";

            @Override // defpackage.uc
            public final void afterTextChanged(Editable editable) {
                editable.getClass();
                Matcher matcher = this.c.matcher(editable);
                while (matcher.find()) {
                    int iStart = matcher.start();
                    editable.replace(iStart, iStart + 3, this.d);
                }
            }
        };
        EMDASH_SPACER = ucVar;
        uc ucVar2 = new uc() { // from class: tc
            public final Pattern c = Pattern.compile("‘\\d{2}\\b");

            @Override // defpackage.uc
            public final void afterTextChanged(Editable editable) {
                editable.getClass();
                Matcher matcher = this.c.matcher(editable);
                while (matcher.find()) {
                    int iStart = matcher.start();
                    editable.replace(iStart, iStart + 1, "’");
                }
            }
        };
        YEAR_SHORTHAND = ucVar2;
        uc ucVar3 = new uc() { // from class: rc
            public final Pattern c;

            {
                gi7.a.getClass();
                this.c = Pattern.compile(" [" + fi7.e + "]");
            }

            @Override // defpackage.uc
            public final void afterTextChanged(Editable editable) {
                editable.getClass();
                Matcher matcher = this.c.matcher(editable);
                while (matcher.find()) {
                    int iStart = matcher.start();
                    editable.replace(iStart, iStart + 1, " ");
                }
            }
        };
        END_PUNCTUATION_SPACER = ucVar3;
        uc ucVar4 = new uc() { // from class: pc
            public final Pattern c;

            {
                gi7.a.getClass();
                this.c = Pattern.compile("[" + fi7.f + "] ");
            }

            @Override // defpackage.uc
            public final void afterTextChanged(Editable editable) {
                editable.getClass();
                Matcher matcher = this.c.matcher(editable);
                while (matcher.find()) {
                    int iStart = matcher.start();
                    editable.replace(iStart + 1, iStart + 2, " ");
                }
            }
        };
        BEGIN_PUNCTUATION_SPACER = ucVar4;
        uc ucVar5 = new uc() { // from class: sc
            public final Pattern c = Pattern.compile("(?<=\\S)'(?=\\S)");

            @Override // defpackage.uc
            public final void afterTextChanged(Editable editable) {
                editable.getClass();
                Matcher matcher = this.c.matcher(editable);
                while (matcher.find()) {
                    int iStart = matcher.start();
                    int iEnd = matcher.end();
                    if (editable.charAt(iStart) == '\'') {
                        editable.replace(iStart, iEnd, "’");
                    }
                }
            }
        };
        PATTERN_CONTRACTION_CLOSING_QUOTE = ucVar5;
        uc[] ucVarArr = {ucVar, ucVar2, ucVar3, ucVar4, ucVar5};
        a = ucVarArr;
        b = new i04(ucVarArr);
    }

    public uc(String str, int i, gy2 gy2Var) {
    }

    public static g04 getEntries() {
        return b;
    }

    public static uc valueOf(String str) {
        return (uc) Enum.valueOf(uc.class, str);
    }

    public static uc[] values() {
        return (uc[]) a.clone();
    }

    public abstract /* synthetic */ void afterTextChanged(Editable editable);
}
