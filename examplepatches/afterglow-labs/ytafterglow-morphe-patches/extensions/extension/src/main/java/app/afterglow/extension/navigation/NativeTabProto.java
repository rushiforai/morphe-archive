package app.afterglow.extension.navigation;

import java.nio.charset.StandardCharsets;

/** Bounded, read-only identifier lookup shared by normal and icon-only native pivot protos. */
public final class NativeTabProto {
    public static final String COMPAT_SEARCH="AfterglowCompatSearch",COMPAT_SETTINGS="AfterglowCompatSettings";
    private NativeTabProto() {}
    public static String identifier(byte[] bytes) {
        if(bytes==null||bytes.length>1024*1024)return "";
        try {
            int[] position={0};int fields=0;String id="";int icon=0;
            while(position[0]<bytes.length&&fields++<4096) {
                long key=varint(bytes,position);int wire=(int)(key&7);long field=key>>>3;
                if(field<=0||field>0x1fffffffL)return "";
                if(wire==0)varint(bytes,position);
                else if(wire==1)position[0]+=8;
                else if(wire==5)position[0]+=4;
                else if(wire==2) {
                    long length=varint(bytes,position);if(length<0||length>bytes.length-position[0])return "";
                    if(field==1&&length<=128)id=NativeTabPolicy.canonical(new String(bytes,position[0],(int)length,StandardCharsets.UTF_8));
                    else if(field==5&&length<=512)icon=icon(bytes,position[0],(int)length);
                    position[0]+=(int)length;
                }else return "";
                if(position[0]>bytes.length)return "";
            }
            if(position[0]!=bytes.length)return "";
            // Upstream's optional Search/Settings buttons clone Home without changing its
            // pivotIdentifier. Keep their actual commands distinct from the real Home view.
            if(id.equals("FEwhat_to_watch")) {
                if(icon==1045||icon==1160)return COMPAT_SEARCH;
                if(icon==1162)return COMPAT_SETTINGS;
            }
            return id;
        }catch(IllegalArgumentException ignored){}return "";
    }
    private static int icon(byte[] bytes,int start,int length) {
        if(length<2)return 0;
        int[] at={start};long key=varint(bytes,at);
        if(key!=8||at[0]>=start+length)return 0;
        long value=varint(bytes,at);return at[0]<=start+length&&value>=0&&value<=Integer.MAX_VALUE?(int)value:0;
    }
    private static long varint(byte[] data,int[] at) {
        long value=0;
        for(int shift=0;shift<64;shift+=7) {
            if(at[0]>=data.length)throw new IllegalArgumentException();
            int next=data[at[0]++]&255;if(shift==63&&next>1)throw new IllegalArgumentException();
            value|=(long)(next&127)<<shift;if((next&128)==0)return value;
        }
        throw new IllegalArgumentException();
    }
}
