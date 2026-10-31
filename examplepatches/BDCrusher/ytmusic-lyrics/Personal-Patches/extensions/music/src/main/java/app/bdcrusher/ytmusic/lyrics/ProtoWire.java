/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

/** Bounded protobuf edits that retain every unrelated field's original bytes. */
public final class ProtoWire {
    public static final class Field {
        public final int number,wire;public final long value;public final byte[] data,encoded;
        Field(int n,int w,long v,byte[] d,byte[] e){number=n;wire=w;value=v;data=d;encoded=e;}
    }
    public final List<Field> fields=new ArrayList<>();
    public ProtoWire(byte[] bytes){
        if(bytes==null||bytes.length>16*1024*1024)throw new IllegalArgumentException("protobuf size");
        int[] at={0};
        while(at[0]<bytes.length){
            if(fields.size()>=16384)throw new IllegalArgumentException("protobuf fields");
            int start=at[0];long tag=read(bytes,at);int n=(int)(tag>>>3),w=(int)(tag&7);
            if(n<=0||n>0x1fffffff)throw new IllegalArgumentException("protobuf tag");
            long value=0;byte[] data=null;
            if(w==0)value=read(bytes,at);
            else if(w==1||w==2||w==5){
                long count=w==2?read(bytes,at):w==1?8:4;
                if(count<0||count>bytes.length-at[0])throw new IllegalArgumentException("protobuf length");
                data=java.util.Arrays.copyOfRange(bytes,at[0],at[0]+(int)count);at[0]+=(int)count;
            }else throw new IllegalArgumentException("protobuf wire type");
            fields.add(new Field(n,w,value,data,java.util.Arrays.copyOfRange(bytes,start,at[0])));
        }
    }
    private static long read(byte[] b,int[] p){long v=0;for(int shift=0;shift<64;shift+=7){if(p[0]>=b.length)break;int c=b[p[0]++]&255;if(shift==63&&(c&254)!=0)break;v|=(long)(c&127)<<shift;if(c<128)return v;}throw new IllegalArgumentException("protobuf varint");}
    public static void varint(ByteArrayOutputStream out,long value){while((value&~127L)!=0){out.write(((int)value&127)|128);value>>>=7;}out.write((int)value);}
    public static Field blob(int n,byte[] data){ByteArrayOutputStream b=new ByteArrayOutputStream();varint(b,((long)n<<3)|2);varint(b,data.length);b.write(data,0,data.length);return new Field(n,2,0,data,b.toByteArray());}
    public static Field number(int n,long v){ByteArrayOutputStream b=new ByteArrayOutputStream();varint(b,(long)n<<3);varint(b,v);return new Field(n,0,v,null,b.toByteArray());}
    public static byte[] message(Field... fields){ByteArrayOutputStream b=new ByteArrayOutputStream();for(Field f:fields)b.write(f.encoded,0,f.encoded.length);return b.toByteArray();}
    public Field one(int n){Field found=null;for(Field f:fields)if(f.number==n){if(found!=null)throw new IllegalArgumentException("duplicate singular field");found=f;}return found;}
    public byte[] child(int n){Field f=one(n);if(f==null||f.wire!=2)throw new IllegalArgumentException("missing message "+n);return f.data;}
    public void remove(int n){fields.removeIf(f->f.number==n);}
    public void put(Field value){int at=fields.size();for(int i=0;i<fields.size();i++)if(fields.get(i).number==value.number){at=i;break;}remove(value.number);fields.add(at,value);}
    public byte[] bytes(){return message(fields.toArray(new Field[0]));}
    public static byte[] at(byte[] input,int[] path,int level,java.util.function.UnaryOperator<byte[]> change){
        if(level==path.length)return change.apply(input);
        ProtoWire parent=new ProtoWire(input);byte[] before=parent.child(path[level]);byte[] after=at(before,path,level+1,change);
        if(before==after)return input;
        parent.put(blob(path[level],after));return parent.bytes();
    }
}
