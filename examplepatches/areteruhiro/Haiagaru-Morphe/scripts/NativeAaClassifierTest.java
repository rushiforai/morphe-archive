package app.morphe.extension.chmate;

import java.util.Random;

public final class NativeAaClassifierTest {
    static long cases;
    // Original 191 bytecode: scan the whole UTF-16 string and decide afterward.
    static boolean nativeResult(String text) {
        int n=text.length(),count=0;
        for(int i=0;i<n;i++) {
            int c=text.charAt(i);
            if((32<=c&&c<48)||(123<=c&&c<1280)||(8704<=c&&c<9312)
                    ||(9472<=c&&c<9728)||c==58||c==59||c==124||c==12288)count++;
        }
        return count*3>n&&n>3;
    }
    static void check(String value) {
        if(nativeResult(value)!=NativeAaClassifier.classify(value))throw new AssertionError("length="+value.length());
        cases++;
    }
    public static void main(String[] args) {
        check("");
        for(int c=0;c<=Character.MAX_VALUE;c++) {
            String s=String.valueOf((char)c);
            check(s);check(s.repeat(4));check("日"+s+"本"+s+"語"+s);
        }
        for(int n=0;n<300;n++)for(int matching=0;matching<=n;matching++) {
            check(" ".repeat(matching)+"日".repeat(n-matching));
            check("日".repeat(n-matching)+" ".repeat(matching));
        }
        Random random=new Random(191);
        for(int i=0;i<10000;i++) {
            char[] text=new char[random.nextInt(1000)];
            for(int j=0;j<text.length;j++)text[j]=(char)random.nextInt(65536);
            check(new String(text));
        }
        check(" ".repeat(100000));check("日".repeat(100000));
        boolean threw=false;try{NativeAaClassifier.classify(null);}catch(NullPointerException expected){threw=true;}
        if(!threw)throw new AssertionError("native null contract");
        System.out.println("PASS "+cases+" native AA equivalence cases + null contract");
    }
}
