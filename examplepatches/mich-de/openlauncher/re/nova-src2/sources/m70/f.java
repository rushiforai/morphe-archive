package m70;

import java.io.File;
import java.util.ArrayDeque;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.AbstractIterator;
import kotlin.io.FileTreeWalk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends AbstractIterator {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayDeque f76042a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FileTreeWalk f76043b;

    public f(FileTreeWalk fileTreeWalk) {
        this.f76043b = fileTreeWalk;
        ArrayDeque arrayDeque = new ArrayDeque();
        this.f76042a = arrayDeque;
        File rootFile = fileTreeWalk.f71826a;
        if (rootFile.isDirectory()) {
            arrayDeque.push(a(rootFile));
        } else if (!rootFile.isFile()) {
            done();
        } else {
            Intrinsics.g(rootFile, "rootFile");
            arrayDeque.push(new d(rootFile));
        }
    }

    public final b a(File rootDir) {
        int iOrdinal = this.f76043b.f71827b.ordinal();
        if (iOrdinal == 0) {
            Intrinsics.g(rootDir, "rootDir");
            return new e(rootDir);
        }
        if (iOrdinal != 1) {
            throw new NoWhenBranchMatchedException();
        }
        Intrinsics.g(rootDir, "rootDir");
        return new c(rootDir);
    }

    @Override // kotlin.collections.AbstractIterator
    public final void computeNext() {
        File file;
        File fileA;
        while (true) {
            ArrayDeque arrayDeque = this.f76042a;
            g gVar = (g) arrayDeque.peek();
            if (gVar == null) {
                file = null;
                break;
            }
            fileA = gVar.a();
            if (fileA == null) {
                arrayDeque.pop();
            } else if (fileA.equals(gVar.f76044a) || !fileA.isDirectory() || arrayDeque.size() >= Integer.MAX_VALUE) {
                break;
            } else {
                arrayDeque.push(a(fileA));
            }
        }
        file = fileA;
        if (file != null) {
            setNext(file);
        } else {
            done();
        }
    }
}
