package defpackage;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.FileSystemException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mg8 extends ig6 {
    public static Long j0(FileTime fileTime) {
        long millis = fileTime.toMillis();
        Long lValueOf = Long.valueOf(millis);
        if (millis != 0) {
            return lValueOf;
        }
        return null;
    }

    @Override // defpackage.ig6, defpackage.ch4
    public final w73 R(g59 g59Var) {
        g59 g59VarR;
        g59Var.getClass();
        Path path = Paths.get(g59Var.a.t(), new String[0]);
        path.getClass();
        try {
            BasicFileAttributes attributes = Files.readAttributes(path, (Class<BasicFileAttributes>) BasicFileAttributes.class, LinkOption.NOFOLLOW_LINKS);
            Path symbolicLink = attributes.isSymbolicLink() ? Files.readSymbolicLink(path) : null;
            boolean zIsRegularFile = attributes.isRegularFile();
            boolean zIsDirectory = attributes.isDirectory();
            if (symbolicLink != null) {
                String str = g59.b;
                g59VarR = cd7.r(symbolicLink.toString());
            } else {
                g59VarR = null;
            }
            Long lValueOf = Long.valueOf(attributes.size());
            FileTime fileTimeCreationTime = attributes.creationTime();
            Long lJ0 = fileTimeCreationTime != null ? j0(fileTimeCreationTime) : null;
            FileTime fileTimeLastModifiedTime = attributes.lastModifiedTime();
            Long lJ02 = fileTimeLastModifiedTime != null ? j0(fileTimeLastModifiedTime) : null;
            FileTime fileTimeLastAccessTime = attributes.lastAccessTime();
            return new w73(zIsRegularFile, zIsDirectory, g59VarR, lValueOf, lJ0, lJ02, fileTimeLastAccessTime != null ? j0(fileTimeLastAccessTime) : null);
        } catch (NoSuchFileException | FileSystemException unused) {
            return null;
        }
    }

    @Override // defpackage.ig6, defpackage.ch4
    public final void m(g59 g59Var, g59 g59Var2) throws IOException {
        g59Var.getClass();
        g59Var2.getClass();
        try {
            Path path = Paths.get(g59Var.a.t(), new String[0]);
            path.getClass();
            Path path2 = Paths.get(g59Var2.a.t(), new String[0]);
            path2.getClass();
            Files.move(path, path2, StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
        } catch (UnsupportedOperationException unused) {
            ik4.g("atomic move not supported");
        } catch (NoSuchFileException e) {
            throw new FileNotFoundException(e.getMessage());
        }
    }

    @Override // defpackage.ig6
    public final String toString() {
        return "NioSystemFileSystem";
    }
}
