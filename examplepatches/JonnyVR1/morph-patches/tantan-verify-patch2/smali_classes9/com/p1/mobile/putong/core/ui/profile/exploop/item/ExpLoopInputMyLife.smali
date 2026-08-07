.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyLife;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFKUkZTQVA3M0NNRlNYR1laNFIyN0ZNWVU2M0NPVTE0IiwidyI6NDE1LCJoIjozNjEsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTkyMDQyMjE2MjUzNTYyOTI0NX0.png"

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    const/16 v2, 0x18

    .line 5
    .line 6
    const-string v3, "\u8bf7\u4e0a\u4f20\u81f3\u5c113\u5f20\u7167\u7247"

    .line 7
    .line 8
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public fillInputContentData(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V
    .locals 0

    .line 1
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 2
    .line 3
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 7
    .line 8
    iput-object p1, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->pictures:Ljava/util/List;

    .line 9
    .line 10
    const/4 p1, 0x3

    .line 11
    iput p1, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->needCount:I

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setData(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_upload_photos"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "my_lift"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasInfoExist(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 p1, 0x3

    .line 16
    if-lt p0, p1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public saveUserInfo(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->getData()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getImageType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getImageType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->pictures:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopUploadImageTypeData;->pictures:Ljava/util/List;

    .line 22
    .line 23
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 24
    .line 25
    :cond_0
    return-void
.end method
