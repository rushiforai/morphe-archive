package app.afterglow.extension.downloads;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public final class DownloadEngineTest {
    private static int checks;
    private static void check(boolean condition,String message) {checks++;if(!condition)throw new AssertionError(message);}
    private interface Throwing {void run() throws Exception;}
    private static void rejects(Throwing action,String label) throws Exception {boolean failed=false;try{action.run();}catch(IOException|IllegalArgumentException e){failed=true;}check(failed,label);}
    private static DownloadRequest request() {DownloadRequest r=new DownloadRequest("abcdefghijk");r.title="Résumé";r.videoItag=137;r.audioItag=140;r.audioTrackId="en.4";r.audioLanguageCode="en";r.thumbnailUrl="https://i.ytimg.com/vi/abcdefghijk/hqdefault.jpg?token=SECRET";return r;}
    private static QueueRecord record() {QueueRecord r=new QueueRecord();r.id=UUID.randomUUID().toString();r.request=request();r.created=r.updated=1700000000000L;r.ordinal=1;return r;}
    private static LibraryItem item(String title,DownloadRequest.Kind kind,String collection,long size,long date,boolean favorite) {
        String id=UUID.randomUUID().toString();return new LibraryItem(id,"abcdefghijk",title,"Chánnel",collection,"",id+".mp4","video/mp4","1080p","1080p","youtube","",date,size,1000,0,1080,favorite,kind,LibraryItem.RepairState.HEALTHY);
    }
    public static void main(String[] args) throws Exception {
        File root=new File(args[0]);DownloadStorage storage=new DownloadStorage(root);
        policies();persistence(storage);transfers(storage);queries();
        System.out.println(checks+" download engine checks passed (queue/index recovery, bounded IO, range transfer, cancellation, Vault queries)");
    }
    private static void policies() throws Exception {
        check(DownloadPolicy.exportName("Me at the zoo.vtt","vtt").equals("Me at the zoo.vtt"),"imported caption shares with exactly one extension");
        check(DownloadPolicy.exportName("Video.MP4","mp4").equals("Video.mp4"),"existing extension comparison ignores case");
        check(DownloadPolicy.exportName("Chapter.one","mp4").equals("Chapter.one.mp4"),"unrelated title suffix preserved");
        check(DownloadPolicy.exportName("A/B\\C\n","jpg").equals("A_B_C_.jpg"),"export name removes path separators and controls");
        check(DownloadPolicy.exportName(".vtt","vtt").equals("Afterglow.vtt"),"empty imported stem has fallback");
        check(DownloadPolicy.exportName("x".repeat(140)+".vtt","vtt").equals("x".repeat(120)+".vtt"),"long imported filename retains one extension");
        check(DownloadPolicy.importMime("webm","audio/webm").equals("audio/webm"),"explicit audio WebM MIME survives container extension");
        check(DownloadPolicy.importMime("mp4","audio/mp4").equals("audio/mp4"),"explicit audio MP4 MIME survives container extension");
        check(DownloadPolicy.importMime("webm"," Audio/WebM ").equals("audio/webm"),"provider audio MIME is case-insensitive");
        check(DownloadPolicy.importMime("webm","video/webm").equals("video/webm"),"video WebM stays video");
        check(DownloadPolicy.importMime("mp4","video/mp4").equals("video/mp4"),"video MP4 stays video");
        check(DownloadPolicy.importMime("webm","application/octet-stream").equals("video/webm"),"generic WebM MIME retains extension fallback");
        check(DownloadPolicy.importMime("mp4",null).equals("video/mp4"),"missing MP4 MIME retains extension fallback");
        check(DownloadPolicy.importMime("mp4","audio/webm").equals("video/mp4"),"mismatched audio MIME cannot reclassify another container");
        check(DownloadPolicy.importMime("m4a","application/octet-stream").equals("audio/mp4"),"unambiguous audio extension retains fallback");
        check(DownloadPolicy.importMime("vtt","audio/mp4").equals("text/vtt"),"audio declaration cannot reclassify a caption");
        check(DownloadPolicy.transition(DownloadJob.State.QUEUED,DownloadJob.State.RUNNING),"queued starts");
        check(DownloadPolicy.transition(DownloadJob.State.RUNNING,DownloadJob.State.PAUSED),"running pauses");
        check(DownloadPolicy.transition(DownloadJob.State.PAUSED,DownloadJob.State.QUEUED),"paused resumes");
        check(!DownloadPolicy.transition(DownloadJob.State.SUCCEEDED,DownloadJob.State.QUEUED),"completed cannot become queued");
        check(!DownloadPolicy.transition(DownloadJob.State.QUEUED,DownloadJob.State.SUCCEEDED),"queued cannot skip transfer");
        check(DownloadPolicy.transition(DownloadJob.State.FAILED,DownloadJob.State.QUEUED),"failed retries");
        check(DownloadPolicy.transition(DownloadJob.State.CANCELLED,DownloadJob.State.QUEUED),"cancelled retries");
        DownloadRequest a=request(),b=a.copy();check(DownloadPolicy.sameSelection(a,b),"same selection duplicate");
        b.audioLanguageCode="fr";check(!DownloadPolicy.sameSelection(a,b),"language separates formats");
        b=a.copy();b.audioDrc=true;check(!DownloadPolicy.sameSelection(a,b),"DRC separates formats");
        b=a.copy();b.audioTrackId="en.5";check(!DownloadPolicy.sameSelection(a,b),"track separates formats");
        b=a.copy();b.videoItag=248;check(!DownloadPolicy.sameSelection(a,b),"video quality separates formats");
        b=a.copy();a.kind=b.kind=DownloadRequest.Kind.AUDIO;b.videoItag=248;check(DownloadPolicy.sameSelection(a,b),"audio ignores video itag");
        a.kind=b.kind=DownloadRequest.Kind.CAPTIONS;a.captionTrackId="en";b.captionTrackId="es";check(!DownloadPolicy.sameSelection(a,b),"caption identity");
        check(DownloadPolicy.retryHttp(429)&&DownloadPolicy.retryHttp(503)&&!DownloadPolicy.retryHttp(403),"transient HTTP policy");
        check(DownloadPolicy.retryDelay(0)==1000&&DownloadPolicy.retryDelay(1)==2000&&DownloadPolicy.retryDelay(2)==4000,"backoff matches iOS");
        check(DownloadPolicy.sanitize(request()).thumbnailUrl.equals("https://i.ytimg.com/vi/abcdefghijk/hqdefault.jpg"),"thumbnail strips query secrets");
        check(DownloadPolicy.safeThumbnail("https://evil.test/a?secret=x").isEmpty(),"thumbnail host allowlist");
        check(DownloadPolicy.safeThumbnail("http://i.ytimg.com/a").isEmpty(),"thumbnail HTTPS only");
        a=request();a.audioTrackId="https://signed.invalid?token=secret";DownloadRequest invalid=a;rejects(()->DownloadPolicy.sanitize(invalid),"format identities reject URL secrets");
        for(DownloadJob.State state:DownloadJob.State.values()) {
            QueueRecord r=record();r.state=state;r.phase=DownloadJob.Phase.VIDEO_TRANSFER;r.recover();
            check(r.state==(state==DownloadJob.State.RUNNING?DownloadJob.State.QUEUED:state),"relaunch state "+state);
            if(state==DownloadJob.State.RUNNING || state==DownloadJob.State.QUEUED || state==DownloadJob.State.PAUSED)check(r.phase==DownloadJob.Phase.EXTRACTION,"relaunch refreshes links "+state);
        }
    }
    private static void persistence(DownloadStorage s) throws Exception {
        check(s.loadQueue().isEmpty(),"new queue empty");check(s.loadLibrary().isEmpty(),"new library empty");
        QueueRecord r=record();r.state=DownloadJob.State.RUNNING;r.phase=DownloadJob.Phase.AUDIO_TRANSFER;r.bytes=42;r.total=100;r.request.description="Signed URLs are never persisted: https://signed.invalid?secret=DO_NOT_SAVE";
        s.saveQueue(Collections.singletonList(r));List<QueueRecord> loaded=s.loadQueue();
        check(loaded.size()==1&&loaded.get(0).id.equals(r.id),"queue identity roundtrip");
        check(loaded.get(0).state==DownloadJob.State.QUEUED&&loaded.get(0).phase==DownloadJob.Phase.EXTRACTION,"running queue recovery");
        check(loaded.get(0).bytes==42&&loaded.get(0).total==100,"progress counters roundtrip");
        String bytes=new String(Files.readAllBytes(new File(s.root,"queue.agv").toPath()),StandardCharsets.ISO_8859_1);
        check(!bytes.contains("SECRET")&&!bytes.contains("DO_NOT_SAVE")&&!bytes.contains("signed.invalid"),"no signed URLs or long freeform detail on disk");
        r.state=DownloadJob.State.PAUSED;s.saveQueue(Collections.singletonList(r));
        File primary=new File(s.root,"queue.agv");Files.write(primary.toPath(),new byte[]{1,2,3});
        loaded=s.loadQueue();check(loaded.size()==1&&loaded.get(0).state==DownloadJob.State.QUEUED,"previous generation recovery");check(!s.recoveryMessage.isEmpty(),"recovery visible");
        byte[] valid=Files.readAllBytes(primary.toPath());valid[12]^=1;Files.write(primary.toPath(),valid);Files.delete(new File(s.root,"queue.agv.previous").toPath());
        rejects(s::loadQueue,"checksum rejects corruption without overwriting");check(primary.length()==valid.length,"corrupt evidence preserved");
        Files.delete(primary.toPath());s.saveQueue(Collections.singletonList(r));
        Files.move(primary.toPath(),new File(s.root,"queue.agv.pending").toPath());check(s.loadQueue().get(0).state==DownloadJob.State.PAUSED,"pending generation recovery");
        List<QueueRecord> duplicate=Arrays.asList(r,r);rejects(()->s.saveQueue(duplicate),"duplicate queue IDs rejected");
        Files.delete(primary.toPath());Files.deleteIfExists(new File(s.root,"queue.agv.pending").toPath());Files.deleteIfExists(new File(s.root,"queue.agv.previous").toPath());
        List<QueueRecord> huge=new ArrayList<>();for(int i=0;i<=DownloadPolicy.MAX_JOBS;i++)huge.add(record());rejects(()->s.saveQueue(huge),"queue bounded");
        rejects(()->DownloadStorage.child(s.media,"../outside"),"traversal rejected");rejects(()->DownloadStorage.child(s.media,"/absolute"),"absolute rejected");rejects(()->DownloadStorage.child(s.media,"a\\b"),"backslash rejected");
        File external=new File(s.root,"external");Files.write(external.toPath(),new byte[]{1});Files.createSymbolicLink(new File(s.media,"link.mp4").toPath(),external.toPath());rejects(()->DownloadStorage.child(s.media,"link.mp4"),"symlink rejected");Files.delete(new File(s.media,"link.mp4").toPath());
        LibraryItem item=item("Favorite",DownloadRequest.Kind.VIDEO,"Travel",600,123,true);s.saveLibrary(Collections.singletonList(item));LibraryItem copy=s.loadLibrary().get(0);
        check(copy.favorite&&copy.collectionName.equals("Travel")&&copy.fileSize==600,"library metadata roundtrip");
        check(copy.id.equals(item.id)&&copy.relativePath.equals(item.relativePath),"library file identity roundtrip");
        rejects(()->s.saveLibrary(Arrays.asList(item,item)),"duplicate library paths rejected");
        File hugeFile=new File(s.root,"oversize.agv");try(java.io.RandomAccessFile f=new java.io.RandomAccessFile(hugeFile,"rw")){f.setLength(17*1024*1024);}rejects(()->s.load("oversize.agv",in->in.readInt(),0),"store bound checked before allocation");
    }
    private static final class Response extends HttpURLConnection {
        final byte[] bytes;final Map<String,String> headers=new HashMap<>(),requests=new HashMap<>();int failAfter=-1;boolean disconnected;
        Response(int status,String content) throws Exception {super(new URL("https://media.example/stream"));responseCode=status;bytes=content.getBytes(StandardCharsets.UTF_8);headers.put("Content-Length",Integer.toString(bytes.length));}
        public int getResponseCode(){return responseCode;}public String getHeaderField(String key){return headers.get(key);}public long getContentLengthLong(){String v=headers.get("Content-Length");return v==null?-1:Long.parseLong(v);}
        public void setRequestProperty(String key,String value){requests.put(key,value);}
        public InputStream getInputStream(){return new InputStream(){int pos;public int read()throws IOException{if(disconnected)throw new IOException("Closed");if(failAfter>=0&&pos>=failAfter)throw new IOException("Disconnected");return pos<bytes.length?bytes[pos++]&255:-1;}public int read(byte[] b,int off,int len)throws IOException{if(failAfter>=0&&pos>=failAfter)throw new IOException("Disconnected");if(pos>=bytes.length)return -1;int n=Math.min(len,bytes.length-pos);if(failAfter>=0)n=Math.min(n,failAfter-pos);System.arraycopy(bytes,pos,b,off,n);pos+=n;return n;}};}
        public void disconnect(){disconnected=true;}public boolean usingProxy(){return false;}public void connect(){}
    }
    private static DownloadResolver.Track track(String identity,long length){return new DownloadResolver.Track(DownloadResolver.Role.VIDEO,"https://media.example/video?sig=SECRET",Collections.singletonMap("Authorization","SECRET"),identity,"video/mp4",length);}
    private static void transfers(DownloadStorage s) throws Exception {
        File file=new File(s.work,"range.part");Response interrupted=new Response(200,"0123456789");interrupted.failAfter=4;
        DownloadTransfer.Control cancellation=new DownloadTransfer.Control();
        rejects(()->new DownloadTransfer(u->interrupted).download(track("itag137",10),file,cancellation,(a,b)->{}),"interrupted response fails");check(file.length()==4,"partial bytes kept");check("bytes=0-9".equals(interrupted.requests.get("Range")),"fresh media transfer requests bounded byte range");
        Response resumed=new Response(206,"456789");resumed.headers.put("Content-Range","bytes 4-9/10");
        new DownloadTransfer(u->resumed).download(track("itag137",10),file,new DownloadTransfer.Control(),(a,b)->{});
        check("bytes=4-9".equals(resumed.requests.get("Range")),"resume requests exact offset");check(new String(Files.readAllBytes(file.toPath()),StandardCharsets.UTF_8).equals("0123456789"),"range resumes exact content");
        new DownloadTransfer(u->{throw new IOException("Should not connect");}).download(track("itag137",10),file,new DownloadTransfer.Control(),(a,b)->{});check(file.length()==10,"known completed part reused");
        Response fresh=new Response(200,"abcdefghij");new DownloadTransfer(u->fresh).download(track("itag248",10),file,new DownloadTransfer.Control(),(a,b)->{});check("bytes=0-9".equals(fresh.requests.get("Range")),"changed identity discards partial");
        Files.write(file.toPath(),"abc".getBytes(StandardCharsets.UTF_8));Response ignored=new Response(200,"abcdefghij");new DownloadTransfer(u->ignored).download(track("itag248",10),file,new DownloadTransfer.Control(),(a,b)->{});check(file.length()==10,"ignored Range truncates instead of appending");
        Files.write(file.toPath(),"abc".getBytes(StandardCharsets.UTF_8));Response wrong=new Response(206,"defghij");wrong.headers.put("Content-Range","bytes 2-8/10");rejects(()->new DownloadTransfer(u->wrong).download(track("itag248",10),file,new DownloadTransfer.Control(),(a,b)->{}),"wrong range rejected");check(file.length()==3,"wrong range leaves partial intact");
        Response changedSize=new Response(206,"defghij");changedSize.headers.put("Content-Range","bytes 3-9/11");rejects(()->new DownloadTransfer(u->changedSize).download(track("itag248",10),file,new DownloadTransfer.Control(),(a,b)->{}),"remote size change rejected");
        Response redirect=new Response(302,"");redirect.headers.put("Location","https://cdn.example/video");Response redirected=new Response(200,"abcdefghij");int[] connections={0};
        new DownloadTransfer(u->connections[0]++==0?redirect:redirected).download(track("itag248",10),file,new DownloadTransfer.Control(),(a,b)->{});
        check("SECRET".equals(redirect.requests.get("Authorization"))&&!redirected.requests.containsKey("Authorization"),"cross-host redirects strip authentication");
        File insecure=new File(s.work,"insecure.part");DownloadResolver.Track http=new DownloadResolver.Track(DownloadResolver.Role.AUDIO,"http://media.example/a",null,"x","audio/mp4",1);rejects(()->new DownloadTransfer().download(http,insecure,new DownloadTransfer.Control(),(a,b)->{}),"insecure source rejected");
        Response downgrade=new Response(302,"");downgrade.headers.put("Location","http://cdn.example/a");rejects(()->new DownloadTransfer(u->downgrade).download(track("redirect",10),insecure,new DownloadTransfer.Control(),(a,b)->{}),"HTTPS downgrade rejected");
        Response cancelling=new Response(200,"0123456789");DownloadTransfer.Control stop=new DownloadTransfer.Control();rejects(()->new DownloadTransfer(u->cancelling).download(track("cancel",10),insecure,stop,(a,b)->stop.cancel()),"cancel interrupts before completion");check(cancelling.disconnected&&stop.isCancelled(),"cancel disconnects active HTTP");
        Response unknown=new Response(200,"caption");unknown.headers.remove("Content-Length");File caption=new File(s.work,"caption.part");new DownloadTransfer(u->unknown).download(track("caption",0),caption,new DownloadTransfer.Control(),(a,b)->{});check(caption.length()==7,"unknown length accepted when nonempty");
        Response full=new Response(416,"");full.headers.put("Content-Range","bytes */7");new DownloadTransfer(u->full).download(track("caption",0),caption,new DownloadTransfer.Control(),(a,b)->{});check("bytes=7-4194310".equals(full.requests.get("Range")),"416 exact complete part accepted");
        Response stale=new Response(416,"");stale.headers.put("Content-Range","bytes */5");Response restarted=new Response(200,"fresh");int[] rangeAttempts={0};
        new DownloadTransfer(u->rangeAttempts[0]++==0?stale:restarted).download(track("caption",0),caption,new DownloadTransfer.Control(),(a,b)->{});check("bytes=0-4194303".equals(restarted.requests.get("Range"))&&caption.length()==5,"416 mismatched length restarts once from zero");
        Response empty=new Response(200,"");rejects(()->new DownloadTransfer(u->empty).download(track("empty",0),caption,new DownloadTransfer.Control(),(a,b)->{}),"empty transfer rejected");
        Response shortBody=new Response(200,"123");shortBody.headers.put("Content-Length","10");rejects(()->new DownloadTransfer(u->shortBody).download(track("short",10),caption,new DownloadTransfer.Control(),(a,b)->{}),"truncated advertised response rejected");
        Response forbidden=new Response(403,"");try{new DownloadTransfer(u->forbidden).download(track("forbid",10),caption,new DownloadTransfer.Control(),(a,b)->{});throw new AssertionError();}catch(DownloadTransfer.HttpFailure e){check(e.status==403&&!e.getMessage().contains("SECRET"),"HTTP errors contain status only");}
        File segmented=new File(s.work,"segmented.part");
        Response first=new Response(206,"abcd"),second=new Response(206,"efgh"),last=new Response(206,"ij");
        first.headers.put("Content-Range","bytes 0-3/10");second.headers.put("Content-Range","bytes 4-7/10");last.headers.put("Content-Range","bytes 8-9/10");
        first.headers.remove("Content-Length");second.headers.remove("Content-Length");last.headers.remove("Content-Length");
        Response[] pieces={first,second,last};int[] piece={0};long[] seen={0};
        new DownloadTransfer(u->pieces[piece[0]++]).download(track("segmented",0),segmented,new DownloadTransfer.Control(),(a,b)->{if(a<seen[0])throw new AssertionError("progress decreased");seen[0]=a;});
        check(piece[0]==3&&new String(Files.readAllBytes(segmented.toPath()),StandardCharsets.UTF_8).equals("abcdefghij"),"consecutive ranges assemble exact bytes without Content-Length");
        check("bytes=0-4194303".equals(first.requests.get("Range"))&&"bytes=4-9".equals(second.requests.get("Range"))&&"bytes=8-9".equals(last.requests.get("Range")),"server total bounds subsequent ranges");
        check(first.disconnected&&second.disconnected&&last.disconnected&&seen[0]==10,"completed segments close and progress ends at total");
        File truncatedRange=new File(s.work,"short-range.part");Response shortRange=new Response(206,"abc");shortRange.headers.remove("Content-Length");shortRange.headers.put("Content-Range","bytes 0-3/10");
        rejects(()->new DownloadTransfer(u->shortRange).download(track("range-short",10),truncatedRange,new DownloadTransfer.Control(),(a,b)->{}),"truncated range without Content-Length is rejected");
        File bounded=new File(s.work,"bounded.part");Response excessiveRange=new Response(206,"");excessiveRange.headers.remove("Content-Length");excessiveRange.headers.put("Content-Range","bytes 0-4194304/8388608");
        rejects(()->new DownloadTransfer(u->excessiveRange).download(track("range-large",8388608),bounded,new DownloadTransfer.Control(),(a,b)->{}),"range larger than requested is rejected before writing");
        Response captionBody=new Response(200,"WEBVTT");DownloadResolver.Track captionTrack=new DownloadResolver.Track(DownloadResolver.Role.CAPTIONS,"https://media.example/caption",null,"caption-unbounded","text/vtt",0);
        new DownloadTransfer(u->captionBody).download(captionTrack,new File(s.work,"caption-unbounded.part"),new DownloadTransfer.Control(),(a,b)->{});
        check("bytes=0-".equals(captionBody.requests.get("Range")),"caption endpoint keeps a single open-ended request");
        Response combinedBody=new Response(200,"abcdefghij");
        DownloadResolver.Track combinedTrack=new DownloadResolver.Track(DownloadResolver.Role.COMBINED,"https://media.example/combined",null,"progressive","video/mp4",10);
        new DownloadTransfer(u->combinedBody).download(combinedTrack,new File(s.work,"combined.part"),new DownloadTransfer.Control(),(a,b)->{});
        check("bytes=0-9".equals(combinedBody.requests.get("Range")),"progressive audio/video uses the same bounded media range policy");

        File interruptedSegments=new File(s.work,"interrupted-segments.part");
        Response keptSegment=new Response(206,"abcd"),brokenSegment=new Response(206,"efghij");
        keptSegment.headers.put("Content-Range","bytes 0-3/10");brokenSegment.headers.put("Content-Range","bytes 4-9/10");brokenSegment.failAfter=2;
        int[] segmentAttempt={0};
        rejects(()->new DownloadTransfer(u->segmentAttempt[0]++==0?keptSegment:brokenSegment).download(track("segment-resume",10),interruptedSegments,new DownloadTransfer.Control(),(a,b)->{}),"interrupted later segment fails");
        check(interruptedSegments.length()==6,"completed segment and partial next segment survive interruption");
        Response resumedSegment=new Response(206,"ghij");resumedSegment.headers.put("Content-Range","bytes 6-9/10");
        new DownloadTransfer(u->resumedSegment).download(track("segment-resume",10),interruptedSegments,new DownloadTransfer.Control(),(a,b)->{});
        check("bytes=6-9".equals(resumedSegment.requests.get("Range"))&&new String(Files.readAllBytes(interruptedSegments.toPath()),StandardCharsets.UTF_8).equals("abcdefghij"),"retry resumes actual persisted byte offset within a segment");

        File stoppedSegments=new File(s.work,"stopped-segments.part");Response stopSegment=new Response(206,"abcd");stopSegment.headers.put("Content-Range","bytes 0-3/10");
        DownloadTransfer.Control segmentStop=new DownloadTransfer.Control();int[] segmentOpens={0};
        rejects(()->new DownloadTransfer(u->{segmentOpens[0]++;return stopSegment;}).download(track("segment-stop",10),stoppedSegments,segmentStop,(a,b)->segmentStop.cancel()),"cancellation prevents advancing to another segment");
        check(segmentOpens[0]==1&&stopSegment.disconnected&&stoppedSegments.length()==4,"cancel closes the connection and retains only the written prefix");

        File ignoredSegmentFile=new File(s.work,"ignored-segment.part");Response partialThenIgnored=new Response(206,"abcd"),wholeInstead=new Response(200,"abcdefghij");
        partialThenIgnored.headers.put("Content-Range","bytes 0-3/10");int[] ignoredAttempt={0};
        new DownloadTransfer(u->ignoredAttempt[0]++==0?partialThenIgnored:wholeInstead).download(track("ignored-segment",0),ignoredSegmentFile,new DownloadTransfer.Control(),(a,b)->{});
        check("bytes=4-9".equals(wholeInstead.requests.get("Range"))&&new String(Files.readAllBytes(ignoredSegmentFile.toPath()),StandardCharsets.UTF_8).equals("abcdefghij"),"ignored later range safely replaces the existing prefix with the whole body");

        File redirectedSegments=new File(s.work,"redirected-segments.part");Response segmentRedirect=new Response(307,""),cdnFirst=new Response(206,"abcd"),cdnLast=new Response(206,"efghij");
        segmentRedirect.headers.put("Location","https://cdn.example/redirected");cdnFirst.headers.put("Content-Range","bytes 0-3/10");cdnLast.headers.put("Content-Range","bytes 4-9/10");
        Response[] redirectedPieces={segmentRedirect,cdnFirst,cdnLast};java.util.List<String> requestedHosts=new java.util.ArrayList<>();
        new DownloadTransfer(u->{requestedHosts.add(u.getHost());return redirectedPieces[requestedHosts.size()-1];}).download(track("redirected-segments",10),redirectedSegments,new DownloadTransfer.Control(),(a,b)->{});
        check(requestedHosts.equals(Arrays.asList("media.example","cdn.example","cdn.example"))&&"bytes=4-9".equals(cdnLast.requests.get("Range")),"subsequent segments retain the verified redirect target and byte offset");
        check("SECRET".equals(segmentRedirect.requests.get("Authorization"))&&!cdnFirst.requests.containsKey("Authorization")&&!cdnLast.requests.containsKey("Authorization"),"redirected segment sequence never forwards original-host authentication");

        File changingTotal=new File(s.work,"changing-total.part");Response initialTotal=new Response(206,"abcd"),changedTotal=new Response(206,"efghij");
        initialTotal.headers.put("Content-Range","bytes 0-3/10");changedTotal.headers.put("Content-Range","bytes 4-9/11");int[] totalAttempts={0};
        rejects(()->new DownloadTransfer(u->totalAttempts[0]++==0?initialTotal:changedTotal).download(track("changing-total",0),changingTotal,new DownloadTransfer.Control(),(a,b)->{}),"server total learned on the first segment cannot change on the next");
        check(changingTotal.length()==4,"inconsistent later size is rejected before appending bytes");
        String disk=new String(Files.readAllBytes(new File(s.work,"range.part.identity").toPath()),StandardCharsets.UTF_8);check(disk.matches("[0-9a-f]{64}")&&!disk.contains("SECRET"),"resume identity contains only hash");
    }
    private static void queries() {
        List<LibraryItem> items=Arrays.asList(item("Résumé",DownloadRequest.Kind.VIDEO,"Travel",5,1,true),item("Music",DownloadRequest.Kind.AUDIO,"Home",10,2,false),item("Picture",DownloadRequest.Kind.THUMBNAIL,"Travel",7,3,true),item("Captions",DownloadRequest.Kind.CAPTIONS,"",2,4,false));
        VaultQuery q=new VaultQuery();q.searchText="resume";check(q.sections(items).get(0).items.size()==1,"accent-insensitive search");
        q.searchText="";q.videoOnly=true;check(q.sections(items).get(0).items.size()==1&&q.sections(items).get(0).items.get(0).kind==DownloadRequest.Kind.VIDEO,"video filter excludes images/captions");
        q.audioOnly=true;check(q.sections(items).get(0).items.size()==4,"combined media toggles retain iOS all-types behavior");
        q.videoOnly=false;check(q.sections(items).get(0).items.get(0).kind==DownloadRequest.Kind.AUDIO,"audio filter");
        q.audioOnly=false;q.favoritesOnly=true;check(q.sections(items).get(0).items.size()==2,"favorites filter");
        q.favoritesOnly=false;q.channel="channel";check(q.sections(items).get(0).items.size()==4,"folded channel equality");
        q.channel="";q.collection="TRAVEL";check(q.sections(items).get(0).items.size()==2,"collection equality");
        q.collection="";q.sort=VaultQuery.Sort.SIZE;check(q.sections(items).get(0).items.get(0).fileSize==10,"descending size");
        q.sort=VaultQuery.Sort.NEWEST;check(q.sections(items).get(0).items.get(0).createdAt==4,"newest first");
        q.grouping=VaultQuery.Group.MEDIA_TYPE;check(q.sections(items).size()==4,"four media-kind sections");
        q.grouping=VaultQuery.Group.COLLECTION;check(q.sections(items).stream().anyMatch(s->s.title.equals("Unfiled")),"unfiled collection");
        q.grouping=VaultQuery.Group.NONE;q.createdAfter=2;q.createdBefore=3;check(q.sections(items).get(0).items.size()==2,"inclusive date range");
    }
}
