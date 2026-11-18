package app.afterglow.extension.downloads;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Bounded reader for the few player/command protobuf fields needed by downloads. */
final class DownloadProto {
    static final int LIMIT = 8 * 1024 * 1024;
    final List<Field> fields = new ArrayList<>();

    static final class Field {
        final int number, wire;
        final long numberValue;
        final byte[] bytes;
        Field(int number, int wire, long value, byte[] bytes) {
            this.number=number; this.wire=wire; this.numberValue=value; this.bytes=bytes;
        }
        String text() { return bytes == null ? "" : new String(bytes, StandardCharsets.UTF_8); }
    }

    static DownloadProto parse(byte[] bytes) throws IOException {
        if (bytes == null || bytes.length > LIMIT) throw new IOException("Invalid player data size");
        DownloadProto result=new DownloadProto();
        int[] at={0};
        while (at[0]<bytes.length) {
            if (result.fields.size()>=30000) throw new IOException("Too many player fields");
            long tag=varint(bytes,at); int field=(int)(tag>>>3), wire=(int)(tag&7);
            if (field<=0 || tag>>>3>0x1fffffffL) throw new IOException("Invalid player field");
            long value=0; byte[] payload=null;
            if (wire==0) value=varint(bytes,at);
            else if (wire==2) {
                long length=varint(bytes,at);
                if (length<0 || length>bytes.length-at[0]) throw new IOException("Truncated player data");
                payload=Arrays.copyOfRange(bytes,at[0],at[0]+(int)length); at[0]+=(int)length;
            } else if (wire==1 || wire==5) {
                int size=wire==1?8:4;
                if (bytes.length-at[0]<size) throw new IOException("Truncated player field");
                at[0]+=size;
            } else throw new IOException("Unsupported player wire type");
            result.fields.add(new Field(field,wire,value,payload));
        }
        return result;
    }

    private static long varint(byte[] bytes,int[] at) throws IOException {
        long result=0;
        for(int i=0;i<10;i++) {
            if(at[0]>=bytes.length)throw new IOException("Truncated player integer");
            int b=bytes[at[0]++]&255;
            if(i==9 && (b&254)!=0)throw new IOException("Player integer overflow");
            result|=(long)(b&127)<<(i*7);
            if((b&128)==0)return result;
        }
        throw new IOException("Player integer overflow");
    }

    List<Field> all(int field) {
        List<Field> out=new ArrayList<>();
        for(Field f:fields)if(f.number==field)out.add(f);
        return out;
    }
    String text(int field) { for(Field f:fields)if(f.number==field&&f.wire==2)return f.text();return ""; }
    long number(int field) { for(Field f:fields)if(f.number==field&&f.wire==0)return f.numberValue;return 0; }
    DownloadProto message(int field) throws IOException {
        for(Field f:fields)if(f.number==field&&f.wire==2)return parse(f.bytes);
        return new DownloadProto();
    }

    static String downloadCommandVideoId(byte[] bytes) throws IOException {
        DownloadProto command=parse(bytes);
        String id=command.message(382320942).text(1);
        if(id.isEmpty())id=command.message(133724106).text(1);
        if(id.isEmpty()) {
            DownloadProto offline=command.message(73080600);
            if(offline.number(2)==1)id=offline.text(1);
        }
        return id.matches("[A-Za-z0-9_-]{11}")?id:"";
    }
}
