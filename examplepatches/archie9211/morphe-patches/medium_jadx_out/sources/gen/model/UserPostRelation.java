package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.Internal;
import defpackage.bu1;
import defpackage.eee;
import defpackage.fee;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\f\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\u0018\u0000 42\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u00025B\u0091\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u0012\b\b\u0002\u0010\u001f\u001a\u00020\u001e¢\u0006\u0004\b \u0010!J\u000f\u0010\"\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\"\u0010#J\u001a\u0010'\u001a\u00020&2\b\u0010%\u001a\u0004\u0018\u00010$H\u0096\u0002¢\u0006\u0004\b'\u0010(J\u000f\u0010)\u001a\u00020\u0015H\u0016¢\u0006\u0004\b)\u0010*J\u000f\u0010+\u001a\u00020\u0003H\u0016¢\u0006\u0004\b+\u0010,J\u009b\u0002\u0010-\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\b\b\u0002\u0010\u001f\u001a\u00020\u001e¢\u0006\u0004\b-\u0010.R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010/R\u0014\u0010\u0005\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010/R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u00100R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u00100R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u00100R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u00100R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u00100R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u00100R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u00100R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u00100R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010/R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010/R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u00100R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010/R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u00101R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u00102R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u00102R\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u00102R\u0016\u0010\u0019\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u00100R\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u00100R\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u00100R\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u001c8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u00103¨\u00066"}, d2 = {"Lgen/model/UserPostRelation;", "Lcom/squareup/wire/AndroidMessage;", "Leee;", "", "user_id", "post_id", "", "read_at", "read_later_added_at", "queued_at", "voted_at", "collaborator_added_at", "notes_added_at", "subscribed_at", "viewed_at", "last_read_section_name", "last_read_version_id", "last_read_at", "last_read_paragraph_name", "", "last_read_percentage", "", "presented_count_in_stream", "presented_count_in_response_management", "clap_count", "series_update_notifs_opted_in_at", "series_first_viewed_at", "series_last_viewed_at", "", "audio_progress_sec", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Float;Lh21;)V", "newBuilder", "()Leee;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Float;Lh21;)Lgen/model/UserPostRelation;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/lang/Double;", "Ljava/lang/Integer;", "Ljava/lang/Float;", "Companion", "fee", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserPostRelation extends AndroidMessage<UserPostRelation, eee> {
    public static final ProtoAdapter<UserPostRelation> ADAPTER;
    public static final Parcelable.Creator<UserPostRelation> CREATOR;
    public static final fee Companion = new fee();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 21, tag = 22)
    public final Float audio_progress_sec;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 17, tag = 16)
    public final Integer clap_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 6, tag = 6)
    public final Long collaborator_added_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 12, tag = 11)
    public final Long last_read_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 12)
    public final String last_read_paragraph_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#DOUBLE", schemaIndex = 14, tag = 13)
    public final Double last_read_percentage;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 9)
    public final String last_read_section_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 10)
    public final String last_read_version_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 7, tag = 7)
    public final Long notes_added_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 16, tag = 15)
    public final Integer presented_count_in_response_management;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 15, tag = 20)
    public final Integer presented_count_in_stream;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 4, tag = 18)
    public final Long queued_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long read_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 4)
    public final Long read_later_added_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 19, tag = 19)
    public final Long series_first_viewed_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 20, tag = 21)
    public final Long series_last_viewed_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 18, tag = 17)
    public final Long series_update_notifs_opted_in_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 8, tag = 8)
    public final Long subscribed_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final String user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 9, tag = 14)
    public final Long viewed_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 5, tag = 5)
    public final Long voted_at;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UserPostRelation.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UserPostRelation> protoAdapter = new ProtoAdapter<UserPostRelation>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.UserPostRelation$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UserPostRelation decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                Long lDecode3 = null;
                Long lDecode4 = null;
                Long lDecode5 = null;
                Long lDecode6 = null;
                Long lDecode7 = null;
                Long lDecode8 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                Long lDecode9 = null;
                String strDecode5 = null;
                Double dDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                Integer numDecode3 = null;
                Long lDecode10 = null;
                Long lDecode11 = null;
                Long lDecode12 = null;
                Float fDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    String str = strDecode;
                    if (iNextTag == -1) {
                        h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                        String str2 = str;
                        if (str2 == null) {
                            Internal.missingRequiredFields(str, "user_id");
                            throw null;
                        }
                        String str3 = strDecode2;
                        if (str3 != null) {
                            return new UserPostRelation(str2, str3, lDecode, lDecode2, lDecode3, lDecode4, lDecode5, lDecode6, lDecode7, lDecode8, strDecode3, strDecode4, lDecode9, strDecode5, dDecode, numDecode, numDecode2, numDecode3, lDecode10, lDecode11, lDecode12, fDecode, h21VarEndMessageAndGetUnknownFields);
                        }
                        Internal.missingRequiredFields(strDecode2, "post_id");
                        throw null;
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 4:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 5:
                            lDecode4 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 6:
                            lDecode5 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 7:
                            lDecode6 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 8:
                            lDecode7 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 9:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 10:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 11:
                            lDecode9 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 12:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 13:
                            dDecode = ProtoAdapter.DOUBLE.decode(reader);
                            break;
                        case 14:
                            lDecode8 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 15:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 16:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 17:
                            lDecode10 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 18:
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 19:
                            lDecode11 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 20:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 21:
                            lDecode12 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 22:
                            fDecode = ProtoAdapter.FLOAT.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                    strDecode = str;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UserPostRelation value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.user_id);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 3, value.read_at);
                protoAdapter3.encodeWithTag(writer, 4, value.read_later_added_at);
                protoAdapter3.encodeWithTag(writer, 18, value.queued_at);
                protoAdapter3.encodeWithTag(writer, 5, value.voted_at);
                protoAdapter3.encodeWithTag(writer, 6, value.collaborator_added_at);
                protoAdapter3.encodeWithTag(writer, 7, value.notes_added_at);
                protoAdapter3.encodeWithTag(writer, 8, value.subscribed_at);
                protoAdapter3.encodeWithTag(writer, 14, value.viewed_at);
                protoAdapter2.encodeWithTag(writer, 9, value.last_read_section_name);
                protoAdapter2.encodeWithTag(writer, 10, value.last_read_version_id);
                protoAdapter3.encodeWithTag(writer, 11, value.last_read_at);
                protoAdapter2.encodeWithTag(writer, 12, value.last_read_paragraph_name);
                ProtoAdapter.DOUBLE.encodeWithTag(writer, 13, value.last_read_percentage);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 20, value.presented_count_in_stream);
                protoAdapter4.encodeWithTag(writer, 15, value.presented_count_in_response_management);
                protoAdapter4.encodeWithTag(writer, 16, value.clap_count);
                protoAdapter3.encodeWithTag(writer, 17, value.series_update_notifs_opted_in_at);
                protoAdapter3.encodeWithTag(writer, 19, value.series_first_viewed_at);
                protoAdapter3.encodeWithTag(writer, 21, value.series_last_viewed_at);
                ProtoAdapter.FLOAT.encodeWithTag(writer, 22, value.audio_progress_sec);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UserPostRelation value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.post_id) + protoAdapter2.encodedSizeWithTag(1, value.user_id) + iE;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                int iEncodedSizeWithTag2 = ProtoAdapter.DOUBLE.encodedSizeWithTag(13, value.last_read_percentage) + protoAdapter2.encodedSizeWithTag(12, value.last_read_paragraph_name) + protoAdapter3.encodedSizeWithTag(11, value.last_read_at) + protoAdapter2.encodedSizeWithTag(10, value.last_read_version_id) + protoAdapter2.encodedSizeWithTag(9, value.last_read_section_name) + protoAdapter3.encodedSizeWithTag(14, value.viewed_at) + protoAdapter3.encodedSizeWithTag(8, value.subscribed_at) + protoAdapter3.encodedSizeWithTag(7, value.notes_added_at) + protoAdapter3.encodedSizeWithTag(6, value.collaborator_added_at) + protoAdapter3.encodedSizeWithTag(5, value.voted_at) + protoAdapter3.encodedSizeWithTag(18, value.queued_at) + protoAdapter3.encodedSizeWithTag(4, value.read_later_added_at) + protoAdapter3.encodedSizeWithTag(3, value.read_at) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                return ProtoAdapter.FLOAT.encodedSizeWithTag(22, value.audio_progress_sec) + protoAdapter3.encodedSizeWithTag(21, value.series_last_viewed_at) + protoAdapter3.encodedSizeWithTag(19, value.series_first_viewed_at) + protoAdapter3.encodedSizeWithTag(17, value.series_update_notifs_opted_in_at) + protoAdapter4.encodedSizeWithTag(16, value.clap_count) + protoAdapter4.encodedSizeWithTag(15, value.presented_count_in_response_management) + protoAdapter4.encodedSizeWithTag(20, value.presented_count_in_stream) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UserPostRelation redact(UserPostRelation value) {
                value.getClass();
                return value.copy((4194303 & 1) != 0 ? value.user_id : null, (4194303 & 2) != 0 ? value.post_id : null, (4194303 & 4) != 0 ? value.read_at : null, (4194303 & 8) != 0 ? value.read_later_added_at : null, (4194303 & 16) != 0 ? value.queued_at : null, (4194303 & 32) != 0 ? value.voted_at : null, (4194303 & 64) != 0 ? value.collaborator_added_at : null, (4194303 & 128) != 0 ? value.notes_added_at : null, (4194303 & 256) != 0 ? value.subscribed_at : null, (4194303 & 512) != 0 ? value.viewed_at : null, (4194303 & 1024) != 0 ? value.last_read_section_name : null, (4194303 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.last_read_version_id : null, (4194303 & 4096) != 0 ? value.last_read_at : null, (4194303 & 8192) != 0 ? value.last_read_paragraph_name : null, (4194303 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.last_read_percentage : null, (4194303 & 32768) != 0 ? value.presented_count_in_stream : null, (4194303 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.presented_count_in_response_management : null, (4194303 & 131072) != 0 ? value.clap_count : null, (4194303 & 262144) != 0 ? value.series_update_notifs_opted_in_at : null, (4194303 & 524288) != 0 ? value.series_first_viewed_at : null, (4194303 & 1048576) != 0 ? value.series_last_viewed_at : null, (4194303 & 2097152) != 0 ? value.audio_progress_sec : null, (4194303 & 4194304) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UserPostRelation value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.FLOAT.encodeWithTag(writer, 22, value.audio_progress_sec);
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                protoAdapter2.encodeWithTag(writer, 21, value.series_last_viewed_at);
                protoAdapter2.encodeWithTag(writer, 19, value.series_first_viewed_at);
                protoAdapter2.encodeWithTag(writer, 17, value.series_update_notifs_opted_in_at);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 16, value.clap_count);
                protoAdapter3.encodeWithTag(writer, 15, value.presented_count_in_response_management);
                protoAdapter3.encodeWithTag(writer, 20, value.presented_count_in_stream);
                ProtoAdapter.DOUBLE.encodeWithTag(writer, 13, value.last_read_percentage);
                ProtoAdapter<String> protoAdapter4 = ProtoAdapter.STRING;
                protoAdapter4.encodeWithTag(writer, 12, value.last_read_paragraph_name);
                protoAdapter2.encodeWithTag(writer, 11, value.last_read_at);
                protoAdapter4.encodeWithTag(writer, 10, value.last_read_version_id);
                protoAdapter4.encodeWithTag(writer, 9, value.last_read_section_name);
                protoAdapter2.encodeWithTag(writer, 14, value.viewed_at);
                protoAdapter2.encodeWithTag(writer, 8, value.subscribed_at);
                protoAdapter2.encodeWithTag(writer, 7, value.notes_added_at);
                protoAdapter2.encodeWithTag(writer, 6, value.collaborator_added_at);
                protoAdapter2.encodeWithTag(writer, 5, value.voted_at);
                protoAdapter2.encodeWithTag(writer, 18, value.queued_at);
                protoAdapter2.encodeWithTag(writer, 4, value.read_later_added_at);
                protoAdapter2.encodeWithTag(writer, 3, value.read_at);
                protoAdapter4.encodeWithTag(writer, 2, value.post_id);
                protoAdapter4.encodeWithTag(writer, 1, value.user_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UserPostRelation(String str, String str2, Long l, Long l2, Long l3, Long l4, Long l5, Long l6, Long l7, Long l8, String str3, String str4, Long l9, String str5, Double d, Integer num, Integer num2, Integer num3, Long l10, Long l11, Long l12, Float f, h21 h21Var, int i, gy2 gy2Var) {
        this(str, str2, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : l2, (i & 16) != 0 ? null : l3, (i & 32) != 0 ? null : l4, (i & 64) != 0 ? null : l5, (i & 128) != 0 ? null : l6, (i & 256) != 0 ? null : l7, (i & 512) != 0 ? null : l8, (i & 1024) != 0 ? null : str3, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str4, (i & 4096) != 0 ? null : l9, (i & 8192) != 0 ? null : str5, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : d, (32768 & i) != 0 ? null : num, (65536 & i) != 0 ? null : num2, (131072 & i) != 0 ? null : num3, (262144 & i) != 0 ? null : l10, (524288 & i) != 0 ? null : l11, (1048576 & i) != 0 ? null : l12, (2097152 & i) != 0 ? null : f, (i & 4194304) != 0 ? h21.d : h21Var);
    }

    public final UserPostRelation copy(String user_id, String post_id, Long read_at, Long read_later_added_at, Long queued_at, Long voted_at, Long collaborator_added_at, Long notes_added_at, Long subscribed_at, Long viewed_at, String last_read_section_name, String last_read_version_id, Long last_read_at, String last_read_paragraph_name, Double last_read_percentage, Integer presented_count_in_stream, Integer presented_count_in_response_management, Integer clap_count, Long series_update_notifs_opted_in_at, Long series_first_viewed_at, Long series_last_viewed_at, Float audio_progress_sec, h21 unknownFields) {
        user_id.getClass();
        post_id.getClass();
        unknownFields.getClass();
        return new UserPostRelation(user_id, post_id, read_at, read_later_added_at, queued_at, voted_at, collaborator_added_at, notes_added_at, subscribed_at, viewed_at, last_read_section_name, last_read_version_id, last_read_at, last_read_paragraph_name, last_read_percentage, presented_count_in_stream, presented_count_in_response_management, clap_count, series_update_notifs_opted_in_at, series_first_viewed_at, series_last_viewed_at, audio_progress_sec, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UserPostRelation)) {
            return false;
        }
        UserPostRelation userPostRelation = (UserPostRelation) other;
        if (!g76.L(unknownFields(), userPostRelation.unknownFields()) || !g76.L(this.user_id, userPostRelation.user_id) || !g76.L(this.post_id, userPostRelation.post_id) || !g76.L(this.read_at, userPostRelation.read_at) || !g76.L(this.read_later_added_at, userPostRelation.read_later_added_at) || !g76.L(this.queued_at, userPostRelation.queued_at) || !g76.L(this.voted_at, userPostRelation.voted_at) || !g76.L(this.collaborator_added_at, userPostRelation.collaborator_added_at) || !g76.L(this.notes_added_at, userPostRelation.notes_added_at) || !g76.L(this.subscribed_at, userPostRelation.subscribed_at) || !g76.L(this.viewed_at, userPostRelation.viewed_at) || !g76.L(this.last_read_section_name, userPostRelation.last_read_section_name) || !g76.L(this.last_read_version_id, userPostRelation.last_read_version_id) || !g76.L(this.last_read_at, userPostRelation.last_read_at) || !g76.L(this.last_read_paragraph_name, userPostRelation.last_read_paragraph_name)) {
            return false;
        }
        Double d = this.last_read_percentage;
        Double d2 = userPostRelation.last_read_percentage;
        if (d == null) {
            if (d2 != null) {
                return false;
            }
        } else if (d2 == null || d.doubleValue() != d2.doubleValue()) {
            return false;
        }
        return g76.L(this.presented_count_in_stream, userPostRelation.presented_count_in_stream) && g76.L(this.presented_count_in_response_management, userPostRelation.presented_count_in_response_management) && g76.L(this.clap_count, userPostRelation.clap_count) && g76.L(this.series_update_notifs_opted_in_at, userPostRelation.series_update_notifs_opted_in_at) && g76.L(this.series_first_viewed_at, userPostRelation.series_first_viewed_at) && g76.L(this.series_last_viewed_at, userPostRelation.series_last_viewed_at) && g76.K(this.audio_progress_sec, userPostRelation.audio_progress_sec);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        int i13;
        int i14 = this.hashCode;
        if (i14 != 0) {
            return i14;
        }
        int iO = wgd.o(wgd.o(unknownFields().hashCode() * 37, 37, this.user_id), 37, this.post_id);
        Long l = this.read_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i15 = (iO + i) * 37;
        Long l2 = this.read_later_added_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i16 = (i15 + i2) * 37;
        Long l3 = this.queued_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i17 = (i16 + i3) * 37;
        Long l4 = this.voted_at;
        if (l4 != null) {
            long jLongValue4 = l4.longValue();
            i4 = (int) (jLongValue4 ^ (jLongValue4 >>> 32));
        } else {
            i4 = 0;
        }
        int i18 = (i17 + i4) * 37;
        Long l5 = this.collaborator_added_at;
        if (l5 != null) {
            long jLongValue5 = l5.longValue();
            i5 = (int) (jLongValue5 ^ (jLongValue5 >>> 32));
        } else {
            i5 = 0;
        }
        int i19 = (i18 + i5) * 37;
        Long l6 = this.notes_added_at;
        if (l6 != null) {
            long jLongValue6 = l6.longValue();
            i6 = (int) (jLongValue6 ^ (jLongValue6 >>> 32));
        } else {
            i6 = 0;
        }
        int i20 = (i19 + i6) * 37;
        Long l7 = this.subscribed_at;
        if (l7 != null) {
            long jLongValue7 = l7.longValue();
            i7 = (int) (jLongValue7 ^ (jLongValue7 >>> 32));
        } else {
            i7 = 0;
        }
        int i21 = (i20 + i7) * 37;
        Long l8 = this.viewed_at;
        if (l8 != null) {
            long jLongValue8 = l8.longValue();
            i8 = (int) (jLongValue8 ^ (jLongValue8 >>> 32));
        } else {
            i8 = 0;
        }
        int i22 = (i21 + i8) * 37;
        String str = this.last_read_section_name;
        int iHashCode = (i22 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.last_read_version_id;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 37;
        Long l9 = this.last_read_at;
        if (l9 != null) {
            long jLongValue9 = l9.longValue();
            i9 = (int) (jLongValue9 ^ (jLongValue9 >>> 32));
        } else {
            i9 = 0;
        }
        int i23 = (iHashCode2 + i9) * 37;
        String str3 = this.last_read_paragraph_name;
        int iHashCode3 = (i23 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Double d = this.last_read_percentage;
        if (d != null) {
            long jDoubleToLongBits = Double.doubleToLongBits(d.doubleValue());
            i10 = (int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32));
        } else {
            i10 = 0;
        }
        int i24 = (iHashCode3 + i10) * 37;
        Integer num = this.presented_count_in_stream;
        int iIntValue = (i24 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.presented_count_in_response_management;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        Integer num3 = this.clap_count;
        int iIntValue3 = (iIntValue2 + (num3 != null ? num3.intValue() : 0)) * 37;
        Long l10 = this.series_update_notifs_opted_in_at;
        if (l10 != null) {
            long jLongValue10 = l10.longValue();
            i11 = (int) (jLongValue10 ^ (jLongValue10 >>> 32));
        } else {
            i11 = 0;
        }
        int i25 = (iIntValue3 + i11) * 37;
        Long l11 = this.series_first_viewed_at;
        if (l11 != null) {
            long jLongValue11 = l11.longValue();
            i12 = (int) (jLongValue11 ^ (jLongValue11 >>> 32));
        } else {
            i12 = 0;
        }
        int i26 = (i25 + i12) * 37;
        Long l12 = this.series_last_viewed_at;
        if (l12 != null) {
            long jLongValue12 = l12.longValue();
            i13 = (int) ((jLongValue12 >>> 32) ^ jLongValue12);
        } else {
            i13 = 0;
        }
        int i27 = (i26 + i13) * 37;
        Float f = this.audio_progress_sec;
        int iFloatToIntBits = i27 + (f != null ? Float.floatToIntBits(f.floatValue()) : 0);
        this.hashCode = iFloatToIntBits;
        return iFloatToIntBits;
    }

    @Override // com.squareup.wire.Message
    public final eee newBuilder() {
        eee eeeVar = new eee();
        eeeVar.a = this.user_id;
        eeeVar.b = this.post_id;
        eeeVar.c = this.read_at;
        eeeVar.d = this.read_later_added_at;
        eeeVar.e = this.queued_at;
        eeeVar.f = this.voted_at;
        eeeVar.g = this.collaborator_added_at;
        eeeVar.h = this.notes_added_at;
        eeeVar.i = this.subscribed_at;
        eeeVar.j = this.viewed_at;
        eeeVar.k = this.last_read_section_name;
        eeeVar.l = this.last_read_version_id;
        eeeVar.m = this.last_read_at;
        eeeVar.n = this.last_read_paragraph_name;
        eeeVar.o = this.last_read_percentage;
        eeeVar.p = this.presented_count_in_stream;
        eeeVar.q = this.presented_count_in_response_management;
        eeeVar.r = this.clap_count;
        eeeVar.s = this.series_update_notifs_opted_in_at;
        eeeVar.t = this.series_first_viewed_at;
        eeeVar.u = this.series_last_viewed_at;
        eeeVar.v = this.audio_progress_sec;
        eeeVar.addUnknownFields(unknownFields());
        return eeeVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        lv8.D(this.user_id, "user_id=", arrayList);
        lv8.D(this.post_id, "post_id=", arrayList);
        Long l = this.read_at;
        if (l != null) {
            y30.A("read_at=", l, arrayList);
        }
        Long l2 = this.read_later_added_at;
        if (l2 != null) {
            y30.A("read_later_added_at=", l2, arrayList);
        }
        Long l3 = this.queued_at;
        if (l3 != null) {
            y30.A("queued_at=", l3, arrayList);
        }
        Long l4 = this.voted_at;
        if (l4 != null) {
            y30.A("voted_at=", l4, arrayList);
        }
        Long l5 = this.collaborator_added_at;
        if (l5 != null) {
            y30.A("collaborator_added_at=", l5, arrayList);
        }
        Long l6 = this.notes_added_at;
        if (l6 != null) {
            y30.A("notes_added_at=", l6, arrayList);
        }
        Long l7 = this.subscribed_at;
        if (l7 != null) {
            y30.A("subscribed_at=", l7, arrayList);
        }
        Long l8 = this.viewed_at;
        if (l8 != null) {
            y30.A("viewed_at=", l8, arrayList);
        }
        String str = this.last_read_section_name;
        if (str != null) {
            lv8.D(str, "last_read_section_name=", arrayList);
        }
        String str2 = this.last_read_version_id;
        if (str2 != null) {
            lv8.D(str2, "last_read_version_id=", arrayList);
        }
        Long l9 = this.last_read_at;
        if (l9 != null) {
            y30.A("last_read_at=", l9, arrayList);
        }
        String str3 = this.last_read_paragraph_name;
        if (str3 != null) {
            lv8.D(str3, "last_read_paragraph_name=", arrayList);
        }
        Double d = this.last_read_percentage;
        if (d != null) {
            arrayList.add("last_read_percentage=" + d);
        }
        Integer num = this.presented_count_in_stream;
        if (num != null) {
            lv8.B("presented_count_in_stream=", num, arrayList);
        }
        Integer num2 = this.presented_count_in_response_management;
        if (num2 != null) {
            lv8.B("presented_count_in_response_management=", num2, arrayList);
        }
        Integer num3 = this.clap_count;
        if (num3 != null) {
            lv8.B("clap_count=", num3, arrayList);
        }
        Long l10 = this.series_update_notifs_opted_in_at;
        if (l10 != null) {
            y30.A("series_update_notifs_opted_in_at=", l10, arrayList);
        }
        Long l11 = this.series_first_viewed_at;
        if (l11 != null) {
            y30.A("series_first_viewed_at=", l11, arrayList);
        }
        Long l12 = this.series_last_viewed_at;
        if (l12 != null) {
            y30.A("series_last_viewed_at=", l12, arrayList);
        }
        Float f = this.audio_progress_sec;
        if (f != null) {
            arrayList.add("audio_progress_sec=" + f);
        }
        return bu1.F0(arrayList, ", ", "UserPostRelation{", "}", null, 56);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserPostRelation(String str, String str2, Long l, Long l2, Long l3, Long l4, Long l5, Long l6, Long l7, Long l8, String str3, String str4, Long l9, String str5, Double d, Integer num, Integer num2, Integer num3, Long l10, Long l11, Long l12, Float f, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        str2.getClass();
        h21Var.getClass();
        this.user_id = str;
        this.post_id = str2;
        this.read_at = l;
        this.read_later_added_at = l2;
        this.queued_at = l3;
        this.voted_at = l4;
        this.collaborator_added_at = l5;
        this.notes_added_at = l6;
        this.subscribed_at = l7;
        this.viewed_at = l8;
        this.last_read_section_name = str3;
        this.last_read_version_id = str4;
        this.last_read_at = l9;
        this.last_read_paragraph_name = str5;
        this.last_read_percentage = d;
        this.presented_count_in_stream = num;
        this.presented_count_in_response_management = num2;
        this.clap_count = num3;
        this.series_update_notifs_opted_in_at = l10;
        this.series_first_viewed_at = l11;
        this.series_last_viewed_at = l12;
        this.audio_progress_sec = f;
    }
}
