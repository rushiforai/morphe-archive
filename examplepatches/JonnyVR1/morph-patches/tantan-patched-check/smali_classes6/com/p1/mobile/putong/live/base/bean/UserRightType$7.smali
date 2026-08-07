.class final enum Lcom/p1/mobile/putong/live/base/bean/UserRightType$7;
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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/bean/UserRightType$7;-><init>(Ljava/lang/String;I)V

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

    const/4 p0, 0x0

    return p0
.end method

.method public getManageTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->B1:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

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

.method public getRightEquipUrlStr(Ll/z8d0;Ljava/lang/String;)Ll/rnl;
    .locals 1

    .line 1
    const-string p0, "/userMedals/"

    .line 2
    .line 3
    invoke-static {p0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Ll/z8d0;->c()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/rnl$a;->b(Ljava/lang/String;)Ll/rnl$a;

    .line 16
    .line 17
    .line 18
    const-string v0, "actions"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/rnl$a;->b(Ljava/lang/String;)Ll/rnl$a;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2}, Ll/rnl$a;->b(Ljava/lang/String;)Ll/rnl$a;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ll/z8d0;->b()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_0

    .line 35
    .line 36
    const-string p2, "roomId"

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/z8d0;->b()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, p2, v0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p1}, Ll/z8d0;->a()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_1

    .line 54
    .line 55
    const-string p2, "liveId"

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/z8d0;->a()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p2, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
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

    .line 1
    const-string p0, "/rights/medal/actions/unequip"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoiceAvatarRightsUrl()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "/voiceRights/medal/me"

    .line 2
    .line 3
    return-object p0
.end method

.method public isVideoRoomRight()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
