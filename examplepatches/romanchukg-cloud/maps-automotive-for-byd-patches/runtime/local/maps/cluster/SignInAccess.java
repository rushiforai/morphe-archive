// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;
import android.app.Activity;
/** No token requests or consent bridge. Maps' native Sign in button owns authentication. */
final class SignInAccess {
    static void resumed(Activity a){} static void paused(){}
    static String description(){return "Google sign-in: MicroG-RE";}
    static void show(Activity a){MicrogProvider.show(a);}
}
