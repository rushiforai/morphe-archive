package app.morphe.extension.chmate;
/** Isolated fixture policy: no preferences or application data are accessed. */
final class WacchoiStorageLimits {
    static long limit=Long.MAX_VALUE;
    static boolean fresh(android.content.Context ignored,java.io.File file){return file.isFile();}
    static long scaled(android.content.Context ignored,int index,long unit){return limit;}
}
