package h10;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/* loaded from: classes4.dex */
public final class v0 extends SimpleFileVisitor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ZipOutputStream f58992a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Path f58993b;

    public v0(ZipOutputStream zipOutputStream, Path path) {
        this.f58992a = zipOutputStream;
        this.f58993b = path;
    }

    @Override // java.nio.file.SimpleFileVisitor, java.nio.file.FileVisitor
    public final FileVisitResult visitFile(Object obj, BasicFileAttributes basicFileAttributes) throws IOException {
        Path path = (Path) obj;
        ZipEntry zipEntry = new ZipEntry(this.f58993b.relativize(path).toString());
        ZipOutputStream zipOutputStream = this.f58992a;
        zipOutputStream.putNextEntry(zipEntry);
        Files.copy(path, zipOutputStream);
        zipOutputStream.closeEntry();
        return FileVisitResult.CONTINUE;
    }
}
