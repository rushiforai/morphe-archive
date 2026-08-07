.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputQualification;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    const-string v0, "\u4f60\u7684\u6700\u9ad8\u5b66\u5386\u662f?"

    .line 2
    .line 3
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxJUzVPV0hFNkw1TU5JWUZMT002RlVUSFRORzI3TjE0IiwidyI6NDE0LCJoIjozNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjQ3MzA2MzMwNjA2NDE2MzI0fQ.png"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-direct {p0, v2, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "\u6682\u4e0d\u900f\u9732"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;)Ljava/lang/Boolean;
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

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;)Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData$ItemData;
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
    invoke-static {p1}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper;->g(Lcom/p1/mobile/putong/data/User;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 8
    .line 9
    if-ne p2, v0, :cond_0

    .line 10
    .line 11
    new-instance p2, Ll/igf;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/igf;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData;

    .line 20
    .line 21
    new-instance v0, Ll/jgf;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/jgf;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopSelectTypeData;-><init>(Ljava/util/ArrayList;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setData(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_edit_education_degree"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "education_degree"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasInfoExist(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z
    .locals 1

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
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_2

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/lang/CharSequence;

    .line 31
    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_2

    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 39
    .line 40
    if-ne p2, p0, :cond_1

    .line 41
    .line 42
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 43
    .line 44
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Zj:I

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_0

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_0
    return v0

    .line 70
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 71
    return p0

    .line 72
    :cond_2
    return v0
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
    new-instance v0, Ll/kgf;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/kgf;-><init>()V

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
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Pi(Ljava/lang/String;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 58
    .line 59
    return-void
.end method
