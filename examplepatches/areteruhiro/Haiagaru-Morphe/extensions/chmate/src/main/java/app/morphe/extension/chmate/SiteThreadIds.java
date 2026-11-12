package app.morphe.extension.chmate;

import java.io.IOException;

/** ChMate's native non-timestamp thread namespace. Source IDs remain unchanged upstream. */
final class SiteThreadIds {
    static final long BASE=9240000000L;
    static String source(String value)throws IOException{
        if(value==null||!value.matches("[0-9]{1,12}"))throw new IOException("スレ番号が不正です");
        long number=Long.parseLong(value);if(number>BASE&&number<BASE*2)number-=BASE;
        if(number<=0||number>=BASE)throw new IOException("スレ番号が対応範囲外です");
        return Long.toString(number);
    }
    static long nativeId(String value)throws IOException{
        if(value==null||!value.matches("[0-9]{1,12}"))throw new IOException("スレ番号が不正です");
        long number=Long.parseLong(value);if(number<=0||number>=BASE)throw new IOException("元サイトのスレ番号が対応範囲外です");
        return BASE+number;
    }
    static long nativeInput(String value)throws IOException{return nativeId(source(value));}
    private SiteThreadIds(){}
}
