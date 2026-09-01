package sprig.b;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.MutableContextWrapper;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Rect;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkRequest;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.RelativeLayout;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.google.android.gms.analytics.wYI.ivbZv;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import com.squareup.wire.sjIw.ezwlgQm;
import com.userleap.EventListener;
import com.userleap.EventName;
import com.userleap.EventPayload;
import com.userleap.SprigEvent;
import com.userleap.SprigLoggingLevel;
import com.userleap.SprigSurveyResult;
import com.userleap.SprigUserInterfaceMode;
import com.userleap.SurveyState;
import com.userleap.UserLeapInterface;
import com.userleap.internal.data.ReplayRequest;
import com.userleap.internal.data.SdkConfig;
import defpackage.ajb;
import defpackage.b09;
import defpackage.b2a;
import defpackage.bjb;
import defpackage.c1e;
import defpackage.co6;
import defpackage.d46;
import defpackage.e37;
import defpackage.ev6;
import defpackage.fhf;
import defpackage.fy3;
import defpackage.g76;
import defpackage.igf;
import defpackage.iy6;
import defpackage.jhf;
import defpackage.ka1;
import defpackage.km4;
import defpackage.ky6;
import defpackage.kyd;
import defpackage.lv8;
import defpackage.m15;
import defpackage.m45;
import defpackage.mt;
import defpackage.n1b;
import defpackage.nya;
import defpackage.q13;
import defpackage.s1b;
import defpackage.ss;
import defpackage.tuc;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.vx6;
import defpackage.wm;
import defpackage.x45;
import defpackage.x55;
import defpackage.y30;
import defpackage.ygf;
import defpackage.z73;
import java.lang.ref.WeakReference;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import pushnotifications.SY.eoLmc;
import sprig.b.VPIE.gYpYQDQkhfs;
import sprig.b.g;
import sprig.b.h;
import sprig.graphics.EnumC0050b;
import sprig.view.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000²\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0003\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b-\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u001b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010%\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b#\bÇ\u0002\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004B\t\b\u0002¢\u0006\u0004\b\u0005\u0010\u0006J?\u0010\u0011\u001a\u00020\u00102\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t2\u0014\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0002¢\u0006\u0004\b\u0011\u0010\u0012J?\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\t2\u0014\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0002¢\u0006\u0004\b\u0015\u0010\u0012J/\u0010\u001a\u001a\u00020\u00102\u0006\u0010\u0016\u001a\u00020\t2\u0016\b\u0002\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u0018\u0018\u00010\u0017H\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0002¢\u0006\u0004\b\u0011\u0010\u0006J'\u0010\u001a\u001a\u00020 2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u001eH\u0002¢\u0006\u0004\b\u001a\u0010!J\u0017\u0010\u001a\u001a\u00020 2\u0006\u0010\u001f\u001a\u00020\u001eH\u0002¢\u0006\u0004\b\u001a\u0010\"J\u0017\u0010\u001a\u001a\u00020 2\u0006\u0010#\u001a\u00020\tH\u0002¢\u0006\u0004\b\u001a\u0010$J\u001d\u0010\u001a\u001a\u00020\u00102\f\u0010&\u001a\b\u0012\u0004\u0012\u00020\u00100%H\u0002¢\u0006\u0004\b\u001a\u0010'J\u0017\u0010\u001a\u001a\u00020\u00102\u0006\u0010)\u001a\u00020(H\u0002¢\u0006\u0004\b\u001a\u0010*J\u0015\u0010\u0011\u001a\u00020\t*\u0004\u0018\u00010\tH\u0002¢\u0006\u0004\b\u0011\u0010+J#\u0010\u001a\u001a\u00020\u00102\u0012\u0010,\u001a\u000e\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020\u00100\u0017H\u0002¢\u0006\u0004\b\u001a\u0010-J\u0017\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0007H\u0002¢\u0006\u0004\b\u0011\u0010.J\u000f\u0010/\u001a\u00020\u0010H\u0002¢\u0006\u0004\b/\u0010\u0006J\u000f\u00100\u001a\u00020\u0010H\u0002¢\u0006\u0004\b0\u0010\u0006J\u000f\u0010\u0015\u001a\u00020 H\u0002¢\u0006\u0004\b\u0015\u00101J\u0017\u0010\u001a\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0007H\u0002¢\u0006\u0004\b\u001a\u0010.J\u0017\u0010\u001a\u001a\u00020\u00102\u0006\u00103\u001a\u000202H\u0002¢\u0006\u0004\b\u001a\u00104J\u000f\u00105\u001a\u00020\u0010H\u0002¢\u0006\u0004\b5\u0010\u0006J\u001f\u00106\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0016¢\u0006\u0004\b6\u00107J?\u00106\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t2\u0014\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b2\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0016¢\u0006\u0004\b6\u0010\u0012J\u0017\u0010:\u001a\u00020\u00102\u0006\u00109\u001a\u000208H\u0016¢\u0006\u0004\b:\u0010;J\u0019\u0010=\u001a\u00020\u00102\b\u0010<\u001a\u0004\u0018\u00010\u001cH\u0016¢\u0006\u0004\b=\u0010>J\u0017\u0010A\u001a\u00020\u00102\u0006\u0010@\u001a\u00020?H\u0016¢\u0006\u0004\bA\u0010BJ!\u0010D\u001a\u00020\u00102\u0006\u0010@\u001a\u00020?2\b\u0010C\u001a\u0004\u0018\u00010\u001eH\u0016¢\u0006\u0004\bD\u0010EJ\u0019\u0010F\u001a\u00020\u00102\b\u0010C\u001a\u0004\u0018\u00010\u001eH\u0016¢\u0006\u0004\bF\u0010GJ\u0017\u0010H\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\tH\u0016¢\u0006\u0004\bH\u0010IJ-\u0010H\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\t2\u0014\u0010K\u001a\u0010\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0017H\u0016¢\u0006\u0004\bH\u0010\u001bJ\u000f\u0010L\u001a\u00020\u0010H\u0016¢\u0006\u0004\bL\u0010\u0006J\u000f\u0010N\u001a\u00020\u0010H\u0000¢\u0006\u0004\bM\u0010\u0006J\u000f\u0010O\u001a\u00020\u0010H\u0016¢\u0006\u0004\bO\u0010\u0006J\u000f\u0010P\u001a\u00020\u0010H\u0016¢\u0006\u0004\bP\u0010\u0006J\u0017\u0010S\u001a\u00020\u00102\u0006\u0010R\u001a\u00020QH\u0016¢\u0006\u0004\bS\u0010TJ\u000f\u0010U\u001a\u00020\u0010H\u0016¢\u0006\u0004\bU\u0010\u0006J\u0017\u0010W\u001a\u00020\u00102\u0006\u0010V\u001a\u00020\tH\u0016¢\u0006\u0004\bW\u0010IJ\u0017\u0010Y\u001a\u00020\u00102\u0006\u0010X\u001a\u00020\tH\u0016¢\u0006\u0004\bY\u0010IJ\u0017\u0010[\u001a\u00020\u00102\u0006\u0010Z\u001a\u00020\tH\u0016¢\u0006\u0004\b[\u0010IJ\u001f\u0010^\u001a\u00020\u00102\u0006\u0010\\\u001a\u00020\t2\u0006\u0010]\u001a\u00020\tH\u0016¢\u0006\u0004\b^\u0010_J\u001f\u0010^\u001a\u00020\u00102\u0006\u0010\\\u001a\u00020\t2\u0006\u0010]\u001a\u00020 H\u0016¢\u0006\u0004\b^\u0010`J\u001f\u0010^\u001a\u00020\u00102\u0006\u0010\\\u001a\u00020\t2\u0006\u0010]\u001a\u00020\u001cH\u0016¢\u0006\u0004\b^\u0010aJ#\u0010c\u001a\u00020\u00102\u0012\u0010b\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u000bH\u0016¢\u0006\u0004\bc\u0010dJ7\u0010c\u001a\u00020\u00102\u0012\u0010b\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u000b2\b\u0010e\u001a\u0004\u0018\u00010\t2\b\u0010f\u001a\u0004\u0018\u00010\tH\u0016¢\u0006\u0004\bc\u0010gJ\u001d\u0010i\u001a\u00020\u00102\f\u0010b\u001a\b\u0012\u0004\u0012\u00020\t0hH\u0016¢\u0006\u0004\bi\u0010jJ\u0017\u0010k\u001a\u00020\u00102\u0006\u0010V\u001a\u00020\tH\u0016¢\u0006\u0004\bk\u0010IJ\u000f\u0010l\u001a\u00020\u0010H\u0016¢\u0006\u0004\bl\u0010\u0006J\u001f\u0010p\u001a\u00020\u00102\u0006\u0010n\u001a\u00020m2\u0006\u0010,\u001a\u00020oH\u0016¢\u0006\u0004\bp\u0010qJ\u001f\u0010r\u001a\u00020\u00102\u0006\u0010n\u001a\u00020m2\u0006\u0010,\u001a\u00020oH\u0016¢\u0006\u0004\br\u0010qJ\u0017\u0010t\u001a\u00020\u00102\u0006\u0010s\u001a\u00020\tH\u0016¢\u0006\u0004\bt\u0010IJ7\u0010v\u001a\u00020\u00102\u0006\u0010u\u001a\u00020\f2\b\u0010e\u001a\u0004\u0018\u00010\t2\u0014\u0010b\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t\u0018\u00010\u000bH\u0016¢\u0006\u0004\bv\u0010wJ\u0017\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\tH\u0017¢\u0006\u0004\bA\u0010IJ-\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0017H\u0017¢\u0006\u0004\bA\u0010\u001bJ7\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0017H\u0017¢\u0006\u0004\bA\u0010yJ+\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\b\u0010f\u001a\u0004\u0018\u00010\tH\u0017¢\u0006\u0004\bA\u0010zJA\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\b\u0010f\u001a\u0004\u0018\u00010\t2\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0017H\u0017¢\u0006\u0004\bA\u0010{J+\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\u0012\u0010|\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f0\u000bH\u0017¢\u0006\u0004\bA\u0010}JA\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\u0012\u0010|\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f0\u000b2\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0017H\u0017¢\u0006\u0004\bA\u0010~JM\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\u0014\u0010|\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b2\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0017H\u0017¢\u0006\u0004\bA\u0010\u007fJB\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\b\u0010f\u001a\u0004\u0018\u00010\t2\u0014\u0010|\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bH\u0017¢\u0006\u0005\bA\u0010\u0080\u0001JX\u0010A\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\b\u0010f\u001a\u0004\u0018\u00010\t2\u0014\u0010|\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b2\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0017H\u0017¢\u0006\u0005\bA\u0010\u0081\u0001J \u0010D\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\u0006\u0010C\u001a\u00020\u000eH\u0017¢\u0006\u0005\bD\u0010\u0082\u0001J*\u0010D\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\u0006\u0010C\u001a\u00020\u000eH\u0017¢\u0006\u0005\bD\u0010\u0083\u0001J4\u0010D\u001a\u00020\u00102\u0006\u0010x\u001a\u00020\t2\b\u0010e\u001a\u0004\u0018\u00010\t2\b\u0010f\u001a\u0004\u0018\u00010\t2\u0006\u0010C\u001a\u00020\u000eH\u0017¢\u0006\u0005\bD\u0010\u0084\u0001J\u001a\u0010\u0086\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0086\u0001\u0010IJ\u001a\u0010\u0087\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0087\u0001\u0010IJ\u001a\u0010\u0088\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0088\u0001\u0010IJ\u001a\u0010\u0089\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0089\u0001\u0010IJ\u001a\u0010\u008a\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u008a\u0001\u0010IJ\u001a\u0010\u008b\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u008b\u0001\u0010IJ\u001a\u0010\u008c\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u008c\u0001\u0010IJ-\u0010\u008f\u0001\u001a\u00020\u00102\u0007\u0010\u008d\u0001\u001a\u00020\t2\u0007\u0010\u008e\u0001\u001a\u00020J2\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0006\b\u008f\u0001\u0010\u0090\u0001J#\u0010\u0092\u0001\u001a\u00020\u00102\u0007\u0010\u0091\u0001\u001a\u00020\t2\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0092\u0001\u0010_J\u001a\u0010\u0093\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0093\u0001\u0010IJ\u001a\u0010\u0094\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0094\u0001\u0010IJ\u001a\u0010\u0095\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0095\u0001\u0010IJ\u0011\u0010\u0096\u0001\u001a\u00020\u0010H\u0016¢\u0006\u0005\b\u0096\u0001\u0010\u0006J\"\u0010\u0098\u0001\u001a\u00020\u00102\u0007\u0010\u0097\u0001\u001a\u00020\t2\u0006\u0010x\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0098\u0001\u0010_J\u001a\u0010\u0099\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\tH\u0016¢\u0006\u0005\b\u0099\u0001\u0010IJ\u0019\u0010\u009a\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0005\b\u009a\u0001\u0010GJ\u0019\u0010\u009b\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0005\b\u009b\u0001\u0010GJ\u0019\u0010\u009c\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0005\b\u009c\u0001\u0010GJ$\u0010\u009f\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001e2\b\u0010\u009e\u0001\u001a\u00030\u009d\u0001H\u0016¢\u0006\u0006\b\u009f\u0001\u0010 \u0001J\u0019\u0010¡\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0005\b¡\u0001\u0010GJ&\u0010£\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001e2\n\u0010¢\u0001\u001a\u0005\u0018\u00010\u009d\u0001H\u0016¢\u0006\u0006\b£\u0001\u0010 \u0001J\u0019\u0010¤\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0005\b¤\u0001\u0010GJ\u001c\u0010§\u0001\u001a\u00020\u00102\b\u0010¦\u0001\u001a\u00030¥\u0001H\u0016¢\u0006\u0006\b§\u0001\u0010¨\u0001J\u001c\u0010©\u0001\u001a\u00020\u00102\b\u0010¦\u0001\u001a\u00030¥\u0001H\u0016¢\u0006\u0006\b©\u0001\u0010¨\u0001J\u0011\u0010«\u0001\u001a\u00020\u0010H\u0000¢\u0006\u0005\bª\u0001\u0010\u0006J\u0019\u0010\u00ad\u0001\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u001eH\u0000¢\u0006\u0005\b¬\u0001\u0010GJ\u0011\u0010¯\u0001\u001a\u00020\u0010H\u0000¢\u0006\u0005\b®\u0001\u0010\u0006J\u0011\u0010±\u0001\u001a\u00020\u0010H\u0000¢\u0006\u0005\b°\u0001\u0010\u0006J\u0011\u0010³\u0001\u001a\u00020\u0010H\u0000¢\u0006\u0005\b²\u0001\u0010\u0006J)\u0010·\u0001\u001a\u00020\u00102\b\u0010µ\u0001\u001a\u00030´\u00012\r\u0010¶\u0001\u001a\b\u0012\u0004\u0012\u00020\u00100%¢\u0006\u0006\b·\u0001\u0010¸\u0001J\u001a\u0010¹\u0001\u001a\u00020\u00102\b\u0010µ\u0001\u001a\u00030´\u0001¢\u0006\u0006\b¹\u0001\u0010º\u0001R)\u0010¿\u0001\u001a\u0004\u0018\u00010\u001c8\u0000@\u0000X\u0080\u000e¢\u0006\u0016\n\u0005\b\u001a\u0010»\u0001\u001a\u0006\b¼\u0001\u0010½\u0001\"\u0005\b¾\u0001\u0010>R(\u0010Å\u0001\u001a\u00020\u001c8\u0016@\u0016X\u0096\u000e¢\u0006\u0017\n\u0005\b\u0011\u0010À\u0001\u001a\u0006\bÁ\u0001\u0010Â\u0001\"\u0006\bÃ\u0001\u0010Ä\u0001R'\u0010Ê\u0001\u001a\u00020 8\u0000@\u0000X\u0080\u000e¢\u0006\u0016\n\u0005\b\u0015\u0010Æ\u0001\u001a\u0005\bÇ\u0001\u00101\"\u0006\bÈ\u0001\u0010É\u0001R)\u0010Ï\u0001\u001a\u0004\u0018\u0001088\u0000@\u0000X\u0080\u000e¢\u0006\u0016\n\u0005\b5\u0010Ë\u0001\u001a\u0006\bÌ\u0001\u0010Í\u0001\"\u0005\bÎ\u0001\u0010;R\u0018\u0010Ó\u0001\u001a\u00030Ð\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\bÑ\u0001\u0010Ò\u0001R*\u0010Õ\u0001\u001a\u00030Ô\u00018\u0000@\u0000X\u0080.¢\u0006\u0018\n\u0006\bÕ\u0001\u0010Ö\u0001\u001a\u0006\b×\u0001\u0010Ø\u0001\"\u0006\bÙ\u0001\u0010Ú\u0001R\u001a\u0010Þ\u0001\u001a\u00030Û\u00018\u0002@\u0002X\u0082.¢\u0006\b\n\u0006\bÜ\u0001\u0010Ý\u0001R\u0018\u0010à\u0001\u001a\u00020\u00078\u0002@\u0002X\u0082.¢\u0006\u0007\n\u0005\b0\u0010ß\u0001R\"\u0010ä\u0001\u001a\u000b\u0012\u0004\u0012\u00020\u001e\u0018\u00010á\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bâ\u0001\u0010ã\u0001R \u0010è\u0001\u001a\t\u0012\u0004\u0012\u00020\t0å\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bæ\u0001\u0010ç\u0001R\u0018\u0010é\u0001\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\u0007\n\u0005\b/\u0010Æ\u0001R\u0019\u0010ë\u0001\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bê\u0001\u0010Æ\u0001R\u001a\u0010ï\u0001\u001a\u00030ì\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bí\u0001\u0010î\u0001R\u0019\u0010ñ\u0001\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bð\u0001\u0010Æ\u0001R\u001a\u0010õ\u0001\u001a\u00030ò\u00018\u0002@\u0002X\u0082.¢\u0006\b\n\u0006\bó\u0001\u0010ô\u0001R\u001c\u0010ù\u0001\u001a\u0005\u0018\u00010ö\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b÷\u0001\u0010ø\u0001R\u001c\u0010ý\u0001\u001a\u0005\u0018\u00010ú\u00018\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bû\u0001\u0010ü\u0001R.\u0010\u0083\u0002\u001a\u0011\u0012\u0004\u0012\u00020\u001c\u0012\u0006\u0012\u0004\u0018\u00010\t0þ\u00018\u0000X\u0080\u0004¢\u0006\u0010\n\u0006\bÿ\u0001\u0010\u0080\u0002\u001a\u0006\b\u0081\u0002\u0010\u0082\u0002R*\u0010\u0087\u0002\u001a\u0004\u0018\u00010\u001c8\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\b\u0084\u0002\u0010»\u0001\u001a\u0006\b\u0085\u0002\u0010½\u0001\"\u0005\b\u0086\u0002\u0010>R\u0019\u0010\u0089\u0002\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0088\u0002\u0010Æ\u0001R\u001c\u0010\u008d\u0002\u001a\u0005\u0018\u00010\u008a\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u008b\u0002\u0010\u008c\u0002R\u0019\u0010\u008f\u0002\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u008e\u0002\u0010Æ\u0001R\u0019\u0010\u0091\u0002\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0090\u0002\u0010Æ\u0001R(\u0010\u0095\u0002\u001a\u00020 8\u0000@\u0000X\u0080\u000e¢\u0006\u0017\n\u0006\b\u0092\u0002\u0010Æ\u0001\u001a\u0005\b\u0093\u0002\u00101\"\u0006\b\u0094\u0002\u0010É\u0001R\u0019\u0010\u0097\u0002\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0096\u0002\u0010Æ\u0001R\u001c\u0010\u009b\u0002\u001a\u0005\u0018\u00010\u0098\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u0099\u0002\u0010\u009a\u0002R\u0019\u0010\u009d\u0002\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b\u009c\u0002\u0010Æ\u0001R*\u0010£\u0002\u001a\u0004\u0018\u00010\t8\u0006@\u0006X\u0086\u000e¢\u0006\u0017\n\u0006\b\u009e\u0002\u0010\u009f\u0002\u001a\u0006\b \u0002\u0010¡\u0002\"\u0005\b¢\u0002\u0010IR\u001b\u0010¥\u0002\u001a\u0004\u0018\u00010\t8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b¤\u0002\u0010\u009f\u0002R'\u0010\n\u001a\u00020\t8\u0006@\u0006X\u0086\u000e¢\u0006\u0017\n\u0006\b¦\u0002\u0010\u009f\u0002\u001a\u0006\b§\u0002\u0010¡\u0002\"\u0005\b¨\u0002\u0010IR&\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b©\u0002\u0010\u0080\u0002R*\u0010¯\u0002\u001a\u0004\u0018\u00010Q8\u0006@\u0006X\u0086\u000e¢\u0006\u0017\n\u0006\bª\u0002\u0010«\u0002\u001a\u0006\b¬\u0002\u0010\u00ad\u0002\"\u0005\b®\u0002\u0010TR\u0019\u0010±\u0002\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b°\u0002\u0010Æ\u0001R\u001a\u0010µ\u0002\u001a\u00030²\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b³\u0002\u0010´\u0002R \u0010º\u0002\u001a\u00030¶\u00028BX\u0082\u0084\u0002¢\u0006\u000f\n\u0006\b·\u0002\u0010¸\u0002\u001a\u0005\b\u001a\u0010¹\u0002R$\u0010»\u0002\u001a\u000f\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020?0þ\u00018\u0002X\u0082\u0004¢\u0006\b\n\u0006\bÀ\u0001\u0010\u0080\u0002R\u001a\u0010¼\u0002\u001a\u00030²\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b´\u0002\u0010´\u0002R\u001a\u0010¾\u0002\u001a\u00030²\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\b½\u0002\u0010´\u0002R\u0018\u0010À\u0002\u001a\u00030\u008a\u00028\u0002X\u0082\u0004¢\u0006\b\n\u0006\b¿\u0002\u0010\u008c\u0002R\u0019\u0010Â\u0002\u001a\u00020 8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÁ\u0002\u0010Æ\u0001R\u001a\u0010Ä\u0002\u001a\u00030²\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÃ\u0002\u0010´\u0002R\u0019\u0010Æ\u0002\u001a\u00020\u001c8\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÅ\u0002\u0010À\u0001R\u001a\u0010È\u0002\u001a\u00030²\u00028\u0002@\u0002X\u0082\u000e¢\u0006\b\n\u0006\bÇ\u0002\u0010´\u0002R\u001d\u0010Ë\u0002\u001a\b\u0012\u0004\u0012\u00020m0h8\u0002X\u0082\u0004¢\u0006\b\n\u0006\bÉ\u0002\u0010Ê\u0002R.\u0010Î\u0002\u001a\u000e\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020\u00100\u0017*\t\u0012\u0004\u0012\u00020\u001e0á\u00018@X\u0080\u0004¢\u0006\b\u001a\u0006\bÌ\u0002\u0010Í\u0002R\u0017\u0010Ð\u0002\u001a\u00020\t8VX\u0096\u0004¢\u0006\b\u001a\u0006\bÏ\u0002\u0010¡\u0002R\u0017\u0010Ò\u0002\u001a\u00020\t8@X\u0080\u0004¢\u0006\b\u001a\u0006\bÑ\u0002\u0010¡\u0002R\u0019\u0010Ô\u0002\u001a\u0004\u0018\u00010\u001c8VX\u0096\u0004¢\u0006\b\u001a\u0006\bÓ\u0002\u0010½\u0001R\u0019\u0010Ö\u0002\u001a\u0004\u0018\u00010\t8VX\u0096\u0004¢\u0006\b\u001a\u0006\bÕ\u0002\u0010¡\u0002R\u0014\u0010Ø\u0002\u001a\u00020\u001c8F¢\u0006\b\u001a\u0006\b×\u0002\u0010Â\u0001¨\u0006Ù\u0002"}, d2 = {"Lsprig/b/g;", "Lcom/userleap/UserLeapInterface;", "Landroid/app/Application$ActivityLifecycleCallbacks;", "Lsprig/b/h$d;", "Landroid/net/ConnectivityManager$NetworkCallback;", "<init>", "()V", "Landroid/content/Context;", "originalContext", "", "environmentId", "", "", "configuration", "Lm15;", "fragmentActivity", "Lc1e;", "b", "(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lm15;)V", "context", "environment", "c", "javascript", "Lkotlin/Function1;", "Ljava/lang/Void;", "callback", "a", "(Ljava/lang/String;Lx45;)V", "", "surveyId", "Landroid/app/Activity;", "activity", "", "(Ljava/lang/Integer;Landroid/app/Activity;)Z", "(Landroid/app/Activity;)Z", "description", "(Ljava/lang/String;)Z", "Lkotlin/Function0;", "function", "(Lm45;)V", "", "exception", "(Ljava/lang/Throwable;)V", "(Ljava/lang/String;)Ljava/lang/String;", "listener", "(Lx45;)V", "(Landroid/content/Context;)V", "j", "g", "()Z", "Landroid/content/res/Configuration;", "newConfig", "(Landroid/content/res/Configuration;)V", "d", "configure", "(Landroid/content/Context;Ljava/lang/String;)V", "Lcom/userleap/SprigUserInterfaceMode;", "style", "overrideUserInterfaceMode", "(Lcom/userleap/SprigUserInterfaceMode;)V", "height", "setKeyboardHeightForSurveyPlacement", "(Ljava/lang/Integer;)V", "Lcom/userleap/EventPayload;", "payload", "track", "(Lcom/userleap/EventPayload;)V", "fromActivity", "trackAndPresent", "(Lcom/userleap/EventPayload;Landroid/app/Activity;)V", "presentSurvey", "(Landroid/app/Activity;)V", "presentSurveyWithId", "(Ljava/lang/String;)V", "Lcom/userleap/SurveyState;", "givenCallback", "dismissActiveSurvey", "dismissSurveyOnExternalTap$userleap_release", "dismissSurveyOnExternalTap", "pauseDisplayingSurveys", "unpauseDisplayingSurveys", "Lsprig/d/e;", "approvalBlock", "setSessionReplayApprovalBlock", "(Lsprig/d/e;)V", "stopRecording", "identifier", "setUserIdentifier", "locale", "setLocale", "emailAddress", "setEmailAddress", "key", "value", "setVisitorAttribute", "(Ljava/lang/String;Ljava/lang/String;)V", "(Ljava/lang/String;Z)V", "(Ljava/lang/String;I)V", "attributes", "setVisitorAttributes", "(Ljava/util/Map;)V", "userId", "partnerAnonymousId", "(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V", "", "removeVisitorAttributes", "(Ljava/util/List;)V", "setPartnerAnonymousId", "logout", "Lcom/userleap/EventName;", "eventName", "Lcom/userleap/EventListener;", "addEventListener", "(Lcom/userleap/EventName;Lcom/userleap/EventListener;)V", "removeEventListener", "previewKey", "setPreviewKey", "optimizelySdk", "integrateOptimizely", "(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;)V", "event", "(Ljava/lang/String;Ljava/lang/String;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx45;)V", "properties", "(Ljava/lang/String;Ljava/util/Map;)V", "(Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lx45;)V", "(Ljava/lang/String;Lm15;)V", "(Ljava/lang/String;Ljava/lang/String;Lm15;)V", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lm15;)V", "data", "onSdkReady", "onSurveyWillPresent", "onSurveyPresented", "onSurveyHeight", "onSurveyWidth", "onSurveyWillClose", "onSurveyClosed", "callbackId", "state", "onSurveyCallback", "(Ljava/lang/String;Lcom/userleap/SurveyState;Ljava/lang/String;)V", "id", "onVisitorIdUpdated", "onDismissSurvey", "onAppearSurvey", "onTextFieldFocused", "onTextFieldBlurred", "name", "onEvent", "onScheduleOrCaptureReplay", "onActivityResumed", "onActivityPaused", "onActivityStopped", "Landroid/os/Bundle;", "outState", "onActivitySaveInstanceState", "(Landroid/app/Activity;Landroid/os/Bundle;)V", "onActivityDestroyed", "savedInstanceState", "onActivityCreated", "onActivityStarted", "Landroid/net/Network;", "network", "onAvailable", "(Landroid/net/Network;)V", "onLost", "clearSurveySheetReference$userleap_release", "clearSurveySheetReference", "attachActivityContext$userleap_release", "attachActivityContext", "applyUserInterfaceStyleToContext$userleap_release", "applyUserInterfaceStyleToContext", "detachActivityContext$userleap_release", "detachActivityContext", "recreateWebViewIfSafe$userleap_release", "recreateWebViewIfSafe", "Landroid/view/ViewGroup;", "view", "dismissView", "onViewCreated", "(Landroid/view/ViewGroup;Lm45;)V", "onViewDestroyed", "(Landroid/view/ViewGroup;)V", "Ljava/lang/Integer;", "getKeyboardHeightForSurveyPlacement$userleap_release", "()Ljava/lang/Integer;", "setKeyboardHeightForSurveyPlacement$userleap_release", "keyboardHeightForSurveyPlacement", "I", "getBottomSafeArea", "()I", "setBottomSafeArea", "(I)V", "bottomSafeArea", "Z", "getSurveysPaused$userleap_release", "setSurveysPaused$userleap_release", "(Z)V", "surveysPaused", "Lcom/userleap/SprigUserInterfaceMode;", "getUserInterfaceStyle$userleap_release", "()Lcom/userleap/SprigUserInterfaceMode;", "setUserInterfaceStyle$userleap_release", "userInterfaceStyle", "Landroid/content/ComponentCallbacks;", "e", "Landroid/content/ComponentCallbacks;", "orientationCallbacks", "Lsprig/b/h;", "webView", "Lsprig/b/h;", "getWebView$userleap_release", "()Lsprig/b/h;", "setWebView$userleap_release", "(Lsprig/b/h;)V", "Landroid/content/MutableContextWrapper;", "f", "Landroid/content/MutableContextWrapper;", "webViewContextWrapper", "Landroid/content/Context;", "appContext", "Ljava/lang/ref/WeakReference;", "h", "Ljava/lang/ref/WeakReference;", "attachedActivityRef", "Ljava/util/Queue;", "i", "Ljava/util/Queue;", "javaScriptExecutionQueue", "shouldDismissOnResume", "k", "shouldResetOnResume", "Lsprig/j/e;", "l", "Lsprig/j/e;", "logger", "m", "shouldDismissOnPageChange", "Ljhf;", "n", "Ljhf;", "networkService", "Lsprig/j/a;", "o", "Lsprig/j/a;", "configurationActivityListener", "Lsprig/i/b;", "p", "Lsprig/i/b;", "surveySheet", "", "q", "Ljava/util/Map;", "getSurveyLayouts$userleap_release", "()Ljava/util/Map;", "surveyLayouts", "r", "getActiveSurveyId$userleap_release", "setActiveSurveyId$userleap_release", "activeSurveyId", "s", "isSurveyReady", "Ljava/lang/Runnable;", "t", "Ljava/lang/Runnable;", "handleSurveyCallback", "u", "shouldRestoreSurveyAfterConfigChange", "v", "isRestoringAfterConfigChange", "w", "isHandlingConfigChange$userleap_release", "setHandlingConfigChange$userleap_release", "isHandlingConfigChange", "x", "orientationCallbacksRegistered", "Landroid/net/ConnectivityManager;", "y", "Landroid/net/ConnectivityManager;", "connectivityManager", "z", "isNetworkAvailable", "A", "Ljava/lang/String;", "getVisitorId", "()Ljava/lang/String;", "setVisitorId", "visitorId", "B", "userIdentifier", "C", "getEnvironmentId", "setEnvironmentId", "D", "E", "Lsprig/d/e;", "getReplayApprovalBlock", "()Lsprig/d/e;", "setReplayApprovalBlock", "replayApprovalBlock", "F", "hasConfigured", "", "G", "J", "lastSurveyPresentationTimeMs", "Landroid/os/Handler;", "H", "Lvq6;", "()Landroid/os/Handler;", "sdkHandler", "pendingEventPayloads", "configureStartTimeMs", "K", "webViewConfigureStartTimeMs", "L", "resetWebView", "M", "isRecreatingWebView", "N", "lastWebViewResponseTimestamp", "O", "staleWebViewCount", "P", "lastWebViewCreatedOrResetTimestamp", "Q", "Ljava/util/List;", "sdkHandledEvents", "getPresent$userleap_release", "(Ljava/lang/ref/WeakReference;)Lx45;", "present", "getSdkVersion", "sdkVersion", "getWebSdkVersion$userleap_release", "webSdkVersion", "getVisitorIdentifier", "visitorIdentifier", "getVisitorIdentifierString", "visitorIdentifierString", "getBottomSafeAreaForScreenDensity", "bottomSafeAreaForScreenDensity", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class g extends ConnectivityManager.NetworkCallback implements UserLeapInterface, Application.ActivityLifecycleCallbacks, h.d {

    /* JADX INFO: renamed from: A, reason: from kotlin metadata */
    public static String visitorId;

    /* JADX INFO: renamed from: B, reason: from kotlin metadata */
    public static String userIdentifier;

    /* JADX INFO: renamed from: C, reason: from kotlin metadata */
    public static String environmentId;

    /* JADX INFO: renamed from: D, reason: from kotlin metadata */
    public static Map configuration;

    /* JADX INFO: renamed from: E, reason: from kotlin metadata */
    public static sprig.view.e replayApprovalBlock;

    /* JADX INFO: renamed from: F, reason: from kotlin metadata */
    public static volatile boolean hasConfigured;

    /* JADX INFO: renamed from: G, reason: from kotlin metadata */
    public static long lastSurveyPresentationTimeMs;

    /* JADX INFO: renamed from: H, reason: from kotlin metadata */
    public static final vq6 sdkHandler;

    /* JADX INFO: renamed from: I, reason: from kotlin metadata */
    public static final Map pendingEventPayloads;
    public static final g INSTANCE;

    /* JADX INFO: renamed from: J, reason: from kotlin metadata */
    public static long configureStartTimeMs;

    /* JADX INFO: renamed from: K, reason: from kotlin metadata */
    public static long webViewConfigureStartTimeMs;

    /* JADX INFO: renamed from: L, reason: from kotlin metadata */
    public static final Runnable resetWebView;

    /* JADX INFO: renamed from: M, reason: from kotlin metadata */
    public static boolean isRecreatingWebView;

    /* JADX INFO: renamed from: N, reason: from kotlin metadata */
    public static long lastWebViewResponseTimestamp;

    /* JADX INFO: renamed from: O, reason: from kotlin metadata */
    public static int staleWebViewCount;

    /* JADX INFO: renamed from: P, reason: from kotlin metadata */
    public static long lastWebViewCreatedOrResetTimestamp;

    /* JADX INFO: renamed from: Q, reason: from kotlin metadata */
    public static final List sdkHandledEvents;

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public static Integer keyboardHeightForSurveyPlacement;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public static int bottomSafeArea;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public static boolean surveysPaused;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public static SprigUserInterfaceMode userInterfaceStyle;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    public static final ComponentCallbacks orientationCallbacks;

    /* JADX INFO: renamed from: f, reason: from kotlin metadata */
    public static MutableContextWrapper webViewContextWrapper;

    /* JADX INFO: renamed from: g, reason: from kotlin metadata */
    public static Context appContext;

    /* JADX INFO: renamed from: h, reason: from kotlin metadata */
    public static WeakReference attachedActivityRef;

    /* JADX INFO: renamed from: i, reason: from kotlin metadata */
    public static Queue javaScriptExecutionQueue;

    /* JADX INFO: renamed from: j, reason: from kotlin metadata */
    public static boolean shouldDismissOnResume;

    /* JADX INFO: renamed from: k, reason: from kotlin metadata */
    public static boolean shouldResetOnResume;

    /* JADX INFO: renamed from: l, reason: from kotlin metadata */
    public static sprig.j.e logger;

    /* JADX INFO: renamed from: m, reason: from kotlin metadata */
    public static boolean shouldDismissOnPageChange;

    /* JADX INFO: renamed from: n, reason: from kotlin metadata */
    public static jhf networkService;

    /* JADX INFO: renamed from: o, reason: from kotlin metadata */
    public static sprig.j.a configurationActivityListener;

    /* JADX INFO: renamed from: p, reason: from kotlin metadata */
    public static sprig.i.b surveySheet;

    /* JADX INFO: renamed from: q, reason: from kotlin metadata */
    public static final Map surveyLayouts;

    /* JADX INFO: renamed from: r, reason: from kotlin metadata */
    public static Integer activeSurveyId;

    /* JADX INFO: renamed from: s, reason: from kotlin metadata */
    public static boolean isSurveyReady;

    /* JADX INFO: renamed from: t, reason: from kotlin metadata */
    public static Runnable handleSurveyCallback;

    /* JADX INFO: renamed from: u, reason: from kotlin metadata */
    public static boolean shouldRestoreSurveyAfterConfigChange;

    /* JADX INFO: renamed from: v, reason: from kotlin metadata */
    public static boolean isRestoringAfterConfigChange;

    /* JADX INFO: renamed from: w, reason: from kotlin metadata */
    public static boolean isHandlingConfigChange;
    public static sprig.b.h webView;

    /* JADX INFO: renamed from: x, reason: from kotlin metadata */
    public static boolean orientationCallbacksRegistered;

    /* JADX INFO: renamed from: y, reason: from kotlin metadata */
    public static ConnectivityManager connectivityManager;

    /* JADX INFO: renamed from: z, reason: from kotlin metadata */
    public static boolean isNetworkAvailable;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class a {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[SprigUserInterfaceMode.values().length];
            try {
                iArr[SprigUserInterfaceMode.LIGHT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[SprigUserInterfaceMode.DARK.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[SprigUserInterfaceMode.UNSPECIFIED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class b extends co6 implements m45 {
        final /* synthetic */ Map<String, Object> $configuration;
        final /* synthetic */ Context $context;
        final /* synthetic */ String $environment;
        final /* synthetic */ m15 $fragmentActivity;
        final /* synthetic */ g this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(Context context, m15 m15Var, String str, Map<String, ? extends Object> map, g gVar) {
            super(0);
            this.$context = context;
            this.$fragmentActivity = m15Var;
            this.$environment = str;
            this.$configuration = map;
            this.this$0 = gVar;
        }

        /* JADX WARN: Removed duplicated region for block: B:12:0x0047 A[PHI: r2
          0x0047: PHI (r2v9 android.app.Activity) = (r2v8 android.app.Activity), (r2v22 android.app.Activity), (r2v24 android.app.Activity) binds: [B:3:0x0035, B:8:0x003d, B:11:0x0045] A[DONT_GENERATE, DONT_INLINE]] */
        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void m162invoke() {
            /*
                Method dump skipped, instruction units count: 292
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: sprig.b.g.b.m162invoke():void");
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m162invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class l extends co6 implements m45 {
        final /* synthetic */ WeakReference<Activity> $activityRef;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public l(WeakReference<Activity> weakReference) {
            super(0);
            this.$activityRef = weakReference;
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m168invoke() {
            try {
                Activity activity = this.$activityRef.get();
                if (activity == null) {
                    sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Activity no longer available for survey presentation.", SprigLoggingLevel.ERROR, 0, 4, null);
                    return;
                }
                g gVar = g.INSTANCE;
                if (!gVar.a(activity)) {
                    sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Survey presentation blocked by secondary validation.", SprigLoggingLevel.ERROR, 0, 4, null);
                } else if (g.shouldBlockConversationalSurveyForOrientation$default(gVar, null, null, 3, null)) {
                    gVar.dismissActiveSurvey();
                } else {
                    gVar.a().removeCallbacks(g.resetWebView);
                    gVar.a().postDelayed(new sprig.b.m(1, this.$activityRef), 50L);
                }
            } catch (Exception e) {
                sprig.j.e eVar = g.logger;
                String message = e.getMessage();
                if (message == null) {
                    message = "";
                }
                sprig.j.e.logWarning$default(eVar, "Error in presentSurvey", null, message, kyd.h0(e), null, null, 50, null);
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error in presentSurvey: ", e.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
            }
        }

        public static final void a(WeakReference weakReference) {
            weakReference.getClass();
            try {
                Activity activity = (Activity) weakReference.get();
                if (activity == null) {
                    sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Activity no longer available after cleanup delay.", SprigLoggingLevel.ERROR, 0, 4, null);
                    return;
                }
                g gVar = g.INSTANCE;
                if (!gVar.a(activity)) {
                    sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ezwlgQm.dsjBa, SprigLoggingLevel.ERROR, 0, 4, null);
                    return;
                }
                if (!g.isSurveyReady) {
                    sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Survey no longer ready after delay, aborting presentation.", SprigLoggingLevel.WARNING, 0, 4, null);
                    return;
                }
                if (g.shouldBlockConversationalSurveyForOrientation$default(gVar, null, null, 3, null)) {
                    gVar.dismissActiveSurvey();
                    return;
                }
                sprig.i.b bVar = g.surveySheet;
                if (bVar != null && bVar.isShowing()) {
                    sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Survey sheet already exists and is added - this shouldn't happen after cleanup", SprigLoggingLevel.ERROR, 0, 4, null);
                    return;
                }
                sprig.i.b bVar2 = g.surveySheet;
                if (bVar2 != null) {
                    try {
                        bVar2.dismiss();
                    } catch (Exception e) {
                        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Error dismissing existing survey: " + e.getMessage(), SprigLoggingLevel.WARNING, 0, 4, null);
                    }
                }
                g.surveySheet = null;
                g.INSTANCE.a().removeCallbacks(g.resetWebView);
                g.surveySheet = new sprig.i.b(activity);
                sprig.i.b bVar3 = g.surveySheet;
                if (bVar3 != null) {
                    bVar3.show();
                }
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Survey sheet shown", null, 0, 6, null);
            } catch (Exception e2) {
                sprig.j.e eVar = g.logger;
                String message = e2.getMessage();
                if (message == null) {
                    message = "";
                }
                sprig.j.e.logWarning$default(eVar, "Error presenting survey after cleanup", null, message, kyd.h0(e2), null, null, 50, null);
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error presenting survey after cleanup: ", e2.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
            }
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m168invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "Landroid/os/Handler;", "invoke"}, k = 3, mv = {1, 8, 0}, xi = 48)
    public static final class n extends co6 implements m45 {
        public static final n INSTANCE = new n();

        public n() {
            super(0);
        }

        @Override // defpackage.m45
        public final Handler invoke() {
            return new Handler(Looper.getMainLooper());
        }
    }

    static {
        g gVar = new g();
        INSTANCE = gVar;
        orientationCallbacks = new j();
        javaScriptExecutionQueue = new LinkedList();
        logger = new sprig.j.e();
        shouldDismissOnPageChange = true;
        surveyLayouts = new LinkedHashMap();
        isNetworkAvailable = true;
        environmentId = "";
        sdkHandler = vx0.e0(n.INSTANCE);
        pendingEventPayloads = new LinkedHashMap();
        resetWebView = new defpackage.e(21);
        sdkHandledEvents = d46.R(EventName.QUESTION_ANSWERED, EventName.SDK_READY, EventName.VISITOR_ID_UPDATED, EventName.SURVEY_CLOSE_REQUESTED, EventName.SURVEY_APPEARED, EventName.LOGGING_EVENT, EventName.SURVEY_WILL_PRESENT, EventName.SURVEY_PRESENTED, EventName.SURVEY_WILL_CLOSE, EventName.SURVEY_CLOSED, EventName.SURVEY_HEIGHT);
        gVar.d();
    }

    private g() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void a(AtomicBoolean atomicBoolean, Runnable runnable, String str, Map map, m15 m15Var, Activity activity) {
        atomicBoolean.getClass();
        runnable.getClass();
        str.getClass();
        try {
            if (!atomicBoolean.compareAndSet(false, true)) {
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Configuration listener called but already started, ignoring", null, 0, 6, null);
                return;
            }
            g gVar = INSTANCE;
            gVar.a().removeCallbacks(runnable);
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            sprig.b.b.sendLoggingEvent$default(bVar, "Configuration listener triggered with activity: " + activity, null, 0, 6, null);
            if (activity == 0) {
                atomicBoolean.set(false);
                gVar.a().postDelayed(runnable, 30000L);
                sprig.b.b.sendLoggingEvent$default(bVar, "Activity listener called with null activity", SprigLoggingLevel.WARNING, 0, 4, null);
                return;
            }
            boolean z = activity instanceof iy6;
            boolean zIsFinishing = activity.isFinishing();
            boolean zIsDestroyed = activity.isDestroyed();
            vx6 vx6Var = z ? ((ky6) ((iy6) activity).getLifecycle()).d : null;
            boolean zIsAtLeast = vx6Var != null ? vx6Var.isAtLeast(vx6.STARTED) : false;
            vx6 vx6Var2 = vx6Var;
            sprig.b.b.sendLoggingEvent$default(bVar, "Activity state: lifecycleState=" + vx6Var + ", isFinishing=" + zIsFinishing + ", isDestroyed=" + zIsDestroyed, null, 0, 6, null);
            if (z && !zIsFinishing && !zIsDestroyed && zIsAtLeast) {
                sprig.b.b.sendLoggingEvent$default(bVar, "Configuration proceeding with activity: " + activity + " (lifecycleState=" + vx6Var2 + ")", null, 0, 6, null);
                sprig.j.a aVar = configurationActivityListener;
                if (aVar != null) {
                    sprig.j.b.INSTANCE.removeActivityChangeListener(aVar);
                }
                configurationActivityListener = null;
                gVar.c(activity, str, map, m15Var);
                return;
            }
            atomicBoolean.set(false);
            gVar.a().postDelayed(runnable, 30000L);
            sprig.b.b.sendLoggingEvent$default(bVar, "Activity not yet usable: " + activity + " (isLifecycleOwner=" + z + ", lifecycleState=" + vx6Var2 + ", isFinishing=" + zIsFinishing + ", isDestroyed=" + zIsDestroyed + ")", SprigLoggingLevel.WARNING, 0, 4, null);
        } catch (Exception e2) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, lv8.r("EXCEPTION in configuration listener: ", e2.getClass().getSimpleName(), ": ", e2.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    public static final void e() {
        isHandlingConfigChange = false;
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Config change handling complete", null, 0, 6, null);
    }

    public static /* synthetic */ void executeJavascript$default(g gVar, String str, x45 x45Var, int i2, Object obj) throws JSONException {
        if ((i2 & 2) != 0) {
            x45Var = null;
        }
        gVar.a(str, x45Var);
    }

    public static final void f() {
        sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ev6.x("Resuming ", n1b.a.b(sprig.b.h.class).j(), " after reattachment"), null, 0, 6, null);
        g gVar = INSTANCE;
        gVar.getWebView$userleap_release().onResume();
        gVar.getWebView$userleap_release().resumeTimers();
        gVar.getWebView$userleap_release().setVisibility(0);
        gVar.getWebView$userleap_release().requestLayout();
        gVar.getWebView$userleap_release().invalidate();
    }

    public static final void h() {
        INSTANCE.recreateWebViewIfSafe$userleap_release();
    }

    public static final void i() {
        boolean z;
        if (sprig.j.b.INSTANCE.getCurrentActivity() != null) {
            if (SdkConfig.INSTANCE.isReady()) {
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "resetWebView: SDK is ready, no action needed", null, 0, 6, null);
            } else {
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "resetWebView: SDK not ready, triggering WebView rebuild", null, 0, 6, null);
                INSTANCE.recreateWebViewIfSafe$userleap_release();
            }
            z = false;
        } else {
            z = true;
        }
        shouldResetOnResume = z;
    }

    public static /* synthetic */ boolean shouldBlockConversationalSurveyForOrientation$default(g gVar, Integer num, Activity activity, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            num = null;
        }
        if ((i2 & 2) != 0) {
            activity = null;
        }
        return gVar.a(num, activity);
    }

    @Override // com.userleap.UserLeapInterface
    public void addEventListener(EventName eventName, EventListener listener) {
        eventName.getClass();
        listener.getClass();
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendMobileSDKLoggingEvent$default(bVar, eventName + " ==> " + listener, "addEventListener", null, false, 12, null);
        if (bVar.addListener(eventName, listener) == 1 && !sdkHandledEvents.contains(eventName)) {
            executeJavascript$default(this, ev6.x("Sprig.addEventListener(", eventName.getValue(), ")"), null, 2, null);
        }
        if (eventName == EventName.LOGGING_EVENT) {
            sprig.b.b.sendMobileSDKLoggingEvent$default(bVar, "Logging events enabled", null, null, false, 14, null);
            sprig.b.b.sendLoggingEvent$default(bVar, ev6.x("Android SDK Version: ", getSdkVersion(), " (DEBUG: false)"), null, 1, 2, null);
            sprig.b.b.sendLoggingEvent$default(bVar, ka1.r("WebSDK Version: ", getWebSdkVersion$userleap_release()), null, 1, 2, null);
            sprig.b.b.sendLoggingEvent$default(bVar, b09.w(Build.VERSION.SDK_INT, "Device API level: "), null, 1, 2, null);
        }
    }

    public final void applyUserInterfaceStyleToContext$userleap_release() {
        Context baseContext;
        int i2;
        Activity activity;
        SprigUserInterfaceMode sprigUserInterfaceMode = userInterfaceStyle;
        if (sprigUserInterfaceMode == null) {
            return;
        }
        if (sprigUserInterfaceMode == SprigUserInterfaceMode.UNSPECIFIED) {
            WeakReference weakReference = attachedActivityRef;
            if (weakReference == null || (activity = (Activity) weakReference.get()) == null) {
                return;
            }
            MutableContextWrapper mutableContextWrapper = webViewContextWrapper;
            if (mutableContextWrapper != null) {
                mutableContextWrapper.setBaseContext(activity);
                return;
            } else {
                g76.g0("webViewContextWrapper");
                throw null;
            }
        }
        MutableContextWrapper mutableContextWrapper2 = webViewContextWrapper;
        if (mutableContextWrapper2 == null || (baseContext = mutableContextWrapper2.getBaseContext()) == null) {
            return;
        }
        int i3 = a.$EnumSwitchMapping$0[sprigUserInterfaceMode.ordinal()];
        if (i3 == 1) {
            i2 = 16;
        } else {
            if (i3 != 2) {
                if (i3 == 3) {
                    return;
                }
                ygf.a();
                return;
            }
            i2 = 32;
        }
        Configuration configuration2 = new Configuration(baseContext.getResources().getConfiguration());
        configuration2.uiMode = i2 | (configuration2.uiMode & (-49));
        MutableContextWrapper mutableContextWrapper3 = webViewContextWrapper;
        if (mutableContextWrapper3 != null) {
            mutableContextWrapper3.setBaseContext(baseContext.createConfigurationContext(configuration2));
        } else {
            g76.g0("webViewContextWrapper");
            throw null;
        }
    }

    public final void attachActivityContext$userleap_release(Activity activity) {
        activity.getClass();
        MutableContextWrapper mutableContextWrapper = webViewContextWrapper;
        if (mutableContextWrapper == null) {
            return;
        }
        Context baseContext = mutableContextWrapper.getBaseContext();
        MutableContextWrapper mutableContextWrapper2 = webViewContextWrapper;
        if (mutableContextWrapper2 == null) {
            g76.g0("webViewContextWrapper");
            throw null;
        }
        mutableContextWrapper2.setBaseContext(activity);
        attachedActivityRef = new WeakReference(activity);
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar, "Attaching SprigWebView to context: ".concat(activity.getClass().getSimpleName()), null, 0, 6, null);
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar, "Swap: " + baseContext + " → " + activity, null, 1, 2, null);
    }

    public final void c(Context context, String environment, Map configuration2, m15 fragmentActivity) {
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendLoggingEvent$default(bVar, "configureWebView called with context: " + context, null, 0, 6, null);
        webViewConfigureStartTimeMs = System.currentTimeMillis();
        if (!(context instanceof Activity)) {
            String strX = ev6.x("WARNING: Context used for ", n1b.a.b(sprig.b.h.class).j(), " should be an Activity for best results.");
            SprigLoggingLevel sprigLoggingLevel = SprigLoggingLevel.WARNING;
            bVar.sendLoggingEvent(strX, sprigLoggingLevel, 1);
            bVar.sendLoggingEvent("Given " + context + " instead. Will attempt to find and use current activity.", sprigLoggingLevel, 2);
        }
        if (sprig.b.e.INSTANCE.shouldDisableSprig(new sprig.b.l(context))) {
            sprig.b.b.sendLoggingEvent$default(bVar, "Sprig could not be started on this device.", SprigLoggingLevel.CRITICAL, 0, 4, null);
            return;
        }
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        ((Application) applicationContext).registerActivityLifecycleCallbacks(this);
        environmentId = environment;
        configuration = configuration2;
        a(context);
        a(new b(context, fragmentActivity, environment, configuration2, this));
        networkService = new jhf(context.getApplicationContext());
        b(context);
    }

    public final void clearSurveySheetReference$userleap_release() {
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Clearing survey sheet reference.", null, 0, 6, null);
        surveySheet = null;
    }

    @Override // com.userleap.UserLeapInterface
    public void configure(Context context, String environmentId2, Map<String, ? extends Object> configuration2, m15 fragmentActivity) {
        context.getClass();
        environmentId2.getClass();
        if (g76.L(Looper.myLooper(), Looper.getMainLooper())) {
            b(context, environmentId2, configuration2, fragmentActivity);
        } else {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "configure() called from background thread. Posting to main thread for safety.", SprigLoggingLevel.WARNING, 0, 4, null);
            a().post(new q13(context, environmentId2, configuration2, fragmentActivity, 6));
        }
    }

    public final void d() {
        final int i2 = 0;
        addEventListener(EventName.QUESTION_ANSWERED, new EventListener() { // from class: cif
            @Override // com.userleap.EventListener
            public final void onEvent(SprigEvent sprigEvent) {
                switch (i2) {
                    case 0:
                        g.a(sprigEvent);
                        break;
                    default:
                        g.b(sprigEvent);
                        break;
                }
            }
        });
        final int i3 = 1;
        addEventListener(EventName.SURVEY_CLOSE_REQUESTED, new EventListener() { // from class: cif
            @Override // com.userleap.EventListener
            public final void onEvent(SprigEvent sprigEvent) {
                switch (i3) {
                    case 0:
                        g.a(sprigEvent);
                        break;
                    default:
                        g.b(sprigEvent);
                        break;
                }
            }
        });
    }

    public final void detachActivityContext$userleap_release() {
        MutableContextWrapper mutableContextWrapper = webViewContextWrapper;
        if (mutableContextWrapper == null || appContext == null) {
            return;
        }
        Context baseContext = mutableContextWrapper.getBaseContext();
        MutableContextWrapper mutableContextWrapper2 = webViewContextWrapper;
        if (mutableContextWrapper2 == null) {
            g76.g0("webViewContextWrapper");
            throw null;
        }
        Context context = appContext;
        if (context == null) {
            g76.g0("appContext");
            throw null;
        }
        mutableContextWrapper2.setBaseContext(context);
        attachedActivityRef = null;
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar, "Detaching SprigWebView to app context", null, 0, 6, null);
        Context context2 = appContext;
        if (context2 == null) {
            g76.g0("appContext");
            throw null;
        }
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar, "Swap: " + baseContext + " → " + context2, null, 1, 2, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void dismissActiveSurvey() {
        sprig.b.b.sendMobileSDKLoggingEvent$default(sprig.b.b.INSTANCE, null, "dismissActiveSurvey", null, false, 13, null);
        isSurveyReady = false;
        Runnable runnable = handleSurveyCallback;
        if (runnable != null) {
            INSTANCE.a().removeCallbacks(runnable);
        }
        handleSurveyCallback = null;
        pendingEventPayloads.clear();
        executeJavascript$default(this, "Sprig.dismissActiveSurvey()", null, 2, null);
    }

    public final void dismissSurveyOnExternalTap$userleap_release() {
        executeJavascript$default(this, "Sprig.dismissActiveSurvey('close.click')", null, 2, null);
    }

    public final void g() {
        lastWebViewResponseTimestamp = System.currentTimeMillis();
    }

    public final Integer getActiveSurveyId$userleap_release() {
        return activeSurveyId;
    }

    @Override // com.userleap.UserLeapInterface
    public int getBottomSafeArea() {
        return bottomSafeArea;
    }

    public final int getBottomSafeAreaForScreenDensity() {
        Resources resources;
        DisplayMetrics displayMetrics;
        Activity currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
        return (currentActivity == null || (resources = currentActivity.getResources()) == null || (displayMetrics = resources.getDisplayMetrics()) == null) ? getBottomSafeArea() : Math.min((int) (INSTANCE.getBottomSafeArea() * displayMetrics.density), displayMetrics.heightPixels - ((int) (400.0f * displayMetrics.density)));
    }

    public final String getEnvironmentId() {
        return environmentId;
    }

    public final Integer getKeyboardHeightForSurveyPlacement$userleap_release() {
        return keyboardHeightForSurveyPlacement;
    }

    public final x45 getPresent$userleap_release(WeakReference<Activity> weakReference) {
        weakReference.getClass();
        return new k(weakReference);
    }

    public final sprig.view.e getReplayApprovalBlock() {
        return replayApprovalBlock;
    }

    @Override // com.userleap.UserLeapInterface
    public String getSdkVersion() {
        return "2.25.0";
    }

    public final Map<Integer, String> getSurveyLayouts$userleap_release() {
        return surveyLayouts;
    }

    public final boolean getSurveysPaused$userleap_release() {
        return surveysPaused;
    }

    public final SprigUserInterfaceMode getUserInterfaceStyle$userleap_release() {
        return userInterfaceStyle;
    }

    public final String getVisitorId() {
        return visitorId;
    }

    @Override // com.userleap.UserLeapInterface
    public Integer getVisitorIdentifier() {
        try {
            String str = visitorId;
            if (str != null) {
                return Integer.valueOf(Integer.parseInt(str));
            }
            return null;
        } catch (Exception unused) {
            return null;
        }
    }

    @Override // com.userleap.UserLeapInterface
    public String getVisitorIdentifierString() {
        return visitorId;
    }

    public final String getWebSdkVersion$userleap_release() {
        return "2.45.0";
    }

    public final sprig.b.h getWebView$userleap_release() {
        sprig.b.h hVar = webView;
        if (hVar != null) {
            return hVar;
        }
        g76.g0("webView");
        throw null;
    }

    @Override // com.userleap.UserLeapInterface
    public void integrateOptimizely(Object optimizelySdk, String userId, Map<String, String> attributes) {
        optimizelySdk.getClass();
        sprig.c.e eVar = new sprig.c.e(optimizelySdk, new d(this));
        if (userId == null) {
            userId = "";
        }
        if (attributes == null) {
            attributes = fy3.a;
        }
        executeJavascript$default(this, "Sprig('integrateOptimizely', " + eVar.getExperiments(userId, attributes).toJson() + ")", null, 2, null);
    }

    public final boolean isHandlingConfigChange$userleap_release() {
        return isHandlingConfigChange;
    }

    public final void j() {
        try {
            ConnectivityManager connectivityManager2 = connectivityManager;
            if (connectivityManager2 != null) {
                connectivityManager2.unregisterNetworkCallback(this);
            }
        } catch (Exception unused) {
        }
        connectivityManager = null;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        activity.getClass();
        if (savedInstanceState != null && savedInstanceState.getBoolean("sprig_restore_survey") && shouldRestoreSurveyAfterConfigChange) {
            if (shouldBlockConversationalSurveyForOrientation$default(this, null, activity, 1, null)) {
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Dismissing conversational survey after rotation to landscape on phone", SprigLoggingLevel.INFO, 0, 4, null);
                shouldRestoreSurveyAfterConfigChange = false;
                isHandlingConfigChange = false;
                surveySheet = null;
                activeSurveyId = null;
                dismissActiveSurvey();
                return;
            }
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            s1b s1bVar = n1b.a;
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar, ka1.r("Restoring survey after config change - reusing existing ", s1bVar.b(sprig.b.h.class).j()), null, 0, 6, null);
            attachActivityContext$userleap_release(activity);
            if (activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar, ka1.r("Creating new dialog for existing ", s1bVar.b(sprig.b.h.class).j()), null, 0, 6, null);
            sprig.b.b.sendLoggingEvent$default(bVar, "Clearing previous survey sheet reference.", null, 0, 6, null);
            surveySheet = null;
            a().removeCallbacks(resetWebView);
            surveySheet = sprig.i.b.INSTANCE.show(activity);
            shouldRestoreSurveyAfterConfigChange = false;
            isRestoringAfterConfigChange = false;
            a().postDelayed(new defpackage.e(20), 500L);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
        activity.getClass();
        WeakReference weakReference = attachedActivityRef;
        if ((weakReference != null ? (Activity) weakReference.get() : null) == activity) {
            detachActivityContext$userleap_release();
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        activity.getClass();
        sprig.i.b bVar = surveySheet;
        if (bVar == null || !bVar.isShowing()) {
            return;
        }
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Survey showing when activity paused", SprigLoggingLevel.WARNING, 0, 4, null);
        shouldRestoreSurveyAfterConfigChange = true;
        isHandlingConfigChange = true;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        activity.getClass();
        attachActivityContext$userleap_release(activity);
        a(e.INSTANCE);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        activity.getClass();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        activity.getClass();
    }

    @Override // sprig.b.h.d
    public void onAppearSurvey(String data) {
        sprig.view.b bVar;
        data.getClass();
        sprig.view.c currentSessionReplay = sprig.view.a.INSTANCE.get$userleap_release().getCurrentSessionReplay();
        if (currentSessionReplay == null || (bVar = currentSessionReplay.get_sessionRecorder()) == null) {
            return;
        }
        bVar.addEventDigest(new b.a(System.currentTimeMillis(), b.EnumC0010b.SHOW_SURVEY, null, Integer.valueOf(new JSONObject(data).getInt("survey.id")), 4, null));
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onAvailable(Network network) {
        network.getClass();
        super.onAvailable(network);
        boolean z = isNetworkAvailable;
        Boolean boolValueOf = Boolean.valueOf(z);
        if (z) {
            boolValueOf = null;
        }
        if (boolValueOf != null) {
            a(f.INSTANCE);
        }
    }

    @Override // sprig.b.h.d
    public void onDismissSurvey(String data) {
        Object ajbVar;
        sprig.view.b bVar;
        data.getClass();
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "onDismissSurvey called with data: ".concat(data), null, 0, 6, null);
        isSurveyReady = false;
        sprig.i.b bVar2 = surveySheet;
        if (bVar2 != null && bVar2.isShowing()) {
            bVar2.dismiss();
        }
        surveySheet = null;
        activeSurveyId = null;
        sprig.view.c currentSessionReplay = sprig.view.a.INSTANCE.get$userleap_release().getCurrentSessionReplay();
        if (currentSessionReplay != null && (bVar = currentSessionReplay.get_sessionRecorder()) != null) {
            bVar.addEventDigest(new b.a(System.currentTimeMillis(), b.EnumC0010b.SUBMIT_SURVEY, null, null, 12, null));
        }
        onEvent("SURVEY_CLOSE_REQUESTED", data);
        try {
            ajbVar = new JSONObject(data).optString("initiator");
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        if (g76.L((String) (ajbVar instanceof ajb ? null : ajbVar), "survey.completed")) {
            onEvent("SURVEY_COMPLETED", data);
        }
    }

    @Override // sprig.b.h.d
    public void onEvent(String name, String event) {
        name.getClass();
        event.getClass();
        SprigEvent sprigEventA = SprigEvent.INSTANCE.a(name, event);
        if (sprigEventA != null) {
            sprig.b.b.INSTANCE.onEvent(sprigEventA);
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onLost(Network network) {
        network.getClass();
        super.onLost(network);
        isNetworkAvailable = false;
    }

    @Override // sprig.b.h.d
    public void onScheduleOrCaptureReplay(String data) {
        c1e c1eVar;
        data.getClass();
        sprig.view.e eVar = replayApprovalBlock;
        if (eVar == null) {
            c1eVar = null;
        } else if (!eVar.approve()) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Replay session recording was denied by host app.", SprigLoggingLevel.WARNING, 0, 4, null);
            return;
        } else {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Replay session recording was approved by host app.", null, 0, 6, null);
            c1eVar = c1e.a;
        }
        if (c1eVar == null) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "No replay approval block was implemented by the host app. Replay capture will begin.", null, 0, 6, null);
        }
        sprig.b.b.sendMobileSDKLoggingEvent$default(sprig.b.b.INSTANCE, data, "onScheduleOrCaptureReplay", null, false, 12, null);
        try {
            if (SdkConfig.INSTANCE.get$userleap_release() != null) {
                sprig.view.a.INSTANCE.get$userleap_release().startRecordingSession(ReplayRequest.INSTANCE.fromWebSdkJson(data));
            }
        } catch (Exception e2) {
            sprig.j.e.logWarning$default(logger, "onScheduleOrCaptureReplay data was invalid.", null, lv8.r("data: ", data, ", exception: ", e2.getMessage()), null, null, null, 58, null);
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, lv8.r("onScheduleOrCaptureReplay data was invalid: ", data, " - ", e2.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    @Override // sprig.b.h.d
    public void onSdkReady(String data) throws JSONException {
        data.getClass();
        SdkConfig.Companion aVar = SdkConfig.INSTANCE;
        if (aVar.isReady()) {
            return;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        sprig.j.f fVar = sprig.j.f.INSTANCE;
        if (fVar.isTracking()) {
            fVar.onSdkReady(staleWebViewCount);
        } else {
            long j2 = jCurrentTimeMillis - configureStartTimeMs;
            long j3 = jCurrentTimeMillis - webViewConfigureStartTimeMs;
            sprig.b.b bVar = sprig.b.b.INSTANCE;
            sprig.b.b.sendVerboseLoggingEvent$default(bVar, "⏱️ Elapsed Time for SDK Configuration:", null, 0, 6, null);
            sprig.b.b.sendVerboseLoggingEvent$default(bVar, b09.x("total=", "ms", j2), null, 1, 2, null);
            sprig.b.b.sendVerboseLoggingEvent$default(bVar, b09.x("webView=", "ms", j3), null, 2, 2, null);
        }
        try {
            aVar.setFromWebSdkJson(data);
            g();
            String str = userIdentifier;
            if (str != null) {
                INSTANCE.setUserIdentifier(str);
            }
            a(new C0008g(data));
        } catch (Exception e2) {
            sprig.j.e.logError$default(logger, "Problem with SDK config data.", null, lv8.r("data: ", data, ", exception: ", e2.getMessage()), null, null, null, 58, null);
        }
    }

    @Override // sprig.b.h.d
    public void onSurveyCallback(String callbackId, SurveyState state, String data) {
        long jOptLong;
        callbackId.getClass();
        state.getClass();
        data.getClass();
        g();
        isSurveyReady = false;
        onEvent("SURVEY_STATE_RETURNED", data);
        EventPayload eventPayload = (EventPayload) pendingEventPayloads.remove(callbackId);
        boolean z = surveysPaused;
        if (z || eventPayload == null) {
            if (z) {
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "Surveys paused. Dismissing request and ignoring.", SprigLoggingLevel.WARNING, 0, 4, null);
            } else {
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "No matching survey in the queue. Dismissing request and ignoring.", SprigLoggingLevel.WARNING, 0, 4, null);
            }
            dismissActiveSurvey();
            return;
        }
        if (state == SurveyState.READY || state == SurveyState.PREVIOUS_SURVEY_READY) {
            isSurveyReady = true;
        }
        try {
            jOptLong = new JSONObject(data).optLong("delay", 0L);
        } catch (Exception unused) {
            jOptLong = 0;
        }
        ss ssVar = new ss(eventPayload, data, state, 19);
        if (jOptLong > 0) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, b09.x("Delaying survey presentation by ", "ms", jOptLong), SprigLoggingLevel.DEBUG, 0, 4, null);
            INSTANCE.a().postDelayed(ssVar, jOptLong);
        } else {
            ssVar.run();
        }
        handleSurveyCallback = ssVar;
    }

    @Override // sprig.b.h.d
    public void onSurveyClosed(String data) {
        data.getClass();
        onEvent("SURVEY_CLOSED", data);
    }

    @Override // sprig.b.h.d
    public void onSurveyHeight(String data) {
        data.getClass();
        try {
            JSONObject jSONObject = new JSONObject(data);
            Object objOpt = jSONObject.opt("contentFrameHeight");
            Number number = objOpt instanceof Number ? (Number) objOpt : null;
            Double dValueOf = number != null ? Double.valueOf(number.doubleValue()) : null;
            int i2 = jSONObject.getInt("survey.id");
            if (dValueOf != null) {
                double dDoubleValue = dValueOf.doubleValue();
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Height of survey received: " + dValueOf + ": " + data, null, 0, 6, null);
                INSTANCE.a(new h(dDoubleValue, i2));
            }
        } catch (JSONException unused) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "No `contentFrameHeight` found in event data: ".concat(data), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    @Override // sprig.b.h.d
    public void onSurveyPresented(String data) {
        data.getClass();
        onEvent("SURVEY_PRESENTED", data);
    }

    @Override // sprig.b.h.d
    public void onSurveyWidth(String data) {
        data.getClass();
    }

    @Override // sprig.b.h.d
    public void onSurveyWillClose(String data) {
        data.getClass();
        onEvent("SURVEY_WILL_CLOSE", data);
    }

    @Override // sprig.b.h.d
    public void onTextFieldBlurred() {
        a(i.INSTANCE);
    }

    @Override // sprig.b.h.d
    public void onTextFieldFocused(String data) {
        data.getClass();
        try {
            JSONObject jSONObject = new JSONObject(data);
            Rect rect = new Rect();
            Object objOpt = jSONObject.opt("top");
            Number number = objOpt instanceof Number ? (Number) objOpt : null;
            rect.top = number != null ? number.intValue() : 0;
            Object objOpt2 = jSONObject.opt("left");
            Number number2 = objOpt2 instanceof Number ? (Number) objOpt2 : null;
            rect.left = number2 != null ? number2.intValue() : 0;
            Object objOpt3 = jSONObject.opt("bottom");
            Number number3 = objOpt3 instanceof Number ? (Number) objOpt3 : null;
            rect.bottom = number3 != null ? number3.intValue() : 0;
            Object objOpt4 = jSONObject.opt("right");
            Number number4 = objOpt4 instanceof Number ? (Number) objOpt4 : null;
            rect.right = number4 != null ? number4.intValue() : 0;
            sprig.i.b bVar = surveySheet;
            if (bVar != null) {
                bVar.onTextFieldFocused(rect);
            }
        } catch (JSONException unused) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Unable to parse text field boundary: ".concat(data), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    public final void onViewCreated(ViewGroup view, m45 dismissView) {
        view.getClass();
        dismissView.getClass();
        if (webView == null) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "WebView not initialized when onViewCreated called - dismissing dialog", SprigLoggingLevel.ERROR, 0, 4, null);
            dismissView.invoke();
            return;
        }
        a().removeCallbacks(resetWebView);
        boolean z = getWebView$userleap_release().getParent() != null;
        ViewParent parent = getWebView$userleap_release().getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ev6.x("Removing ", n1b.a.b(sprig.b.h.class).j(), " from old parent during view recreation"), null, 0, 6, null);
            viewGroup.removeView(INSTANCE.getWebView$userleap_release());
        }
        getWebView$userleap_release().setLayoutParams(new RelativeLayout.LayoutParams(-1, 1));
        getWebView$userleap_release().setFilterTouchesWhenObscured(true);
        view.setFilterTouchesWhenObscured(true);
        view.addView(getWebView$userleap_release());
        view.postDelayed(new b2a(13, view), 50L);
        if (z) {
            getWebView$userleap_release().post(new defpackage.e(22));
        }
    }

    public final void onViewDestroyed(ViewGroup view) {
        view.getClass();
        if (isHandlingConfigChange) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ev6.x("Skipping ", n1b.a.b(sprig.b.h.class).j(), " cleanup during config change"), null, 0, 6, null);
            return;
        }
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendEngineeringLoggingEvent$default(bVar, "onViewDestroyed called", null, 0, 6, null);
        if (webView == null) {
            sprig.b.b.sendEngineeringLoggingEvent$default(bVar, km4.y(n1b.a.b(sprig.b.h.class).j(), " not initialized, dismissing view only"), null, 0, 6, null);
            return;
        }
        try {
            if (g76.L(getWebView$userleap_release().getParent(), view)) {
                view.removeView(getWebView$userleap_release());
                sprig.b.b.sendEngineeringLoggingEvent$default(bVar, n1b.a.b(sprig.b.h.class).j() + " removed from parent", null, 0, 6, null);
            }
            view.removeAllViews();
            view.setVisibility(8);
            view.setAlpha(0.0f);
            sprig.b.b.sendVerboseLoggingEvent$default(bVar, "View cleanup completed", null, 0, 6, null);
        } catch (Exception e2) {
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error cleaning up survey view: ", e2.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
            try {
                view.removeAllViews();
                view.setVisibility(8);
            } catch (Exception e3) {
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Emergency view cleanup also failed: ", e3.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
            }
        }
        a().postDelayed(resetWebView, 1000L);
    }

    @Override // sprig.b.h.d
    public void onVisitorIdUpdated(String id, String data) {
        id.getClass();
        data.getClass();
        visitorId = id;
        onEvent("VISITOR_ID_UPDATED", data);
    }

    @Override // com.userleap.UserLeapInterface
    public void overrideUserInterfaceMode(SprigUserInterfaceMode style) {
        style.getClass();
        userInterfaceStyle = style;
    }

    @Override // com.userleap.UserLeapInterface
    public void pauseDisplayingSurveys() {
        surveysPaused = true;
        dismissActiveSurvey();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Pausing the display of surveys", null, 0, 6, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void presentSurveyWithId(String surveyId, x45 givenCallback) {
        surveyId.getClass();
        sprig.b.b.sendMobileSDKLoggingEvent$default(sprig.b.b.INSTANCE, surveyId, "presentSurveyWithId", null, false, 12, null);
        m mVar = new m(givenCallback);
        String string = UUID.randomUUID().toString();
        string.getClass();
        pendingEventPayloads.put(string, new EventPayload(surveyId, null, null, null, null, null, mVar, 62, null));
        StringBuilder sb = new StringBuilder("Sprig.mobileDisplaySurvey('");
        sb.append(surveyId);
        executeJavascript$default(this, y30.s(sb, "', '", string, "')"), null, 2, null);
    }

    public final void recreateWebViewIfSafe$userleap_release() {
        MutableContextWrapper mutableContextWrapper;
        if (!g76.L(Looper.myLooper(), Looper.getMainLooper())) {
            a().post(new defpackage.e(19));
            return;
        }
        if (isRecreatingWebView) {
            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "recreateWebViewIfSafe skipped — already recreating", null, 0, 6, null);
            return;
        }
        if (webView == null || webViewContextWrapper == null) {
            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "recreateWebViewIfSafe skipped — WebView not initialized", null, 0, 6, null);
            return;
        }
        sprig.i.b bVar = surveySheet;
        if ((bVar != null && bVar.isShowing()) || isHandlingConfigChange) {
            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "recreateWebViewIfSafe deferred — survey showing or config change in progress", null, 0, 6, null);
            return;
        }
        isRecreatingWebView = true;
        a().removeCallbacks(resetWebView);
        sprig.b.b bVar2 = sprig.b.b.INSTANCE;
        sprig.b.b.sendLoggingEvent$default(bVar2, "Cancelled pending resetWebView before rebuild", null, 0, 6, null);
        sprig.b.b.sendLoggingEvent$default(bVar2, "Recreating SprigWebView due to inactivity refresh", null, 0, 6, null);
        sprig.j.f fVar = sprig.j.f.INSTANCE;
        fVar.onRebuildStarted();
        try {
            try {
                SdkConfig.INSTANCE.resetForReconfig$userleap_release();
                ViewParent parent = getWebView$userleap_release().getParent();
                ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
                if (viewGroup != null) {
                    viewGroup.removeView(getWebView$userleap_release());
                }
                getWebView$userleap_release().stopAnyCurrentActivity();
                getWebView$userleap_release().removeJavascriptInterface("android_hook");
                getWebView$userleap_release().destroy();
                fVar.onTeardownComplete();
                String str = visitorId;
                if (str != null) {
                    sprig.b.b.sendLoggingEvent$default(bVar2, "Existing visitor ID being injected back to SDK: ".concat(str), null, 0, 6, null);
                    Map map = configuration;
                    if (map == null) {
                        map = fy3.a;
                    }
                    LinkedHashMap linkedHashMap = new LinkedHashMap(map);
                    linkedHashMap.put("visitorId", str);
                    configuration = linkedHashMap;
                }
                lastWebViewCreatedOrResetTimestamp = System.currentTimeMillis();
                mutableContextWrapper = webViewContextWrapper;
            } catch (Exception e2) {
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Error recreating SprigWebView: " + e2.getMessage(), SprigLoggingLevel.ERROR, 0, 4, null);
            }
            if (mutableContextWrapper == null) {
                g76.g0("webViewContextWrapper");
                throw null;
            }
            sprig.b.h hVar = new sprig.b.h(mutableContextWrapper, environmentId, configuration, this, null, 0, 48, null);
            if (Build.VERSION.SDK_INT >= 26) {
                hVar.setImportantForAutofill(8);
            }
            setWebView$userleap_release(hVar);
            fVar.onCreateComplete();
            sprig.b.b.sendLoggingEvent$default(bVar2, "SprigWebView recreated — waiting for onSdkReady", null, 0, 6, null);
            isRecreatingWebView = false;
        } catch (Throwable th) {
            isRecreatingWebView = false;
            throw th;
        }
    }

    @Override // com.userleap.UserLeapInterface
    public void removeEventListener(EventName eventName, EventListener listener) {
        eventName.getClass();
        listener.getClass();
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendMobileSDKLoggingEvent$default(bVar, eventName + " - " + listener, "removeEventListener", null, false, 12, null);
        if (bVar.removeListener(eventName, listener) != 0 || sdkHandledEvents.contains(eventName)) {
            return;
        }
        executeJavascript$default(this, ev6.x("Sprig.removeEventListener(", eventName.getValue(), ")"), null, 2, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void removeVisitorAttributes(List<String> attributes) {
        attributes.getClass();
        executeJavascript$default(this, "Sprig('removeAttributes', " + new JSONArray((Collection) attributes) + ")", null, 2, null);
    }

    public final void setActiveSurveyId$userleap_release(Integer num) {
        activeSurveyId = num;
    }

    @Override // com.userleap.UserLeapInterface
    public void setBottomSafeArea(int i2) {
        bottomSafeArea = i2;
    }

    @Override // com.userleap.UserLeapInterface
    public void setEmailAddress(String emailAddress) {
        emailAddress.getClass();
        executeJavascript$default(this, "Sprig('setEmail', '" + emailAddress + "')", null, 2, null);
    }

    public final void setEnvironmentId(String str) {
        str.getClass();
        environmentId = str;
    }

    public final void setHandlingConfigChange$userleap_release(boolean z) {
        isHandlingConfigChange = z;
    }

    @Override // com.userleap.UserLeapInterface
    public void setKeyboardHeightForSurveyPlacement(Integer height) {
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Setting fixed keyboard height for surveys: " + height, SprigLoggingLevel.WARNING, 0, 4, null);
        keyboardHeightForSurveyPlacement = height;
    }

    public final void setKeyboardHeightForSurveyPlacement$userleap_release(Integer num) {
        keyboardHeightForSurveyPlacement = num;
    }

    @Override // com.userleap.UserLeapInterface
    public void setLocale(String locale) {
        locale.getClass();
        executeJavascript$default(this, "Sprig.locale = '" + locale + "'", null, 2, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void setPartnerAnonymousId(String identifier) {
        identifier.getClass();
        executeJavascript$default(this, "Sprig('setPartnerAnonymousId', '" + identifier + "')", null, 2, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void setPreviewKey(String previewKey) {
        previewKey.getClass();
        sprig.b.b.sendMobileSDKLoggingEvent$default(sprig.b.b.INSTANCE, previewKey, "setPreviewKey", null, false, 12, null);
        executeJavascript$default(this, ev6.x("Sprig('setPreviewKey', '", previewKey, "')"), null, 2, null);
    }

    public final void setReplayApprovalBlock(sprig.view.e eVar) {
        replayApprovalBlock = eVar;
    }

    @Override // com.userleap.UserLeapInterface
    public void setSessionReplayApprovalBlock(sprig.view.e approvalBlock) {
        approvalBlock.getClass();
        replayApprovalBlock = approvalBlock;
    }

    public final void setSurveysPaused$userleap_release(boolean z) {
        surveysPaused = z;
    }

    @Override // com.userleap.UserLeapInterface
    public void setUserIdentifier(String identifier) {
        identifier.getClass();
        userIdentifier = identifier;
        executeJavascript$default(this, ev6.x("Sprig('setUserId', '", identifier, "')"), null, 2, null);
    }

    public final void setUserInterfaceStyle$userleap_release(SprigUserInterfaceMode sprigUserInterfaceMode) {
        userInterfaceStyle = sprigUserInterfaceMode;
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttribute(String key, boolean value) {
        key.getClass();
        executeJavascript$default(this, "Sprig('setAttribute', '" + key + "', '" + value + "')", null, 2, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttributes(Map<String, String> attributes, String userId, String partnerAnonymousId) {
        attributes.getClass();
        String strB = b(userId);
        String strB2 = b(partnerAnonymousId);
        JSONObject jSONObject = new JSONObject(attributes);
        StringBuilder sbU = y30.u("Sprig.mobileIdentifyAndSetAttributes(", strB, ", ", strB2, ", ");
        sbU.append(jSONObject);
        sbU.append(")");
        executeJavascript$default(this, sbU.toString(), null, 2, null);
    }

    public final void setVisitorId(String str) {
        visitorId = str;
    }

    public final void setWebView$userleap_release(sprig.b.h hVar) {
        hVar.getClass();
        webView = hVar;
    }

    @Override // com.userleap.UserLeapInterface
    public void stopRecording() {
        sprig.b.b.sendMobileSDKLoggingEvent$default(sprig.b.b.INSTANCE, null, "stopRecording", null, false, 13, null);
        sprig.view.a.INSTANCE.get$userleap_release().stopRecording$userleap_release(EnumC0050b.USER_INITIATED);
    }

    @Override // com.userleap.UserLeapInterface
    public void track(EventPayload payload) {
        sprig.view.b bVar;
        payload.getClass();
        if (a("track(" + payload + ")")) {
            return;
        }
        String string = UUID.randomUUID().toString();
        string.getClass();
        pendingEventPayloads.put(string, payload);
        b.a aVar = new b.a(System.currentTimeMillis(), b.EnumC0010b.TRACK_EVENT, payload.getEvent(), null, 8, null);
        sprig.b.b.sendMobileSDKLoggingEvent$default(sprig.b.b.INSTANCE, String.valueOf(payload), "track", null, false, 12, null);
        sprig.view.c currentSessionReplay = sprig.view.a.INSTANCE.get$userleap_release().getCurrentSessionReplay();
        if (currentSessionReplay != null && (bVar = currentSessionReplay.get_sessionRecorder()) != null) {
            bVar.addEventDigest(aVar);
        }
        String strL = tuc.L(payload.getEvent(), "'", "\\'");
        String userId = payload.getUserId();
        String strX = userId != null ? ev6.x("'", userId, "'") : "undefined";
        String partnerAnonymousId = payload.getPartnerAnonymousId();
        String strX2 = partnerAnonymousId != null ? ev6.x("'", partnerAnonymousId, "'") : "undefined";
        Map<String, Object> properties = payload.getProperties();
        Object jSONObject = properties != null ? new JSONObject(properties) : "undefined";
        StringBuilder sbU = y30.u("Sprig.mobileTrackEvent('", strL, "', ", strX, ", ");
        sbU.append(strX2);
        sbU.append(", ");
        sbU.append(jSONObject);
        sbU.append(", '");
        executeJavascript$default(INSTANCE, ka1.v(sbU, string, "')"), null, 2, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void trackAndPresent(EventPayload payload, Activity fromActivity) {
        Activity currentActivity = fromActivity;
        payload.getClass();
        if (a("trackAndPresent(" + payload + ")")) {
            return;
        }
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendMobileSDKLoggingEvent$default(bVar, payload + " - " + currentActivity, "trackAndPresent", null, false, 12, null);
        if (currentActivity == null) {
            currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
        }
        if (currentActivity == null) {
            sprig.b.b.sendLoggingEvent$default(bVar, "Unable to present survey. No activity available.", SprigLoggingLevel.ERROR, 0, 4, null);
            sprig.j.e.logError$default(logger, "Unable to present survey. No activity available.", null, null, null, null, null, 62, null);
            return;
        }
        Application application = currentActivity.getApplication();
        if (shouldDismissOnPageChange) {
            igf igfVar = igf.a;
            String event = payload.getEvent();
            event.getClass();
            igf.b.put(event, new WeakReference(currentActivity));
        }
        application.registerActivityLifecycleCallbacks(igf.a);
        p pVar = new p(new nya(), application, payload);
        wm wmVar = new wm(8, pVar);
        a().postDelayed(wmVar, 30000L);
        payload.setResultCallback(new o(wmVar, new WeakReference(currentActivity), payload, pVar));
        track(payload);
    }

    @Override // com.userleap.UserLeapInterface
    public void unpauseDisplayingSurveys() {
        surveysPaused = false;
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Unpausing the display of surveys", null, 0, 6, null);
    }

    public final void b(Context originalContext, final String environmentId2, final Map configuration2, final m15 fragmentActivity) {
        Context context;
        sprig.b.b bVar;
        sprig.b.b bVar2;
        sprig.b.b bVar3;
        if (hasConfigured) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Attempted to configure SDK again when already configured.", SprigLoggingLevel.WARNING, 0, 4, null);
            return;
        }
        hasConfigured = true;
        configureStartTimeMs = System.currentTimeMillis();
        sprig.b.b bVar4 = sprig.b.b.INSTANCE;
        sprig.b.b.sendMobileSDKLoggingEvent$default(bVar4, ka1.r("Configure for environment: ", environmentId2), null, null, false, 14, null);
        if (fragmentActivity != null) {
            sprig.b.b.sendLoggingEvent$default(bVar4, "Fragment Activity provided for configure: " + fragmentActivity, null, 1, 2, null);
            context = fragmentActivity;
        } else {
            sprig.b.b.sendLoggingEvent$default(bVar4, "Context provided for configure: " + originalContext, null, 1, 2, null);
            sprig.b.b.sendLoggingEvent$default(bVar4, "Is activity: " + (originalContext instanceof Activity), null, 2, 2, null);
            context = originalContext;
        }
        sprig.b.b.sendLoggingEvent$default(bVar4, "Proceeding with configuration setup...", null, 0, 6, null);
        try {
            sprig.b.b.sendLoggingEvent$default(bVar4, "Checking current activity availability...", null, 1, 2, null);
            try {
                sprig.b.b.sendLoggingEvent$default(bVar4, "currentActivityIsAvailable: " + sprig.j.b.INSTANCE.currentActivityIsAvailable(), null, 1, 2, null);
                bVar = bVar4;
            } catch (Exception e2) {
                sprig.b.b bVar5 = sprig.b.b.INSTANCE;
                bVar5.sendLoggingEvent("Error checking currentActivityIsAvailable: " + e2.getClass().getSimpleName() + ": " + e2.getMessage(), SprigLoggingLevel.ERROR, 1);
                bVar = bVar5;
            }
            try {
                sprig.b.b.sendLoggingEvent$default(bVar, "currentActivity: " + sprig.j.b.INSTANCE.getCurrentActivity(), null, 1, 2, null);
            } catch (Exception e3) {
                bVar = sprig.b.b.INSTANCE;
                bVar.sendLoggingEvent("Error getting currentActivity: " + e3.getClass().getSimpleName() + ": " + e3.getMessage(), SprigLoggingLevel.ERROR, 1);
            }
            sprig.b.b bVar6 = bVar;
            sprig.b.b.sendLoggingEvent$default(bVar6, "Setting up configuration activity listener...", null, 0, 6, null);
            sprig.j.a aVar = configurationActivityListener;
            if (aVar != null) {
                sprig.b.b.sendLoggingEvent$default(bVar6, "Removing existing configuration listener", null, 1, 2, null);
                sprig.j.b.INSTANCE.removeActivityChangeListener(aVar);
            }
            final AtomicBoolean atomicBoolean = new AtomicBoolean(false);
            final e37 e37Var = new e37(atomicBoolean, 2);
            a().postDelayed(e37Var, 30000L);
            configurationActivityListener = new sprig.j.a() { // from class: bif
                @Override // sprig.j.a
                public final void onActivityChanged(Activity activity) {
                    g.a(atomicBoolean, e37Var, environmentId2, configuration2, fragmentActivity, activity);
                }
            };
            sprig.b.b.sendLoggingEvent$default(bVar6, "Adding configuration activity listener...", null, 0, 6, null);
            sprig.j.b bVar7 = sprig.j.b.INSTANCE;
            sprig.j.a aVar2 = configurationActivityListener;
            aVar2.getClass();
            bVar7.addActivityChangeListener(aVar2);
            sprig.b.b.sendLoggingEvent$default(bVar6, "Configuration activity listener added successfully", null, 0, 6, null);
            sprig.b.b.sendLoggingEvent$default(bVar6, "Calling ActivityTracker.track()...", null, 0, 6, null);
            try {
                bVar7.track(context);
                sprig.b.b.sendLoggingEvent$default(bVar6, eoLmc.IMzNysFuqmCJY, null, 0, 6, null);
                bVar2 = bVar6;
            } catch (Exception e4) {
                sprig.b.b bVar8 = sprig.b.b.INSTANCE;
                sprig.b.b.sendLoggingEvent$default(bVar8, "EXCEPTION in ActivityTracker.track(): " + e4.getClass().getSimpleName() + ": " + e4.getMessage(), SprigLoggingLevel.ERROR, 0, 4, null);
                bVar2 = bVar8;
            }
            sprig.b.b.sendLoggingEvent$default(bVar2, "Checking post-track state: configurationStarted=" + atomicBoolean.get(), null, 0, 6, null);
            if (atomicBoolean.get()) {
                bVar3 = bVar2;
            } else {
                try {
                    sprig.j.b bVar9 = sprig.j.b.INSTANCE;
                    boolean zCurrentActivityIsAvailable = bVar9.currentActivityIsAvailable();
                    sprig.b.b.sendLoggingEvent$default(bVar2, "Post-track currentActivityIsAvailable: " + zCurrentActivityIsAvailable, null, 0, 6, null);
                    if (zCurrentActivityIsAvailable && atomicBoolean.compareAndSet(false, true)) {
                        a().removeCallbacks(e37Var);
                        Activity currentActivity = bVar9.getCurrentActivity();
                        sprig.b.b.sendLoggingEvent$default(bVar2, "Configuration context is available immediately after track(): " + currentActivity, null, 0, 6, null);
                        sprig.j.a aVar3 = configurationActivityListener;
                        if (aVar3 != null) {
                            bVar9.removeActivityChangeListener(aVar3);
                        }
                        c1e c1eVar = null;
                        configurationActivityListener = null;
                        if (currentActivity != null) {
                            INSTANCE.c(currentActivity, environmentId2, configuration2, fragmentActivity);
                            c1eVar = c1e.a;
                        }
                        if (c1eVar == null) {
                            sprig.b.b.sendLoggingEvent$default(bVar2, "currentActivityIsAvailable() was true but currentActivity is null", SprigLoggingLevel.ERROR, 0, 4, null);
                            return;
                        }
                        return;
                    }
                    bVar3 = bVar2;
                } catch (Exception e5) {
                    sprig.b.b bVar10 = sprig.b.b.INSTANCE;
                    sprig.b.b.sendLoggingEvent$default(bVar10, "EXCEPTION checking post-track activity: " + e5.getClass().getSimpleName() + ": " + e5.getMessage(), SprigLoggingLevel.ERROR, 0, 4, null);
                    bVar3 = bVar10;
                }
            }
            if (atomicBoolean.get()) {
                return;
            }
            sprig.b.b.sendLoggingEvent$default(bVar3, "Waiting for activity for configuration to become ready.", null, 0, 6, null);
        } catch (Exception e6) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, lv8.r("CRITICAL EXCEPTION in configure(): ", e6.getClass().getSimpleName(), ": ", e6.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
        }
    }

    @Override // com.userleap.UserLeapInterface
    public void logout() {
        sprig.b.b.sendMobileSDKLoggingEvent$default(sprig.b.b.INSTANCE, "", "logout", null, false, 12, null);
        userIdentifier = null;
        executeJavascript$default(this, ivbZv.zUe, null, 2, null);
    }

    @Override // sprig.b.h.d
    public void onSurveyWillPresent(String data) {
        data.getClass();
        g();
        try {
            JSONObject jSONObject = new JSONObject(data);
            try {
                int i2 = jSONObject.getInt(ziYqbdHrAXvj.ldLVHZ);
                Map map = surveyLayouts;
                Integer numValueOf = Integer.valueOf(i2);
                Object objOpt = jSONObject.opt("layout");
                map.put(numValueOf, objOpt instanceof String ? (String) objOpt : null);
                activeSurveyId = Integer.valueOf(i2);
                onEvent("SURVEY_WILL_PRESENT", data);
            } catch (Exception e2) {
                sprig.j.e eVar = logger;
                String strConcat = "willPresent event missing survey ID: ".concat(data);
                String message = e2.getMessage();
                sprig.j.e.logWarning$default(eVar, strConcat, null, message == null ? "" : message, kyd.h0(e2), null, null, 50, null);
            }
        } catch (Exception e3) {
            sprig.j.e eVar2 = logger;
            String strConcat2 = "invalid willPresent event data: ".concat(data);
            String message2 = e3.getMessage();
            sprig.j.e.logWarning$default(eVar2, strConcat2, null, message2 == null ? "" : message2, kyd.h0(e3), null, null, 50, null);
        }
    }

    @Override // com.userleap.UserLeapInterface
    public void presentSurvey(Activity fromActivity) {
        if (!isSurveyReady) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "No survey ready to present. Call track() and wait for it to be ready first.", SprigLoggingLevel.WARNING, 0, 4, null);
            return;
        }
        if (fromActivity == null) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "No activity provided to present survey. Attempting to find and use current activity.", SprigLoggingLevel.DEBUG, 0, 4, null);
        }
        Activity currentActivity = sprig.j.b.INSTANCE.getCurrentActivity();
        Activity activity = fromActivity == null ? currentActivity : fromActivity;
        if (activity == null) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Unable to present survey. No activity provide and current activity could not be determined.", SprigLoggingLevel.ERROR, 0, 4, null);
            sprig.j.e.logError$default(logger, "Unable to present survey.", "No activity provide and current activity could not be determined.", null, null, null, null, 60, null);
            return;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (jCurrentTimeMillis - lastSurveyPresentationTimeMs < 500) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, b09.x(gYpYQDQkhfs.kocAG, "ms < 500ms)", jCurrentTimeMillis - lastSurveyPresentationTimeMs), SprigLoggingLevel.WARNING, 0, 4, null);
            return;
        }
        lastSurveyPresentationTimeMs = jCurrentTimeMillis;
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        sprig.b.b.sendVerboseLoggingEvent$default(bVar, "Attempting to present survey using activity: " + activity, null, 0, 6, null);
        sprig.b.b.sendVerboseLoggingEvent$default(bVar, "Current activity is: " + currentActivity, null, 1, 2, null);
        if (!g76.L(currentActivity, activity)) {
            bVar.sendLoggingEvent("Given activity is not current activity", SprigLoggingLevel.WARNING, 2);
        }
        if (a(activity)) {
            if (shouldBlockConversationalSurveyForOrientation$default(this, null, null, 3, null)) {
                dismissActiveSurvey();
            } else {
                a(new l(new WeakReference(activity)));
            }
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        activity.getClass();
        outState.getClass();
        if (shouldRestoreSurveyAfterConfigChange) {
            sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Saving survey restoration state", null, 0, 6, null);
            outState.putBoolean(mgKMENwrbHf.vnHQIGPEt, true);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class i extends co6 implements m45 {
        public static final i INSTANCE = new i();

        public i() {
            super(0);
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m167invoke() {
            sprig.i.b bVar = g.surveySheet;
            if (bVar != null) {
                bVar.onTextFieldBlurred();
            }
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m167invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    public /* synthetic */ class d extends x55 implements x45 {
        public d(Object obj) {
            super(1, 0, g.class, obj, "logError", "logError(Ljava/lang/Throwable;)V");
        }

        public final void invoke(Throwable th) throws JSONException {
            th.getClass();
            ((g) this.receiver).a(th);
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) throws JSONException {
            invoke((Throwable) obj);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class c extends co6 implements m45 {
        final /* synthetic */ x45 $callback;
        final /* synthetic */ String $javascript;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(String str, x45 x45Var) {
            super(0);
            this.$javascript = str;
            this.$callback = x45Var;
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m163invoke() {
            g.INSTANCE.getWebView$userleap_release().executeJavascript(this.$javascript, this.$callback);
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m163invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lcom/userleap/SurveyState;", "surveyState", "Lc1e;", "invoke", "(Lcom/userleap/SurveyState;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class m extends co6 implements x45 {
        final /* synthetic */ x45 $givenCallback;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public m(x45 x45Var) {
            super(1);
            this.$givenCallback = x45Var;
        }

        public final void invoke(SurveyState surveyState) {
            surveyState.getClass();
            if (surveyState == SurveyState.READY) {
                UserLeapInterface.DefaultImpls.presentSurvey$default(g.INSTANCE, null, 1, null);
            }
            x45 x45Var = this.$givenCallback;
            if (x45Var != null) {
                x45Var.invoke(surveyState);
            }
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((SurveyState) obj);
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class h extends co6 implements m45 {
        final /* synthetic */ double $it;
        final /* synthetic */ int $surveyId;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(double d, int i) {
            super(0);
            this.$it = d;
            this.$surveyId = i;
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m166invoke() {
            sprig.i.b bVar = g.surveySheet;
            if (bVar != null) {
                bVar.onSurveyHeightReceived(this.$it, g.INSTANCE.getSurveyLayouts$userleap_release().get(Integer.valueOf(this.$surveyId)));
            }
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m166invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class f extends co6 implements m45 {
        public static final f INSTANCE = new f();

        public f() {
            super(0);
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m165invoke() {
            g.isNetworkAvailable = true;
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, b09.z("Network restored, running resetWebView (isReady=", ")", SdkConfig.INSTANCE.isReady()), null, 0, 6, null);
            g.resetWebView.run();
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m165invoke();
            return c1e.a;
        }
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttribute(String key, String value) {
        key.getClass();
        value.getClass();
        StringBuilder sb = new StringBuilder("Sprig('setAttribute', '");
        sb.append(key);
        sb.append("', '");
        executeJavascript$default(this, ka1.v(sb, value, "')"), null, 2, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttribute(String key, int value) {
        key.getClass();
        executeJavascript$default(this, "Sprig('setAttribute', '" + key + "', '" + value + "')", null, 2, null);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class p extends co6 implements m45 {
        final /* synthetic */ Application $applicationRef;
        final /* synthetic */ nya $isCleanedUp;
        final /* synthetic */ EventPayload $payload;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public p(nya nyaVar, Application application, EventPayload eventPayload) {
            super(0);
            this.$isCleanedUp = nyaVar;
            this.$applicationRef = application;
            this.$payload = eventPayload;
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m169invoke() {
            nya nyaVar = this.$isCleanedUp;
            if (nyaVar.a) {
                return;
            }
            nyaVar.a = true;
            this.$applicationRef.unregisterActivityLifecycleCallbacks(igf.a);
            String event = this.$payload.getEvent();
            event.getClass();
            igf.b.remove(event);
            sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, "trackAndPresent lifecycle cleanup completed", null, 0, 6, null);
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m169invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lcom/userleap/SurveyState;", "surveyState", "Lc1e;", "invoke", "(Lcom/userleap/SurveyState;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class k extends co6 implements x45 {
        final /* synthetic */ WeakReference<Activity> $this_present;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public k(WeakReference<Activity> weakReference) {
            super(1);
            this.$this_present = weakReference;
        }

        public static final void a(Activity activity) {
            activity.getClass();
            g gVar = g.INSTANCE;
            if (g.shouldBlockConversationalSurveyForOrientation$default(gVar, null, null, 3, null)) {
                gVar.dismissActiveSurvey();
                return;
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (jCurrentTimeMillis - g.lastSurveyPresentationTimeMs < 500) {
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Survey presentation (via trackAndPresent) debounced - too soon after last presentation", SprigLoggingLevel.WARNING, 0, 4, null);
                return;
            }
            g.lastSurveyPresentationTimeMs = jCurrentTimeMillis;
            gVar.a().removeCallbacks(g.resetWebView);
            sprig.i.b bVar = g.surveySheet;
            if (bVar != null) {
                try {
                    bVar.dismiss();
                } catch (Exception e) {
                    sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error dismissing existing survey in trackAndPresent: ", e.getMessage()), SprigLoggingLevel.WARNING, 0, 4, null);
                }
            }
            g.surveySheet = null;
            g.surveySheet = new sprig.i.b(activity);
            sprig.i.b bVar2 = g.surveySheet;
            if (bVar2 != null) {
                bVar2.show();
            }
        }

        public final void invoke(SurveyState surveyState) {
            surveyState.getClass();
            Activity activity = this.$this_present.get();
            if (activity != null) {
                g gVar = g.INSTANCE;
                if (gVar.a(activity) && surveyState == SurveyState.READY && !g.shouldBlockConversationalSurveyForOrientation$default(gVar, null, null, 3, null)) {
                    activity.runOnUiThread(new sprig.b.m(0, activity));
                }
            }
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((SurveyState) obj);
            return c1e.a;
        }
    }

    @Override // com.userleap.UserLeapInterface
    public void setVisitorAttributes(Map<String, String> attributes) {
        attributes.getClass();
        executeJavascript$default(this, "Sprig('setAttributes', " + new JSONObject(attributes) + ")", null, 2, null);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"sprig/b/g$j", "Landroid/content/ComponentCallbacks;", "Landroid/content/res/Configuration;", "newConfig", "Lc1e;", "onConfigurationChanged", "(Landroid/content/res/Configuration;)V", "onLowMemory", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class j implements ComponentCallbacks {
        @Override // android.content.ComponentCallbacks
        public void onConfigurationChanged(Configuration newConfig) {
            newConfig.getClass();
            g.INSTANCE.a(newConfig);
        }

        @Override // android.content.ComponentCallbacks
        public void onLowMemory() {
        }
    }

    /* JADX INFO: renamed from: sprig.b.g$g, reason: collision with other inner class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"", "dismiss", "Lc1e;", "invoke", "(Z)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class C0008g extends co6 implements x45 {
        final /* synthetic */ String $data;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0008g(String str) {
            super(1);
            this.$data = str;
        }

        public final void invoke(boolean z) throws JSONException {
            g.shouldDismissOnPageChange = z;
            if (!z) {
                sprig.b.c.INSTANCE.clearRegisteredEvents();
            }
            while (!g.javaScriptExecutionQueue.isEmpty()) {
                String str = (String) g.javaScriptExecutionQueue.poll();
                if (str != null) {
                    g.executeJavascript$default(g.INSTANCE, str, null, 2, null);
                }
            }
            g.INSTANCE.onEvent("SDK_READY", this.$data);
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) throws JSONException {
            invoke(((Boolean) obj).booleanValue());
            return c1e.a;
        }
    }

    @Override // com.userleap.UserLeapInterface
    public void configure(Context context, String environmentId2) {
        context.getClass();
        environmentId2.getClass();
        configure(context, environmentId2, null, null);
    }

    @Override // com.userleap.UserLeapInterface
    public void presentSurveyWithId(String surveyId) {
        surveyId.getClass();
        presentSurveyWithId(surveyId, null);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0003\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0001\u0010\u0002"}, d2 = {"Lc1e;", "invoke", "()V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class e extends co6 implements m45 {
        public static final e INSTANCE = new e();

        public e() {
            super(0);
        }

        /* JADX INFO: renamed from: invoke, reason: collision with other method in class */
        public final void m164invoke() {
            sprig.i.b bVar;
            try {
                if (g.shouldResetOnResume) {
                    sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Resetting " + n1b.a.b(sprig.b.h.class).j() + " on activity resume", null, 0, 6, null);
                    g.resetWebView.run();
                    g.shouldResetOnResume = false;
                }
                if (g.shouldRestoreSurveyAfterConfigChange || (bVar = g.surveySheet) == null || !bVar.isShowing()) {
                    return;
                }
                sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Survey successfully restored after config change", null, 0, 6, null);
            } catch (Exception e) {
                sprig.b.b.sendVerboseLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("Error in onActivityResumed: ", e.getMessage()), SprigLoggingLevel.ERROR, 0, 4, null);
                g.shouldDismissOnResume = false;
                g.shouldResetOnResume = false;
                g.shouldRestoreSurveyAfterConfigChange = false;
            }
        }

        @Override // defpackage.m45
        public /* bridge */ /* synthetic */ Object invoke() {
            m164invoke();
            return c1e.a;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0001\u001a\u00020\u0000H\n¢\u0006\u0004\b\u0003\u0010\u0004"}, d2 = {"Lcom/userleap/SprigSurveyResult;", "result", "Lc1e;", "invoke", "(Lcom/userleap/SprigSurveyResult;)V", "<anonymous>"}, k = 3, mv = {1, 8, 0})
    public static final class o extends co6 implements x45 {
        final /* synthetic */ m45 $cleanup;
        final /* synthetic */ Runnable $cleanupTimeout;
        final /* synthetic */ EventPayload $payload;
        final /* synthetic */ WeakReference<Activity> $weakActivity;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public o(Runnable runnable, WeakReference<Activity> weakReference, EventPayload eventPayload, m45 m45Var) {
            super(1);
            this.$cleanupTimeout = runnable;
            this.$weakActivity = weakReference;
            this.$payload = eventPayload;
            this.$cleanup = m45Var;
        }

        public final void invoke(SprigSurveyResult sprigSurveyResult) {
            boolean z;
            sprigSurveyResult.getClass();
            try {
                g gVar = g.INSTANCE;
                gVar.a().removeCallbacks(this.$cleanupTimeout);
                Activity activity = this.$weakActivity.get();
                if (g.shouldDismissOnPageChange) {
                    if (activity != null) {
                        igf igfVar = igf.a;
                        String event = this.$payload.getEvent();
                        event.getClass();
                        WeakReference weakReference = (WeakReference) igf.b.get(event);
                        Activity activity2 = weakReference != null ? (Activity) weakReference.get() : null;
                        z = activity2 != null && activity2.equals(activity);
                    }
                }
                m45 shouldShowSurveyCallback = this.$payload.getShouldShowSurveyCallback();
                boolean zBooleanValue = shouldShowSurveyCallback != null ? ((Boolean) shouldShowSurveyCallback.invoke()).booleanValue() : true;
                boolean zShouldBlockConversationalSurveyForOrientation$default = g.shouldBlockConversationalSurveyForOrientation$default(gVar, null, null, 3, null);
                if (zBooleanValue && z && !zShouldBlockConversationalSurveyForOrientation$default) {
                    gVar.getPresent$userleap_release(this.$weakActivity).invoke(sprigSurveyResult.getSurveyState());
                } else {
                    g.executeJavascript$default(gVar, "Sprig('dismissActiveSurvey')", null, 2, null);
                }
                this.$cleanup.invoke();
            } catch (Throwable th) {
                this.$cleanup.invoke();
                throw th;
            }
        }

        @Override // defpackage.x45
        public /* bridge */ /* synthetic */ Object invoke(Object obj) {
            invoke((SprigSurveyResult) obj);
            return c1e.a;
        }
    }

    public static final void c(m45 m45Var) {
        m45Var.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "trackAndPresent callback timeout - forcing cleanup", SprigLoggingLevel.WARNING, 0, 4, null);
        m45Var.invoke();
    }

    public final boolean c() {
        return lastWebViewResponseTimestamp != 0 && System.currentTimeMillis() - lastWebViewResponseTimestamp > 180000;
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void trackAndPresent(String event, m15 fromActivity) {
        event.getClass();
        fromActivity.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: trackAndPresent. Using Non-Deprecated call.", SprigLoggingLevel.WARNING, 0, 4, null);
        trackAndPresent(new EventPayload(event, null, null, null, null, null, null, 120, null), fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void trackAndPresent(String event, String userId, m15 fromActivity) {
        event.getClass();
        fromActivity.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: trackAndPresent. Using Non-Deprecated call", SprigLoggingLevel.WARNING, 0, 4, null);
        trackAndPresent(new EventPayload(event, userId, null, null, null, null, null, 120, null), fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void trackAndPresent(String event, String userId, String partnerAnonymousId, m15 fromActivity) {
        event.getClass();
        fromActivity.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: trackAndPresent. Using Non-Deprecated call", SprigLoggingLevel.WARNING, 0, 4, null);
        trackAndPresent(new EventPayload(event, userId, partnerAnonymousId, null, null, null, null, 120, null), fromActivity);
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, x45 callback) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, callback: ((SurveyState) -> Unit)?)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, null, null, null, null, null, callback, 48, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, x45 callback) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, userId: String?, callback: ((SurveyState) -> Unit)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, userId, null, null, null, null, callback, 48, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, userId: String?)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, userId, partnerAnonymousId, null, null, null, null, 32, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId, x45 callback) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, UserId: String? partnerAnonymousId: String?, callback: ((SurveyState) -> Unit)?)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, userId, partnerAnonymousId, null, null, null, callback, 48, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, Map<String, ? extends Object> properties) {
        event.getClass();
        properties.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, properties: Map<String, Any>)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, null, null, properties, null, null, null, 32, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, Map<String, ? extends Object> properties, x45 callback) {
        event.getClass();
        properties.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, properties: Map<String, Any>, callback: ((SurveyState) -> Unit)?)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, null, null, properties, null, null, callback, 48, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, Map<String, ? extends Object> properties, x45 callback) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, userUd: String?, propertis: Map<String, Any>?, callback: ((SurveyState) -> Unit)?)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, userId, null, properties, null, null, callback, 48, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId, Map<String, ? extends Object> properties) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, userId: String?, partnerAnonymousId: String?, properties: Map<String, Any>?)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, userId, partnerAnonymousId, properties, null, null, null, 32, null));
    }

    @Override // com.userleap.UserLeapInterface
    @z73
    public void track(String event, String userId, String partnerAnonymousId, Map<String, ? extends Object> properties, x45 callback) {
        event.getClass();
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Deprecated SDK API call: track. Using Non-Deprecated call: track(event: String, userId: String?, partnerAnonymousId: String?, properties: Map<String, Any>?, callback: ((SurveyState) -> Unit)?)", SprigLoggingLevel.WARNING, 0, 4, null);
        track(new EventPayload(event, userId, partnerAnonymousId, properties, null, null, callback, 48, null));
    }

    public static final void a(AtomicBoolean atomicBoolean) {
        atomicBoolean.getClass();
        if (atomicBoolean.get()) {
            return;
        }
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        SprigLoggingLevel sprigLoggingLevel = SprigLoggingLevel.ERROR;
        sprig.b.b.sendLoggingEvent$default(bVar, "Configuration timeout - no activity became available within timeout period", sprigLoggingLevel, 0, 4, null);
        sprig.j.a aVar = configurationActivityListener;
        if (aVar != null) {
            sprig.j.b.INSTANCE.removeActivityChangeListener(aVar);
        }
        configurationActivityListener = null;
        sprig.b.b.sendLoggingEvent$default(bVar, "Timeout diagnostics - hasConfigured: " + hasConfigured + ", webView initialized: " + (webView != null), sprigLoggingLevel, 0, 4, null);
    }

    public static final void a(Context context, String str, Map map, m15 m15Var) {
        context.getClass();
        str.getClass();
        INSTANCE.b(context, str, map, m15Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(com.userleap.EventPayload r17, java.lang.String r18, com.userleap.SurveyState r19) {
        /*
            Method dump skipped, instruction units count: 220
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: sprig.b.g.a(com.userleap.EventPayload, java.lang.String, com.userleap.SurveyState):void");
    }

    public final void a(String javascript, x45 callback) throws JSONException {
        if (SdkConfig.INSTANCE.isReady()) {
            if (c()) {
                javaScriptExecutionQueue.add(javascript);
                b();
                return;
            } else {
                a(new c(javascript, callback));
                return;
            }
        }
        sprig.b.b.sendWebSDKLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("[JSQ]: ", javascript), null, null, false, 6, null);
        javaScriptExecutionQueue.add(javascript);
    }

    public final boolean a(Integer surveyId, Activity activity) {
        if (surveyId == null && (surveyId = activeSurveyId) == null) {
            return false;
        }
        int iIntValue = surveyId.intValue();
        if ((activity == null && (activity = sprig.j.b.INSTANCE.getCurrentActivity()) == null) || !g76.L(surveyLayouts.get(Integer.valueOf(iIntValue)), sprig.b.j.CONVERSATIONAL) || !sprig.b.j.INSTANCE.isPhoneLandscape(activity)) {
            return false;
        }
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Conversational survey blocked/dismissed due to phone landscape orientation", SprigLoggingLevel.WARNING, 0, 4, null);
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean a(Activity activity) {
        if (!SdkConfig.INSTANCE.isReady()) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "SDK not ready, cannot present survey.", SprigLoggingLevel.ERROR, 0, 4, null);
            return false;
        }
        sprig.i.b bVar = surveySheet;
        if (bVar != null && bVar.isShowing()) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Survey already active, cannot present another.", SprigLoggingLevel.ERROR, 0, 4, null);
            return false;
        }
        if (!activity.isFinishing() && !activity.isDestroyed()) {
            if (webView == null) {
                sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, km4.y(n1b.a.b(sprig.b.h.class).j(), pUlNWdybf.QgzjuZ), SprigLoggingLevel.ERROR, 0, 4, null);
                return false;
            }
            if (!(activity instanceof iy6)) {
                return false;
            }
            iy6 iy6Var = (iy6) activity;
            if (((ky6) iy6Var.getLifecycle()).d.isAtLeast(vx6.RESUMED)) {
                return true;
            }
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Activity not resumed, cannot present survey: " + ((ky6) iy6Var.getLifecycle()).d, SprigLoggingLevel.ERROR, 0, 4, null);
            return false;
        }
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Activity is finishing or destroyed, cannot present survey.", SprigLoggingLevel.ERROR, 0, 4, null);
        return false;
    }

    public final boolean a(String description) {
        if (SdkConfig.INSTANCE.isReady()) {
            return false;
        }
        sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, ka1.r("SDK not ready. Ignoring ", description), SprigLoggingLevel.WARNING, 0, 4, null);
        return true;
    }

    public final void a(m45 function) {
        a().post(new wm(7, function));
    }

    public final void a(Throwable exception) throws JSONException {
        String message = exception.getMessage();
        StackTraceElement[] stackTrace = exception.getStackTrace();
        StringBuilder sbU = lv8.u("Sprig('postError', { message: '", message, "', stack: ");
        sbU.append(stackTrace);
        sbU.append(" });");
        executeJavascript$default(this, sbU.toString(), null, 2, null);
    }

    public final void a(x45 listener) throws JSONException {
        AtomicBoolean atomicBoolean = new AtomicBoolean(false);
        fhf fhfVar = new fhf(atomicBoolean, 3, listener);
        getWebView$userleap_release().setDismissOnPageChangeListener(new mt(atomicBoolean, fhfVar, listener, 12));
        a().postDelayed(fhfVar, 5000L);
        executeJavascript$default(this, "android_hook.getDismissOnPageChange(Sprig._config.dismissOnPageChange)", null, 2, null);
    }

    public static final void a(AtomicBoolean atomicBoolean, x45 x45Var) {
        atomicBoolean.getClass();
        x45Var.getClass();
        if (atomicBoolean.compareAndSet(false, true)) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "getDismissOnPageChange timed out, proceeding with default (true)", SprigLoggingLevel.WARNING, 0, 4, null);
            INSTANCE.getWebView$userleap_release().setDismissOnPageChangeListener(null);
            x45Var.invoke(Boolean.TRUE);
        }
    }

    public static final void a(AtomicBoolean atomicBoolean, Runnable runnable, x45 x45Var, boolean z) {
        atomicBoolean.getClass();
        runnable.getClass();
        x45Var.getClass();
        if (atomicBoolean.compareAndSet(false, true)) {
            INSTANCE.a().removeCallbacks(runnable);
            x45Var.invoke(Boolean.valueOf(z));
        }
        INSTANCE.getWebView$userleap_release().setDismissOnPageChangeListener(null);
    }

    public static final void a(ViewGroup viewGroup) {
        viewGroup.getClass();
        g gVar = INSTANCE;
        gVar.getWebView$userleap_release().setLayoutParams(new RelativeLayout.LayoutParams(-1, -2));
        gVar.getWebView$userleap_release().requestLayout();
        viewGroup.requestLayout();
    }

    public final void a(Context context) {
        if (orientationCallbacksRegistered) {
            return;
        }
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        ((Application) applicationContext).registerComponentCallbacks(orientationCallbacks);
        orientationCallbacksRegistered = true;
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Orientation ComponentCallbacks registered", null, 0, 6, null);
    }

    public final void a(Configuration newConfig) {
        sprig.i.b bVar;
        Integer num = activeSurveyId;
        if (num != null && g76.L(surveyLayouts.get(num), sprig.b.j.CONVERSATIONAL) && sprig.b.j.INSTANCE.isPhoneLandscape(newConfig) && (bVar = surveySheet) != null && bVar.isShowing()) {
            sprig.b.b.sendLoggingEvent$default(sprig.b.b.INSTANCE, "Dismissing conversational survey due to orientation change (ComponentCallbacks)", SprigLoggingLevel.INFO, 0, 4, null);
            shouldRestoreSurveyAfterConfigChange = false;
            isHandlingConfigChange = false;
            isRestoringAfterConfigChange = false;
            dismissActiveSurvey();
        }
    }

    public final Handler a() {
        return (Handler) sdkHandler.getValue();
    }

    public static final void a(SprigEvent sprigEvent) {
        sprigEvent.getClass();
        Integer surveyId = sprigEvent.getSurveyId();
        if (surveyId != null) {
            sprig.view.a.INSTANCE.get$userleap_release().surveyForSessionHasBeenAnswered(surveyId.intValue());
        }
    }

    public final void b() throws JSONException {
        staleWebViewCount++;
        long jCurrentTimeMillis = lastWebViewCreatedOrResetTimestamp > 0 ? (System.currentTimeMillis() - lastWebViewCreatedOrResetTimestamp) / 1000 : -1L;
        sprig.b.b bVar = sprig.b.b.INSTANCE;
        int i2 = staleWebViewCount;
        String str = visitorId;
        StringBuilder sb = new StringBuilder("JIT Web View Reset: staleCount: ");
        sb.append(i2);
        sb.append(", secondsSinceReset: ");
        sb.append(jCurrentTimeMillis);
        sprig.b.b.sendLoggingEvent$default(bVar, ka1.v(sb, ", visitorID: ", str), null, 0, 6, null);
        sprig.j.e eVar = logger;
        StringBuilder sbT = y30.t(staleWebViewCount, "visitorID: ", visitorId, ", staleCount: ", ", secondsSinceReset: ");
        sbT.append(jCurrentTimeMillis);
        sprig.j.e.logError$default(eVar, "JIT Android Web View Reset", sbT.toString(), null, null, null, null, 60, null);
        recreateWebViewIfSafe$userleap_release();
    }

    public static final void b(m45 m45Var) {
        Object ajbVar;
        m45Var.getClass();
        try {
            m45Var.invoke();
            ajbVar = c1e.a;
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        g gVar = INSTANCE;
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            gVar.a(thB);
        }
    }

    public final String b(String str) {
        if (str != null && str.length() != 0) {
            return ev6.x("'", str, "'");
        }
        return "undefined";
    }

    public final void b(Context context) {
        j();
        sprig.b.b.sendEngineeringLoggingEvent$default(sprig.b.b.INSTANCE, "Setting up ConnectivityManager listener with context: " + context.getApplicationContext(), null, 0, 6, null);
        Object systemService = context.getApplicationContext().getSystemService("connectivity");
        systemService.getClass();
        ConnectivityManager connectivityManager2 = (ConnectivityManager) systemService;
        connectivityManager = connectivityManager2;
        connectivityManager2.registerNetworkCallback(new NetworkRequest.Builder().addCapability(12).addTransportType(1).addTransportType(0).build(), this);
    }

    public static final void b(SprigEvent sprigEvent) {
        sprigEvent.getClass();
        Integer surveyId = sprigEvent.getSurveyId();
        if (surveyId != null) {
            sprig.view.a.INSTANCE.get$userleap_release().surveyForSessionHasEnded(surveyId.intValue());
        }
    }
}
