package m70;

import java.io.File;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public final File f76044a;

    public g(File root) {
        Intrinsics.g(root, "root");
        this.f76044a = root;
    }

    public abstract File a();
}
