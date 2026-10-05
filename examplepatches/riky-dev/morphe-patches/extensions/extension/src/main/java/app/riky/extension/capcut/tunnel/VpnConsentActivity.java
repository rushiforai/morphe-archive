/*
 * Copyright (C) 2026 riky-dev
 *
 * See the included NOTICE / wireguard licenses for terms.
 */

package app.riky.extension.capcut.tunnel;

import android.app.Activity;
import android.content.Intent;
import android.net.VpnService;
import android.os.Bundle;

/**
 * One-shot Android VPN consent prompt. Started from Application when auto-connect
 * needs {@link VpnService#prepare(android.content.Context)}.
 */
public final class VpnConsentActivity extends Activity {
    private static final int REQUEST = 0x56474e;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent prepare = VpnService.prepare(this);
        if (prepare != null) {
            startActivityForResult(prepare, REQUEST);
        } else {
            WireGuardManager.get(this).connect();
            finish();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST) {
            if (resultCode == RESULT_OK) {
                WireGuardManager.get(this).connect();
            } else {
                WireGuardManager.get(this).permissionDenied();
            }
        }
        finish();
    }
}
