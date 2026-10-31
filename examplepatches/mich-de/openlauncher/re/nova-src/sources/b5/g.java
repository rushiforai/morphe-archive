package b5;

import a5.k0;
import a5.k1;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ClickableSpan;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.List;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final AccessibilityNodeInfo f17551a;

    /* renamed from: b, reason: collision with root package name */
    public int f17552b = -1;

    /* renamed from: c, reason: collision with root package name */
    public int f17553c = -1;

    public g(AccessibilityNodeInfo accessibilityNodeInfo) {
        this.f17551a = accessibilityNodeInfo;
    }

    public static String f(int i5) {
        if (i5 == 1) {
            return "ACTION_FOCUS";
        }
        if (i5 == 2) {
            return "ACTION_CLEAR_FOCUS";
        }
        switch (i5) {
            case 4:
                return "ACTION_SELECT";
            case 8:
                return "ACTION_CLEAR_SELECTION";
            case 16:
                return "ACTION_CLICK";
            case 32:
                return "ACTION_LONG_CLICK";
            case 64:
                return "ACTION_ACCESSIBILITY_FOCUS";
            case 128:
                return "ACTION_CLEAR_ACCESSIBILITY_FOCUS";
            case 256:
                return "ACTION_NEXT_AT_MOVEMENT_GRANULARITY";
            case EventBridgeChannel.QUEUE_CAPACITY /* 512 */:
                return "ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY";
            case 1024:
                return "ACTION_NEXT_HTML_ELEMENT";
            case 2048:
                return "ACTION_PREVIOUS_HTML_ELEMENT";
            case u1.FLAG_APPEARED_IN_PRE_LAYOUT /* 4096 */:
                return "ACTION_SCROLL_FORWARD";
            case UserMetadata.MAX_INTERNAL_KEY_SIZE /* 8192 */:
                return "ACTION_SCROLL_BACKWARD";
            case ReaderJsonLexerKt.BATCH_SIZE /* 16384 */:
                return "ACTION_COPY";
            case SQLiteDatabase.OPEN_NOMUTEX /* 32768 */:
                return "ACTION_PASTE";
            case SQLiteDatabase.OPEN_FULLMUTEX /* 65536 */:
                return "ACTION_CUT";
            case SQLiteDatabase.OPEN_SHAREDCACHE /* 131072 */:
                return "ACTION_SET_SELECTION";
            case SQLiteDatabase.OPEN_PRIVATECACHE /* 262144 */:
                return "ACTION_EXPAND";
            case 524288:
                return "ACTION_COLLAPSE";
            case 2097152:
                return "ACTION_SET_TEXT";
            case 16908354:
                return "ACTION_MOVE_WINDOW";
            case 16908382:
                return "ACTION_SCROLL_IN_DIRECTION";
            default:
                switch (i5) {
                    case 16908342:
                        return "ACTION_SHOW_ON_SCREEN";
                    case 16908343:
                        return "ACTION_SCROLL_TO_POSITION";
                    case 16908344:
                        return "ACTION_SCROLL_UP";
                    case 16908345:
                        return "ACTION_SCROLL_LEFT";
                    case 16908346:
                        return "ACTION_SCROLL_DOWN";
                    case 16908347:
                        return "ACTION_SCROLL_RIGHT";
                    case 16908348:
                        return "ACTION_CONTEXT_CLICK";
                    case 16908349:
                        return "ACTION_SET_PROGRESS";
                    default:
                        switch (i5) {
                            case 16908356:
                                return "ACTION_SHOW_TOOLTIP";
                            case 16908357:
                                return "ACTION_HIDE_TOOLTIP";
                            case 16908358:
                                return "ACTION_PAGE_UP";
                            case 16908359:
                                return "ACTION_PAGE_DOWN";
                            case 16908360:
                                return "ACTION_PAGE_LEFT";
                            case 16908361:
                                return "ACTION_PAGE_RIGHT";
                            case 16908362:
                                return "ACTION_PRESS_AND_HOLD";
                            default:
                                switch (i5) {
                                    case 16908372:
                                        return "ACTION_IME_ENTER";
                                    case 16908373:
                                        return "ACTION_DRAG_START";
                                    case 16908374:
                                        return "ACTION_DRAG_DROP";
                                    case 16908375:
                                        return "ACTION_DRAG_CANCEL";
                                    default:
                                        return "ACTION_UNKNOWN";
                                }
                        }
                }
        }
    }

    public static ClickableSpan[] i(CharSequence charSequence) {
        if (charSequence instanceof Spanned) {
            return (ClickableSpan[]) ((Spanned) charSequence).getSpans(0, charSequence.length(), ClickableSpan.class);
        }
        return null;
    }

    public static g l0(AccessibilityNodeInfo accessibilityNodeInfo) {
        return new g(accessibilityNodeInfo);
    }

    public static g q() {
        return new g(AccessibilityNodeInfo.obtain());
    }

    public final void A(f fVar) {
        this.f17551a.setCollectionInfo(fVar == null ? null : (AccessibilityNodeInfo.CollectionInfo) fVar.f17550a);
    }

    public final void B(f fVar) {
        this.f17551a.setCollectionItemInfo((AccessibilityNodeInfo.CollectionItemInfo) fVar.f17550a);
    }

    public final void C(String str) {
        this.f17551a.setContentDescription(str);
    }

    public final void D() {
        this.f17551a.setContentInvalid(true);
    }

    public final void E(int i5) {
        this.f17551a.setDrawingOrder(i5);
    }

    public final void F(boolean z11) {
        this.f17551a.setEditable(z11);
    }

    public final void G(boolean z11) {
        this.f17551a.setEnabled(z11);
    }

    public final void H(CharSequence charSequence) {
        this.f17551a.setError(charSequence);
    }

    public final void I(boolean z11) {
        this.f17551a.setFocusable(z11);
    }

    public final void J(boolean z11) {
        this.f17551a.setFocused(z11);
    }

    public final void K(boolean z11) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.f17551a.setHeading(z11);
        } else {
            u(2, z11);
        }
    }

    public final void L(boolean z11) {
        this.f17551a.setImportantForAccessibility(z11);
    }

    public final void M(int i5) {
        this.f17551a.setLiveRegion(i5);
    }

    public final void N(boolean z11) {
        this.f17551a.setLongClickable(z11);
    }

    public final void O(int i5) {
        this.f17551a.setMaxTextLength(i5);
    }

    public final void P(int i5) {
        this.f17551a.setMovementGranularities(i5);
    }

    public final void Q(String str) {
        this.f17551a.setPackageName(str);
    }

    public final void R(CharSequence charSequence) {
        int i5 = Build.VERSION.SDK_INT;
        AccessibilityNodeInfo accessibilityNodeInfo = this.f17551a;
        if (i5 >= 28) {
            accessibilityNodeInfo.setPaneTitle(charSequence);
        } else {
            accessibilityNodeInfo.getExtras().putCharSequence("androidx.view.accessibility.AccessibilityNodeInfoCompat.PANE_TITLE_KEY", charSequence);
        }
    }

    public final void S(int i5, View view) {
        this.f17552b = i5;
        this.f17551a.setParent(view, i5);
    }

    public final void T(View view) {
        this.f17552b = -1;
        this.f17551a.setParent(view);
    }

    public final void U(boolean z11) {
        this.f17551a.setPassword(z11);
    }

    public final void V(f fVar) {
        this.f17551a.setRangeInfo((AccessibilityNodeInfo.RangeInfo) fVar.f17550a);
    }

    public final void W(String str) {
        this.f17551a.getExtras().putCharSequence("AccessibilityNodeInfo.roleDescription", str);
    }

    public final void X(boolean z11) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.f17551a.setScreenReaderFocusable(z11);
        } else {
            u(1, z11);
        }
    }

    public final void Y(boolean z11) {
        this.f17551a.setScrollable(z11);
    }

    public final void Z(boolean z11) {
        this.f17551a.setSelected(z11);
    }

    public final void a(int i5) {
        this.f17551a.addAction(i5);
    }

    public final void a0(int i5, View view) {
        this.f17553c = i5;
        this.f17551a.setSource(view, i5);
    }

    public final void b(d dVar) {
        this.f17551a.addAction((AccessibilityNodeInfo.AccessibilityAction) dVar.f17545a);
    }

    public final void b0(CharSequence charSequence) {
        int i5 = Build.VERSION.SDK_INT;
        AccessibilityNodeInfo accessibilityNodeInfo = this.f17551a;
        if (i5 >= 30) {
            k1.i(accessibilityNodeInfo, charSequence);
        } else {
            accessibilityNodeInfo.getExtras().putCharSequence("androidx.view.accessibility.AccessibilityNodeInfoCompat.STATE_DESCRIPTION_KEY", charSequence);
        }
    }

    public final void c(int i5, View view) {
        this.f17551a.addChild(view, i5);
    }

    public final void c0(CharSequence charSequence) {
        this.f17551a.setText(charSequence);
    }

    public final void d(b4.m mVar) {
        this.f17551a.addChild(mVar);
    }

    public final void d0(int i5, int i11) {
        this.f17551a.setTextSelection(i5, i11);
    }

    public final ArrayList e(String str) {
        AccessibilityNodeInfo accessibilityNodeInfo = this.f17551a;
        ArrayList<Integer> integerArrayList = accessibilityNodeInfo.getExtras().getIntegerArrayList(str);
        if (integerArrayList != null) {
            return integerArrayList;
        }
        ArrayList<Integer> arrayList = new ArrayList<>();
        accessibilityNodeInfo.getExtras().putIntegerArrayList(str, arrayList);
        return arrayList;
    }

    public final void e0(int i5, View view) {
        this.f17551a.setTraversalAfter(view, i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        AccessibilityNodeInfo accessibilityNodeInfo = gVar.f17551a;
        AccessibilityNodeInfo accessibilityNodeInfo2 = this.f17551a;
        if (accessibilityNodeInfo2 == null) {
            if (accessibilityNodeInfo != null) {
                return false;
            }
        } else if (!accessibilityNodeInfo2.equals(accessibilityNodeInfo)) {
            return false;
        }
        return this.f17553c == gVar.f17553c && this.f17552b == gVar.f17552b;
    }

    public final void f0(View view) {
        this.f17551a.setTraversalAfter(view);
    }

    public final boolean g(int i5) {
        Bundle extras = this.f17551a.getExtras();
        return extras != null && (extras.getInt("androidx.view.accessibility.AccessibilityNodeInfoCompat.BOOLEAN_PROPERTY_KEY", 0) & i5) == i5;
    }

    public final void g0(int i5, View view) {
        this.f17551a.setTraversalBefore(view, i5);
    }

    public final void h(Rect rect) {
        this.f17551a.getBoundsInParent(rect);
    }

    public final void h0(b4.m mVar) {
        this.f17551a.setTraversalBefore(mVar);
    }

    public final int hashCode() {
        AccessibilityNodeInfo accessibilityNodeInfo = this.f17551a;
        if (accessibilityNodeInfo == null) {
            return 0;
        }
        return accessibilityNodeInfo.hashCode();
    }

    public final void i0(String str) {
        this.f17551a.setViewIdResourceName(str);
    }

    public final f j() {
        AccessibilityNodeInfo.CollectionItemInfo collectionItemInfo = this.f17551a.getCollectionItemInfo();
        if (collectionItemInfo != null) {
            return new f(collectionItemInfo);
        }
        return null;
    }

    public final void j0(boolean z11) {
        this.f17551a.setVisibleToUser(z11);
    }

    public final Bundle k() {
        return this.f17551a.getExtras();
    }

    public final AccessibilityNodeInfo k0() {
        return this.f17551a;
    }

    public final int l() {
        return this.f17551a.getMovementGranularities();
    }

    public final CharSequence m() {
        boolean zIsEmpty = e("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY").isEmpty();
        AccessibilityNodeInfo accessibilityNodeInfo = this.f17551a;
        if (zIsEmpty) {
            return accessibilityNodeInfo.getText();
        }
        ArrayList arrayListE = e("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_START_KEY");
        ArrayList arrayListE2 = e("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_END_KEY");
        ArrayList arrayListE3 = e("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_FLAGS_KEY");
        ArrayList arrayListE4 = e("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ID_KEY");
        SpannableString spannableString = new SpannableString(TextUtils.substring(accessibilityNodeInfo.getText(), 0, accessibilityNodeInfo.getText().length()));
        for (int i5 = 0; i5 < arrayListE.size(); i5++) {
            spannableString.setSpan(new a(((Integer) arrayListE4.get(i5)).intValue(), this, accessibilityNodeInfo.getExtras().getInt("androidx.view.accessibility.AccessibilityNodeInfoCompat.SPANS_ACTION_ID_KEY")), ((Integer) arrayListE.get(i5)).intValue(), ((Integer) arrayListE2.get(i5)).intValue(), ((Integer) arrayListE3.get(i5)).intValue());
        }
        return spannableString;
    }

    public final boolean n() {
        return this.f17551a.isClickable();
    }

    public final boolean o() {
        return this.f17551a.isFocusable();
    }

    public final boolean p() {
        return this.f17551a.isFocused();
    }

    public final void r(boolean z11) {
        if (Build.VERSION.SDK_INT >= 34) {
            k0.l(this.f17551a, z11);
        } else {
            u(64, z11);
        }
    }

    public final void s(boolean z11) {
        this.f17551a.setAccessibilityFocused(z11);
    }

    public final void t(ArrayList arrayList) {
        this.f17551a.setAvailableExtraData(arrayList);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        Rect rect = new Rect();
        h(rect);
        sb2.append("; boundsInParent: " + rect);
        AccessibilityNodeInfo accessibilityNodeInfo = this.f17551a;
        accessibilityNodeInfo.getBoundsInScreen(rect);
        sb2.append("; boundsInScreen: " + rect);
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 34) {
            k0.e(accessibilityNodeInfo, rect);
        } else {
            Rect rect2 = (Rect) accessibilityNodeInfo.getExtras().getParcelable("androidx.view.accessibility.AccessibilityNodeInfoCompat.BOUNDS_IN_WINDOW_KEY");
            if (rect2 != null) {
                rect.set(rect2.left, rect2.top, rect2.right, rect2.bottom);
            }
        }
        sb2.append("; boundsInWindow: " + rect);
        sb2.append("; packageName: ");
        sb2.append(accessibilityNodeInfo.getPackageName());
        sb2.append("; className: ");
        sb2.append(accessibilityNodeInfo.getClassName());
        sb2.append("; text: ");
        sb2.append(m());
        sb2.append("; error: ");
        sb2.append(accessibilityNodeInfo.getError());
        sb2.append("; maxTextLength: ");
        sb2.append(accessibilityNodeInfo.getMaxTextLength());
        sb2.append("; stateDescription: ");
        sb2.append(i5 >= 30 ? k1.e(accessibilityNodeInfo) : accessibilityNodeInfo.getExtras().getCharSequence("androidx.view.accessibility.AccessibilityNodeInfoCompat.STATE_DESCRIPTION_KEY"));
        sb2.append("; contentDescription: ");
        sb2.append(accessibilityNodeInfo.getContentDescription());
        sb2.append("; tooltipText: ");
        sb2.append(i5 >= 28 ? accessibilityNodeInfo.getTooltipText() : accessibilityNodeInfo.getExtras().getCharSequence("androidx.view.accessibility.AccessibilityNodeInfoCompat.TOOLTIP_TEXT_KEY"));
        sb2.append("; viewIdResName: ");
        sb2.append(accessibilityNodeInfo.getViewIdResourceName());
        sb2.append("; uniqueId: ");
        sb2.append(i5 >= 33 ? e.b(accessibilityNodeInfo) : accessibilityNodeInfo.getExtras().getString("androidx.view.accessibility.AccessibilityNodeInfoCompat.UNIQUE_ID_KEY"));
        sb2.append("; checkable: ");
        sb2.append(accessibilityNodeInfo.isCheckable());
        sb2.append("; checked: ");
        sb2.append(accessibilityNodeInfo.isChecked());
        sb2.append("; focusable: ");
        sb2.append(accessibilityNodeInfo.isFocusable());
        sb2.append("; focused: ");
        sb2.append(accessibilityNodeInfo.isFocused());
        sb2.append("; selected: ");
        sb2.append(accessibilityNodeInfo.isSelected());
        sb2.append("; clickable: ");
        sb2.append(accessibilityNodeInfo.isClickable());
        sb2.append("; longClickable: ");
        sb2.append(accessibilityNodeInfo.isLongClickable());
        sb2.append("; contextClickable: ");
        sb2.append(accessibilityNodeInfo.isContextClickable());
        sb2.append("; enabled: ");
        sb2.append(accessibilityNodeInfo.isEnabled());
        sb2.append("; password: ");
        sb2.append(accessibilityNodeInfo.isPassword());
        sb2.append("; scrollable: " + accessibilityNodeInfo.isScrollable());
        sb2.append("; containerTitle: ");
        sb2.append(i5 >= 34 ? k0.f(accessibilityNodeInfo) : accessibilityNodeInfo.getExtras().getCharSequence("androidx.view.accessibility.AccessibilityNodeInfoCompat.CONTAINER_TITLE_KEY"));
        sb2.append("; granularScrollingSupported: ");
        sb2.append(g(67108864));
        sb2.append("; importantForAccessibility: ");
        sb2.append(accessibilityNodeInfo.isImportantForAccessibility());
        sb2.append("; visible: ");
        sb2.append(accessibilityNodeInfo.isVisibleToUser());
        sb2.append("; isTextSelectable: ");
        sb2.append(i5 >= 33 ? e.c(accessibilityNodeInfo) : g(8388608));
        sb2.append("; accessibilityDataSensitive: ");
        sb2.append(i5 >= 34 ? k0.i(accessibilityNodeInfo) : g(64));
        sb2.append("; [");
        List<AccessibilityNodeInfo.AccessibilityAction> actionList = accessibilityNodeInfo.getActionList();
        ArrayList arrayList = new ArrayList();
        int size = actionList.size();
        for (int i11 = 0; i11 < size; i11++) {
            arrayList.add(new d(actionList.get(i11), 0, null, null, null));
        }
        for (int i12 = 0; i12 < arrayList.size(); i12++) {
            d dVar = (d) arrayList.get(i12);
            String strF = f(dVar.b());
            if (strF.equals("ACTION_UNKNOWN") && dVar.c() != null) {
                strF = dVar.c().toString();
            }
            sb2.append(strF);
            if (i12 != arrayList.size() - 1) {
                sb2.append(", ");
            }
        }
        sb2.append("]");
        return sb2.toString();
    }

    public final void u(int i5, boolean z11) {
        Bundle extras = this.f17551a.getExtras();
        if (extras != null) {
            int i11 = extras.getInt("androidx.view.accessibility.AccessibilityNodeInfoCompat.BOOLEAN_PROPERTY_KEY", 0) & (~i5);
            if (!z11) {
                i5 = 0;
            }
            extras.putInt("androidx.view.accessibility.AccessibilityNodeInfoCompat.BOOLEAN_PROPERTY_KEY", i5 | i11);
        }
    }

    public final void v(Rect rect) {
        this.f17551a.setBoundsInScreen(rect);
    }

    public final void w(boolean z11) {
        this.f17551a.setCheckable(z11);
    }

    public final void x(boolean z11) {
        this.f17551a.setChecked(z11);
    }

    public final void y(CharSequence charSequence) {
        this.f17551a.setClassName(charSequence);
    }

    public final void z(boolean z11) {
        this.f17551a.setClickable(z11);
    }
}
