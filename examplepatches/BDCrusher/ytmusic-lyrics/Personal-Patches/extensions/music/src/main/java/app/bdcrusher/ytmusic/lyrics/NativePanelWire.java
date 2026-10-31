/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import java.nio.charset.StandardCharsets;

/** Preserve the registered native Music presentation, including its palette entity. */
final class NativePanelWire {
    /** Same APK's native Lyrics factory profile (not a Related panel clone). */
    static byte[] lyricsProfile(String title){
        byte[] label=ProtoWire.message(ProtoWire.blob(4,title.getBytes(StandardCharsets.UTF_8)));
        byte[] header=ProtoWire.message(ProtoWire.blob(138681548,ProtoWire.message(ProtoWire.blob(1,label))));
        byte[] identity=ProtoWire.message(ProtoWire.number(1,1),ProtoWire.blob(3,NativeLyricsHost.ID.getBytes(StandardCharsets.UTF_8)));
        return ProtoWire.message(ProtoWire.blob(2,header),ProtoWire.number(5,95102),
            ProtoWire.number(6,1),ProtoWire.number(15,1),ProtoWire.blob(18,identity),
            ProtoWire.number(20,1),ProtoWire.blob(21,new byte[]{4}),ProtoWire.number(37,2));
    }
    /** Retain presentation only: another recording's native lyric content is never cached. */
    static byte[] presentation(byte[] original){ProtoWire panel=new ProtoWire(original);panel.remove(3);return panel.bytes();}
    static byte[] command(){
        byte[] id=ProtoWire.message(ProtoWire.number(1,1),ProtoWire.blob(3,NativeLyricsHost.ID.getBytes(StandardCharsets.UTF_8)));
        return ProtoWire.message(ProtoWire.blob(138681778,ProtoWire.message(ProtoWire.blob(10,id))));
    }
}
