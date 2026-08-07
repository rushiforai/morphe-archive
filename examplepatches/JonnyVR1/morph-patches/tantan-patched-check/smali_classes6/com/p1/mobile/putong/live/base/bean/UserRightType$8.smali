.class final enum Lcom/p1/mobile/putong/live/base/bean/UserRightType$8;
.super Lcom/p1/mobile/putong/live/base/bean/UserRightType;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/bean/UserRightType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;-><init>(Ljava/lang/String;ILl/zhk0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/zhk0;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$8;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public getEquipNotice(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeftIcon()I
    .locals 0

    .line 1
    sget p0, Ll/mbc0;->P:I

    .line 2
    .line 3
    return p0
.end method

.method public getManageTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->i1:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRightBindAnchorsUrlStr(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getRightListUrlStr(Ll/yhk0;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getUnEquipUrl()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method
