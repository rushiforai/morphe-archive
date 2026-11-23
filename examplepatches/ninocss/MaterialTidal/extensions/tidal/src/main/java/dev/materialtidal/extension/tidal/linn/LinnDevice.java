package dev.materialtidal.extension.tidal.linn;

/**
 * Immutable representation of a discovered Linn DS / DSM OpenHome renderer on the LAN.
 */
public final class LinnDevice {

    public final String udn;
    public final String itemId;
    public final String friendlyName;
    public final String roomName;
    public final String modelName;
    public final String manufacturer;
    public final String host;
    public final int port;
    public final String locationUrl;
    public final String productControlUrl;
    public final String playlistControlUrl;
    public final String volumeControlUrl;
    public final String timeControlUrl;
    public final String infoControlUrl;
    public final String productServiceType;
    public final String playlistServiceType;
    public final String volumeServiceType;
    public final String timeServiceType;

    public LinnDevice(
            String udn,
            String friendlyName,
            String roomName,
            String modelName,
            String manufacturer,
            String host,
            int port,
            String locationUrl,
            String productControlUrl,
            String playlistControlUrl,
            String volumeControlUrl,
            String timeControlUrl,
            String infoControlUrl
    ) {
        this(
                udn,
                friendlyName,
                roomName,
                modelName,
                manufacturer,
                host,
                port,
                locationUrl,
                productControlUrl,
                playlistControlUrl,
                volumeControlUrl,
                timeControlUrl,
                infoControlUrl,
                LinnOpenHomeClient.SERVICE_PRODUCT,
                LinnOpenHomeClient.SERVICE_PLAYLIST,
                LinnOpenHomeClient.SERVICE_VOLUME,
                LinnOpenHomeClient.SERVICE_TIME
        );
    }

    public LinnDevice(
            String udn,
            String friendlyName,
            String roomName,
            String modelName,
            String manufacturer,
            String host,
            int port,
            String locationUrl,
            String productControlUrl,
            String playlistControlUrl,
            String volumeControlUrl,
            String timeControlUrl,
            String infoControlUrl,
            String productServiceType,
            String playlistServiceType,
            String volumeServiceType,
            String timeServiceType
    ) {
        this.udn = udn != null ? udn : (host + ":" + port);
        this.itemId = "linn:" + this.udn;
        this.friendlyName = friendlyName != null ? friendlyName.trim() : "";
        this.roomName = roomName != null ? roomName.trim() : "";
        this.modelName = modelName != null ? modelName.trim() : "";
        this.manufacturer = manufacturer != null ? manufacturer.trim() : "";
        this.host = host != null ? host : "";
        this.port = port;
        this.locationUrl = locationUrl != null ? locationUrl : "";
        this.productControlUrl = productControlUrl;
        this.playlistControlUrl = playlistControlUrl;
        this.volumeControlUrl = volumeControlUrl;
        this.timeControlUrl = timeControlUrl;
        this.infoControlUrl = infoControlUrl;
        this.productServiceType = (productServiceType != null && !productServiceType.isEmpty())
                ? productServiceType : LinnOpenHomeClient.SERVICE_PRODUCT;
        this.playlistServiceType = (playlistServiceType != null && !playlistServiceType.isEmpty())
                ? playlistServiceType : LinnOpenHomeClient.SERVICE_PLAYLIST;
        this.volumeServiceType = (volumeServiceType != null && !volumeServiceType.isEmpty())
                ? volumeServiceType : LinnOpenHomeClient.SERVICE_VOLUME;
        this.timeServiceType = (timeServiceType != null && !timeServiceType.isEmpty())
                ? timeServiceType : LinnOpenHomeClient.SERVICE_TIME;
    }

    public String getDisplayTitle() {
        if (!roomName.isEmpty()) {
            if (!modelName.isEmpty() && !roomName.toLowerCase().contains(modelName.toLowerCase())) {
                return roomName + " (" + modelName + ")";
            }
            return roomName;
        }
        if (!friendlyName.isEmpty()) {
            return friendlyName;
        }
        if (!modelName.isEmpty()) {
            return modelName;
        }
        return "Linn DSM (" + host + ")";
    }

    public String getSubtitle() {
        if (!modelName.isEmpty()) {
            return modelName + " \u00b7 Wi-Fi";
        }
        return "Linn OpenHome \u00b7 Wi-Fi";
    }

    public boolean supportsPlaylist() {
        return playlistControlUrl != null && !playlistControlUrl.isEmpty();
    }

    public boolean supportsVolume() {
        return volumeControlUrl != null && !volumeControlUrl.isEmpty();
    }

    public boolean supportsProduct() {
        return productControlUrl != null && !productControlUrl.isEmpty();
    }

    public boolean supportsTime() {
        return timeControlUrl != null && !timeControlUrl.isEmpty();
    }
}
