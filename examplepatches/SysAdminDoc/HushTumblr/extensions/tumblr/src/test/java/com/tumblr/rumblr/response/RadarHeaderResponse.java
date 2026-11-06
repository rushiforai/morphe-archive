package com.tumblr.rumblr.response;

/** Test copy of Tumblr's Explore header response: the header and the getters the extension reads. */
public final class RadarHeaderResponse {
    private final RadarHeader header;

    public RadarHeaderResponse(RadarHeader header) {
        this.header = header;
    }

    public RadarHeader getHeader() {
        return header;
    }

    public static class RadarHeader {
        private final String headerType;
        private final String sponsoredBadgeUrl;
        private final TakeOverAd ad;

        public RadarHeader(String headerType, String sponsoredBadgeUrl, TakeOverAd ad) {
            this.headerType = headerType;
            this.sponsoredBadgeUrl = sponsoredBadgeUrl;
            this.ad = ad;
        }

        public String getHeaderImage() {
            return "https://64.media.tumblr.com/header.jpg";
        }

        public String getHeaderType() {
            return headerType;
        }

        public String getSponsoredBadgeUrl() {
            return sponsoredBadgeUrl;
        }

        public TakeOverAd getAd() {
            return ad;
        }
    }

    public static final class TakeOverAd {
        public String getSponsoredBy() {
            return "A sponsor";
        }
    }
}
