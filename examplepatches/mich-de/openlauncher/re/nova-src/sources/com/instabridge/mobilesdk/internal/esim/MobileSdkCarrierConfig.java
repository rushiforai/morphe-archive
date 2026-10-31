package com.instabridge.mobilesdk.internal.esim;

import android.os.Build;
import android.os.PersistableBundle;
import android.service.carrier.CarrierIdentifier;
import android.service.carrier.CarrierService;
import com.instabridge.mobilesdk.internal.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Deprecated;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0017J\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\b\u001a\u00020\t2\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0016¨\u0006\n"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/MobileSdkCarrierConfig;", "Landroid/service/carrier/CarrierService;", "<init>", "()V", "onLoadConfig", "Landroid/os/PersistableBundle;", "id", "Landroid/service/carrier/CarrierIdentifier;", "subscriptionId", b.f42142b, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class MobileSdkCarrierConfig extends CarrierService {
    public static final int $stable = 0;

    public MobileSdkCarrierConfig() {
        Logger.INSTANCE.d("MobileSdkCarrierConfig created");
    }

    @Override // android.service.carrier.CarrierService
    @Deprecated
    @NotNull
    public PersistableBundle onLoadConfig(@Nullable CarrierIdentifier id2) {
        PersistableBundle persistableBundle = new PersistableBundle();
        persistableBundle.putInt("cdma_roaming_mode_int", 2);
        persistableBundle.putBoolean("force_home_network_bool", true);
        persistableBundle.putString("config_plans_package_override_string", getApplication().getApplicationContext().getPackageName());
        persistableBundle.putBoolean("carrier_volte_available_bool", true);
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 29) {
            persistableBundle.putBoolean("enhanced_4g_lte_on_by_default_bool", true);
        }
        persistableBundle.putBoolean("editable_enhanced_4g_lte_bool", true);
        persistableBundle.putBoolean("hide_enhanced_4g_lte_bool", false);
        persistableBundle.putBoolean("carrier_volte_provisioning_required_bool", false);
        if (i5 >= 30) {
            persistableBundle.putBoolean("carrier_rcs_provisioning_required_bool", false);
        }
        persistableBundle.putBoolean("carrier_volte_provisioned_bool", true);
        return persistableBundle;
    }

    @Override // android.service.carrier.CarrierService
    @Nullable
    public PersistableBundle onLoadConfig(int subscriptionId, @Nullable CarrierIdentifier id2) {
        return onLoadConfig(id2);
    }
}
