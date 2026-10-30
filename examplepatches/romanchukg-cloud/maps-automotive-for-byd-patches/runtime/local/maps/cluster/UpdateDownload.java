package local.maps.cluster;

import java.io.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Bounded resumable download with deterministic identity and durable private staging. */
final class UpdateDownload {
    interface Transport {Response open(String url,long offset) throws Exception;}
    interface Progress {void update(long count,long total);boolean cancelled();}
    static final class Response implements AutoCloseable {
        final int code;final String range;final InputStream input;final Runnable close;
        Response(int code,String range,InputStream input,Runnable close){this.code=code;this.range=range;this.input=input;this.close=close;}
        public void close() throws Exception{try{if(input!=null)input.close();}finally{close.run();}}
    }
    private final File dir;private final Transport transport;
    UpdateDownload(File dir,Transport transport){this.dir=dir;this.transport=transport;}
    static String hash(File file) throws Exception {
        MessageDigest digest=MessageDigest.getInstance("SHA-256");
        try(InputStream in=new FileInputStream(file)){byte[] b=new byte[65536];int n;while((n=in.read(b))!=-1)digest.update(b,0,n);}
        return HudPackets.hex(digest.digest()).replace(",","").toLowerCase(java.util.Locale.ROOT);
    }
    File ready(){return new File(dir,"update.apk");}
    File download(UpdateInfo info,Progress progress) throws Exception {
        if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("storage");
        File meta=new File(dir,"identity"),part=new File(dir,"update.part"),ready=ready();
        String identity=info.build+":"+info.sha+":"+info.size;
        String previous=meta.isFile()&&meta.length()<256?new String(Files.readAllBytes(meta.toPath()),StandardCharsets.US_ASCII):"";
        if(!identity.equals(previous)) {
            Files.deleteIfExists(part.toPath());Files.deleteIfExists(ready.toPath());
            File pending=new File(dir,"identity.new");
            try(FileOutputStream out=new FileOutputStream(pending)){out.write(identity.getBytes(StandardCharsets.US_ASCII));out.getFD().sync();}
            Files.move(pending.toPath(),meta.toPath(),StandardCopyOption.REPLACE_EXISTING,StandardCopyOption.ATOMIC_MOVE);
        }
        if(ready.isFile()) {
            if(ready.length()==info.size&&hash(ready).equals(info.sha))return ready;
            Files.delete(ready.toPath());
        }
        long offset=part.length();if(offset>info.size){Files.delete(part.toPath());offset=0;}
        if(dir.getUsableSpace()<info.size-offset+info.size+32L*1024*1024)throw new IOException("storage");
        if(offset<info.size)try(Response response=transport.open(info.url,offset)) {
            if(progress.cancelled())throw new InterruptedIOException();
            boolean append=offset>0&&response.code==206;
            if(response.code!=200&&!append)throw new IOException("download_response");
            long expectedResponse=info.size;
            if(append) {
                java.util.regex.Matcher m=java.util.regex.Pattern.compile("bytes ([0-9]+)-([0-9]+)/([0-9]+)").matcher(response.range==null?"":response.range);
                if(!m.matches()||Long.parseLong(m.group(1))!=offset||Long.parseLong(m.group(3))!=info.size)throw new IOException("invalid_range");
                long end=Long.parseLong(m.group(2));if(end<offset||end>=info.size)throw new IOException("invalid_range");
                expectedResponse=end-offset+1;
            } else offset=0; // Server ignored Range: restart, never append a full response.
            if(response.input==null)throw new IOException("empty_response");
            long received=0,synced=offset;
            try(FileOutputStream out=new FileOutputStream(part,append)) {
                byte[] buffer=new byte[65536];int n;
                while((n=response.input.read(buffer))!=-1) {
                    if(progress.cancelled())throw new InterruptedIOException();
                    if(received+n>expectedResponse||offset+n>info.size){out.getFD().sync();throw new IOException("oversized_download");}
                    out.write(buffer,0,n);received+=n;offset+=n;progress.update(offset,info.size);
                    if(offset-synced>=4L*1024*1024){out.getFD().sync();synced=offset;}
                }
                out.getFD().sync();
            }
            if(received!=expectedResponse||offset!=info.size)throw new IOException("incomplete_download");
        }
        if(progress.cancelled())throw new InterruptedIOException();
        if(part.length()!=info.size||!hash(part).equals(info.sha)){Files.deleteIfExists(part.toPath());throw new IOException("hash_mismatch");}
        Files.move(part.toPath(),ready.toPath(),StandardCopyOption.REPLACE_EXISTING,StandardCopyOption.ATOMIC_MOVE);
        return ready;
    }
}
