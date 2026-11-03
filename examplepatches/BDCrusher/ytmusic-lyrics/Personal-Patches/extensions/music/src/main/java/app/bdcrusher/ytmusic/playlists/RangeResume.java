/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import java.io.*;
import java.util.*;

/** Validated progress for independent byte ranges. URLs and credentials are never serialized. */
public final class RangeResume {
    private static final int MAGIC=0x42445231;
    private final long length;private final int segments;private final String format;private final long[] positions;
    public RangeResume(long length,int segments,String format){
        if(length<=0||segments<1||segments>8||format==null||format.length()>512)throw new IllegalArgumentException("Invalid range geometry");
        this.length=length;this.segments=segments;this.format=format;positions=new long[segments];for(int i=0;i<segments;i++)positions[i]=start(i);
    }
    public long start(int segment){return segment*((length+segments-1)/segments);}
    public long end(int segment){return Math.min(length-1,start(segment)+(length+segments-1)/segments-1);}
    public synchronized long position(int segment){return positions[segment];}
    public synchronized void advance(int segment,long value){if(value<positions[segment]||value<start(segment)||value>Math.max(start(segment),end(segment)+1))throw new IllegalArgumentException("Invalid range position");positions[segment]=value;}
    public synchronized long completed(){long total=0;for(int i=0;i<segments;i++)total+=Math.max(0,positions[i]-start(i));return total;}
    public synchronized byte[] bytes()throws IOException{
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();try(DataOutputStream out=new DataOutputStream(bytes)){out.writeInt(MAGIC);out.writeLong(length);out.writeInt(segments);out.writeUTF(format);for(long p:positions)out.writeLong(p);}return bytes.toByteArray();
    }
    public static RangeResume read(InputStream input,long length,int segments,String format)throws IOException{
        DataInputStream in=new DataInputStream(input);if(in.readInt()!=MAGIC||in.readLong()!=length||in.readInt()!=segments||!in.readUTF().equals(format))throw new IOException("Different media variant");
        RangeResume result=new RangeResume(length,segments,format);try{for(int i=0;i<segments;i++)result.advance(i,in.readLong());}catch(IllegalArgumentException invalid){throw new IOException("Invalid saved ranges",invalid);}if(in.read()!=-1)throw new IOException("Unexpected range data");return result;
    }
}
