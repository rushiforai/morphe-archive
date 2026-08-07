.class public Ll/zsc0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zsc0$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/zsc0$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zsc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/zsc0;->b:Ljava/util/List;

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ll/vsc0;

    .line 19
    .line 20
    invoke-direct {v0, p0, p3, p2}, Ll/vsc0;-><init>(Ll/zsc0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Ll/zsc0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zsc0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;->userID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zsc0$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/zsc0$a;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;->avatarUrl:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, v0, Ll/zsc0$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->giftUrl:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, v0, Ll/zsc0$a;->b:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;->name:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p1, v0, Ll/zsc0$a;->c:Ljava/lang/String;

    .line 19
    .line 20
    new-instance p1, Ll/wsc0;

    .line 21
    .line 22
    invoke-direct {p1, p3}, Ll/wsc0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p2, p1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->grade:I

    .line 34
    .line 35
    iput p1, v0, Ll/zsc0$a;->d:I

    .line 36
    .line 37
    :cond_0
    iget-object p0, p0, Ll/zsc0;->b:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    return-void
.end method
