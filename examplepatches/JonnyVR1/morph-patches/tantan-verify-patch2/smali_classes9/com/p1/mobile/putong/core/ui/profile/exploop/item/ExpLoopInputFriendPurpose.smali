.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputFriendPurpose;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRIRkFTSFoySVJUVTQzNUVWWE83VVpRRlJHVDRBNzE0IiwidyI6NDE0LCJoIjozNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTM5NDA5NTY4MDczNDE1NzA1OH0.png"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x7

    .line 5
    const-string v3, "\u4f60\u60f3\u5efa\u7acb\u4ec0\u4e48\u6837\u7684\u611f\u60c5\u5173\u7cfb?"

    .line 6
    .line 7
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;->boolValue:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;)Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-direct {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public fillInputContentData(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper;->d(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData;

    .line 6
    .line 7
    new-instance v0, Ll/lff;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/lff;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData;-><init>(Ljava/util/ArrayList;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setData(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_edit_dating_purpose"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "dating_purpose"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasInfoExist(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public saveUserInfo(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->saveUserInfo(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getData()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getSelectType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData;->list:Ljava/util/ArrayList;

    .line 13
    .line 14
    new-instance v0, Ll/mff;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/mff;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 32
    .line 33
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;->text:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->nn(Ljava/lang/String;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    new-array p1, p1, [Lcom/p1/mobile/putong/data/Purpose;

    .line 58
    .line 59
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 64
    .line 65
    return-void
.end method
