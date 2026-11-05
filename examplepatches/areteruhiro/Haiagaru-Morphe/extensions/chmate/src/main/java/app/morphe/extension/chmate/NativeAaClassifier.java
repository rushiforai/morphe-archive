package app.morphe.extension.chmate;

/** Equivalent to ChMate 191/226/242's native character-ratio test, with an early exit. */
public final class NativeAaClassifier {
    public static boolean classify(String text) {
        int length=text.length();
        if(length<=3)return false;
        int count=0,required=length/3+1;
        // For exceptionally large strings preserve native int multiplication
        // overflow semantics by finishing the full scan before deciding.
        boolean early=length<=Integer.MAX_VALUE/3;
        for(int i=0;i<length;i++) {
            char c=text.charAt(i);
            if(c>=0x20&&c<0x30 || c>=0x7b&&c<0x500
                    || c>=0x2200&&c<0x2460 || c>=0x2500&&c<0x2600
                    || c==0x3a || c==0x3b || c==0x7c || c==0x3000) {
                count++;
                if(early&&count>=required)return true;
            }
        }
        return count*3>length;
    }
    private NativeAaClassifier(){}
}
