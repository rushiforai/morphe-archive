.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
.source "SourceFile"


# instance fields
.field private needCount:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJIRjdaUURVTzJBSFpYSUhNUVUzRE1OSFJVSU5PNDE0IiwidyI6NDE0LCJoIjozNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5NTM2NDg3NTQyODU1NjA4ODc2fQ.png"

    .line 2
    .line 3
    const/16 v1, 0x3f6

    .line 4
    .line 5
    const/16 v2, 0xe

    .line 6
    .line 7
    const-string v3, "\u7b80\u5355\u4ecb\u7ecd\u4e0b\u81ea\u5df1"

    .line 8
    .line 9
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;->needCount:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public fillInputContentData(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V
    .locals 2

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 4
    .line 5
    const-string v1, "\u81ea\u6211\u4ecb\u7ecd\u4e00\u4e0b..."

    .line 6
    .line 7
    invoke-direct {v0, p2, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/16 p2, 0x1f4

    .line 11
    .line 12
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->setMaxCount(I)Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;->needCount:I

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->setNeedCount(I)Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    const-string p1, "\u672c\u79d1\u91cd\u5e86\u53cc\u975e\uff0c\u672a\u6765\u56db\u5230\u4e94\u5e74\u4f1a\u5728\u5317\u4eac\u8bfb\u535a\u3002\u7231\u597d\u7fbd\u6bdb\u7403\u3001\u684c\u6e38\uff0c\u5076\u5c14\u6668\u8dd1\u6216\u6e38\u6cf3\u3002\u5e0c\u671b\u8ba4\u8bc6\u4e00\u4e2a\u53ef\u4ee5\u8ba4\u771f\u604b\u7231\u7684\u7537\u5b69\uff0c\u4e00\u8d77\u5206\u4eab\u7f8e\u597d\u3002"

    .line 29
    .line 30
    iput-object p1, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->text3:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p1, "\u60c5\u7eea\u7a33\u5b9a\uff0c\u6709\u4e8b\u4e1a\u5fc3\u3002\u5e73\u65f6\u559c\u6b22\u6253\u7bee\u7403\u3001\u7fbd\u6bdb\u7403\uff0c\u6709\u65f6\u95f4\u4f1a\u53bb\u65c5\u6e38\u6253\u5361\u3002\u5e0c\u671b\u8ba4\u8bc6\u4e00\u4e2a\u4e50\u89c2\u5584\u826f\u3001\u6709\u5171\u540c\u8bdd\u9898\u7684\u5973\u5b69\u3002"

    .line 34
    .line 35
    iput-object p1, p2, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->text3:Ljava/lang/String;

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setData(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_edit_self_introduction_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "self_introduction"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasInfoExist(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_PICKS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p2, v0, :cond_1

    .line 5
    .line 6
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;->needCount:I

    .line 21
    .line 22
    if-lt p1, p0, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->q2:Ll/ura;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ura;->n3()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    return v1

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    xor-int/2addr p0, v1

    .line 48
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
    iput-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public setNeedCount(I)Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;->needCount:I

    .line 2
    .line 3
    return-object p0
.end method
