package app.morphe.extension.network.patches;

import android.net.NetworkCapabilities;

@SuppressWarnings("unused")
public class MaskVPNTransportPatch {
  public static boolean hasTransport(NetworkCapabilities self, int transportType) {
    if (transportType == NetworkCapabilities.TRANSPORT_VPN) {
      return false;
    }

    return self.hasTransport(transportType);
  }
}
