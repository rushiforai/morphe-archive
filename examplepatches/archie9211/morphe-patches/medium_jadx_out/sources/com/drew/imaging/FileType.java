package com.drew.imaging;

import androidx.core.widget.nRCC.nGxjfIr;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.explore.ui.vAWg.OphtYB;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum FileType {
    Unknown("Unknown", "Unknown", null, new String[0]),
    Jpeg("JPEG", "Joint Photographic Experts Group", "image/jpeg", "jpg", "jpeg", "jpe"),
    Tiff("TIFF", "Tagged Image File Format", "image/tiff", "tiff", "tif"),
    Psd("PSD", uvlZTF.NYghqWCJ, "image/vnd.adobe.photoshop", "psd"),
    Dng("DNG", "Digital Negative", "image/x-adobe-dng", "dng"),
    Png("PNG", "Portable Network Graphics", "image/png", "png"),
    Bmp("BMP", "Device Independent Bitmap", "image/bmp", "bmp"),
    Gif("GIF", "Graphics Interchange Format", "image/gif", "gif"),
    Ico("ICO", "Windows Icon", "image/x-icon", "ico"),
    Pcx("PCX", "PiCture eXchange", "image/x-pcx", "pcx"),
    Riff("RIFF", "Resource Interchange File Format", null, new String[0]),
    Wav("WAV", "Waveform Audio File Format", "audio/vnd.wave", "wav", "wave"),
    Avi("AVI", DtuT.LYiponn, "video/vnd.avi", "avi"),
    WebP("WebP", "WebP", "image/webp", "webp"),
    QuickTime(nGxjfIr.ezqEcUUOzc, "QuickTime Movie", "video/quicktime", "mov", "qt"),
    Mp4("MP4", "MPEG-4 Part 14", "video/mp4", "mp4", "m4a", "m4p", "m4b", "m4r", "m4v"),
    Heif("HEIF", "High Efficiency Image File Format", "image/heif", "heif", "heic"),
    Avif("AVIF", "AV1 Image File Format", "image/avif", "avif"),
    Eps("EPS", "Encapsulated PostScript", "application/postscript", "eps", "epsf", "epsi"),
    Mp3("MP3", "MPEG Audio Layer III", "audio/mpeg", Plbho.SglQCmbUwpodWq),
    Arw("ARW", "Sony Camera Raw", "image/x-sony-arw", "arw"),
    Crw("CRW", "Canon Camera Raw", "image/x-canon-crw", "crw"),
    Cr2("CR2", "Canon Camera Raw", "image/x-canon-cr2", "cr2"),
    Nef("NEF", "Nikon Camera Raw", "image/x-nikon-nef", "nef"),
    Orf("ORF", "Olympus Camera Raw", "image/x-olympus-orf", "orf"),
    Raf("RAF", "FujiFilm Camera Raw", "image/x-fuji-raf", "raf"),
    Rw2(uuLAxLN.ZCAfejZVZenjgN, "Panasonic Camera Raw", null, "rw2"),
    Crx("CRX", "Canon Camera Raw", null, "cr3", "crm"),
    GoPro("GPR", "GoPro Raw", "image/x-gopro-gpr", "gpr"),
    Kdc("KDC", "Kodak Raw", "image/x-kodak-kdc", "kdc"),
    ThreeFR("3FR", "Hasselblad Raw", "image/x-hasselblad-3fr", "3fr"),
    Pef("PEF", "Pentax Raw", "image/x-pentax-pef", "pef"),
    Srw("SRW", "Samsung Raw", "image/x-samsung-srw", "srw"),
    Aac("AAC", "Advanced Audio Coding", "audio/aac", "m4a"),
    Asf("ASF", "Advanced Systems Format", "video/x-ms-asf", "asf", "wma", "wmv"),
    Cfbf("CFBF", "Compound File Binary Format", null, new String[0]),
    Flv("FLV", "Flash Video", "video/x-flv", ".flv", ".f4v,"),
    Indd("INDD", "INDesign Document", "application/octet-stream", ".indd"),
    Mxf("MXF", "Material Exchange Format", "application/mxf", "mxf"),
    Pdf("PDF", "Portable Document Format", "application/pdf", "pdf"),
    Qxp("QXP", "Quark XPress Document", null, "qzp", "qxd"),
    Ram("RAM", "RealAudio", "audio/vnd.rn-realaudio", "aac", "ra"),
    Rtf("RTF", "Rich Text Format", "application/rtf", OphtYB.YTaxGQeJl),
    Sit("SIT", "Stuffit Archive", "application/x-stuffit", "sit"),
    Sitx("SITX", "Stuffit X Archive", "application/x-stuffitx", "sitx"),
    Swf("SWF", "Small Web Format", "application/vnd.adobe.flash-movie", "swf"),
    Vob("VOB", "Video Object", "video/dvd", dpBiLjNeNsiASg.SheQrJUMDMxQW),
    Zip("ZIP", "ZIP Archive", "application/zip", ".zip", ".zipx");

    private final String[] _extensions;
    private final String _longName;
    private final String _mimeType;
    private final String _name;

    FileType(String str, String str2, String str3, String... strArr) {
        this._name = str;
        this._longName = str2;
        this._mimeType = str3;
        this._extensions = strArr;
    }

    public String[] getAllExtensions() {
        return this._extensions;
    }

    public String getCommonExtension() {
        String[] strArr = this._extensions;
        if (strArr == null || strArr.length == 0) {
            return null;
        }
        return strArr[0];
    }

    public String getLongName() {
        return this._longName;
    }

    public String getMimeType() {
        return this._mimeType;
    }

    public String getName() {
        return this._name;
    }
}
