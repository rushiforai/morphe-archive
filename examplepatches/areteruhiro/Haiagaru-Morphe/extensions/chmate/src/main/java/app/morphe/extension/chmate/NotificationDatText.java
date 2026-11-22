package app.morphe.extension.chmate;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.*;
import java.util.Locale;

/** Selects between UTF-8 and the board's legacy DAT charset using decoded Japanese text. */
final class NotificationDatText {
    private static final int SAMPLE_BYTES=64*1024;
    private static final String MOJIBAKE="縺繧譁蜿莠繝ãæ�";
    private static final Charset MS932=Charset.forName("MS932");
    private static final Charset EUC_JP=Charset.forName("EUC-JP");

    static String decode(byte[] bytes,String fallback){
        return new String(bytes,select(bytes,Math.min(bytes.length,SAMPLE_BYTES),charset(fallback)));
    }

    static Reader reader(File file,String fallback)throws IOException{
        byte[] sample=new byte[SAMPLE_BYTES];
        int count=0;
        try(InputStream in=new FileInputStream(file)){
            int n;
            while(count<sample.length&&(n=in.read(sample,count,sample.length-count))>0)count+=n;
        }
        return new InputStreamReader(new FileInputStream(file),select(sample,count,charset(fallback)));
    }

    private static Charset select(byte[] bytes,int count,Charset preferred){
        if(count==0)return preferred;
        Charset best=preferred;
        int bestScore=Integer.MIN_VALUE;
        for(Charset candidate:new Charset[]{preferred,StandardCharsets.UTF_8,MS932,EUC_JP}){
            if(candidate.equals(preferred)&&bestScore!=Integer.MIN_VALUE)continue;
            // A prefix can end in the middle of a multibyte character. Leave
            // the unfinished sequence out of encoding detection.
            CharBuffer chars=CharBuffer.allocate(count);
            CharsetDecoder decoder=candidate.newDecoder();
            ByteBuffer input=ByteBuffer.wrap(bytes,0,count);
            boolean valid=!decoder.decode(input,chars,count<SAMPLE_BYTES).isError();
            String value=valid?chars.flip().toString():new String(bytes,0,count,candidate);
            if(valid&&candidate.equals(preferred)&&candidate.equals(StandardCharsets.UTF_8))return candidate;
            int score=quality(value)+(valid?64:0);
            if(valid&&candidate.equals(StandardCharsets.UTF_8)&&value.chars().anyMatch(c->c>127))score+=16;
            if(score>bestScore){bestScore=score;best=candidate;}
        }
        return best;
    }
    private static Charset charset(String value){
        try{return value==null?MS932:Charset.forName(value.trim());}
        catch(Exception invalid){return MS932;}
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
