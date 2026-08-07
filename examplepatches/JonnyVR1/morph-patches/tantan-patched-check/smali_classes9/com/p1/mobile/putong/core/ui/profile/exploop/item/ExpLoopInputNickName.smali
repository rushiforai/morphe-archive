.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputNickName;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNFRDNWRlFRUENJRUNCWEM1STVYUVhGRkJGMlQzNDE0IiwidyI6NDE1LCJoIjozNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDE5NDY4MjUwNTY3Mjg2MzA2MX0.png"

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/16 v2, 0x11

    .line 5
    .line 6
    const-string v3, "\u8be5\u5982\u4f55\u79f0\u547c\u4f60?"

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
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 2
    .line 3
    new-instance p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 4
    .line 5
    const-string v0, "\u6dfb\u52a0\u6635\u79f0"

    .line 6
    .line 7
    invoke-direct {p2, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/16 p1, 0x32

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->setMaxCount(I)Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string p2, "\u6635\u79f0\u4e0d\u80fd\u4e3a\u7a7a"

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->setErrorTips(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setData(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_edit_nickname"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "nickname"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasInfoExist(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public saveUserInfo(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;->getTextType()Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->text1:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/jyb;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method
