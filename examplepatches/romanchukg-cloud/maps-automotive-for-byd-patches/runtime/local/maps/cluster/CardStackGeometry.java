package local.maps.cluster;

/** Native footer artwork may overflow its layout container. Coordinates are unscaled. */
final class CardStackGeometry {
    static float footerOffset(float cardHeight,float nativeOffset,float footerTop){
        return Math.max(nativeOffset,cardHeight-footerTop);
    }
}
