.class public Ll/vat;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;",
            ">;"
        }
    .end annotation
.end field

.field public j:Landroid/graphics/Point;

.field public final k:I

.field public l:Ljava/util/Random;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vat;->i:Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    const/high16 p1, 0x431a0000    # 154.0f

    .line 12
    .line 13
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Ll/vat;->k:I

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic J3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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

.method public static synthetic L3(Ll/q260;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic M3(Ll/vat;Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vat;->i4(Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    return-void
.end method

.method public static synthetic N3(Ll/vat;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vat;->p4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    return-void
.end method

.method public static synthetic O3(Ll/vat;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vat;->h4(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/vat;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vat;->l4(Ll/q260;)V

    return-void
.end method

.method public static synthetic R3(Ll/vat;Ll/z160;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vat;->n4(Ll/z160;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/vat;Ll/f060;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vat;->g4(Ll/f060;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Ll/fat;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->REFRESH_UNIT:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->showOperationDrawer:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic U3(Ll/vat;Ll/fat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vat;->k4(Ll/fat;)V

    return-void
.end method

.method public static synthetic V3(Ll/vat;Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vat;->j4(Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    return-void
.end method

.method public static synthetic W3(Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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

.method public static synthetic X3(Ll/vat;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vat;->m4(Ll/q260;)V

    return-void
.end method

.method public static synthetic Y3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method private b4()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vat;->j:Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Ll/vat;->j:Landroid/graphics/Point;

    .line 11
    .line 12
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    iget p0, p0, Ll/vat;->k:I

    .line 15
    .line 16
    mul-int/lit8 v2, p0, 0x3

    .line 17
    .line 18
    div-int/lit8 v2, v2, 0xa

    .line 19
    .line 20
    if-ge v0, v2, :cond_0

    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    mul-int/lit8 v2, p0, 0x3

    .line 24
    .line 25
    const/4 v3, 0x5

    .line 26
    div-int/2addr v2, v3

    .line 27
    if-ge v0, v2, :cond_1

    .line 28
    .line 29
    const/16 p0, 0x11

    .line 30
    .line 31
    return p0

    .line 32
    :cond_1
    if-ge v0, p0, :cond_2

    .line 33
    .line 34
    return v3

    .line 35
    :cond_2
    return v1
.end method

.method private d4()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "video"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, ""

    .line 19
    .line 20
    return-object p0
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/sat;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/sat;-><init>(Ll/vat;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/f060;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Z3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ll/b260;->c()Ll/b260;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1, p1}, Ll/b260;->a(Ll/xzs;Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final a4()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public final c4(I)J
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vat;->l:Ljava/util/Random;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/util/Random;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/vat;->l:Ljava/util/Random;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/vat;->l:Ljava/util/Random;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/Random;->nextFloat()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-float p1, p1

    .line 23
    mul-float/2addr p0, p1

    .line 24
    const/high16 p1, 0x447a0000    # 1000.0f

    .line 25
    .line 26
    mul-float/2addr p0, p1

    .line 27
    float-to-long p0, p0

    .line 28
    return-wide p0
.end method

.method public final e4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "lotteryGiftRedPacket"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->Data:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 18
    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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

.method public final f4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "turboCoupon"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->Data:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 18
    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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

.method public final synthetic g4(Ll/f060;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vat;->b4()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic h4(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vat;->i:Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic i4(Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/vat;->i:Ljava/util/LinkedHashMap;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->clear()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p4, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 14
    .line 15
    new-instance v1, Ll/kat;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/kat;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 35
    .line 36
    new-instance v1, Ll/lat;

    .line 37
    .line 38
    invoke-direct {v1, p1}, Ll/lat;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->i(Ll/qcj;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    iput-boolean p2, p4, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->isInit:Z

    .line 45
    .line 46
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->extraData:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getAnimation()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    iget-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-lez p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 77
    .line 78
    const/4 p2, 0x0

    .line 79
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 84
    .line 85
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getAnimation()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p0, p2}, Ll/vat;->o4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;

    .line 94
    .line 95
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0, p4}, Ll/oo2;->F1(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final synthetic j4(Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/vat;->a4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/vat;->d4()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 28
    .line 29
    const-string v5, ""

    .line 30
    .line 31
    move-object v0, p1

    .line 32
    invoke-static/range {v0 .. v5}, Ll/aiv;->D0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v1, Ll/jat;

    .line 37
    .line 38
    invoke-direct {v1, p0, v0, p2, p3}, Ll/jat;-><init>(Ll/vat;Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic k4(Ll/fat;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 4
    .line 5
    new-instance v1, Ll/hat;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/hat;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p1, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->extraData:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Ll/vat;->r4(Ljava/util/List;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p1, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/vat;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic l4(Ll/q260;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/q260;->i()Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->j(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic m4(Ll/q260;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 4
    .line 5
    new-instance v0, Ll/uat;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/uat;-><init>(Ll/q260;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->i(Ll/qcj;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic n4(Ll/z160;)Landroid/util/Pair;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/z160;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->e(Ljava/lang/String;)Landroid/util/Pair;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final o4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;
    .locals 2
    .param p1    # Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;->enter:Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;->getEnter()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimationEnter;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimationEnter;->getAnimationType()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnterType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnterType;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;->animationType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnterType;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;->enter:Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;->getEnter()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimationEnter;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimationEnter;->getImageUrl()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;->imageUrl:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimation;->enter:Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;->getEnter()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimationEnter;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimationEnter;->getIsTop()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationAnimationEnter;->isTop:Z

    .line 44
    .line 45
    return-object p0
.end method

.method public final p4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 3

    .line 1
    sget-object v0, Ll/vat$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_4

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    :goto_0
    return-void

    .line 34
    :cond_1
    invoke-virtual {p0, p1}, Ll/vat;->e4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/vat;->v4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-virtual {p0, p1}, Ll/vat;->f4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/vat;->w4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getRandomDelaySeconds()J

    .line 58
    .line 59
    .line 60
    move-result-wide v1

    .line 61
    long-to-int v1, v1

    .line 62
    invoke-virtual {p0, v1}, Ll/vat;->c4(I)J

    .line 63
    .line 64
    .line 65
    move-result-wide v1

    .line 66
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/vat;->s4(Ljava/lang/String;JLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getRandomDelaySeconds()J

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    long-to-int p1, v0

    .line 75
    invoke-virtual {p0, p1}, Ll/vat;->c4(I)J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    const/4 p1, 0x0

    .line 80
    invoke-virtual {p0, p1, v0, v1, p1}, Ll/vat;->s4(Ljava/lang/String;JLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final q4(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    :goto_0
    if-ltz v0, :cond_1

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->enableEntranceAnim()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showEntranceAnim()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v3, Ll/q260$a;

    .line 44
    .line 45
    const/16 v4, 0x1fa4

    .line 46
    .line 47
    invoke-direct {v3, v4}, Ll/q260$a;-><init>(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v1}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-virtual {v1, v3}, Ll/q260$a;->h(Z)Ll/q260$a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ll/q260$a;->a()Ll/q260;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v2, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    return-void
.end method

.method public final r4(Ljava/util/List;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 16
    .line 17
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->extraData:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, p0, Ll/vat;->i:Ljava/util/LinkedHashMap;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 29
    .line 30
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->d(Ljava/lang/String;)Landroid/util/Pair;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 43
    .line 44
    instance-of v2, v1, Ll/v1m;

    .line 45
    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    check-cast v1, Landroid/view/View;

    .line 49
    .line 50
    check-cast v1, Ll/v1m;

    .line 51
    .line 52
    invoke-interface {v1, v0}, Ll/v1m;->a(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p0, v0}, Ll/vat;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_0

    .line 65
    .line 66
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->enableEntranceAnim()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_3

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->enableOperationTop()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 85
    .line 86
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->a(Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 93
    .line 94
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 95
    .line 96
    const/4 v2, 0x0

    .line 97
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->b(Landroid/view/View;I)V

    .line 98
    .line 99
    .line 100
    :goto_2
    const/high16 v0, 0x40000000    # 2.0f

    .line 101
    .line 102
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-static {v1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_4
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 111
    .line 112
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 113
    .line 114
    new-instance p2, Ll/iat;

    .line 115
    .line 116
    invoke-direct {p2, p0}, Ll/iat;-><init>(Ll/vat;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;->i(Ll/qcj;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final s4(Ljava/lang/String;JLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-wide v2, p2

    .line 5
    move-object v4, p4

    .line 6
    invoke-virtual/range {v0 .. v5}, Ll/vat;->t4(Ljava/lang/String;JLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    const/4 v4, 0x0

    .line 5
    const/4 v5, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    invoke-virtual/range {v0 .. v5}, Ll/vat;->t4(Ljava/lang/String;JLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/oo2;->q1()Ll/aj1;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/aj1;->F()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v1, Ll/gat;

    .line 30
    .line 31
    invoke-direct {v1, v0}, Ll/gat;-><init>(Ll/vat;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/oo2;->q1()Ll/aj1;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/aj1;->E()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance v1, Ll/mat;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/mat;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v1, Ll/nat;

    .line 67
    .line 68
    invoke-direct {v1, v0}, Ll/nat;-><init>(Ll/vat;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showOperationsRoot()Ll/v3f$d;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Lrx/c;

    .line 93
    .line 94
    invoke-virtual {v0, p0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    new-instance v1, Ll/oat;

    .line 99
    .line 100
    invoke-direct {v1, v0}, Ll/oat;-><init>(Ll/vat;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->removeOperationItem()Ll/v3f$d;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    check-cast p0, Lrx/c;

    .line 125
    .line 126
    invoke-virtual {v0, p0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    new-instance v1, Ll/pat;

    .line 131
    .line 132
    invoke-direct {v1}, Ll/pat;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    new-instance v1, Ll/qat;

    .line 140
    .line 141
    invoke-direct {v1, v0}, Ll/qat;-><init>(Ll/vat;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 149
    .line 150
    .line 151
    new-instance p0, Ll/rat;

    .line 152
    .line 153
    invoke-direct {p0, v0}, Ll/rat;-><init>(Ll/vat;)V

    .line 154
    .line 155
    .line 156
    const-class v1, Ll/z160;

    .line 157
    .line 158
    invoke-virtual {v0, v1, p0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public final t4(Ljava/lang/String;JLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Z)V
    .locals 1
    .param p4    # Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/tat;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p5, p4}, Ll/tat;-><init>(Ll/vat;Ljava/lang/String;ZLcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2, p3, v0}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u4(Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vat;->j:Landroid/graphics/Point;

    .line 2
    .line 3
    return-void
.end method

.method public final v4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "lotteryGiftRedPacket"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->extraData:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStart()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/q260$a;

    .line 26
    .line 27
    const/16 v1, 0x1fa4

    .line 28
    .line 29
    invoke-direct {p1, v1}, Ll/q260$a;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final w4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "turboCoupon"

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->extraData:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStart()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/q260$a;

    .line 26
    .line 27
    const/16 v1, 0x1fa4

    .line 28
    .line 29
    invoke-direct {p1, v1}, Ll/q260$a;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
