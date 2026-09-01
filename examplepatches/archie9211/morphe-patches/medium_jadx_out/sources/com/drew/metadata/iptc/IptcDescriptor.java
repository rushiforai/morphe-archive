package com.drew.metadata.iptc;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.drew.lang.StringUtil;
import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class IptcDescriptor extends TagDescriptor<IptcDirectory> {
    public IptcDescriptor(IptcDirectory iptcDirectory) {
        super(iptcDirectory);
    }

    public final String getByLineDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_BY_LINE);
    }

    public final String getByLineTitleDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_BY_LINE_TITLE);
    }

    public final String getCaptionDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_CAPTION);
    }

    public final String getCategoryDescription() {
        return ((IptcDirectory) this._directory).getString(527);
    }

    public final String getCityDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_CITY);
    }

    public final String getCopyrightNoticeDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_COPYRIGHT_NOTICE);
    }

    public final String getCountryOrPrimaryLocationDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_COUNTRY_OR_PRIMARY_LOCATION_NAME);
    }

    public final String getCreditDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_CREDIT);
    }

    public final String getDateCreatedDescription() {
        return getDateDescription(IptcDirectory.TAG_DATE_CREATED);
    }

    public final String getDateDescription(int i) {
        String string = ((IptcDirectory) this._directory).getString(i);
        if (string == null) {
            return null;
        }
        if (string.length() != 8) {
            return string;
        }
        return string.substring(0, 4) + ':' + string.substring(4, 6) + ':' + string.substring(6);
    }

    public final String getDateSentDescription() {
        return getDateDescription(IptcDirectory.TAG_DATE_SENT);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 276 ? i != 326 ? i != 336 ? i != 537 ? i != 542 ? i != 547 ? i != 559 ? i != 567 ? i != 572 ? i != 549 ? i != 550 ? i != 574 ? i != 575 ? super.getDescription(i) : getTimeDescription(IptcDirectory.TAG_DIGITAL_TIME_CREATED) : getDateDescription(IptcDirectory.TAG_DIGITAL_DATE_CREATED) : getTimeDescription(IptcDirectory.TAG_EXPIRATION_TIME) : getDateDescription(549) : getTimeDescription(IptcDirectory.TAG_TIME_CREATED) : getDateDescription(IptcDirectory.TAG_DATE_CREATED) : getDateDescription(559) : getTimeDescription(547) : getDateDescription(542) : getKeywordsDescription() : getTimeDescription(IptcDirectory.TAG_TIME_SENT) : getDateDescription(IptcDirectory.TAG_DATE_SENT) : getFileFormatDescription();
    }

    public final String getDigitalDateCreatedDescription() {
        return getDateDescription(IptcDirectory.TAG_DIGITAL_DATE_CREATED);
    }

    public final String getDigitalTimeCreatedDescription() {
        return getTimeDescription(IptcDirectory.TAG_DIGITAL_TIME_CREATED);
    }

    public final String getExpirationDateDescription() {
        return getDateDescription(549);
    }

    public final String getExpirationTimeDescription() {
        return getTimeDescription(IptcDirectory.TAG_EXPIRATION_TIME);
    }

    public final String getHeadlineDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_HEADLINE);
    }

    public final String getKeywordsDescription() {
        String[] stringArray = ((IptcDirectory) this._directory).getStringArray(537);
        if (stringArray == null) {
            return null;
        }
        return StringUtil.join(stringArray, ";");
    }

    public final String getObjectNameDescription() {
        return ((IptcDirectory) this._directory).getString(517);
    }

    public final String getOriginalTransmissionReferenceDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_ORIGINAL_TRANSMISSION_REFERENCE);
    }

    public final String getOriginatingProgramDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_ORIGINATING_PROGRAM);
    }

    public final String getProvinceOrStateDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_PROVINCE_OR_STATE);
    }

    public final String getRecordVersionDescription() {
        return ((IptcDirectory) this._directory).getString(512);
    }

    public final String getReferenceDateDescription() {
        return getDateDescription(559);
    }

    public final String getReleaseDateDescription() {
        return getDateDescription(542);
    }

    public final String getReleaseTimeDescription() {
        return getTimeDescription(547);
    }

    public final String getSourceDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_SOURCE);
    }

    public final String getSpecialInstructionsDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_SPECIAL_INSTRUCTIONS);
    }

    public final String getSupplementalCategoriesDescription() {
        return ((IptcDirectory) this._directory).getString(532);
    }

    public final String getTimeCreatedDescription() {
        return getTimeDescription(IptcDirectory.TAG_TIME_CREATED);
    }

    public final String getTimeDescription(int i) {
        String string = ((IptcDirectory) this._directory).getString(i);
        if (string == null) {
            return null;
        }
        if (string.length() != 6 && string.length() != 11) {
            return string;
        }
        return string.substring(0, 2) + ':' + string.substring(2, 4) + ':' + string.substring(4);
    }

    public final String getTimeSentDescription() {
        return getTimeDescription(IptcDirectory.TAG_TIME_SENT);
    }

    public final String getUrgencyDescription() {
        return ((IptcDirectory) this._directory).getString(522);
    }

    public final String getWriterDescription() {
        return ((IptcDirectory) this._directory).getString(IptcDirectory.TAG_CAPTION_WRITER);
    }

    public final String getFileFormatDescription() {
        return getIndexedDescription(276, 0, "No ObjectData", "IPTC-NAA Digital Newsphoto Parameter Record", aJzfoQ.rWlqetxHJ, "Tagged Image File Format (Adobe/Aldus Image data)", "Illustrator (Adobe Graphics data)", "AppleSingle (Apple Computer Inc)", "NAA 89-3 (ANPA 1312)", "MacBinary II", "IPTC Unstructured Character Oriented File Format (UCOFF)", "United Press International ANPA 1312 variant", "United Press International Down-Load Message", "JPEG File Interchange (JFIF)", "Photo-CD Image-Pac (Eastman Kodak)", "Bit Mapped Graphics File [.BMP] (Microsoft)", "Digital Audio File [.WAV] (Microsoft & Creative Labs)", "Audio plus Moving Video [.AVI] (Microsoft)", "PC DOS/Windows Executable Files [.COM][.EXE]", "Compressed Binary File [.ZIP] (PKWare Inc)", "Audio Interchange File Format AIFF (Apple Computer Inc)", "RIFF Wave (Microsoft Corporation)", "Freehand (Macromedia/Aldus)", "Hypertext Markup Language [.HTML] (The Internet Society)", "MPEG 2 Audio Layer 2 (Musicom), ISO/IEC", "MPEG 2 Audio Layer 3, ISO/IEC", "Portable Document File [.PDF] Adobe", "News Industry Text Format (NITF)", "Tape Archive [.TAR]", "Tidningarnas Telegrambyra NITF version (TTNITF DTD)", "Ritzaus Bureau NITF version (RBNITF DTD)", "Corel Draw [.CDR]");
    }
}
