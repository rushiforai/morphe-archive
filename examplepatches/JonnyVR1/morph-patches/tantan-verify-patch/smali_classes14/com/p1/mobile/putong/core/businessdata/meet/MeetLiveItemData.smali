.class public Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;
.super Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;
.source "SourceFile"


# instance fields
.field private final item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getItem()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAnonymous()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public isFollowed()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 4
    .line 5
    const-string v1, "liveVoice"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MeetFollow;->status:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "following"

    .line 20
    .line 21
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public isLikedUser()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 6
    .line 7
    const-string v1, "liked"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    const-string v1, "superliked"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 42
    .line 43
    const-string v0, "lettered"

    .line 44
    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public isMatched()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isLikedUser()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->isSeeUser()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public isPicksUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 4
    .line 5
    return p0
.end method

.method public isSeeUser()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 6
    .line 7
    const-string v1, "liked"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    const-string v1, "superliked"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 42
    .line 43
    const-string v0, "lettered"

    .line 44
    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public isSuperLikedMe()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 6
    .line 7
    const-string v1, "superliked"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;->item:Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 39
    return p0
.end method
