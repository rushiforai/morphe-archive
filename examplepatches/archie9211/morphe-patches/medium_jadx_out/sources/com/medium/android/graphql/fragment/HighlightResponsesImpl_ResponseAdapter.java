package com.medium.android.graphql.fragment;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import androidx.work.impl.yX.VrhD;
import com.medium.android.graphql.fragment.HighlightGroupDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.HighlightResponseThreadDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.HighlightResponses;
import defpackage.ae6;
import defpackage.c8;
import defpackage.cd6;
import defpackage.d46;
import defpackage.fa4;
import defpackage.fd6;
import defpackage.k8;
import defpackage.kng;
import defpackage.sv0;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;
import scalapb.options.hI.AEVqIoD;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001:\u0005\u0004\u0005\u0006\u0007\bB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\t"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponsesImpl_ResponseAdapter;", "", "<init>", "()V", "HighlightResponses", "PostResponses", "Creator", "HighlightGroup", "Responses", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class HighlightResponsesImpl_ResponseAdapter {
    public static final HighlightResponsesImpl_ResponseAdapter INSTANCE = new HighlightResponsesImpl_ResponseAdapter();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponsesImpl_ResponseAdapter$Creator;", "Lc8;", "Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/HighlightResponses$Creator;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Creator implements c8 {
        public static final Creator INSTANCE = new Creator();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "id", "name");

        private Creator() {
        }

        @Override // defpackage.c8
        public final HighlightResponses.Creator fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            String strQ2 = null;
            String str = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else if (iN0 == 1) {
                    fa4 fa4Var2 = k8.a;
                    strQ2 = reader.q();
                    strQ2.getClass();
                } else {
                    if (iN0 != 2) {
                        break;
                    }
                    str = (String) k8.g.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ == null) {
                kng.L(reader, "__typename");
                throw null;
            }
            if (strQ2 != null) {
                return new HighlightResponses.Creator(strQ, strQ2, str);
            }
            kng.L(reader, "id");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, HighlightResponses.Creator value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
            writer.t0("name");
            k8.g.toJson(writer, customScalarAdapters, value.getName());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponsesImpl_ResponseAdapter$HighlightGroup;", "Lc8;", "Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/HighlightResponses$HighlightGroup;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class HighlightGroup implements c8 {
        public static final HighlightGroup INSTANCE = new HighlightGroup();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "responses");

        private HighlightGroup() {
        }

        @Override // defpackage.c8
        public final HighlightResponses.HighlightGroup fromJson(fd6 reader, yl2 customScalarAdapters) {
            Object objFromJson;
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            HighlightResponses.Responses responses = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    sv0 sv0VarC = k8.c(Responses.INSTANCE, true);
                    if (reader.peek() == cd6.NULL) {
                        reader.v();
                        objFromJson = null;
                    } else {
                        objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                    }
                    responses = (HighlightResponses.Responses) objFromJson;
                }
            }
            reader.j();
            HighlightGroupData highlightGroupDataFromJson = HighlightGroupDataImpl_ResponseAdapter.HighlightGroupData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new HighlightResponses.HighlightGroup(strQ, responses, highlightGroupDataFromJson);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, HighlightResponses.HighlightGroup value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("responses");
            sv0 sv0VarC = k8.c(Responses.INSTANCE, true);
            HighlightResponses.Responses responses = value.getResponses();
            if (responses == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, responses);
            }
            HighlightGroupDataImpl_ResponseAdapter.HighlightGroupData.INSTANCE.toJson(writer, customScalarAdapters, value.getHighlightGroupData());
        }
    }

    private HighlightResponsesImpl_ResponseAdapter() {
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponsesImpl_ResponseAdapter$HighlightResponses;", "Lc8;", "Lcom/medium/android/graphql/fragment/HighlightResponses;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/HighlightResponses;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/HighlightResponses;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class HighlightResponses implements c8 {
        public static final HighlightResponses INSTANCE = new HighlightResponses();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "latestPublishedVersion", dpBiLjNeNsiASg.gSyNzfsqtBI, "allowResponses", "postResponses", "creator", "highlightGroup", "id");

        private HighlightResponses() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, com.medium.android.graphql.fragment.HighlightResponses value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            fa4 fa4Var = k8.a;
            fa4Var.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("latestPublishedVersion");
            fa4Var.toJson(writer, customScalarAdapters, value.getLatestPublishedVersion());
            writer.t0("responsesLocked");
            k8.e.toJson(writer, customScalarAdapters, Boolean.valueOf(value.getResponsesLocked()));
            writer.t0("allowResponses");
            k8.j.toJson(writer, customScalarAdapters, value.getAllowResponses());
            writer.t0("postResponses");
            sv0 sv0VarC = k8.c(PostResponses.INSTANCE, false);
            HighlightResponses.PostResponses postResponses = value.getPostResponses();
            if (postResponses == null) {
                writer.s0();
            } else {
                sv0VarC.toJson(writer, customScalarAdapters, postResponses);
            }
            writer.t0("creator");
            sv0 sv0VarC2 = k8.c(Creator.INSTANCE, false);
            HighlightResponses.Creator creator = value.getCreator();
            if (creator == null) {
                writer.s0();
            } else {
                sv0VarC2.toJson(writer, customScalarAdapters, creator);
            }
            writer.t0("highlightGroup");
            sv0 sv0VarC3 = k8.c(HighlightGroup.INSTANCE, true);
            HighlightResponses.HighlightGroup highlightGroup = value.getHighlightGroup();
            if (highlightGroup == null) {
                writer.s0();
            } else {
                sv0VarC3.toJson(writer, customScalarAdapters, highlightGroup);
            }
            writer.t0("id");
            fa4Var.toJson(writer, customScalarAdapters, value.getId());
        }

        @Override // defpackage.c8
        public final com.medium.android.graphql.fragment.HighlightResponses fromJson(fd6 reader, yl2 customScalarAdapters) {
            Boolean bool;
            Object objFromJson;
            Object objFromJson2;
            Object objFromJson3;
            reader.getClass();
            customScalarAdapters.getClass();
            Boolean boolValueOf = null;
            String strQ = null;
            String strQ2 = null;
            Boolean bool2 = null;
            HighlightResponses.PostResponses postResponses = null;
            HighlightResponses.Creator creator = null;
            HighlightResponses.HighlightGroup highlightGroup = null;
            String strQ3 = null;
            while (true) {
                switch (reader.n0(RESPONSE_NAMES)) {
                    case 0:
                        bool = boolValueOf;
                        fa4 fa4Var = k8.a;
                        strQ = reader.q();
                        strQ.getClass();
                        break;
                    case 1:
                        bool = boolValueOf;
                        fa4 fa4Var2 = k8.a;
                        strQ2 = reader.q();
                        strQ2.getClass();
                        break;
                    case 2:
                        fa4 fa4Var3 = k8.a;
                        boolValueOf = Boolean.valueOf(reader.nextBoolean());
                        continue;
                    case 3:
                        bool = boolValueOf;
                        bool2 = (Boolean) k8.j.fromJson(reader, customScalarAdapters);
                        break;
                    case 4:
                        bool = boolValueOf;
                        sv0 sv0VarC = k8.c(PostResponses.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson = null;
                        } else {
                            objFromJson = sv0VarC.fromJson(reader, customScalarAdapters);
                        }
                        postResponses = (HighlightResponses.PostResponses) objFromJson;
                        break;
                    case 5:
                        bool = boolValueOf;
                        sv0 sv0VarC2 = k8.c(Creator.INSTANCE, false);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson2 = null;
                        } else {
                            objFromJson2 = sv0VarC2.fromJson(reader, customScalarAdapters);
                        }
                        creator = (HighlightResponses.Creator) objFromJson2;
                        break;
                    case 6:
                        bool = boolValueOf;
                        sv0 sv0VarC3 = k8.c(HighlightGroup.INSTANCE, true);
                        if (reader.peek() == cd6.NULL) {
                            reader.v();
                            objFromJson3 = null;
                        } else {
                            objFromJson3 = sv0VarC3.fromJson(reader, customScalarAdapters);
                        }
                        highlightGroup = (HighlightResponses.HighlightGroup) objFromJson3;
                        break;
                    case 7:
                        bool = boolValueOf;
                        fa4 fa4Var4 = k8.a;
                        strQ3 = reader.q();
                        strQ3.getClass();
                        break;
                    default:
                        Boolean bool3 = boolValueOf;
                        if (strQ != null) {
                            if (strQ2 != null) {
                                if (bool3 != null) {
                                    boolean zBooleanValue = bool3.booleanValue();
                                    if (strQ3 != null) {
                                        return new com.medium.android.graphql.fragment.HighlightResponses(strQ, strQ2, zBooleanValue, bool2, postResponses, creator, highlightGroup, strQ3);
                                    }
                                    kng.L(reader, AEVqIoD.pLK);
                                    throw null;
                                }
                                kng.L(reader, "responsesLocked");
                                throw null;
                            }
                            kng.L(reader, "latestPublishedVersion");
                            throw null;
                        }
                        kng.L(reader, "__typename");
                        throw null;
                }
                boolValueOf = bool;
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponsesImpl_ResponseAdapter$PostResponses;", "Lc8;", "Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/HighlightResponses$PostResponses;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class PostResponses implements c8 {
        public static final PostResponses INSTANCE = new PostResponses();
        private static final List<String> RESPONSE_NAMES = d46.R("__typename", "count");

        private PostResponses() {
        }

        @Override // defpackage.c8
        public final HighlightResponses.PostResponses fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            Integer num = null;
            while (true) {
                int iN0 = reader.n0(RESPONSE_NAMES);
                if (iN0 == 0) {
                    fa4 fa4Var = k8.a;
                    strQ = reader.q();
                    strQ.getClass();
                } else {
                    if (iN0 != 1) {
                        break;
                    }
                    num = (Integer) k8.i.fromJson(reader, customScalarAdapters);
                }
            }
            if (strQ != null) {
                return new HighlightResponses.PostResponses(strQ, num);
            }
            kng.L(reader, "__typename");
            throw null;
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, HighlightResponses.PostResponses value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0(QFTsJPDEnO.VTeIZUFHYZLbSIk);
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            writer.t0("count");
            k8.i.toJson(writer, customScalarAdapters, value.getCount());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\t\u0010\nJ'\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u001d\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/HighlightResponsesImpl_ResponseAdapter$Responses;", "Lc8;", "Lcom/medium/android/graphql/fragment/HighlightResponses$Responses;", "<init>", "()V", "Lfd6;", "reader", "Lyl2;", "customScalarAdapters", "fromJson", "(Lfd6;Lyl2;)Lcom/medium/android/graphql/fragment/HighlightResponses$Responses;", "Lae6;", "writer", "value", "Lc1e;", "toJson", "(Lae6;Lyl2;Lcom/medium/android/graphql/fragment/HighlightResponses$Responses;)V", "", "", "RESPONSE_NAMES", "Ljava/util/List;", "getRESPONSE_NAMES", "()Ljava/util/List;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Responses implements c8 {
        public static final Responses INSTANCE = new Responses();
        private static final List<String> RESPONSE_NAMES = d46.Q("__typename");

        private Responses() {
        }

        public final List<String> getRESPONSE_NAMES() {
            return RESPONSE_NAMES;
        }

        @Override // defpackage.c8
        public final void toJson(ae6 writer, yl2 customScalarAdapters, HighlightResponses.Responses value) {
            writer.getClass();
            customScalarAdapters.getClass();
            value.getClass();
            writer.t0("__typename");
            k8.a.toJson(writer, customScalarAdapters, value.get__typename());
            HighlightResponseThreadDataImpl_ResponseAdapter.HighlightResponseThreadData.INSTANCE.toJson(writer, customScalarAdapters, value.getHighlightResponseThreadData());
        }

        @Override // defpackage.c8
        public final HighlightResponses.Responses fromJson(fd6 reader, yl2 customScalarAdapters) {
            reader.getClass();
            customScalarAdapters.getClass();
            String strQ = null;
            while (reader.n0(RESPONSE_NAMES) == 0) {
                fa4 fa4Var = k8.a;
                strQ = reader.q();
                strQ.getClass();
            }
            reader.j();
            HighlightResponseThreadData highlightResponseThreadDataFromJson = HighlightResponseThreadDataImpl_ResponseAdapter.HighlightResponseThreadData.INSTANCE.fromJson(reader, customScalarAdapters);
            if (strQ != null) {
                return new HighlightResponses.Responses(strQ, highlightResponseThreadDataFromJson);
            }
            kng.L(reader, VrhD.EezOSSxjSXMPw);
            throw null;
        }
    }
}
