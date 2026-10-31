package m90;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.FileSystemException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class v extends u {
    public static Long o(FileTime fileTime) {
        long millis = fileTime.toMillis();
        Long lValueOf = Long.valueOf(millis);
        if (millis != 0) {
            return lValueOf;
        }
        return null;
    }

    @Override // m90.u, m90.m
    public final void b(z source, z target) throws IOException {
        Intrinsics.g(source, "source");
        Intrinsics.g(target, "target");
        try {
            Files.move(source.h(), target.h(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
        } catch (UnsupportedOperationException unused) {
            throw new IOException("atomic move not supported");
        } catch (NoSuchFileException e3) {
            throw new FileNotFoundException(e3.getMessage());
        }
    }

    @Override // m90.u, m90.m
    public final h4.e j(z path) throws IOException {
        z zVarU;
        Intrinsics.g(path, "path");
        Path pathH = path.h();
        try {
            BasicFileAttributes attributes = Files.readAttributes(pathH, (Class<BasicFileAttributes>) BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS);
            Path symbolicLink = attributes.isSymbolicLink() ? Files.readSymbolicLink(pathH) : null;
            boolean zIsRegularFile = attributes.isRegularFile();
            boolean zIsDirectory = attributes.isDirectory();
            if (symbolicLink != null) {
                String str = z.f76176b;
                zVarU = br.a.u(symbolicLink.toString(), false);
            } else {
                zVarU = null;
            }
            Long lValueOf = Long.valueOf(attributes.size());
            FileTime fileTimeCreationTime = attributes.creationTime();
            Long lO = fileTimeCreationTime != null ? o(fileTimeCreationTime) : null;
            FileTime fileTimeLastModifiedTime = attributes.lastModifiedTime();
            Long lO2 = fileTimeLastModifiedTime != null ? o(fileTimeLastModifiedTime) : null;
            FileTime fileTimeLastAccessTime = attributes.lastAccessTime();
            return new h4.e(zIsRegularFile, zIsDirectory, zVarU, lValueOf, lO, lO2, fileTimeLastAccessTime != null ? o(fileTimeLastAccessTime) : null);
        } catch (NoSuchFileException | FileSystemException unused) {
            return null;
        }
    }

    @Override // m90.u
    public final String toString() {
        return "NioSystemFileSystem";
    }
}
