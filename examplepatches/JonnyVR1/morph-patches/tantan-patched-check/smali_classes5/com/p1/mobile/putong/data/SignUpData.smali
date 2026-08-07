.class public Lcom/p1/mobile/putong/data/SignUpData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public action:Ljava/lang/String;

.field public age:I

.field public appsFlyerUID:Ljava/lang/String;

.field public b1:Z

.field public b2:Z

.field public b3:Z

.field public b4:Z

.field public bb:Z

.field public bindVerifyData:Lcom/p1/mobile/putong/data/VerifyData;

.field public birthdate:Ljava/lang/Double;

.field public bloodType:Lcom/p1/mobile/putong/data/BloodType;

.field public code:I

.field public countryCode:I

.field public email:Ljava/lang/String;

.field public ethnicity:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public fbSignupData:Lcom/p1/mobile/putong/data/FBSignupData;

.field public firebaseId:Ljava/lang/String;

.field public gender:Lcom/p1/mobile/putong/data/Gender;

.field public hideContacts:Z

.field public hideMutualContacts:Z

.field public intlFriendPurpose:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public language:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public name:Ljava/lang/String;

.field public newGender:Lcom/p1/mobile/putong/data/IntlGender;

.field public newProfilePath:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public others:Lcom/p1/mobile/putong/data/OtherSettingsOthers;

.field public password:Ljava/lang/String;

.field public phoneNumber:Ljava/lang/String;

.field public profileMineType:Ljava/lang/String;

.field public profilePath:Ljava/lang/String;

.field public profileShowGender:Z

.field public qualificationType:Lcom/p1/mobile/putong/data/QualificationType;

.field public readContactsPermissionGranted:Z

.field public school:Ljava/lang/String;

.field public signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

.field public subGenderOption:Ljava/lang/String;

.field public thirdPartyAccessCode:Ljava/lang/String;

.field public thirdPartyId:Ljava/lang/String;

.field public thirdPartyToken:Ljava/lang/String;

.field public thirdPartyUnionid:Ljava/lang/String;

.field public thirdPartyValidation:Lcom/p1/mobile/putong/data/ThirdPartyValidation;

.field public tsd1:Z

.field public tsd2:Z

.field public verifyType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/SignUpData;->bb:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/SignUpData;->profileShowGender:Z

    .line 9
    .line 10
    return-void
.end method

.method public static getNonNullPhoneNumber()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/bn5;->getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 25
    .line 26
    return-object v0
.end method
