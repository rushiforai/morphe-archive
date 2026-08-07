.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputVerification;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRLUzRCTlMyTlRXSTJaUE8zRTdTWElXQTJaNktETzE0IiwidyI6NDE0LCJoIjozNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNTU3NTgyMzQ5MDg4NjI2NDg1MH0.png"

    .line 2
    .line 3
    const/16 v1, 0x401

    .line 4
    .line 5
    const/16 v2, 0x19

    .line 6
    .line 7
    const-string v3, "\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 8
    .line 9
    invoke-direct {p0, v2, v3, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    const-string v0, "\u4f7f\u7528\u4e94\u5b98\u6e05\u6670\u6b63\u9762\u7167\u5b8c\u6210\u8ba4\u8bc1\uff0c\u89e3\u9501\u4e13\u5c5e\u6743\u76ca"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->setSubTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public canExit(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 2
    .line 3
    if-eq p2, v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->canExit(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public fillInputContentData(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V
    .locals 0

    return-void
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_avatar_verify"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "verification"

    .line 2
    .line 3
    return-object p0
.end method

.method public hasInfoExist(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 14
    .line 15
    const-string p2, "verified"

    .line 16
    .line 17
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 26
    .line 27
    const-string p1, "pending"

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    :cond_0
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public saveUserInfo(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    return-void
.end method
