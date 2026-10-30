package local.maps.cluster;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

/** Independent encoder for the documented BYD standalone navigation wire format. */
final class HudPackets {
    static final String START="43,E0,00,3A,01,02", END="43,E0,00,3A,01,01";
    static final int MAX_METERS=16777214;
    private static final int[] TURNS={0,0,1,2,3,5,7,8,9,11,45,13,24,46,47,48,49,14,23,10,12,15,18,20,22,16,17,19,21};
    static int turn(int icon,int exit) {
        if(icon<2||icon>=TURNS.length)return -1;
        if(exit>=1&&exit<=10) {
            if(icon==11||icon==12)return 24+exit;
            if(icon==17||icon==18)return 34+exit;
        }
        return TURNS[icon];
    }
    static String guidance(GuidanceFrame frame) {
        if(frame==null)return null;
        int code=turn(frame.icon,frame.exit);
        if(code<0||frame.turnMeters<0||frame.turnMeters>MAX_METERS)return null;
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        record(out,0x43F01018,frame.turnMeters);record(out,0x43F01010,code);record(out,0x43F01030,code);
        byte[] road=street(frame.road);out.write(road,0,road.length);
        return hex(out.toByteArray());
    }
    private static void integer(ByteArrayOutputStream out,int value) {
        for(int shift=24;shift>=0;shift-=8)out.write((value>>>shift)&255);
    }
    private static void record(ByteArrayOutputStream out,int feature,int value) {
        integer(out,feature);out.write(4);integer(out,value);
    }
    static String roadText(String road) {
        StringBuilder text=new StringBuilder();boolean space=false;
        if(road==null)road="";
        for(int i=0;i<road.length()&&text.length()<48;) {
            char c=road.charAt(i++);
            if(Character.isHighSurrogate(c)) {
                if(i<road.length()&&Character.isLowSurrogate(road.charAt(i))) {
                    if(text.length()>46)break;
                    text.append(c).append(road.charAt(i++));space=false;
                }
            } else if(!Character.isLowSurrogate(c)) {
                if(Character.isISOControl(c)||Character.isWhitespace(c)||Character.isSpaceChar(c)) {
                    if(!space)text.append(' ');space=true;
                } else {text.append(c);space=false;}
            }
        }
        String result=text.toString().trim();return result.isEmpty()?" ":result;
    }
    static byte[] street(String road) {
        byte[] text=roadText(road).getBytes(StandardCharsets.UTF_16LE);
        int contentLength=((text.length+2+6)/7)*7;
        byte[] content=new byte[contentLength];java.util.Arrays.fill(content,(byte)0xff);
        content[0]=(byte)text.length;System.arraycopy(text,0,content,1,text.length);
        int sum=0;for(byte b:text)sum+=(b&255);content[text.length+1]=(byte)sum;
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        for(int offset=0;offset<content.length;offset+=7) {
            int feature=0x43FA1008+((offset/7)<<12);
            integer(out,feature);out.write(8);out.write((feature>>>12)&255);out.write(content,offset,7);
        }
        return out.toByteArray();
    }
    static String hex(byte[] bytes) {
        char[] digits="0123456789ABCDEF".toCharArray();StringBuilder text=new StringBuilder(bytes.length*3);
        for(byte b:bytes){if(text.length()>0)text.append(',');text.append(digits[(b&255)>>>4]).append(digits[b&15]);}
        return text.toString();
    }
}
