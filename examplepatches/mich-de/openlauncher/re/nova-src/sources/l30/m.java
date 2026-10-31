package l30;

import android.graphics.Rect;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.Button;
import android.widget.EditText;
import androidx.recyclerview.widget.u1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.launcher.widget.NumberPicker;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/* loaded from: classes4.dex */
public final class m extends AccessibilityNodeProvider {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f74666a = new Rect();

    /* renamed from: b, reason: collision with root package name */
    public final int[] f74667b = new int[2];

    /* renamed from: c, reason: collision with root package name */
    public int f74668c = Integer.MIN_VALUE;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ NumberPicker f74669d;

    public m(NumberPicker numberPicker) {
        this.f74669d = numberPicker;
    }

    public final AccessibilityNodeInfo a(int i5, int i11, int i12, int i13, int i14, String str) {
        AccessibilityNodeInfo accessibilityNodeInfoObtain = AccessibilityNodeInfo.obtain();
        accessibilityNodeInfoObtain.setClassName(Button.class.getName());
        NumberPicker numberPicker = this.f74669d;
        accessibilityNodeInfoObtain.setPackageName(numberPicker.getContext().getPackageName());
        accessibilityNodeInfoObtain.setSource(numberPicker, i5);
        accessibilityNodeInfoObtain.setParent(numberPicker);
        accessibilityNodeInfoObtain.setText(str);
        accessibilityNodeInfoObtain.setClickable(true);
        accessibilityNodeInfoObtain.setLongClickable(true);
        accessibilityNodeInfoObtain.setEnabled(numberPicker.isEnabled());
        Rect rect = this.f74666a;
        rect.set(i11, i12, i13, i14);
        accessibilityNodeInfoObtain.setVisibleToUser(numberPicker.j(rect));
        accessibilityNodeInfoObtain.setBoundsInParent(rect);
        int[] iArr = this.f74667b;
        numberPicker.getLocationOnScreen(iArr);
        rect.offset(iArr[0], iArr[1]);
        accessibilityNodeInfoObtain.setBoundsInScreen(rect);
        if (this.f74668c != i5) {
            accessibilityNodeInfoObtain.addAction(64);
        }
        if (this.f74668c == i5) {
            accessibilityNodeInfoObtain.addAction(128);
        }
        if (numberPicker.isEnabled()) {
            accessibilityNodeInfoObtain.addAction(16);
        }
        return accessibilityNodeInfoObtain;
    }

    public final void b(int i5, String str, ArrayList arrayList) {
        EditText editText = this.f74669d.f46426a;
        if (i5 == 1) {
            String strD = d();
            if (TextUtils.isEmpty(strD) || !strD.toString().toLowerCase(Locale.getDefault()).contains(str)) {
                return;
            }
            arrayList.add(createAccessibilityNodeInfo(1));
            return;
        }
        if (i5 != 2) {
            if (i5 != 3) {
                return;
            }
            String strC = c();
            if (TextUtils.isEmpty(strC) || !strC.toString().toLowerCase(Locale.getDefault()).contains(str)) {
                return;
            }
            arrayList.add(createAccessibilityNodeInfo(3));
            return;
        }
        Editable text = editText.getText();
        if (!TextUtils.isEmpty(text) && text.toString().toLowerCase(Locale.getDefault()).contains(str)) {
            arrayList.add(createAccessibilityNodeInfo(2));
            return;
        }
        Editable text2 = editText.getText();
        if (TextUtils.isEmpty(text2) || !text2.toString().toLowerCase(Locale.getDefault()).contains(str)) {
            return;
        }
        arrayList.add(createAccessibilityNodeInfo(2));
    }

    public final String c() {
        NumberPicker numberPicker = this.f74669d;
        int i5 = numberPicker.f46442l - 1;
        if (i5 >= numberPicker.f46440j) {
            return NumberPicker.e(i5);
        }
        return null;
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final AccessibilityNodeInfo createAccessibilityNodeInfo(int i5) {
        NumberPicker numberPicker = this.f74669d;
        Rect rect = numberPicker.R;
        Rect rect2 = numberPicker.Q;
        int[] iArr = this.f74667b;
        Rect rect3 = this.f74666a;
        if (i5 != -1) {
            if (i5 == 1) {
                return a(1, numberPicker.getScrollX(), rect.bottom, numberPicker.getScrollX() + (numberPicker.getRight() - numberPicker.getLeft()), numberPicker.getScrollY() + (numberPicker.getBottom() - numberPicker.getTop()), d());
            }
            if (i5 != 2) {
                if (i5 != 3) {
                    return super.createAccessibilityNodeInfo(i5);
                }
                String strC = c();
                return a(3, numberPicker.getScrollX(), numberPicker.getScrollY(), (numberPicker.getRight() - numberPicker.getLeft()) + numberPicker.getScrollX(), rect2.bottom, strC);
            }
            int scrollX = numberPicker.getScrollX();
            int i11 = rect2.bottom;
            int right = (numberPicker.getRight() - numberPicker.getLeft()) + numberPicker.getScrollX();
            int i12 = rect.top;
            AccessibilityNodeInfo accessibilityNodeInfoCreateAccessibilityNodeInfo = numberPicker.f46426a.createAccessibilityNodeInfo();
            accessibilityNodeInfoCreateAccessibilityNodeInfo.setSource(numberPicker, 2);
            if (this.f74668c != 2) {
                accessibilityNodeInfoCreateAccessibilityNodeInfo.addAction(64);
            }
            if (this.f74668c == 2) {
                accessibilityNodeInfoCreateAccessibilityNodeInfo.addAction(128);
            }
            rect3.set(scrollX, i11, right, i12);
            accessibilityNodeInfoCreateAccessibilityNodeInfo.setVisibleToUser(numberPicker.j(rect3));
            accessibilityNodeInfoCreateAccessibilityNodeInfo.setBoundsInParent(rect3);
            numberPicker.getLocationOnScreen(iArr);
            rect3.offset(iArr[0], iArr[1]);
            accessibilityNodeInfoCreateAccessibilityNodeInfo.setBoundsInScreen(rect3);
            return accessibilityNodeInfoCreateAccessibilityNodeInfo;
        }
        int scrollX2 = numberPicker.getScrollX();
        int scrollY = numberPicker.getScrollY();
        int right2 = (numberPicker.getRight() - numberPicker.getLeft()) + numberPicker.getScrollX();
        int bottom = (numberPicker.getBottom() - numberPicker.getTop()) + numberPicker.getScrollY();
        AccessibilityNodeInfo accessibilityNodeInfoObtain = AccessibilityNodeInfo.obtain();
        accessibilityNodeInfoObtain.setClassName(NumberPicker.class.getName());
        accessibilityNodeInfoObtain.setPackageName(numberPicker.getContext().getPackageName());
        accessibilityNodeInfoObtain.setSource(numberPicker);
        if (numberPicker.f46442l > numberPicker.f46440j) {
            accessibilityNodeInfoObtain.addChild(numberPicker, 3);
        }
        accessibilityNodeInfoObtain.addChild(numberPicker, 2);
        if (numberPicker.f46442l < numberPicker.f46441k) {
            accessibilityNodeInfoObtain.addChild(numberPicker, 1);
        }
        accessibilityNodeInfoObtain.setParent((View) numberPicker.getParentForAccessibility());
        accessibilityNodeInfoObtain.setEnabled(numberPicker.isEnabled());
        accessibilityNodeInfoObtain.setScrollable(true);
        rect3.set(scrollX2, scrollY, right2, bottom);
        accessibilityNodeInfoObtain.setBoundsInParent(rect3);
        accessibilityNodeInfoObtain.setVisibleToUser(numberPicker.j(null));
        numberPicker.getLocationOnScreen(iArr);
        rect3.offset(iArr[0], iArr[1]);
        accessibilityNodeInfoObtain.setBoundsInScreen(rect3);
        if (this.f74668c != -1) {
            accessibilityNodeInfoObtain.addAction(64);
        }
        if (this.f74668c == -1) {
            accessibilityNodeInfoObtain.addAction(128);
        }
        if (numberPicker.isEnabled()) {
            if (numberPicker.f46442l < numberPicker.f46441k) {
                accessibilityNodeInfoObtain.addAction(u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            }
            if (numberPicker.f46442l > numberPicker.f46440j) {
                accessibilityNodeInfoObtain.addAction(UserMetadata.MAX_INTERNAL_KEY_SIZE);
            }
        }
        return accessibilityNodeInfoObtain;
    }

    public final String d() {
        NumberPicker numberPicker = this.f74669d;
        int i5 = numberPicker.f46442l + 1;
        if (i5 <= numberPicker.f46441k) {
            return NumberPicker.e(i5);
        }
        return null;
    }

    public final void e(int i5, int i11, String str) {
        NumberPicker numberPicker = this.f74669d;
        if (numberPicker.f46431c0.isEnabled()) {
            AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain(i11);
            accessibilityEventObtain.setClassName(Button.class.getName());
            accessibilityEventObtain.setPackageName(numberPicker.getContext().getPackageName());
            accessibilityEventObtain.getText().add(str);
            accessibilityEventObtain.setEnabled(numberPicker.isEnabled());
            accessibilityEventObtain.setSource(numberPicker, i5);
            numberPicker.requestSendAccessibilityEvent(numberPicker, accessibilityEventObtain);
        }
    }

    public final void f(int i5, int i11) {
        NumberPicker numberPicker = this.f74669d;
        if (i5 == 1) {
            if (numberPicker.f46442l < numberPicker.f46441k) {
                e(i5, i11, d());
                return;
            }
            return;
        }
        if (i5 != 2) {
            if (i5 == 3 && numberPicker.f46442l > numberPicker.f46440j) {
                e(i5, i11, c());
                return;
            }
            return;
        }
        AccessibilityManager accessibilityManager = numberPicker.f46431c0;
        EditText editText = numberPicker.f46426a;
        if (accessibilityManager.isEnabled()) {
            AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain(i11);
            editText.onInitializeAccessibilityEvent(accessibilityEventObtain);
            editText.onPopulateAccessibilityEvent(accessibilityEventObtain);
            accessibilityEventObtain.setSource(numberPicker, 2);
            numberPicker.requestSendAccessibilityEvent(numberPicker, accessibilityEventObtain);
        }
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final List findAccessibilityNodeInfosByText(String str, int i5) {
        if (TextUtils.isEmpty(str)) {
            return Collections.EMPTY_LIST;
        }
        String lowerCase = str.toLowerCase(Locale.getDefault());
        ArrayList arrayList = new ArrayList();
        if (i5 == -1) {
            b(3, lowerCase, arrayList);
            b(2, lowerCase, arrayList);
            b(1, lowerCase, arrayList);
            return arrayList;
        }
        if (i5 != 1 && i5 != 2 && i5 != 3) {
            return super.findAccessibilityNodeInfosByText(str, i5);
        }
        b(i5, lowerCase, arrayList);
        return arrayList;
    }

    @Override // android.view.accessibility.AccessibilityNodeProvider
    public final boolean performAction(int i5, int i11, Bundle bundle) {
        NumberPicker numberPicker = this.f74669d;
        if (i5 != -1) {
            if (i5 == 1) {
                if (i11 == 16) {
                    if (!numberPicker.isEnabled()) {
                        return false;
                    }
                    char[] cArr = NumberPicker.f46425f0;
                    numberPicker.b(true);
                    f(i5, 1);
                    return true;
                }
                if (i11 == 64) {
                    if (this.f74668c == i5) {
                        return false;
                    }
                    this.f74668c = i5;
                    f(i5, SQLiteDatabase.OPEN_NOMUTEX);
                    NumberPicker.a(numberPicker, true);
                    return true;
                }
                if (i11 != 128 || this.f74668c != i5) {
                    return false;
                }
                this.f74668c = Integer.MIN_VALUE;
                f(i5, SQLiteDatabase.OPEN_FULLMUTEX);
                NumberPicker.a(numberPicker, true);
                return true;
            }
            if (i5 == 2) {
                if (i11 == 1) {
                    if (!numberPicker.isEnabled() || numberPicker.f46426a.isFocused()) {
                        return false;
                    }
                    return numberPicker.f46426a.requestFocus();
                }
                if (i11 == 2) {
                    if (!numberPicker.isEnabled() || !numberPicker.f46426a.isFocused()) {
                        return false;
                    }
                    numberPicker.f46426a.clearFocus();
                    return true;
                }
                if (i11 == 16) {
                    if (!numberPicker.isEnabled()) {
                        return false;
                    }
                    numberPicker.performClick();
                    return true;
                }
                if (i11 == 32) {
                    if (!numberPicker.isEnabled()) {
                        return false;
                    }
                    numberPicker.performLongClick();
                    return true;
                }
                if (i11 == 64) {
                    if (this.f74668c == i5) {
                        return false;
                    }
                    this.f74668c = i5;
                    f(i5, SQLiteDatabase.OPEN_NOMUTEX);
                    numberPicker.f46426a.invalidate();
                    return true;
                }
                if (i11 != 128) {
                    return numberPicker.f46426a.performAccessibilityAction(i11, bundle);
                }
                if (this.f74668c != i5) {
                    return false;
                }
                this.f74668c = Integer.MIN_VALUE;
                f(i5, SQLiteDatabase.OPEN_FULLMUTEX);
                numberPicker.f46426a.invalidate();
                return true;
            }
            if (i5 == 3) {
                if (i11 == 16) {
                    if (!numberPicker.isEnabled()) {
                        return false;
                    }
                    boolean z11 = i5 == 1;
                    char[] cArr2 = NumberPicker.f46425f0;
                    numberPicker.b(z11);
                    f(i5, 1);
                    return true;
                }
                if (i11 == 64) {
                    if (this.f74668c == i5) {
                        return false;
                    }
                    this.f74668c = i5;
                    f(i5, SQLiteDatabase.OPEN_NOMUTEX);
                    NumberPicker.a(numberPicker, false);
                    return true;
                }
                if (i11 != 128 || this.f74668c != i5) {
                    return false;
                }
                this.f74668c = Integer.MIN_VALUE;
                f(i5, SQLiteDatabase.OPEN_FULLMUTEX);
                NumberPicker.a(numberPicker, false);
                return true;
            }
        } else {
            if (i11 == 64) {
                if (this.f74668c == i5) {
                    return false;
                }
                this.f74668c = i5;
                numberPicker.getClass();
                return true;
            }
            if (i11 == 128) {
                if (this.f74668c != i5) {
                    return false;
                }
                this.f74668c = Integer.MIN_VALUE;
                numberPicker.getClass();
                return true;
            }
            if (i11 == 4096) {
                if (numberPicker.isEnabled()) {
                    numberPicker.getClass();
                    if (numberPicker.f46442l < numberPicker.f46441k) {
                        numberPicker.b(true);
                        return true;
                    }
                }
                return false;
            }
            if (i11 == 8192) {
                if (numberPicker.isEnabled()) {
                    numberPicker.getClass();
                    if (numberPicker.f46442l > numberPicker.f46440j) {
                        numberPicker.b(false);
                        return true;
                    }
                }
                return false;
            }
        }
        return super.performAction(i5, i11, bundle);
    }
}
