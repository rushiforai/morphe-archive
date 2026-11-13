package app.morphe.extension.chmate;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Read only the opening DAT record, without falling back to the full thread page. */
final class EdgeOpeningDat {
    static final int MAX_BYTES = 64 * 1024;
    private static final Pattern RANGE = Pattern.compile("bytes (\\d+)-(\\d+)/(\\d+|\\*)");
    interface Transport { Part get(int first, int last) throws IOException; }
    static final class Part {
        final int status;
        final String range, type;
        final byte[] bytes;
        Part(int status, String range, String type, byte[] bytes) {
            this.status=status; this.range=range; this.type=type; this.bytes=bytes;
        }
    }

    static String body(Transport transport) throws IOException {
        ByteArrayOutputStream record = new ByteArrayOutputStream();
        int first=0, size=1024;
        while(first<MAX_BYTES) {
            int last=Math.min(MAX_BYTES-1,first+size-1);
            Part part=transport.get(first,last);
            if(part.status==200) {
                // A server ignoring Range is still read only as far as its first newline.
                return decode(part.bytes,part.type);
            }
            if(part.status!=206)throw new IOException("HTTP "+part.status);
            Matcher range=RANGE.matcher(part.range==null?"":part.range);
            if(!range.matches())throw new IOException("DATの取得範囲を確認できません");
            long start,end,total;
            try {
                start=Long.parseLong(range.group(1));end=Long.parseLong(range.group(2));
                total=range.group(3).equals("*")?-1:Long.parseLong(range.group(3));
            } catch(NumberFormatException invalid) {throw new IOException("DATの取得範囲が不正です",invalid);}
            if(start!=first||end<start||end>last||(total>=0&&end>=total)
                    ||part.bytes.length>end-start+1)throw new IOException("DATの取得範囲が一致しません");
            record.write(part.bytes,0,part.bytes.length);
            if(newline(part.bytes)>=0)return decode(record.toByteArray(),part.type);
            if(part.bytes.length!=end-start+1)throw new IOException("DATの先頭が途中で切れています");
            if(total>=0&&end+1==total)return decode(record.toByteArray(),part.type);
            first=(int)end+1;size=Math.min(size*2,MAX_BYTES);
        }
        throw new IOException("1レス目の取得上限を超えました");
    }

    /** Leave following records unread, including when the server ignores Range. */
    static byte[] read(InputStream input,int limit) throws IOException {
        ByteArrayOutputStream output=new ByteArrayOutputStream();
        byte[] buffer=new byte[128];
        while(output.size()<limit) {
            int count=input.read(buffer,0,Math.min(buffer.length,limit-output.size()));
            if(count<0)break;
            for(int i=0;i<count;i++)if(buffer[i]=='\n') {
                output.write(buffer,0,i+1);return output.toByteArray();
            }
            output.write(buffer,0,count);
        }
        return output.toByteArray();
    }

    private static int newline(byte[] bytes) {
        for(int i=0;i<bytes.length;i++)if(bytes[i]=='\n')return i;
        return -1;
    }

    private static String decode(byte[] bytes,String type) throws IOException {
        int end=newline(bytes);if(end<0)end=bytes.length;
        if(end>MAX_BYTES)throw new IOException("1レス目の取得上限を超えました");
        if(end>0&&bytes[end-1]=='\r')end--;
        Charset charset=type!=null&&type.toLowerCase(Locale.ROOT).contains("utf-8")
                ?StandardCharsets.UTF_8:Charset.forName("windows-31j");
        String[] fields=new String(bytes,0,end,charset).split("<>",5);
        if(fields.length<5)throw new IOException("1レス目のDAT形式を確認できません");
        return fields[3];
    }

    private EdgeOpeningDat() {}
}
