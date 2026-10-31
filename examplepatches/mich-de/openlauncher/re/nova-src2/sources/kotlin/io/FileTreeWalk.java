package kotlin.io;

import java.io.File;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import m70.f;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/io/FileTreeWalk;", "Lkotlin/sequences/Sequence;", "Ljava/io/File;", "m70/g", "m70/b", "m70/f", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FileTreeWalk implements Sequence<File> {

    /* renamed from: a, reason: collision with root package name */
    public final File f71826a;

    /* renamed from: b, reason: collision with root package name */
    public final FileWalkDirection f71827b;

    public FileTreeWalk(File start, FileWalkDirection fileWalkDirection) {
        Intrinsics.g(start, "start");
        this.f71826a = start;
        this.f71827b = fileWalkDirection;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new f(this);
    }
}
