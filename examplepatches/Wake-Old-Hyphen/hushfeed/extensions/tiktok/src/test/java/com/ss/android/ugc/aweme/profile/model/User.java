package com.ss.android.ugc.aweme.profile.model;

/** The fields of TikTok's account model the follow status label reads, by their real names. */
public class User {
    public String uid;
    public String uniqueId;
    public String nickname;
    public int followStatus;
    public int followerStatus;

    public String getUid() { return uid; }
    public String getUniqueId() { return uniqueId; }
    public String getNickname() { return nickname; }
    public int getFollowStatus() { return followStatus; }
    public int getFollowerStatus() { return followerStatus; }
}
