package defpackage;

import java.io.File;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vp0 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ File b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ vp0(File file, int i) {
        super(0);
        this.a = i;
        this.b = file;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        switch (this.a) {
            case 0:
                return String.format(Locale.US, "The file provided is not a batch file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 1:
                return String.format(Locale.ENGLISH, "Unable to parse the file name as a timestamp: %s", Arrays.copyOf(new Object[]{this.b.getName()}, 1));
            case 2:
                return String.format(Locale.US, "Unable to delete file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 3:
                return String.format(Locale.US, "Unable to delete file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 4:
                return ka1.r("Security exception was thrown for file ", this.b.getPath());
            case 5:
                return ka1.r("Unexpected exception was thrown for file ", this.b.getPath());
            case 6:
                return String.format(Locale.US, "Unable to delete file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 7:
                return String.format(Locale.US, "Unable to delete file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 8:
                return String.format(Locale.US, "Unable to move files; source directory does not exist: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 9:
                return String.format(Locale.US, "Unable to move files; file is not a directory: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 10:
                return String.format(Locale.US, "Unable to move files; could not create directory: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 11:
                return String.format(Locale.US, "Unable to move files; file is not a directory: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 12:
                Object obj = wg4.e;
                File file = this.b;
                synchronized (obj) {
                    wg4.d.remove(file.getAbsolutePath());
                }
                return c1e.a;
            case 13:
                return String.format(Locale.US, "Unable to read data from file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 14:
                return String.format(Locale.US, "Unable to read data from file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 15:
                return String.format(Locale.US, "File %s is probably corrupted, not all content was read.", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 16:
                return String.format(Locale.US, "Unable to write data to file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 17:
                return String.format(Locale.US, "Unable to write data to file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 18:
                return String.format(Locale.US, "Unable to read data from file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 19:
                return String.format(Locale.US, "Unable to read data from file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            case 20:
                return String.format(Locale.US, "Unable to read data from file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
            default:
                return String.format(Locale.US, "Unable to read data from file: %s", Arrays.copyOf(new Object[]{this.b.getPath()}, 1));
        }
    }
}
