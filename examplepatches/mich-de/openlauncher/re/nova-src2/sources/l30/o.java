package l30;

import android.view.KeyEvent;
import android.view.ViewConfiguration;
import com.android.launcher3.WallpaperCropActivity;
import com.teslacoilsw.launcher.widget.NumberPicker;

/* loaded from: classes4.dex */
public final class o implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74671a = 1;

    /* renamed from: b, reason: collision with root package name */
    public int f74672b;

    /* renamed from: c, reason: collision with root package name */
    public int f74673c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ KeyEvent.Callback f74674d;

    public o(WallpaperCropActivity wallpaperCropActivity, int i5, int i11) {
        this.f74674d = wallpaperCropActivity;
        this.f74672b = i5;
        this.f74673c = i11;
    }

    public void a() {
        this.f74673c = 0;
        this.f74672b = 0;
        NumberPicker numberPicker = (NumberPicker) this.f74674d;
        numberPicker.removeCallbacks(this);
        if (numberPicker.T) {
            numberPicker.T = false;
            NumberPicker.a(numberPicker, true);
        }
        numberPicker.U = false;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f74671a) {
            case 0:
                NumberPicker numberPicker = (NumberPicker) this.f74674d;
                int i5 = this.f74673c;
                if (i5 == 1) {
                    int i11 = this.f74672b;
                    if (i11 == 1) {
                        numberPicker.T = true;
                        NumberPicker.a(numberPicker, true);
                        break;
                    } else if (i11 == 2) {
                        numberPicker.U = true;
                        NumberPicker.a(numberPicker, false);
                        break;
                    }
                } else if (i5 == 2) {
                    int i12 = this.f74672b;
                    if (i12 == 1) {
                        if (!numberPicker.T) {
                            numberPicker.postDelayed(this, ViewConfiguration.getPressedStateDuration());
                        }
                        numberPicker.T = !numberPicker.T;
                        NumberPicker.a(numberPicker, true);
                        break;
                    } else if (i12 == 2) {
                        if (!numberPicker.U) {
                            numberPicker.postDelayed(this, ViewConfiguration.getPressedStateDuration());
                        }
                        numberPicker.U = !numberPicker.U;
                        NumberPicker.a(numberPicker, false);
                        break;
                    }
                }
                break;
            default:
                WallpaperCropActivity wallpaperCropActivity = (WallpaperCropActivity) this.f74674d;
                wallpaperCropActivity.h0(this.f74672b, this.f74673c);
                wallpaperCropActivity.setResult(-1);
                wallpaperCropActivity.finish();
                break;
        }
    }

    public o(NumberPicker numberPicker) {
        this.f74674d = numberPicker;
    }
}
