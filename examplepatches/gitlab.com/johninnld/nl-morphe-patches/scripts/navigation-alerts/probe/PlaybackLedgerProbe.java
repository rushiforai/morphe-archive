package nl.johninnl.warningprobe;

import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import android.os.Process;
import android.os.SystemClock;
import android.system.Os;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.EnumSet;
import java.util.UUID;
import nl.johninnl.navigation.alerts.*;
import org.json.JSONObject;

/** Real app-private file/boot/lock checks. Synthetic grants never invoke any audio adapter. */
public final class PlaybackLedgerProbe {
    public static JSONObject run(Instrumentation probe,Bundle args) throws Exception {
        Context context=probe.getTargetContext();String scenario=args.getString("scenario"),boot=AtomicPlaybackStore.bootIdentity(context);
        JSONObject report=new JSONObject().put("probe","PlaybackLedgerProbe").put("scenario",scenario)
                .put("boot_identity",boot).put("process_pid",Process.myPid()).put("output_invoked",false)
                .put("scope","Atomic file and ownership-policy fixture only; no Binder peers, real warning capture or audio acceptance");
        File marker=new File(context.getNoBackupFilesDir(),"morphe-warning-probe.pid");
        try(AtomicPlaybackStore store=new AtomicPlaybackStore(context)) {
            if(scenario.equals("ledger_io")) {
                boolean rejected=false;
                try(AtomicPlaybackStore another=new AtomicPlaybackStore(context)) { }
                catch(IOException expected) { rejected=true; }
                report.put("second_writer_rejected",rejected);
                int before=fds();long start=SystemClock.elapsedRealtimeNanos();
                for(int i=0;i<100;i++)store.save(null);
                int after=fds();report.put("fd_before",before).put("fd_after",after).put("writes",100)
                        .put("total_commit_ms",(SystemClock.elapsedRealtimeNanos()-start)/1000000.0)
                        .put("empty_record_loaded",store.load()==null);
                File file=new File(context.getNoBackupFilesDir(),"morphe-warning-output.bin");
                report.put("file_mode",Os.stat(file.getPath()).st_mode & 0777).put("file_bytes",file.length());
                report.put("status",rejected && after<=before+8 && store.load()==null ? "observed":"blocked");
                return report;
            }
            WarningCapabilities caps=new WarningCapabilities(repeat('a',64),Collections.singleton("native_text:v1"),true);
            String session=UUID.randomUUID().toString();long now=SystemClock.elapsedRealtime();
            WarningJournal journal=new WarningJournal(session);
            WarningAudioOwner owner=new WarningAudioOwner(boot,session,journal,store,caps);
            WarningAudioOwner.Client client=new WarningAudioOwner.Client(Process.myUid(),context.getPackageName(),UUID.randomUUID().toString(),
                    UUID.randomUUID().toString(),caps.required,EnumSet.allOf(WarningAudioOwner.Mode.class),caps.digest);
            if(scenario.equals("ledger_write")) {
                check(store.load()==null,"Prior fixture must be cleared first");
                journal.append(event(session,now),now);
                WarningAudioOwner.Lease lease=owner.claim(client.uid,client,WarningAudioOwner.Mode.VOICE,true,now).lease;
                WarningAudioOwner.GrantResult result=owner.begin(client.uid,client,lease.token,lease.epoch,"synthetic-private-ledger",WarningEvent.Phase.NOTICE,
                        1,1,UUID.randomUUID().toString(),now);
                check(result.code==WarningAudioOwner.Code.GRANTED && store.load()!=null,"Durable grant missing");
                try(FileOutputStream stream=new FileOutputStream(marker);DataOutputStream out=new DataOutputStream(stream)) {
                    out.writeInt(Process.myPid());out.flush();stream.getFD().sync();
                }
                report.put("persisted_disposition",store.load().outcome.name()).put("status","observed");
            }else if(scenario.equals("ledger_recover")) {
                int previous;
                try(DataInputStream in=new DataInputStream(new FileInputStream(marker))) { previous=in.readInt(); }
                check(previous!=Process.myPid(),"Fresh provider process required");
                check(store.load()!=null,"Prior grant not retained");
                check(owner.claim(client.uid,client,WarningAudioOwner.Mode.VOICE,true,now).code==WarningAudioOwner.Code.AUDIO_UNCERTAIN,"Restart permitted competing output");
                PlaybackGrant old=store.load();
                check(owner.outcome(client.uid,client.consumerNonce,old,PlaybackGrant.Outcome.NOT_STARTED,true,now)==WarningAudioOwner.Code.STALE_CONSUMER,"New consumer cleared old uncertainty");
                check(owner.outcome(old.ownerUid,old.consumerNonce,old,PlaybackGrant.Outcome.STARTED,false,now)==WarningAudioOwner.Code.STALE_OWNER,"Revoked epoch accepted STARTED");
                // This fixture created no player/engine. Explicit provider-internal cleanup is safe;
                // it is not proof that a production receiver's output has been stopped.
                check(owner.resetAfterVerifiedParkedStop()==WarningAudioOwner.Code.OK,"Fixture cleanup failed");
                check(store.load()==null,"Fixture ledger not cleared");
                marker.delete();
                report.put("previous_process_pid",previous).put("restart_fenced",true).put("stale_consumer_rejected",true)
                        .put("stale_started_rejected",true).put("test_only_parked_cleanup",true).put("status","observed");
            }else throw new IllegalArgumentException("Unknown ledger scenario");
        }
        return report;
    }
    private static WarningEvent event(String session,long now) {
        Bundle b=new Bundle();b.putInt("protocol_version",1);b.putString("provider_session",session);b.putLong("sequence",1);
        b.putString("warning_id","synthetic-private-ledger");b.putLong("revision",1);b.putLong("announcement_index",1);
        b.putString("operation","ANNOUNCE");b.putString("phase","notice");b.putString("native_type","SyntheticFixture");
        b.putString("category","advice");b.putInt("priority",2);b.putString("message","Synthetic ledger test; never spoken");
        b.putString("language_tag","en");b.putString("message_origin","template");b.putString("relevance","notice");b.putString("relationship","unknown");
        b.putLong("observed_elapsed_ms",now);b.putLong("issued_elapsed_ms",now);b.putLong("announce_until_elapsed_ms",now+10000);b.putLong("state_until_elapsed_ms",now+30000);
        return WarningCodec.decode(b,now);
    }
    private static int fds() { String[] values=new File("/proc/self/fd").list();if(values==null)throw new IllegalStateException("FD inventory unavailable");return values.length; }
    private static String repeat(char c,int n) { StringBuilder b=new StringBuilder();for(int i=0;i<n;i++)b.append(c);return b.toString(); }
    private static void check(boolean value,String reason) { if(!value)throw new IllegalStateException(reason); }
}
