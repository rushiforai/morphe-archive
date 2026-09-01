package com.drew.metadata.iptc;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class IptcDirectory extends Directory {
    public static final int TAG_ACTION_ADVISED = 554;
    public static final int TAG_APPLICATION_RECORD_VERSION = 512;
    public static final int TAG_ARM_IDENTIFIER = 376;
    public static final int TAG_ARM_VERSION = 378;
    public static final int TAG_AUDIO_DURATION = 665;
    public static final int TAG_AUDIO_OUTCUE = 666;
    public static final int TAG_AUDIO_SAMPLING_RATE = 663;
    public static final int TAG_AUDIO_SAMPLING_RESOLUTION = 664;
    public static final int TAG_AUDIO_TYPE = 662;
    public static final int TAG_BY_LINE = 592;
    public static final int TAG_BY_LINE_TITLE = 597;
    public static final int TAG_CAPTION = 632;
    public static final int TAG_CAPTION_WRITER = 634;
    public static final int TAG_CATEGORY = 527;
    public static final int TAG_CITY = 602;
    public static final int TAG_CODED_CHARACTER_SET = 346;
    public static final int TAG_CONTACT = 630;
    public static final int TAG_CONTENT_LOCATION_CODE = 538;
    public static final int TAG_CONTENT_LOCATION_NAME = 539;
    public static final int TAG_COPYRIGHT_NOTICE = 628;
    public static final int TAG_COUNTRY_OR_PRIMARY_LOCATION_CODE = 612;
    public static final int TAG_COUNTRY_OR_PRIMARY_LOCATION_NAME = 613;
    public static final int TAG_CREDIT = 622;
    public static final int TAG_DATE_CREATED = 567;
    public static final int TAG_DATE_SENT = 326;
    public static final int TAG_DESTINATION = 261;
    public static final int TAG_DIGITAL_DATE_CREATED = 574;
    public static final int TAG_DIGITAL_TIME_CREATED = 575;
    public static final int TAG_EDITORIAL_UPDATE = 520;
    public static final int TAG_EDIT_STATUS = 519;
    public static final int TAG_ENVELOPE_NUMBER = 296;
    public static final int TAG_ENVELOPE_PRIORITY = 316;
    public static final int TAG_ENVELOPE_RECORD_VERSION = 256;
    public static final int TAG_EXPIRATION_DATE = 549;
    public static final int TAG_EXPIRATION_TIME = 550;
    public static final int TAG_FILE_FORMAT = 276;
    public static final int TAG_FILE_VERSION = 278;
    public static final int TAG_FIXTURE_ID = 534;
    public static final int TAG_HEADLINE = 617;
    public static final int TAG_IMAGE_ORIENTATION = 643;
    public static final int TAG_IMAGE_TYPE = 642;
    public static final int TAG_JOB_ID = 696;
    public static final int TAG_KEYWORDS = 537;
    public static final int TAG_LANGUAGE_IDENTIFIER = 647;
    public static final int TAG_LOCAL_CAPTION = 633;
    public static final int TAG_MASTER_DOCUMENT_ID = 697;
    public static final int TAG_OBJECT_ATTRIBUTE_REFERENCE = 516;
    public static final int TAG_OBJECT_CYCLE = 587;
    public static final int TAG_OBJECT_NAME = 517;
    public static final int TAG_OBJECT_PREVIEW_DATA = 714;
    public static final int TAG_OBJECT_PREVIEW_FILE_FORMAT = 712;
    public static final int TAG_OBJECT_PREVIEW_FILE_FORMAT_VERSION = 713;
    public static final int TAG_OBJECT_TYPE_REFERENCE = 515;
    public static final int TAG_ORIGINAL_TRANSMISSION_REFERENCE = 615;
    public static final int TAG_ORIGINATING_PROGRAM = 577;
    public static final int TAG_OWNER_ID = 700;
    public static final int TAG_PRODUCT_ID = 306;
    public static final int TAG_PROGRAM_VERSION = 582;
    public static final int TAG_PROVINCE_OR_STATE = 607;
    public static final int TAG_RASTERIZED_CAPTION = 637;
    public static final int TAG_REFERENCE_DATE = 559;
    public static final int TAG_REFERENCE_NUMBER = 562;
    public static final int TAG_REFERENCE_SERVICE = 557;
    public static final int TAG_RELEASE_DATE = 542;
    public static final int TAG_RELEASE_TIME = 547;
    public static final int TAG_SERVICE_ID = 286;
    public static final int TAG_SHORT_DOCUMENT_ID = 698;
    public static final int TAG_SOURCE = 627;
    public static final int TAG_SPECIAL_INSTRUCTIONS = 552;
    public static final int TAG_SUBJECT_REFERENCE = 524;
    public static final int TAG_SUB_LOCATION = 604;
    public static final int TAG_SUPPLEMENTAL_CATEGORIES = 532;
    public static final int TAG_TIME_CREATED = 572;
    public static final int TAG_TIME_SENT = 336;
    public static final int TAG_UNIQUE_DOCUMENT_ID = 699;
    public static final int TAG_UNIQUE_OBJECT_NAME = 356;
    public static final int TAG_URGENCY = 522;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(256, map, "Envelope Record Version", 261, "Destination");
        lv8.x(276, map, "File Format", 278, "File Version");
        lv8.x(286, map, "Service Identifier", 296, "Envelope Number");
        lv8.x(306, map, "Product Identifier", 316, "Envelope Priority");
        lv8.x(TAG_DATE_SENT, map, "Date Sent", TAG_TIME_SENT, "Time Sent");
        lv8.x(TAG_CODED_CHARACTER_SET, map, "Coded Character Set", TAG_UNIQUE_OBJECT_NAME, "Unique Object Name");
        lv8.x(TAG_ARM_IDENTIFIER, map, "ARM Identifier", TAG_ARM_VERSION, "ARM Version");
        lv8.x(512, map, "Application Record Version", 515, "Object Type Reference");
        lv8.x(516, map, "Object Attribute Reference", 517, "Object Name");
        lv8.x(519, map, "Edit Status", 520, "Editorial Update");
        lv8.x(522, map, "Urgency", 524, "Subject Reference");
        lv8.x(527, map, "Category", 532, "Supplemental Category(s)");
        lv8.x(534, map, "Fixture Identifier", 537, "Keywords");
        lv8.x(TAG_CONTENT_LOCATION_CODE, map, "Content Location Code", 539, "Content Location Name");
        lv8.x(542, map, "Release Date", 547, "Release Time");
        lv8.x(549, map, "Expiration Date", TAG_EXPIRATION_TIME, "Expiration Time");
        lv8.x(TAG_SPECIAL_INSTRUCTIONS, map, "Special Instructions", TAG_ACTION_ADVISED, "Action Advised");
        lv8.x(TAG_REFERENCE_SERVICE, map, "Reference Service", 559, "Reference Date");
        lv8.x(TAG_REFERENCE_NUMBER, map, "Reference Number", TAG_DATE_CREATED, "Date Created");
        lv8.x(TAG_TIME_CREATED, map, "Time Created", TAG_DIGITAL_DATE_CREATED, "Digital Date Created");
        lv8.x(TAG_DIGITAL_TIME_CREATED, map, "Digital Time Created", TAG_ORIGINATING_PROGRAM, "Originating Program");
        lv8.x(TAG_PROGRAM_VERSION, map, "Program Version", TAG_OBJECT_CYCLE, "Object Cycle");
        lv8.x(TAG_BY_LINE, map, "By-line", TAG_BY_LINE_TITLE, "By-line Title");
        lv8.x(TAG_CITY, map, "City", TAG_SUB_LOCATION, "Sub-location");
        lv8.x(TAG_PROVINCE_OR_STATE, map, "Province/State", TAG_COUNTRY_OR_PRIMARY_LOCATION_CODE, "Country/Primary Location Code");
        lv8.x(TAG_COUNTRY_OR_PRIMARY_LOCATION_NAME, map, "Country/Primary Location Name", TAG_ORIGINAL_TRANSMISSION_REFERENCE, "Original Transmission Reference");
        lv8.x(TAG_HEADLINE, map, "Headline", TAG_CREDIT, "Credit");
        lv8.x(TAG_SOURCE, map, "Source", TAG_COPYRIGHT_NOTICE, "Copyright Notice");
        lv8.x(TAG_CONTACT, map, "Contact", TAG_CAPTION, "Caption/Abstract");
        lv8.x(TAG_LOCAL_CAPTION, map, "Local Caption", TAG_CAPTION_WRITER, "Caption Writer/Editor");
        lv8.x(TAG_RASTERIZED_CAPTION, map, "Rasterized Caption", TAG_IMAGE_TYPE, "Image Type");
        lv8.x(TAG_IMAGE_ORIENTATION, map, "Image Orientation", TAG_LANGUAGE_IDENTIFIER, "Language Identifier");
        lv8.x(TAG_AUDIO_TYPE, map, "Audio Type", TAG_AUDIO_SAMPLING_RATE, "Audio Sampling Rate");
        lv8.x(TAG_AUDIO_SAMPLING_RESOLUTION, map, "Audio Sampling Resolution", TAG_AUDIO_DURATION, "Audio Duration");
        lv8.x(TAG_AUDIO_OUTCUE, map, "Audio Outcue", TAG_JOB_ID, "Job Identifier");
        lv8.x(TAG_MASTER_DOCUMENT_ID, map, "Master Document Identifier", TAG_SHORT_DOCUMENT_ID, "Short Document Identifier");
        lv8.x(TAG_UNIQUE_DOCUMENT_ID, map, "Unique Document Identifier", 700, "Owner Identifier");
        lv8.x(TAG_OBJECT_PREVIEW_FILE_FORMAT, map, "Object Data Preview File Format", TAG_OBJECT_PREVIEW_FILE_FORMAT_VERSION, "Object Data Preview File Format Version");
        map.put(Integer.valueOf(TAG_OBJECT_PREVIEW_DATA), "Object Data Preview Data");
    }

    public IptcDirectory() {
        setDescriptor(new IptcDescriptor(this));
    }

    private Date getDate(int i, int i2) {
        String string = getString(i);
        String string2 = getString(i2);
        if (string == null || string2 == null) {
            return null;
        }
        try {
            return new SimpleDateFormat("yyyyMMddHHmmssZ").parse(string.concat(string2));
        } catch (ParseException unused) {
            return null;
        }
    }

    public final Date getDateCreated() {
        return getDate(TAG_DATE_CREATED, TAG_TIME_CREATED);
    }

    public final Date getDateSent() {
        return getDate(TAG_DATE_SENT, TAG_TIME_SENT);
    }

    public final Date getDigitalDateCreated() {
        return getDate(TAG_DIGITAL_DATE_CREATED, TAG_DIGITAL_TIME_CREATED);
    }

    public final Date getExpirationDate() {
        return getDate(549, TAG_EXPIRATION_TIME);
    }

    public final List<String> getKeywords() {
        String[] stringArray = getStringArray(537);
        if (stringArray == null) {
            return null;
        }
        return Arrays.asList(stringArray);
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "IPTC";
    }

    public final Date getReleaseDate() {
        return getDate(542, 547);
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
