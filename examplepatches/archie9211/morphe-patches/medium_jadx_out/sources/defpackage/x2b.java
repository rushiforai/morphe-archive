package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x2b implements Serializable {
    public final Pattern a;

    public x2b(String str, y2b y2bVar) {
        str.getClass();
        y2bVar.getClass();
        int value = y2bVar.getValue();
        Pattern patternCompile = Pattern.compile(str, (value & 2) != 0 ? value | 64 : value);
        patternCompile.getClass();
        this.a = patternCompile;
    }

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() {
        Pattern pattern = this.a;
        String strPattern = pattern.pattern();
        strPattern.getClass();
        return new v2b(strPattern, pattern.flags());
    }

    public final ij7 a(int i, String str) {
        Matcher matcherRegion = this.a.matcher(str).useAnchoringBounds(false).useTransparentBounds(true).region(i, str.length());
        if (matcherRegion.lookingAt()) {
            return new ij7(matcherRegion, str);
        }
        return null;
    }

    public final ij7 b(CharSequence charSequence) {
        charSequence.getClass();
        Matcher matcher = this.a.matcher(charSequence);
        matcher.getClass();
        if (matcher.matches()) {
            return new ij7(matcher, charSequence);
        }
        return null;
    }

    public final boolean c(CharSequence charSequence) {
        charSequence.getClass();
        return this.a.matcher(charSequence).matches();
    }

    public final String d(CharSequence charSequence, String str) {
        String strReplaceAll = this.a.matcher(charSequence).replaceAll(str);
        strReplaceAll.getClass();
        return strReplaceAll;
    }

    public final String toString() {
        String string = this.a.toString();
        string.getClass();
        return string;
    }

    public x2b(String str) {
        str.getClass();
        Pattern patternCompile = Pattern.compile(str);
        patternCompile.getClass();
        this.a = patternCompile;
    }

    public x2b(Pattern pattern) {
        this.a = pattern;
    }
}
