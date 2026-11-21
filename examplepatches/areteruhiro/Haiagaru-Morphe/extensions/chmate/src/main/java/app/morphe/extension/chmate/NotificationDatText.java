package app.morphe.extension.chmate;

import java.io.*;
import java.nio.charset.*;
import java.util.Arrays;
import java.util.Locale;

/** Selects between UTF-8 and the board's legacy DAT charset using decoded Japanese text. */
final class NotificationDatText {
    private static final int SAMPLE_BYTES=64*1024;
    private static final String MOJIBAKE="縺繧譁蜿莠繝ãæ�";

    static String decode(byte[] bytes,String fallback){
        Charset legacy=charset(fallback);
        if(legacy.equals(StandardCharsets.UTF_8))return new String(bytes,StandardCharsets.UTF_8);
        String utf8=new String(bytes,StandardCharsets.UTF_8),other=new String(bytes,legacy);
        return quality(utf8)>quality(other)?utf8:other;
    }

    static Reader reader(File file,String fallback)throws IOException{
        Charset legacy=charset(fallback),selected=legacy;
        if(!legacy.equals(StandardCharsets.UTF_8)){
            byte[] sample=new byte[SAMPLE_BYTES];int size;
            try(InputStream in=new FileInputStream(file)){
                int count=0,n;while(count<sample.length&&(n=in.read(sample,count,sample.length-count))>0)count+=n;
                size=count;
            }
            if(size>0){sample=Arrays.copyOf(sample,size);String utf8=new String(sample,StandardCharsets.UTF_8),other=new String(sample,legacy);
                if(quality(utf8)>quality(other))selected=StandardCharsets.UTF_8;
            }
        }
        return new BufferedReader(new InputStreamReader(new FileInputStream(file),selected));
    }
    private static Charset charset(String value){
        try{return Charset.forName(value==null?"MS932":value.trim());}
        catch(Exception invalid){return Charset.forName("MS932");}
    }
    private static int quality(String text){
        int score=0;
        for(int i=0;i<text.length();i++){
            char c=text.charAt(i);
            if(c>='\u3040'&&c<='\u309f')score+=5;
            else if(c>='\u30a0'&&c<='\u30ff')score+=4;
            else if(c>='\u3400'&&c<='\u9fff')score+=2;
            else if(c>='\u3000'&&c<='\u303f')score+=2;
            else if(c=='\ufffd'||Character.isISOControl(c)&&c!='\n'&&c!='\r'&&c!='\t')score-=12;
        }
        String lower=text.toLowerCase(Locale.ROOT);
        for(int i=0;i<MOJIBAKE.length();i++){
            char marker=MOJIBAKE.charAt(i);int at=-1;
            while((at=lower.indexOf(Character.toLowerCase(marker),at+1))>=0)score-=8;
        }
        return score;
    }
    private NotificationDatText(){ }
}
