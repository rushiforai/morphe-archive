package n80;

import android.content.DialogInterface;
import android.content.Intent;
import androidx.biometric.FingerprintDialogFragment;
import androidx.preference.ListPreferenceDialogFragment;
import androidx.preference.ListPreferenceDialogFragmentCompat;
import com.teslacoilsw.launcher.drawer.drawergroups.DialogAddDrawerGroupFragment;
import com.teslacoilsw.launcher.drawer.drawergroups.GroupAppListActivity;
import h6.m0;
import uy.n0;
import v.d;

/* loaded from: classes5.dex */
public final class b implements DialogInterface.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78030a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78031b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f78030a = i5;
        this.f78031b = obj;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        switch (this.f78030a) {
            case 0:
                ((a) this.f78031b).onClick(null);
                break;
            case 1:
                ((a) this.f78031b).onClick(null);
                break;
            case 2:
                ListPreferenceDialogFragment listPreferenceDialogFragment = (ListPreferenceDialogFragment) this.f78031b;
                listPreferenceDialogFragment.f14754i = i5;
                listPreferenceDialogFragment.f14788h = -1;
                dialogInterface.dismiss();
                break;
            case 3:
                ListPreferenceDialogFragmentCompat listPreferenceDialogFragmentCompat = (ListPreferenceDialogFragmentCompat) this.f78031b;
                listPreferenceDialogFragmentCompat.f14757i = i5;
                listPreferenceDialogFragmentCompat.f14796h = -1;
                dialogInterface.dismiss();
                break;
            case 4:
                DialogAddDrawerGroupFragment dialogAddDrawerGroupFragment = (DialogAddDrawerGroupFragment) this.f78031b;
                Intent intent = new Intent(dialogAddDrawerGroupFragment.getActivity(), (Class<?>) GroupAppListActivity.class);
                if (dialogAddDrawerGroupFragment.f45736c == -1 || dialogAddDrawerGroupFragment.f45735b.a() || dialogAddDrawerGroupFragment.f45735b != n0.f91729a) {
                    intent.putExtra("groupId", dialogAddDrawerGroupFragment.f45736c);
                } else {
                    intent.putExtra("groupId", "hideApps");
                }
                dialogAddDrawerGroupFragment.getActivity().startActivity(intent);
                break;
            default:
                d dVar = ((FingerprintDialogFragment) this.f78031b).f13843c;
                if (dVar.f91819g == null) {
                    dVar.f91819g = new m0();
                }
                d.g(dVar.f91819g, Boolean.TRUE);
                break;
        }
    }
}
