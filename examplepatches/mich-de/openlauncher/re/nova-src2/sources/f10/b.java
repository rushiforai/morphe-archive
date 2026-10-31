package f10;

import android.os.Process;
import android.view.View;
import android.widget.CompoundButton;
import com.google.android.material.chip.Chip;
import com.teslacoilsw.launcher.EditShortcutFloatingView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.RequiresPrimeSwitchCompat;
import com.teslacoilsw.launcher.preferences.widget.UserSwitchCompat;
import com.teslacoilsw.launcher.util.NamedIntent;
import mx.c0;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements CompoundButton.OnCheckedChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54167a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f54168b;

    public /* synthetic */ b(View view, int i5) {
        this.f54167a = i5;
        this.f54168b = view;
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public final void onCheckedChanged(CompoundButton compoundButton, boolean z11) {
        switch (this.f54167a) {
            case 0:
                FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) this.f54168b;
                UserSwitchCompat userSwitchCompat = (UserSwitchCompat) fancyPrefCheckableView.K;
                if (userSwitchCompat.P) {
                    fancyPrefCheckableView.x(Boolean.valueOf(userSwitchCompat.isChecked()));
                    break;
                }
                break;
            case 1:
                RequiresPrimeSwitchCompat requiresPrimeSwitchCompat = (RequiresPrimeSwitchCompat) this.f54168b;
                if (!requiresPrimeSwitchCompat.P.f54212b) {
                    requiresPrimeSwitchCompat.h(false, true);
                    break;
                }
                break;
            case 2:
                CompoundButton.OnCheckedChangeListener onCheckedChangeListener = ((Chip) this.f54168b).f34177h;
                if (onCheckedChangeListener != null) {
                    onCheckedChangeListener.onCheckedChanged(compoundButton, z11);
                    break;
                }
                break;
            default:
                EditShortcutFloatingView editShortcutFloatingView = (EditShortcutFloatingView) this.f54168b;
                NamedIntent namedIntent = editShortcutFloatingView.f45604g;
                if (namedIntent == null || c0.c(namedIntent.f46369b) == c0.NONE) {
                    editShortcutFloatingView.f45604g = new NamedIntent(editShortcutFloatingView.getContext().getString(2132018756), c0.FIRST_ITEM_IN_FOLDER.b(), Process.myUserHandle());
                }
                editShortcutFloatingView.f0();
                editShortcutFloatingView.b0();
                break;
        }
    }
}
