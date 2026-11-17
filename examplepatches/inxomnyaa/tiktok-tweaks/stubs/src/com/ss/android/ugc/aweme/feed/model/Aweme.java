package com.ss.android.ugc.aweme.feed.model;
import java.util.List;
import com.ss.android.ugc.aweme.feed.model.live.NewLiveRoomStruct;
import com.ss.android.ugc.aweme.feed.model.live.RoomFeedCellStruct;

/** Compile/test fixture only. Never included in the extension or patch bundle. */
public class Aweme {
    public com.ss.android.ugc.aweme.commerce.AwemeCommerceStruct commerce;
    public com.ss.android.ugc.aweme.commerce.AwemeCommerceStruct getCommerceVideoAuthInfo() { return commerce; }
    public boolean _isAd;
    public boolean _isSoftAd;
    public int productsCount;
    public boolean isLiveHasProduct;
    public List<?> productsInfo;
    public List<AnchorCommonStruct> anchors;
    public NewLiveRoomStruct newLiveRoomData;
    public RoomFeedCellStruct roomFeedCellStruct;
    public int getProductsCount() { return productsCount; }
    public boolean getIsLiveHasProduct() { return isLiveHasProduct; }
    public List<?> getProductsInfo() { return productsInfo; }
    public List<AnchorCommonStruct> getAnchors() { return anchors; }
    public RoomFeedCellStruct getRoomFeedCellStruct() { return roomFeedCellStruct; }
    public boolean isAd() { return false; }
    public boolean isWithPromotionalMusic() { return false; }
    public boolean isLiveReplay() { return false; }
    public boolean getIsTikTokStory() { return false; }
    public String getShareUrl() { return null; }
    public List<?> getImageInfos() { return null; }
    public PhotoModeImageInfo getPhotoModeImageInfo() { return null; }
}
