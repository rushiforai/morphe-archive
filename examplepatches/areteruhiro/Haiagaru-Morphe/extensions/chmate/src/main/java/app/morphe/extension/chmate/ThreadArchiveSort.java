package app.morphe.extension.chmate;

import java.io.File;
import java.util.regex.*;

final class ThreadArchiveSort {
    private static final Pattern KEY=Pattern.compile("(?:^|\\[|_)([0-9]{9,13})(?:])?(?:\\.dat)?$");
    static long created(File f){
        for(File current=f;current!=null;current=current.getParentFile()){
            Matcher m=KEY.matcher(current.getName());
            if(m.find())return Long.parseLong(m.group(1));
        }
        return 0;
    }
    static int compare(File a,File b,int mode){
        long x=mode<=2?created(a):a.lastModified(),y=mode<=2?created(b):b.lastModified();
        if(x==0 || y==0){if(x!=y)return x==0?1:-1;}
        int order=mode==1||mode==3?Long.compare(y,x):Long.compare(x,y);
        return order!=0?order:a.getName().compareTo(b.getName());
    }
}
