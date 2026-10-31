package f10;

import android.widget.SeekBar;
import com.teslacoilsw.launcher.preferences.fancyprefs.PaddingPreviewView;

/* loaded from: classes4.dex */
public final class h implements SeekBar.OnSeekBarChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ PaddingPreviewView f54186a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SeekBar f54187b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f54188c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ SeekBar f54189d;

    public h(PaddingPreviewView paddingPreviewView, SeekBar seekBar, int i5, SeekBar seekBar2) {
        this.f54186a = paddingPreviewView;
        this.f54187b = seekBar;
        this.f54188c = i5;
        this.f54189d = seekBar2;
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public final void onProgressChanged(SeekBar seekBar, int i5, boolean z11) {
        int progress = this.f54187b.getProgress();
        int i11 = this.f54188c;
        PaddingPreviewView paddingPreviewView = this.f54186a;
        paddingPreviewView.f46028b = progress * i11;
        paddingPreviewView.f46029c = this.f54189d.getProgress() * i11;
        paddingPreviewView.invalidate();
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public final void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public final void onStopTrackingTouch(SeekBar seekBar) {
    }
}
