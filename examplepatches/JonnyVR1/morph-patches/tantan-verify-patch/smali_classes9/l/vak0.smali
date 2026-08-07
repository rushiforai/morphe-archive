.class public Ll/vak0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

.field public final c:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

.field public j:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

.field public p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

.field public s:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

.field public t:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

.field public u:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

.field public v:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

.field public w:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

.field public x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lcom/p1/mobile/putong/data/LiveFansClubLevel;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;",
            "Lcom/p1/mobile/putong/data/LiveFansClubLevel;",
            ")V"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const-string v0, "normal"

    iput-object v0, p0, Ll/vak0;->g:Ljava/lang/String;

    .line 33
    iput-object p1, p0, Ll/vak0;->c:Ll/nsv;

    .line 34
    iput-object p2, p0, Ll/vak0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 35
    iput-object p3, p0, Ll/vak0;->h:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 36
    iput-object p4, p0, Ll/vak0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 37
    iput-object p5, p0, Ll/vak0;->j:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    return-void
.end method

.method public constructor <init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "voice"

    .line 5
    .line 6
    iput-object v0, p0, Ll/vak0;->g:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/vak0;->c:Ll/nsv;

    .line 9
    .line 10
    iput-object p2, p0, Ll/vak0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 11
    .line 12
    iput-object p3, p0, Ll/vak0;->h:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 13
    .line 14
    iput-object p4, p0, Ll/vak0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 15
    .line 16
    iput-object p5, p0, Ll/vak0;->d:Ljava/util/List;

    .line 17
    .line 18
    iput-object p6, p0, Ll/vak0;->e:Ljava/util/List;

    .line 19
    .line 20
    iput-object p7, p0, Ll/vak0;->f:Ljava/util/List;

    .line 21
    .line 22
    iput-object p8, p0, Ll/vak0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 23
    .line 24
    iput-object p9, p0, Ll/vak0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 25
    .line 26
    iput-object p10, p0, Ll/vak0;->m:Ljava/util/List;

    .line 27
    .line 28
    iput-object p11, p0, Ll/vak0;->s:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;->to:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public A(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vak0;->q:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public B(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vak0;->x:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->t:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 2
    .line 3
    return-void
.end method

.method public D(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 2
    .line 3
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;)Ll/vak0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->p:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 2
    .line 3
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 2
    .line 3
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/vak0;->f:Ljava/util/List;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/vak0;->f:Ljava/util/List;

    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Ll/vak0;->f:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public c(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vak0;->f:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/uak0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/uak0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->i:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->w:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vak0;->x:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->h:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/data/LiveFansClubLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->j:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->t:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->s:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vak0;->c:Ll/nsv;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->u:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->r:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->middleCards:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

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

.method public u()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->guildId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

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

.method public v()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->maxRankHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vak0;->t:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;->title:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

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

.method public x(Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->w:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 2
    .line 3
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 2
    .line 3
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vak0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 2
    .line 3
    return-void
.end method
