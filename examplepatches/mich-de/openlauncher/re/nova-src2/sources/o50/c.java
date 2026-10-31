package o50;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final e f79544a;

    static {
        new e("multipart", "*");
        new e("multipart", "mixed");
        new e("multipart", "alternative");
        new e("multipart", "related");
        f79544a = new e("multipart", "form-data");
        new e("multipart", "signed");
        new e("multipart", "encrypted");
        new e("multipart", "byteranges");
    }

    public static e a() {
        return f79544a;
    }
}
