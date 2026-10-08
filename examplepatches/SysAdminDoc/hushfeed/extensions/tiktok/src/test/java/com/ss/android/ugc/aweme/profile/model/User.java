package com.ss.android.ugc.aweme.profile.model;

/** The fields of TikTok's account model the follow status label and account facts read, by their real names and types. */
public class User {
    public String uid;
    public String uniqueId;
    public String nickname;
    public int followStatus;
    public int followerStatus;
    public Long createTime;
    public long registerTime;
    public String region;
    public String accountRegion;
    public String language;
    public long uniqueIdModifyTime;
    public int nickNameModifyTs;
    public boolean secret;
    public boolean hasOpenFavorite;

    public String getUid() { return uid; }
    public String getUniqueId() { return uniqueId; }
    public String getNickname() { return nickname; }
    public int getFollowStatus() { return followStatus; }
    public int getFollowerStatus() { return followerStatus; }
}
