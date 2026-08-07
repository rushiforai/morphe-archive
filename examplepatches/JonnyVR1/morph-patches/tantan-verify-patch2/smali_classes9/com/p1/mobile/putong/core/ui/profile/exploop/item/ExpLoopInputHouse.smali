.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
.source "SourceFile"


# instance fields
.field haveHouseStr:Ljava/lang/String;

.field noHouseStr:Ljava/lang/String;

.field notRevealStr:Ljava/lang/String;

.field private regionList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNBUDROV1cyS1hCU09SREJOVDJCRVZQUE83REVMQzE0IiwidyI6NDE0LCJoIjozNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1MjQ4MDc1MzM3MjAwODkwMzc0fQ.png"

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const/16 v2, 0xb

    .line 5
    .line 6
    const-string v3, "\u4f60\u6709\u623f\u4ea7\u5417?"

    .line 7
    .line 8
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/R$string;->D6:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->haveHouseStr:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/core/R$string;->dk:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->noHouseStr:Ljava/lang/String;

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 32
    .line 33
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Zj:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->notRevealStr:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v0, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->regionList:Ljava/util/ArrayList;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->lambda$fillInputContentData$0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method private getSubRegionList(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_2

    .line 7
    .line 8
    const-string p0, "-"

    .line 9
    .line 10
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 48
    .line 49
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_1

    .line 64
    .line 65
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->subRegion:Ljava/util/List;

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_2
    :goto_0
    return-object v0
.end method

.method private synthetic lambda$fillInputContentData$0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p6, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p5}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->setWheelData2AndData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    check-cast p3, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;

    .line 12
    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->c5()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    const/4 p6, 0x2

    .line 22
    if-ne p4, p6, :cond_1

    .line 23
    .line 24
    invoke-direct {p0, p1, p2, p5}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->setWheelData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    check-cast p3, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->c5()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method private setWheelData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->getSubRegionList(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_1

    .line 10
    .line 11
    iput-object p0, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    const/4 v0, 0x0

    .line 26
    if-nez p3, :cond_0

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    check-cast p3, Ljava/lang/CharSequence;

    .line 33
    .line 34
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-nez p3, :cond_0

    .line 39
    .line 40
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/lang/String;

    .line 45
    .line 46
    iput-object p0, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/String;

    .line 54
    .line 55
    iput-object p0, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    const-string p0, "-"

    .line 59
    .line 60
    iput-object p0, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 61
    .line 62
    filled-new-array {p0}, [Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iput-object p0, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 71
    .line 72
    return-void
.end method


# virtual methods
.method public fillInputContentData(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->regionList:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->u()Lcom/p1/mobile/putong/core/data/HometownSuggest;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HometownSuggest;->china:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->regionList:Ljava/util/ArrayList;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/HometownChinaItem;->region:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 47
    .line 48
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;-><init>()V

    .line 49
    .line 50
    .line 51
    const/4 v1, 0x3

    .line 52
    const-string v2, "-"

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->fillWithEmpty(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->haveHouseStr:Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->noHouseStr:Ljava/lang/String;

    .line 68
    .line 69
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->notRevealStr:Ljava/lang/String;

    .line 73
    .line 74
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 78
    .line 79
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData1:Ljava/util/List;

    .line 86
    .line 87
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_2

    .line 92
    .line 93
    const/4 v1, 0x0

    .line 94
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Ljava/lang/CharSequence;

    .line 99
    .line 100
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_1

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_1
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Ljava/lang/String;

    .line 112
    .line 113
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->setWheelData2AndData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->noHouseStr:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 122
    .line 123
    const/4 v1, 0x0

    .line 124
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->setWheelData2AndData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :goto_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setData(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;)V

    .line 128
    .line 129
    .line 130
    instance-of v1, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;

    .line 131
    .line 132
    if-eqz v1, :cond_3

    .line 133
    .line 134
    move-object v1, p2

    .line 135
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;

    .line 136
    .line 137
    new-instance v2, Ll/zff;

    .line 138
    .line 139
    invoke-direct {v2, p0, p1, v0, p2}, Ll/zff;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeFrag;->e5(Ll/a30;)V

    .line 143
    .line 144
    .line 145
    :cond_3
    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_edit_house"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "house"

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 p2, 0x0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    const-string p0, ""

    .line 45
    .line 46
    :goto_1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper;->j(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_2
    return p2
.end method

.method public hasWheelDataChanged(Lcom/p1/mobile/putong/data/User;)Z
    .locals 5

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getData()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getWheelType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    if-nez v2, :cond_3

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    check-cast v4, Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_3

    .line 40
    .line 41
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ljava/lang/CharSequence;

    .line 46
    .line 47
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const-string v4, "-"

    .line 60
    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ljava/lang/CharSequence;

    .line 68
    .line 69
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/String;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_1

    .line 94
    .line 95
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ljava/lang/CharSequence;

    .line 100
    .line 101
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_0

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_0
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Ljava/lang/CharSequence;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    :goto_0
    xor-int/2addr p0, v3

    .line 121
    return p0

    .line 122
    :cond_1
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v4, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    goto :goto_0

    .line 129
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v4, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    goto :goto_0

    .line 136
    :cond_3
    return v3
.end method

.method public saveUserInfo(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->saveUserInfo(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getData()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getWheelType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 17
    .line 18
    const-string v3, "-"

    .line 19
    .line 20
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const-string v5, ""

    .line 25
    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    move-object v2, v5

    .line 29
    :cond_0
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    move-object v0, v5

    .line 36
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->noHouseStr:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_3

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->notRevealStr:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    move-object v5, v2

    .line 54
    goto :goto_1

    .line 55
    :cond_3
    :goto_0
    move-object v0, v5

    .line 56
    :goto_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 61
    .line 62
    filled-new-array {v1}, [Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserWealth;->house:Ljava/util/List;

    .line 71
    .line 72
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 77
    .line 78
    filled-new-array {v5}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 87
    .line 88
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 93
    .line 94
    filled-new-array {v0}, [Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserWealth;->houseSubRegion:Ljava/util/List;

    .line 103
    .line 104
    return-void
.end method

.method public setWheelData2AndData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->haveHouseStr:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_2

    .line 8
    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->regionList:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-nez p3, :cond_1

    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->regionList:Ljava/util/ArrayList;

    .line 18
    .line 19
    iput-object p3, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 20
    .line 21
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 26
    .line 27
    iget-object p3, p3, Lcom/p1/mobile/putong/data/UserWealth;->houseRegion:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/CharSequence;

    .line 41
    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    check-cast p3, Ljava/lang/String;

    .line 53
    .line 54
    iput-object p3, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->regionList:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    check-cast p3, Ljava/lang/String;

    .line 64
    .line 65
    iput-object p3, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 66
    .line 67
    :goto_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 68
    .line 69
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->setWheelData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void

    .line 73
    :cond_2
    const-string p3, "-"

    .line 74
    .line 75
    iput-object p3, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 76
    .line 77
    filled-new-array {p3}, [Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    invoke-static {p3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    iput-object p3, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 86
    .line 87
    iget-object p3, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 88
    .line 89
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputHouse;->setWheelData3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
