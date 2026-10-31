package androidx.compose.ui.node;

import a3.f;
import android.view.View;
import androidx.compose.ui.graphics.Canvas;
import b3.c2;
import b3.d2;
import b3.e2;
import b3.f2;
import b3.i2;
import b3.n2;
import b3.r0;
import c2.j;
import c3.c3;
import c3.e3;
import c3.g;
import c3.n3;
import c3.r3;
import c3.u1;
import c3.v1;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import i2.z;
import j3.s;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import q2.a;
import q3.m;
import q3.o;
import r3.a0;
import v2.c0;
import v2.r;
import y3.c;
import y3.n;
import z2.h1;
import z2.k1;
import z2.o0;

@Metadata(d1 = {"\u0000\u008e\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\b`\u0018\u0000 ä\u00012\u00020\u0001:\u0003å\u0001EJ5\u0010\t\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u0004H&¢\u0006\u0004\b\t\u0010\nJ+\u0010\u000b\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u0004H&¢\u0006\u0004\b\u000b\u0010\fJ\u0017\u0010\r\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\r\u0010\u000eJ\u0017\u0010\u0010\u001a\u00020\b2\u0006\u0010\u000f\u001a\u00020\u0002H&¢\u0006\u0004\b\u0010\u0010\u000eJ\u0017\u0010\u0011\u001a\u00020\b2\u0006\u0010\u000f\u001a\u00020\u0002H&¢\u0006\u0004\b\u0011\u0010\u000eJ\u0017\u0010\u0012\u001a\u00020\b2\u0006\u0010\u000f\u001a\u00020\u0002H&¢\u0006\u0004\b\u0012\u0010\u000eJ\u0017\u0010\u0017\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0013H&¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u001a\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u0013H&¢\u0006\u0004\b\u0019\u0010\u0016J\u0017\u0010\u001b\u001a\u00020\b2\u0006\u0010\u000f\u001a\u00020\u0002H&¢\u0006\u0004\b\u001b\u0010\u000eJ\u0019\u0010\u001d\u001a\u00020\b2\b\b\u0002\u0010\u001c\u001a\u00020\u0004H&¢\u0006\u0004\b\u001d\u0010\u001eJ\u001f\u0010\u001d\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010 \u001a\u00020\u001fH&¢\u0006\u0004\b!\u0010\"J!\u0010#\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u0004H&¢\u0006\u0004\b#\u0010$Jc\u00101\u001a\u00020028\u0010,\u001a4\u0012\u0013\u0012\u00110&¢\u0006\f\b'\u0012\b\b(\u0012\u0004\b\b()\u0012\u0015\u0012\u0013\u0018\u00010*¢\u0006\f\b'\u0012\b\b(\u0012\u0004\b\b(+\u0012\u0004\u0012\u00020\b0%2\f\u0010.\u001a\b\u0012\u0004\u0012\u00020\b0-2\n\b\u0002\u0010/\u001a\u0004\u0018\u00010*H&¢\u0006\u0004\b1\u00102J\u000f\u00103\u001a\u00020\bH&¢\u0006\u0004\b3\u00104J\u0017\u00105\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b5\u0010\u000eJ\u0017\u00106\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b6\u0010\u000eJ\u001f\u00109\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u00108\u001a\u000207H\u0016¢\u0006\u0004\b9\u0010:J\u001f\u0010;\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u00108\u001a\u000207H\u0016¢\u0006\u0004\b;\u0010:J\u001b\u0010?\u001a\u00020\b2\n\u0010>\u001a\u00060<j\u0002`=H'¢\u0006\u0004\b?\u0010@J\u001d\u0010B\u001a\u00020\b2\f\u0010A\u001a\b\u0012\u0004\u0012\u00020\b0-H&¢\u0006\u0004\bB\u0010CJ\u000f\u0010D\u001a\u00020\bH&¢\u0006\u0004\bD\u00104J\u0017\u0010F\u001a\u00020\b2\u0006\u0010A\u001a\u00020EH&¢\u0006\u0004\bF\u0010GJ9\u0010M\u001a\u00020J2'\u0010L\u001a#\b\u0001\u0012\u0004\u0012\u00020H\u0012\n\u0012\b\u0012\u0004\u0012\u00020J0I\u0012\u0006\u0012\u0004\u0018\u00010H0%¢\u0006\u0002\bKH¦@¢\u0006\u0004\bM\u0010NJ\u000f\u0010O\u001a\u00020\bH\u0016¢\u0006\u0004\bO\u00104J\u000f\u0010P\u001a\u00020\bH\u0016¢\u0006\u0004\bP\u00104J\u000f\u0010Q\u001a\u00020\bH\u0016¢\u0006\u0004\bQ\u00104J\u000f\u0010R\u001a\u00020\bH\u0016¢\u0006\u0004\bR\u00104J\u0017\u0010U\u001a\u00020\b2\u0006\u0010T\u001a\u00020SH\u0016¢\u0006\u0004\bU\u0010VJ\u0017\u0010Z\u001a\u00020\b2\u0006\u0010W\u001a\u00020\u0013H\u0016¢\u0006\u0004\bX\u0010YR\u001a\u0010_\u001a\u00020[8&X§\u0004¢\u0006\f\u0012\u0004\b^\u00104\u001a\u0004\b\\\u0010]R\u0014\u0010b\u001a\u00020\u00028&X¦\u0004¢\u0006\u0006\u001a\u0004\b`\u0010aR\u001a\u0010f\u001a\b\u0012\u0004\u0012\u00020\u00020c8&X¦\u0004¢\u0006\u0006\u001a\u0004\bd\u0010eR\u0014\u0010j\u001a\u00020g8&X¦\u0004¢\u0006\u0006\u001a\u0004\bh\u0010iR\u0014\u0010n\u001a\u00020k8&X¦\u0004¢\u0006\u0006\u001a\u0004\bl\u0010mR\u0014\u0010r\u001a\u00020o8&X¦\u0004¢\u0006\u0006\u001a\u0004\bp\u0010qR\u0014\u0010v\u001a\u00020s8&X¦\u0004¢\u0006\u0006\u001a\u0004\bt\u0010uR\u0014\u0010z\u001a\u00020w8&X¦\u0004¢\u0006\u0006\u001a\u0004\bx\u0010yR\u0014\u0010~\u001a\u00020{8&X¦\u0004¢\u0006\u0006\u001a\u0004\b|\u0010}R\u0017\u0010\u0082\u0001\u001a\u00020\u007f8&X¦\u0004¢\u0006\b\u001a\u0006\b\u0080\u0001\u0010\u0081\u0001R\u0018\u0010\u0086\u0001\u001a\u00030\u0083\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b\u0084\u0001\u0010\u0085\u0001R\u0018\u0010\u008a\u0001\u001a\u00030\u0087\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b\u0088\u0001\u0010\u0089\u0001R\u0018\u0010\u008e\u0001\u001a\u00030\u008b\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b\u008c\u0001\u0010\u008d\u0001R\u001a\u0010\u0092\u0001\u001a\u0005\u0018\u00010\u008f\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b\u0090\u0001\u0010\u0091\u0001R\u001a\u0010\u0096\u0001\u001a\u0005\u0018\u00010\u0093\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b\u0094\u0001\u0010\u0095\u0001R\u0018\u0010\u009a\u0001\u001a\u00030\u0097\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b\u0098\u0001\u0010\u0099\u0001R\u0018\u0010\u009e\u0001\u001a\u00030\u009b\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b\u009c\u0001\u0010\u009d\u0001R\u0018\u0010¢\u0001\u001a\u00030\u009f\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b \u0001\u0010¡\u0001R\u0018\u0010¦\u0001\u001a\u00030£\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b¤\u0001\u0010¥\u0001R\u0018\u0010ª\u0001\u001a\u00030§\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b¨\u0001\u0010©\u0001R\u0018\u0010®\u0001\u001a\u00030«\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b¬\u0001\u0010\u00ad\u0001R\u0018\u0010²\u0001\u001a\u00030¯\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b°\u0001\u0010±\u0001R\u0018\u0010¶\u0001\u001a\u00030³\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b´\u0001\u0010µ\u0001R\u0018\u0010º\u0001\u001a\u00030·\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b¸\u0001\u0010¹\u0001R\u0018\u0010¾\u0001\u001a\u00030»\u00018&X¦\u0004¢\u0006\b\u001a\u0006\b¼\u0001\u0010½\u0001R)\u0010Ã\u0001\u001a\u00020\u00042\u0007\u0010¿\u0001\u001a\u00020\u00048&@gX¦\u000e¢\u0006\u000f\u001a\u0006\bÀ\u0001\u0010Á\u0001\"\u0005\bÂ\u0001\u0010\u001eR\u0018\u0010Ç\u0001\u001a\u00030Ä\u00018&X¦\u0004¢\u0006\b\u001a\u0006\bÅ\u0001\u0010Æ\u0001R\u0018\u0010Ë\u0001\u001a\u00030È\u00018&X¦\u0004¢\u0006\b\u001a\u0006\bÉ\u0001\u0010Ê\u0001R\u0018\u0010Ï\u0001\u001a\u00030Ì\u00018&X¦\u0004¢\u0006\b\u001a\u0006\bÍ\u0001\u0010Î\u0001R\u0018\u0010Ó\u0001\u001a\u00030Ð\u00018&X¦\u0004¢\u0006\b\u001a\u0006\bÑ\u0001\u0010Ò\u0001R\u0018\u0010×\u0001\u001a\u00030Ô\u00018&X¦\u0004¢\u0006\b\u001a\u0006\bÕ\u0001\u0010Ö\u0001R\u0018\u0010Û\u0001\u001a\u00030Ø\u00018VX\u0096\u0004¢\u0006\b\u001a\u0006\bÙ\u0001\u0010Ú\u0001R\u0018\u0010ß\u0001\u001a\u00030Ü\u00018&X¦\u0004¢\u0006\b\u001a\u0006\bÝ\u0001\u0010Þ\u0001R\u001a\u0010ã\u0001\u001a\u0005\u0018\u00010à\u00018VX\u0096\u0004¢\u0006\b\u001a\u0006\bá\u0001\u0010â\u0001ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006æ\u0001À\u0006\u0001"}, d2 = {"Landroidx/compose/ui/node/Owner;", "Lv2/c0;", "Landroidx/compose/ui/node/LayoutNode;", "layoutNode", b.f42142b, "affectsLookahead", "forceRequest", "scheduleMeasureAndLayout", b.f42142b, "onRequestMeasure", "(Landroidx/compose/ui/node/LayoutNode;ZZZ)V", "onRequestRelayout", "(Landroidx/compose/ui/node/LayoutNode;ZZ)V", "requestOnPositionedCallback", "(Landroidx/compose/ui/node/LayoutNode;)V", "node", "onPreAttach", "onPostAttach", "onDetach", "Lh2/b;", "localPosition", "calculatePositionInWindow-MK-Hz9U", "(J)J", "calculatePositionInWindow", "positionInWindow", "calculateLocalPosition-MK-Hz9U", "calculateLocalPosition", "requestAutofill", "sendPointerUpdate", "measureAndLayout", "(Z)V", "Ly3/a;", "constraints", "measureAndLayout-0kLqBqw", "(Landroidx/compose/ui/node/LayoutNode;J)V", "forceMeasureTheSubtree", "(Landroidx/compose/ui/node/LayoutNode;Z)V", "Lkotlin/Function2;", "Landroidx/compose/ui/graphics/Canvas;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "canvas", "Ll2/b;", "parentLayer", "drawBlock", "Lkotlin/Function0;", "invalidateParentLayer", "explicitLayer", "Lb3/d2;", "createLayer", "(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Ll2/b;)Lb3/d2;", "onSemanticsChange", "()V", "onLayoutChange", "onLayoutNodeDeactivated", b.f42142b, "oldSemanticsId", "onPreLayoutNodeReused", "(Landroidx/compose/ui/node/LayoutNode;I)V", "onPostLayoutNodeReused", "Landroid/view/View;", "Landroidx/compose/ui/viewinterop/InteropView;", "view", "onInteropViewLayoutChange", "(Landroid/view/View;)V", "listener", "registerOnEndApplyChangesListener", "(Lkotlin/jvm/functions/Function0;)V", "onEndApplyChanges", "Lb3/f2;", "registerOnLayoutCompletedListener", "(Lb3/f2;)V", b.f42142b, "Lkotlin/coroutines/Continuation;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "session", "textInputSession", "(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "incrementSensitiveComponentCount", "decrementSensitiveComponentCount", "incrementKeepScreenOnCount", "decrementKeepScreenOnCount", b.f42142b, "frameRate", "voteFrameRate", "(F)V", "delta", "dispatchOnScrollChanged-k-4lQ0M", "(J)V", "dispatchOnScrollChanged", "Lq3/m;", "getFontLoader", "()Lq3/m;", "getFontLoader$annotations", "fontLoader", "getRoot", "()Landroidx/compose/ui/node/LayoutNode;", "root", "Lz/m;", "getLayoutNodes", "()Lz/m;", "layoutNodes", "Lb3/r0;", "getSharedDrawScope", "()Lb3/r0;", "sharedDrawScope", "Lb3/n2;", "getRootForTest", "()Lb3/n2;", "rootForTest", "Lq2/a;", "getHapticFeedBack", "()Lq2/a;", "hapticFeedBack", "Lr2/b;", "getInputModeManager", "()Lr2/b;", "inputModeManager", "Lc3/v1;", "getClipboardManager", "()Lc3/v1;", "clipboardManager", "Lc3/u1;", "getClipboard", "()Lc3/u1;", "clipboard", "Lc3/g;", "getAccessibilityManager", "()Lc3/g;", "accessibilityManager", "Li2/z;", "getGraphicsContext", "()Li2/z;", "graphicsContext", "Lc3/e3;", "getTextToolbar", "()Lc3/e3;", "textToolbar", "Lc2/k;", "getAutofillTree", "()Lc2/k;", "autofillTree", "Lc2/g;", "getAutofill", "()Lc2/g;", "autofill", "Lc2/j;", "getAutofillManager", "()Lc2/j;", "autofillManager", "Ly3/c;", "getDensity", "()Ly3/c;", "density", "Lr3/a0;", "getTextInputService", "()Lr3/a0;", "textInputService", "Lc3/c3;", "getSoftwareKeyboardController", "()Lc3/c3;", "softwareKeyboardController", "Lv2/r;", "getPointerIconService", "()Lv2/r;", "pointerIconService", "Lj3/s;", "getSemanticsOwner", "()Lj3/s;", "semanticsOwner", "Lg2/j;", "getFocusOwner", "()Lg2/j;", "focusOwner", "Lc3/r3;", "getWindowInfo", "()Lc3/r3;", "windowInfo", "Lk3/a;", "getRectManager", "()Lk3/a;", "rectManager", "Lq3/o;", "getFontFamilyResolver", "()Lq3/o;", "fontFamilyResolver", "Ly3/n;", "getLayoutDirection", "()Ly3/n;", "layoutDirection", "value", "getShowLayoutBounds", "()Z", "setShowLayoutBounds", "showLayoutBounds", b.f42142b, "getMeasureIteration", "()J", "measureIteration", "Lc3/n3;", "getViewConfiguration", "()Lc3/n3;", "viewConfiguration", "Lb3/i2;", "getSnapshotObserver", "()Lb3/i2;", "snapshotObserver", "La3/f;", "getModifierLocalManager", "()La3/f;", "modifierLocalManager", "Lkotlin/coroutines/CoroutineContext;", "getCoroutineContext", "()Lkotlin/coroutines/CoroutineContext;", "coroutineContext", "Lz2/h1;", "getPlacementScope", "()Lz2/h1;", "placementScope", "Le2/c;", "getDragAndDropManager", "()Le2/c;", "dragAndDropManager", "Lb3/c2;", "getOutOfFrameExecutor", "()Lb3/c2;", "outOfFrameExecutor", k.O, "b3/e2", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public interface Owner extends c0 {

    @NotNull
    public static final e2 Companion = e2.f17200a;

    static /* synthetic */ d2 createLayer$default(Owner owner, Function2 function2, Function0 function0, l2.b bVar, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: createLayer");
        }
        if ((i5 & 4) != 0) {
            bVar = null;
        }
        return owner.createLayer(function2, function0, bVar);
    }

    static /* synthetic */ void forceMeasureTheSubtree$default(Owner owner, LayoutNode layoutNode, boolean z11, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: forceMeasureTheSubtree");
        }
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        owner.forceMeasureTheSubtree(layoutNode, z11);
    }

    @Deprecated
    static /* synthetic */ void getFontLoader$annotations() {
    }

    static /* synthetic */ void measureAndLayout$default(Owner owner, boolean z11, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: measureAndLayout");
        }
        if ((i5 & 1) != 0) {
            z11 = true;
        }
        owner.measureAndLayout(z11);
    }

    static /* synthetic */ void onRequestMeasure$default(Owner owner, LayoutNode layoutNode, boolean z11, boolean z12, boolean z13, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: onRequestMeasure");
        }
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        if ((i5 & 4) != 0) {
            z12 = false;
        }
        if ((i5 & 8) != 0) {
            z13 = true;
        }
        owner.onRequestMeasure(layoutNode, z11, z12, z13);
    }

    static /* synthetic */ void onRequestRelayout$default(Owner owner, LayoutNode layoutNode, boolean z11, boolean z12, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: onRequestRelayout");
        }
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        if ((i5 & 4) != 0) {
            z12 = false;
        }
        owner.onRequestRelayout(layoutNode, z11, z12);
    }

    /* renamed from: calculateLocalPosition-MK-Hz9U, reason: not valid java name */
    long mo49calculateLocalPositionMKHz9U(long positionInWindow);

    /* renamed from: calculatePositionInWindow-MK-Hz9U, reason: not valid java name */
    long mo50calculatePositionInWindowMKHz9U(long localPosition);

    @NotNull
    d2 createLayer(@NotNull Function2<? super Canvas, ? super l2.b, Unit> drawBlock, @NotNull Function0<Unit> invalidateParentLayer, @Nullable l2.b explicitLayer);

    default void decrementKeepScreenOnCount() {
    }

    default void decrementSensitiveComponentCount() {
    }

    /* renamed from: dispatchOnScrollChanged-k-4lQ0M, reason: not valid java name */
    default void mo51dispatchOnScrollChangedk4lQ0M(long delta) {
    }

    void forceMeasureTheSubtree(@NotNull LayoutNode layoutNode, boolean affectsLookahead);

    @NotNull
    g getAccessibilityManager();

    @Nullable
    c2.g getAutofill();

    @Nullable
    j getAutofillManager();

    @NotNull
    c2.k getAutofillTree();

    @NotNull
    u1 getClipboard();

    @NotNull
    v1 getClipboardManager();

    @NotNull
    CoroutineContext getCoroutineContext();

    @NotNull
    c getDensity();

    @NotNull
    e2.c getDragAndDropManager();

    @NotNull
    g2.j getFocusOwner();

    @NotNull
    o getFontFamilyResolver();

    @NotNull
    m getFontLoader();

    @NotNull
    z getGraphicsContext();

    @NotNull
    a getHapticFeedBack();

    @NotNull
    r2.b getInputModeManager();

    @NotNull
    n getLayoutDirection();

    @NotNull
    z.m getLayoutNodes();

    long getMeasureIteration();

    @NotNull
    f getModifierLocalManager();

    @Nullable
    default c2 getOutOfFrameExecutor() {
        return null;
    }

    @NotNull
    default h1 getPlacementScope() {
        int i5 = k1.f98101b;
        return new o0(this, 1);
    }

    @NotNull
    r getPointerIconService();

    @NotNull
    k3.a getRectManager();

    @NotNull
    LayoutNode getRoot();

    @NotNull
    n2 getRootForTest();

    @NotNull
    s getSemanticsOwner();

    @NotNull
    r0 getSharedDrawScope();

    boolean getShowLayoutBounds();

    @NotNull
    i2 getSnapshotObserver();

    @NotNull
    c3 getSoftwareKeyboardController();

    @NotNull
    a0 getTextInputService();

    @NotNull
    e3 getTextToolbar();

    @NotNull
    n3 getViewConfiguration();

    @NotNull
    r3 getWindowInfo();

    default void incrementKeepScreenOnCount() {
    }

    default void incrementSensitiveComponentCount() {
    }

    @Override // v2.c0
    /* renamed from: localToScreen-MK-Hz9U, reason: not valid java name */
    /* synthetic */ long mo52localToScreenMKHz9U(long j11);

    void measureAndLayout(boolean sendPointerUpdate);

    /* renamed from: measureAndLayout-0kLqBqw, reason: not valid java name */
    void mo53measureAndLayout0kLqBqw(@NotNull LayoutNode layoutNode, long constraints);

    void onDetach(@NotNull LayoutNode node);

    void onEndApplyChanges();

    void onInteropViewLayoutChange(@NotNull View view);

    void onLayoutChange(@NotNull LayoutNode layoutNode);

    void onLayoutNodeDeactivated(@NotNull LayoutNode layoutNode);

    void onPostAttach(@NotNull LayoutNode node);

    default void onPostLayoutNodeReused(@NotNull LayoutNode layoutNode, int oldSemanticsId) {
    }

    void onPreAttach(@NotNull LayoutNode node);

    default void onPreLayoutNodeReused(@NotNull LayoutNode layoutNode, int oldSemanticsId) {
    }

    void onRequestMeasure(@NotNull LayoutNode layoutNode, boolean affectsLookahead, boolean forceRequest, boolean scheduleMeasureAndLayout);

    void onRequestRelayout(@NotNull LayoutNode layoutNode, boolean affectsLookahead, boolean forceRequest);

    void onSemanticsChange();

    void registerOnEndApplyChangesListener(@NotNull Function0<Unit> listener);

    void registerOnLayoutCompletedListener(@NotNull f2 listener);

    void requestAutofill(@NotNull LayoutNode node);

    void requestOnPositionedCallback(@NotNull LayoutNode layoutNode);

    @Override // v2.c0
    /* renamed from: screenToLocal-MK-Hz9U, reason: not valid java name */
    /* synthetic */ long mo54screenToLocalMKHz9U(long j11);

    void setShowLayoutBounds(boolean z11);

    @Nullable
    Object textInputSession(@NotNull Function2<Object, ? super Continuation<?>, ? extends Object> function2, @NotNull Continuation<?> continuation);

    default void voteFrameRate(float frameRate) {
    }
}
