package o80;

import java.io.File;
import java.io.FilenameFilter;
import java.io.Serializable;
import java.util.regex.Pattern;

/* loaded from: classes5.dex */
public final class j implements FilenameFilter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79739a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final Serializable f79740b;

    public j(String str) {
        this.f79740b = str;
    }

    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String str) {
        switch (this.f79739a) {
            case 0:
                return str != null && str.startsWith((String) this.f79740b);
            default:
                return ((Pattern) this.f79740b).matcher(str).matches();
        }
    }

    public j(Pattern pattern) {
        pattern.getClass();
        this.f79740b = pattern;
    }
}
