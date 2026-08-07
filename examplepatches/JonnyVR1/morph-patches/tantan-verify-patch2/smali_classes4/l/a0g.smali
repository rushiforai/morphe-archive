.class public Ll/a0g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/l4g0;

.field public static b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static c:J

.field public static d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_fake_gender_popup"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/a0g;->a:Ll/l4g0;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Ll/a0g;->b:Lrx/subjects/b;

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    sput-wide v0, Ll/a0g;->c:J

    .line 25
    .line 26
    const-string v0, "noPictureDlg"

    .line 27
    .line 28
    sput-object v0, Ll/a0g;->d:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const-string v0, "button_type_fake"

    .line 2
    .line 3
    const-string v1, "open"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_fake_togood_privacy_button"

    .line 14
    .line 15
    const-string v2, "p_fake_togood_privacy"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "\u60a8\u5df2\u5b8c\u6210\u9690\u79c1\u8bbe\u7f6e\uff0c\u540e\u7eed\u53ef\u4ee5\u5728\u9996\u9875\u53f3\u4e0a\u89d2\u5165\u53e3\u8fdb\u5165\u66f4\u6539"

    .line 21
    .line 22
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->clone()Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;->showMeToMyLike:Ljava/lang/Boolean;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ll/ina;->R3(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)Lrx/c;

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/rzf;

    .line 41
    .line 42
    invoke-direct {p0, p1}, Ll/rzf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 43
    .line 44
    .line 45
    const-wide/16 v0, 0x3e8

    .line 46
    .line 47
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static B()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->u5:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    iget-object v0, v0, Ll/dkb;->v5:Ll/vxd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dkb;->w5:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object v0, v0, Ll/dkb;->x5:Ll/vxd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 35
    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    iget-object v0, v0, Ll/dkb;->y5:Ll/wyd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 44
    .line 45
    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 49
    .line 50
    iget-object v0, v0, Ll/dkb;->z5:Ll/vxd0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/vxd0;->clear()Z

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static C()V
    .locals 1

    .line 1
    invoke-static {}, Ll/spl0;->C()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F2:Ll/br8;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/br8;->f3()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static D()I
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, v1, Ll/dkb;->y5:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    iget-object v0, v0, Ll/dkb;->z5:Ll/vxd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    return v0

    .line 54
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v1, v1, Ll/dkb;->y5:Ll/wyd0;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v0, v0, Ll/dkb;->z5:Ll/vxd0;

    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return v1
.end method

.method public static E(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const v3, 0x3f4ccccd    # 0.8f

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    const/high16 v4, 0x42200000    # 40.0f

    .line 26
    .line 27
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    sub-int/2addr v3, v4

    .line 32
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->setCroppingNewStyle(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static F()I
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, v1, Ll/dkb;->u5:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    iget-object v0, v0, Ll/dkb;->v5:Ll/vxd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    return v0

    .line 54
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v1, v1, Ll/dkb;->u5:Ll/wyd0;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v0, v0, Ll/dkb;->v5:Ll/vxd0;

    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return v1
.end method

.method public static G()I
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, v1, Ll/dkb;->w5:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    iget-object v0, v0, Ll/dkb;->x5:Ll/vxd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    return v0

    .line 54
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v1, v1, Ll/dkb;->w5:Ll/wyd0;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v0, v0, Ll/dkb;->x5:Ll/vxd0;

    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return v1
.end method

.method public static H()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/a0g;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static I()Z
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->c8()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 38
    .line 39
    iget v0, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->aiPictureFrequency:I

    .line 40
    .line 41
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 46
    .line 47
    iget v2, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->totalFrequency:I

    .line 48
    .line 49
    invoke-static {}, Ll/a0g;->D()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-static {}, Ll/a0g;->F()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-static {}, Ll/a0g;->G()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    add-int/2addr v4, v5

    .line 62
    add-int/2addr v4, v3

    .line 63
    if-ge v3, v0, :cond_1

    .line 64
    .line 65
    if-ge v4, v2, :cond_1

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    return v0

    .line 69
    :cond_1
    :goto_0
    return v1
.end method

.method public static J()Z
    .locals 5

    .line 1
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 16
    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->netPictureFrequency:I

    .line 18
    .line 19
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 24
    .line 25
    iget v1, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->totalFrequency:I

    .line 26
    .line 27
    invoke-static {}, Ll/a0g;->D()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {}, Ll/a0g;->F()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-static {}, Ll/a0g;->G()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    add-int/2addr v4, v3

    .line 40
    add-int/2addr v4, v2

    .line 41
    if-ge v3, v0, :cond_0

    .line 42
    .line 43
    if-ge v4, v1, :cond_0

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    return v0

    .line 47
    :cond_0
    const/4 v0, 0x0

    .line 48
    return v0
.end method

.method public static K()Z
    .locals 5

    .line 1
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 16
    .line 17
    iget v0, v0, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->repeatPictureFrequency:I

    .line 18
    .line 19
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->trigger:Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;

    .line 24
    .line 25
    iget v1, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureTrigger;->totalFrequency:I

    .line 26
    .line 27
    invoke-static {}, Ll/a0g;->D()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {}, Ll/a0g;->F()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-static {}, Ll/a0g;->G()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    add-int/2addr v3, v4

    .line 40
    add-int/2addr v3, v2

    .line 41
    if-ge v4, v0, :cond_0

    .line 42
    .line 43
    if-ge v3, v1, :cond_0

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    return v0

    .line 47
    :cond_0
    const/4 v0, 0x0

    .line 48
    return v0
.end method

.method public static L()Z
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 18
    .line 19
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    cmp-long v1, v1, v3

    .line 22
    .line 23
    if-gtz v1, :cond_0

    .line 24
    .line 25
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 26
    .line 27
    const-wide/16 v2, 0x26

    .line 28
    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-ltz v0, :cond_1

    .line 32
    .line 33
    :cond_0
    const/4 v0, 0x1

    .line 34
    return v0

    .line 35
    :cond_1
    invoke-static {}, Ll/joa;->G3()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    return v0
.end method

.method public static M(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "hidden"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static N()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    instance-of v2, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    const-string v1, "WITH_REPEAT_MAIN_PICTURE"

    .line 41
    .line 42
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    return v0

    .line 51
    :cond_0
    return v1
.end method

.method public static O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 10
    .line 11
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    iget-object p0, p0, Ll/dkb;->q1:Ll/jxd0;

    .line 25
    .line 26
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget p2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 33
    .line 34
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 35
    .line 36
    .line 37
    new-instance p2, Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    invoke-direct {p2}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 43
    .line 44
    new-instance v0, Lcom/p1/mobile/putong/data/Settings;

    .line 45
    .line 46
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Settings;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v1, "female"

    .line 50
    .line 51
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    const-string v1, "male"

    .line 58
    .line 59
    :cond_1
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 64
    .line 65
    iput-object v0, p2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 66
    .line 67
    sget-object p1, Ll/a0g;->b:Lrx/subjects/b;

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance v0, Ll/ozf;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/ozf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 93
    .line 94
    invoke-virtual {p0, p2}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    new-instance p1, Ll/pzf;

    .line 99
    .line 100
    invoke-direct {p1}, Ll/pzf;-><init>()V

    .line 101
    .line 102
    .line 103
    new-instance p2, Ll/qzf;

    .line 104
    .line 105
    invoke-direct {p2}, Ll/qzf;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public static P()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, v1, Ll/dkb;->y5:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    iget-object v0, v0, Ll/dkb;->z5:Ll/vxd0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    add-int/2addr v1, v2

    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v1, v1, Ll/dkb;->y5:Ll/wyd0;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    iget-object v0, v0, Ll/dkb;->z5:Ll/vxd0;

    .line 77
    .line 78
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static Q()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, v1, Ll/dkb;->u5:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    iget-object v0, v0, Ll/dkb;->v5:Ll/vxd0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    add-int/2addr v1, v2

    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v1, v1, Ll/dkb;->u5:Ll/wyd0;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    iget-object v0, v0, Ll/dkb;->v5:Ll/vxd0;

    .line 77
    .line 78
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static R()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance v2, Ljava/util/Date;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/pzi0;->d:Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v1, v1, Ll/dkb;->w5:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    iget-object v0, v0, Ll/dkb;->x5:Ll/vxd0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    add-int/2addr v1, v2

    .line 55
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 66
    .line 67
    iget-object v1, v1, Ll/dkb;->w5:Ll/wyd0;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    iget-object v0, v0, Ll/dkb;->x5:Ll/vxd0;

    .line 77
    .line 78
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static S(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 19
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "noPictureDlg"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    goto/16 :goto_7

    .line 12
    .line 13
    :cond_0
    sget-object v2, Ll/a0g;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    goto/16 :goto_7

    .line 22
    .line 23
    :cond_1
    invoke-static {}, Ll/gra;->Z0()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    goto/16 :goto_7

    .line 30
    .line 31
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_3

    .line 44
    .line 45
    goto/16 :goto_7

    .line 46
    .line 47
    :cond_3
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const-string v4, "aiPictureDlg"

    .line 52
    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-nez v3, :cond_4

    .line 60
    .line 61
    goto/16 :goto_7

    .line 62
    .line 63
    :cond_4
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_5

    .line 68
    .line 69
    invoke-static {}, Ll/a0g;->I()Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-nez v3, :cond_5

    .line 74
    .line 75
    goto/16 :goto_7

    .line 76
    .line 77
    :cond_5
    const-string v3, "netPictureDlg"

    .line 78
    .line 79
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    if-eqz v5, :cond_6

    .line 84
    .line 85
    invoke-static {}, Ll/a0g;->J()Z

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    if-nez v5, :cond_6

    .line 90
    .line 91
    goto/16 :goto_7

    .line 92
    .line 93
    :cond_6
    const-string v5, "repeatPictureDlg"

    .line 94
    .line 95
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    if-eqz v6, :cond_7

    .line 100
    .line 101
    invoke-static {}, Ll/a0g;->K()Z

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    if-nez v6, :cond_7

    .line 106
    .line 107
    goto/16 :goto_7

    .line 108
    .line 109
    :cond_7
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 110
    .line 111
    const/4 v6, 0x0

    .line 112
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 117
    .line 118
    if-eqz v2, :cond_1a

    .line 119
    .line 120
    iget-object v7, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    if-eqz v7, :cond_8

    .line 127
    .line 128
    goto/16 :goto_7

    .line 129
    .line 130
    :cond_8
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    const-string v8, "net_picture"

    .line 135
    .line 136
    const-string v9, "swipeLimitDlg"

    .line 137
    .line 138
    if-nez v7, :cond_b

    .line 139
    .line 140
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v7

    .line 144
    if-nez v7, :cond_b

    .line 145
    .line 146
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v7

    .line 150
    if-eqz v7, :cond_9

    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_9
    invoke-static {v0, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    if-eqz v7, :cond_a

    .line 158
    .line 159
    const-string v7, "p_limit_change_avatar_popup"

    .line 160
    .line 161
    :goto_0
    move-object v14, v7

    .line 162
    goto :goto_3

    .line 163
    :cond_a
    const-string v8, ""

    .line 164
    .line 165
    move-object v14, v8

    .line 166
    goto :goto_3

    .line 167
    :cond_b
    :goto_1
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    if-eqz v7, :cond_c

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_c
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v7

    .line 178
    if-eqz v7, :cond_d

    .line 179
    .line 180
    const-string v8, "ai_picture"

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_d
    const-string v8, "repeat_picture"

    .line 184
    .line 185
    :goto_2
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 186
    .line 187
    .line 188
    move-result v7

    .line 189
    if-nez v7, :cond_e

    .line 190
    .line 191
    invoke-static {}, Ll/a0g;->C()V

    .line 192
    .line 193
    .line 194
    :cond_e
    const-string v7, "p_change_avatar_reminder_popup"

    .line 195
    .line 196
    goto :goto_0

    .line 197
    :goto_3
    const-class v7, Lcom/p1/mobile/android/app/Dialog;

    .line 198
    .line 199
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v7

    .line 203
    invoke-static {v14, v7}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 204
    .line 205
    .line 206
    move-result-object v7

    .line 207
    new-instance v10, Lorg/json/JSONObject;

    .line 208
    .line 209
    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 210
    .line 211
    .line 212
    :try_start_0
    const-string v11, "lowquality_reason"

    .line 213
    .line 214
    invoke-virtual {v10, v11, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v7, v10}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    .line 219
    .line 220
    :catch_0
    invoke-static/range {p0 .. p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 221
    .line 222
    .line 223
    move-result-object v8

    .line 224
    sget v10, Ll/kec0;->ic:I

    .line 225
    .line 226
    const/4 v11, 0x0

    .line 227
    invoke-virtual {v8, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 228
    .line 229
    .line 230
    move-result-object v8

    .line 231
    new-instance v10, Ll/jl80$a;

    .line 232
    .line 233
    move-object/from16 v12, p0

    .line 234
    .line 235
    invoke-direct {v10, v12}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v10, v8}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 239
    .line 240
    .line 241
    move-result-object v10

    .line 242
    invoke-virtual {v10, v6}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 243
    .line 244
    .line 245
    move-result-object v10

    .line 246
    invoke-virtual {v10}, Ll/jl80$a;->O()Ll/jl80;

    .line 247
    .line 248
    .line 249
    move-result-object v15

    .line 250
    invoke-virtual {v15, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 251
    .line 252
    .line 253
    sget v10, Ll/adc0;->A1:I

    .line 254
    .line 255
    invoke-virtual {v8, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v10

    .line 259
    check-cast v10, Lv/VImage;

    .line 260
    .line 261
    sget v11, Ll/adc0;->O:I

    .line 262
    .line 263
    invoke-virtual {v8, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 264
    .line 265
    .line 266
    move-result-object v11

    .line 267
    check-cast v11, Lv/VDraweeView;

    .line 268
    .line 269
    sget v13, Ll/adc0;->Jc:I

    .line 270
    .line 271
    invoke-virtual {v8, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 272
    .line 273
    .line 274
    move-result-object v13

    .line 275
    check-cast v13, Lv/VImage;

    .line 276
    .line 277
    sget v6, Ll/adc0;->je:I

    .line 278
    .line 279
    invoke-virtual {v8, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    check-cast v6, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 284
    .line 285
    move-object/from16 v16, v7

    .line 286
    .line 287
    sget v7, Ll/adc0;->bd:I

    .line 288
    .line 289
    invoke-virtual {v8, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 290
    .line 291
    .line 292
    move-result-object v7

    .line 293
    check-cast v7, Lv/VText;

    .line 294
    .line 295
    sget v12, Ll/adc0;->ee:I

    .line 296
    .line 297
    invoke-virtual {v8, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 298
    .line 299
    .line 300
    move-result-object v12

    .line 301
    check-cast v12, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 302
    .line 303
    move-object/from16 v17, v12

    .line 304
    .line 305
    sget v12, Ll/adc0;->M0:I

    .line 306
    .line 307
    invoke-virtual {v8, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object v12

    .line 311
    check-cast v12, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 312
    .line 313
    move-object/from16 v18, v12

    .line 314
    .line 315
    sget v12, Ll/adc0;->N0:I

    .line 316
    .line 317
    invoke-virtual {v8, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 318
    .line 319
    .line 320
    move-result-object v8

    .line 321
    check-cast v8, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 322
    .line 323
    new-instance v12, Ll/zyf;

    .line 324
    .line 325
    invoke-direct {v12, v14, v15}, Ll/zyf;-><init>(Ljava/lang/String;Ll/jl80;)V

    .line 326
    .line 327
    .line 328
    invoke-static {v10, v12}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 329
    .line 330
    .line 331
    sget-object v10, Ll/uqb0;->G:Ll/fsb0;

    .line 332
    .line 333
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v10, v11, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    sget v2, Ll/dbc0;->mq:I

    .line 339
    .line 340
    invoke-virtual {v13, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 341
    .line 342
    .line 343
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->new_()Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 348
    .line 349
    .line 350
    move-result v10

    .line 351
    if-eqz v10, :cond_f

    .line 352
    .line 353
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->repeatPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 354
    .line 355
    goto :goto_4

    .line 356
    :cond_f
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 357
    .line 358
    .line 359
    move-result v10

    .line 360
    if-eqz v10, :cond_10

    .line 361
    .line 362
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->netPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 363
    .line 364
    goto :goto_4

    .line 365
    :cond_10
    invoke-static {v0, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 366
    .line 367
    .line 368
    move-result v9

    .line 369
    if-eqz v9, :cond_11

    .line 370
    .line 371
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->swipeLimitDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 372
    .line 373
    goto :goto_4

    .line 374
    :cond_11
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 375
    .line 376
    .line 377
    move-result v9

    .line 378
    if-eqz v9, :cond_12

    .line 379
    .line 380
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgConfig;->aiPictureDlg:Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;

    .line 381
    .line 382
    :cond_12
    :goto_4
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->title:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 385
    .line 386
    .line 387
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->subTitle1:Ljava/lang/String;

    .line 388
    .line 389
    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 390
    .line 391
    .line 392
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->subTitle2:Ljava/lang/String;

    .line 393
    .line 394
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 395
    .line 396
    .line 397
    move-result v1

    .line 398
    if-nez v1, :cond_13

    .line 399
    .line 400
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->subTitle2:Ljava/lang/String;

    .line 401
    .line 402
    move-object/from16 v12, v17

    .line 403
    .line 404
    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 405
    .line 406
    .line 407
    goto :goto_5

    .line 408
    :cond_13
    move-object/from16 v12, v17

    .line 409
    .line 410
    const/4 v1, 0x0

    .line 411
    invoke-static {v12, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 412
    .line 413
    .line 414
    :goto_5
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->button1:Ljava/lang/String;

    .line 415
    .line 416
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 417
    .line 418
    .line 419
    move-result v1

    .line 420
    if-nez v1, :cond_14

    .line 421
    .line 422
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->button1:Ljava/lang/String;

    .line 423
    .line 424
    move-object/from16 v12, v18

    .line 425
    .line 426
    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 427
    .line 428
    .line 429
    goto :goto_6

    .line 430
    :cond_14
    move-object/from16 v12, v18

    .line 431
    .line 432
    :goto_6
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->button2:Ljava/lang/String;

    .line 433
    .line 434
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    if-nez v1, :cond_15

    .line 439
    .line 440
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->button2:Ljava/lang/String;

    .line 441
    .line 442
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 443
    .line 444
    .line 445
    :cond_15
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->buttonLink1:Ljava/lang/String;

    .line 446
    .line 447
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->buttonLink2:Ljava/lang/String;

    .line 448
    .line 449
    iget-object v13, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->buttonEid1:Ljava/lang/String;

    .line 450
    .line 451
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/RepeatNetPictureDlgContent;->buttonEid2:Ljava/lang/String;

    .line 452
    .line 453
    new-instance v10, Ll/kzf;

    .line 454
    .line 455
    move-object v6, v12

    .line 456
    move-object/from16 v12, p0

    .line 457
    .line 458
    invoke-direct/range {v10 .. v15}, Ll/kzf;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/jl80;)V

    .line 459
    .line 460
    .line 461
    move-object v7, v13

    .line 462
    invoke-static {v6, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 463
    .line 464
    .line 465
    new-instance v10, Ll/szf;

    .line 466
    .line 467
    move-object v11, v1

    .line 468
    move-object v13, v2

    .line 469
    invoke-direct/range {v10 .. v15}, Ll/szf;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/jl80;)V

    .line 470
    .line 471
    .line 472
    invoke-static {v8, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 473
    .line 474
    .line 475
    invoke-static/range {p0 .. p0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 476
    .line 477
    .line 478
    move-result v1

    .line 479
    if-eqz v1, :cond_17

    .line 480
    .line 481
    new-instance v1, Ll/tzf;

    .line 482
    .line 483
    invoke-direct {v1}, Ll/tzf;-><init>()V

    .line 484
    .line 485
    .line 486
    invoke-virtual {v15, v1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 487
    .line 488
    .line 489
    sput-object v0, Ll/a0g;->d:Ljava/lang/String;

    .line 490
    .line 491
    invoke-virtual {v15}, Ll/jl80;->show()V

    .line 492
    .line 493
    .line 494
    invoke-static/range {v16 .. v16}, Ll/w1e;->f(Ll/l4g0;)V

    .line 495
    .line 496
    .line 497
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 498
    .line 499
    .line 500
    move-result v1

    .line 501
    if-nez v1, :cond_16

    .line 502
    .line 503
    invoke-static {v7, v14}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    .line 505
    .line 506
    :cond_16
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 507
    .line 508
    .line 509
    move-result v1

    .line 510
    if-nez v1, :cond_17

    .line 511
    .line 512
    invoke-static {v13, v14}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    :cond_17
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 516
    .line 517
    .line 518
    move-result v1

    .line 519
    if-eqz v1, :cond_18

    .line 520
    .line 521
    invoke-static {}, Ll/a0g;->Q()V

    .line 522
    .line 523
    .line 524
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 525
    .line 526
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 527
    .line 528
    const-string v1, "net"

    .line 529
    .line 530
    invoke-virtual {v0, v1}, Ll/dkb;->a7(Ljava/lang/String;)Lrx/c;

    .line 531
    .line 532
    .line 533
    goto :goto_7

    .line 534
    :cond_18
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 535
    .line 536
    .line 537
    move-result v1

    .line 538
    if-eqz v1, :cond_19

    .line 539
    .line 540
    invoke-static {}, Ll/a0g;->R()V

    .line 541
    .line 542
    .line 543
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 544
    .line 545
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 546
    .line 547
    const-string v1, "repeat"

    .line 548
    .line 549
    invoke-virtual {v0, v1}, Ll/dkb;->a7(Ljava/lang/String;)Lrx/c;

    .line 550
    .line 551
    .line 552
    goto :goto_7

    .line 553
    :cond_19
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 554
    .line 555
    .line 556
    move-result v0

    .line 557
    if-eqz v0, :cond_1a

    .line 558
    .line 559
    invoke-static {}, Ll/a0g;->P()V

    .line 560
    .line 561
    .line 562
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 563
    .line 564
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 565
    .line 566
    const-string v1, "ai_manual"

    .line 567
    .line 568
    invoke-virtual {v0, v1}, Ll/dkb;->a7(Ljava/lang/String;)Lrx/c;

    .line 569
    .line 570
    .line 571
    :cond_1a
    :goto_7
    return-void
.end method

.method public static T(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->e3:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    sget v2, Ll/adc0;->O:I

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 22
    .line 23
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v1, v2, v4, v3}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 40
    .line 41
    .line 42
    sget v1, Ll/adc0;->je:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lv/VText;

    .line 49
    .line 50
    sget v2, Lcom/p1/mobile/putong/core/R$string;->P4:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 53
    .line 54
    .line 55
    sget v1, Ll/adc0;->b1:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lv/VButton;

    .line 62
    .line 63
    sget v2, Lcom/p1/mobile/putong/core/R$string;->N4:I

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 66
    .line 67
    .line 68
    sget v2, Ll/adc0;->c1:I

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Lv/VButton;

    .line 75
    .line 76
    sget v4, Lcom/p1/mobile/putong/core/R$string;->O4:I

    .line 77
    .line 78
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 79
    .line 80
    .line 81
    new-instance v4, Ll/jl80$a;

    .line 82
    .line 83
    invoke-direct {v4, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, v3}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v4, v3}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v4, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v4, Ll/uzf;

    .line 103
    .line 104
    const-string v5, "p_fake_gender_popup"

    .line 105
    .line 106
    invoke-direct {v4, p0, p1, v0, v5}, Ll/uzf;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/jl80;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    new-instance v1, Ll/vzf;

    .line 113
    .line 114
    invoke-direct {v1, p0, p1, v0, v5}, Ll/vzf;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/jl80;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/fake/b;->q()Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    new-instance p1, Ll/wzf;

    .line 133
    .line 134
    invoke-direct {p1, v0}, Ll/wzf;-><init>(Ll/jl80;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    new-instance p1, Ll/xzf;

    .line 146
    .line 147
    invoke-direct {p1, p0}, Ll/xzf;-><init>(Ll/kcg0;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0}, Ll/jl80;->show()V

    .line 154
    .line 155
    .line 156
    sget-object p0, Ll/a0g;->a:Ll/l4g0;

    .line 157
    .line 158
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 159
    .line 160
    .line 161
    new-instance p0, Ljava/util/HashMap;

    .line 162
    .line 163
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 164
    .line 165
    .line 166
    const-string p1, "fake_gender"

    .line 167
    .line 168
    const-string v0, "male"

    .line 169
    .line 170
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 174
    .line 175
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 176
    .line 177
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    const-string v2, "female"

    .line 186
    .line 187
    if-eqz v1, :cond_0

    .line 188
    .line 189
    move-object v1, v2

    .line 190
    goto :goto_0

    .line 191
    :cond_0
    move-object v1, v0

    .line 192
    :goto_0
    const-string v3, "fake_gender_original"

    .line 193
    .line 194
    invoke-interface {p0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    const-string v1, "e_fake_alert_gender"

    .line 198
    .line 199
    invoke-static {v1, v5, p0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 200
    .line 201
    .line 202
    new-instance p0, Ljava/util/HashMap;

    .line 203
    .line 204
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 205
    .line 206
    .line 207
    invoke-interface {p0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 211
    .line 212
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 213
    .line 214
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-eqz p1, :cond_1

    .line 223
    .line 224
    move-object v0, v2

    .line 225
    :cond_1
    invoke-interface {p0, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    invoke-static {v1, v5, p0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public static U(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ina;->Z3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/hzf;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/hzf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static V(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/FakeGuideData;)V
    .locals 14
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/core/data/FakeGuideData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    if-eqz v3, :cond_5

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FakeGuideData;->identifier:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_3

    .line 20
    .line 21
    :cond_0
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto/16 :goto_3

    .line 28
    .line 29
    :cond_1
    iget-object v0, v3, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 30
    .line 31
    new-instance v1, Ll/yzf;

    .line 32
    .line 33
    invoke-direct {v1, p1}, Ll/yzf;-><init>(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    goto/16 :goto_3

    .line 43
    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FakeGuideData;->type:Ljava/lang/String;

    .line 45
    .line 46
    const-string v1, "mainAvatar"

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const-string v0, "p_fake_change_avatar_popup"

    .line 55
    .line 56
    :goto_0
    move-object v2, v0

    .line 57
    goto :goto_1

    .line 58
    :cond_3
    const-string v0, "p_secondary_avatar_change_popup"

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :goto_1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v2, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v4, Lorg/json/JSONObject;

    .line 72
    .line 73
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 74
    .line 75
    .line 76
    :try_start_0
    const-string v5, "user_id"

    .line 77
    .line 78
    iget-object v6, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v4}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    :catch_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    sget v5, Ll/kec0;->ic:I

    .line 91
    .line 92
    const/4 v6, 0x0

    .line 93
    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    new-instance v5, Ll/jl80$a;

    .line 98
    .line 99
    invoke-direct {v5, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v5, v4}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    const/4 v6, 0x0

    .line 107
    invoke-virtual {v5, v6}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-virtual {v5}, Ll/jl80$a;->O()Ll/jl80;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-virtual {v5, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 116
    .line 117
    .line 118
    sget v6, Ll/adc0;->A1:I

    .line 119
    .line 120
    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    check-cast v6, Lv/VImage;

    .line 125
    .line 126
    sget v7, Ll/adc0;->O:I

    .line 127
    .line 128
    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    check-cast v7, Lv/VDraweeView;

    .line 133
    .line 134
    sget v8, Ll/adc0;->Jc:I

    .line 135
    .line 136
    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    check-cast v8, Lv/VImage;

    .line 141
    .line 142
    sget v9, Ll/adc0;->je:I

    .line 143
    .line 144
    invoke-virtual {v4, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    check-cast v9, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 149
    .line 150
    sget v10, Ll/adc0;->bd:I

    .line 151
    .line 152
    invoke-virtual {v4, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v10

    .line 156
    check-cast v10, Lv/VText;

    .line 157
    .line 158
    sget v11, Ll/adc0;->ee:I

    .line 159
    .line 160
    invoke-virtual {v4, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v11

    .line 164
    check-cast v11, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 165
    .line 166
    sget v12, Ll/adc0;->M0:I

    .line 167
    .line 168
    invoke-virtual {v4, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    check-cast v12, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 173
    .line 174
    sget v13, Ll/adc0;->N0:I

    .line 175
    .line 176
    invoke-virtual {v4, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    move-object v13, v4

    .line 181
    check-cast v13, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 182
    .line 183
    new-instance v4, Ll/zzf;

    .line 184
    .line 185
    invoke-direct {v4, v2, v5}, Ll/zzf;-><init>(Ljava/lang/String;Ll/jl80;)V

    .line 186
    .line 187
    .line 188
    invoke-static {v6, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 189
    .line 190
    .line 191
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 192
    .line 193
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/FakeGuideData;->identifier:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {v4, v7, v6}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/FakeGuideData;->type:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-eqz v1, :cond_4

    .line 205
    .line 206
    sget p1, Ll/dbc0;->mq:I

    .line 207
    .line 208
    invoke-virtual {v8, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 209
    .line 210
    .line 211
    const-string p1, "\u66f4\u6362\u771f\u5b9e\u5934\u50cf"

    .line 212
    .line 213
    invoke-virtual {v9, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    .line 215
    .line 216
    const-string p1, "\u5f53\u524d\u4f7f\u7528\u7684\u7167\u7247\u4e0d\u771f\u5b9e\uff0c\u88ab\u559c\u6b22\u7684\u6982\u7387\u8f83\u4f4e\u3002\u8bf7\u7acb\u5373\u66f4\u6362\u4e3a\u672c\u4eba\u4e94\u5b98\u6e05\u6670\u7684\u6b63\u9762\u7167\u7247\uff0c\u83b7\u5f97\u66f4\u591a\u66dd\u5149\uff0c\u6536\u83b7\u559c\u6b22\u3002"

    .line 217
    .line 218
    invoke-virtual {v10, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    .line 220
    .line 221
    const-string p1, "\u6536\u52305\u6b21\u63d0\u9192\u4ecd\u672a\u66f4\u6362\uff0c\u7cfb\u7edf\u5c06\u9650\u5236\u4f60\u5728\u5212\u5361\u7684\u66dd\u5149\u3002"

    .line 222
    .line 223
    invoke-virtual {v11, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    .line 225
    .line 226
    const-string p1, "\u66f4\u6362\u5934\u50cf"

    .line 227
    .line 228
    invoke-virtual {v12, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    const-string p1, "\u5934\u50cf\u793a\u4f8b"

    .line 232
    .line 233
    invoke-virtual {v13, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    .line 235
    .line 236
    new-instance p1, Ll/azf;

    .line 237
    .line 238
    invoke-direct {p1, p0, v2}, Ll/azf;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-static {v12, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 242
    .line 243
    .line 244
    new-instance p1, Ll/bzf;

    .line 245
    .line 246
    invoke-direct {p1, p0, v3, v2}, Ll/bzf;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    invoke-static {v13, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 250
    .line 251
    .line 252
    move-object v6, p0

    .line 253
    goto :goto_2

    .line 254
    :cond_4
    sget v1, Ll/dbc0;->nq:I

    .line 255
    .line 256
    invoke-virtual {v8, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 257
    .line 258
    .line 259
    const-string v1, "\u4f7f\u7528\u771f\u5b9e\u7167\u7247\u4f5c\u4e3a\u4e3b\u5934\u50cf"

    .line 260
    .line 261
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    .line 263
    .line 264
    const-string v1, "\u5f53\u524d\u4f7f\u7528\u7684\u7167\u7247\u4e0d\u771f\u5b9e\uff0c\u5efa\u8bae\u4f7f\u7528\u7cfb\u7edf\u63a8\u8350\u5df2\u6709\u7684\u7167\u7247\u4f5c\u4e3a\u4e3b\u5934\u50cf\uff0c\u6216\u66f4\u6362\u6e05\u6670\u6b63\u9762\u7167\uff0c\u83b7\u5f97\u66f4\u591a\u66dd\u5149\uff0c\u6536\u83b7\u559c\u6b22\u3002"

    .line 265
    .line 266
    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    .line 268
    .line 269
    const-string v1, "\u8fde\u7eed3\u5929\u6536\u5230\u63d0\u9192\u4ecd\u672a\u4fee\u6539\uff0c\u7cfb\u7edf\u4f1a\u9ed8\u8ba4\u66f4\u6362\u3002"

    .line 270
    .line 271
    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    const-string v1, "\u7acb\u5373\u4f7f\u7528"

    .line 275
    .line 276
    invoke-virtual {v12, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    const-string v1, "\u4fee\u6539\u4e3b\u5934\u50cf"

    .line 280
    .line 281
    invoke-virtual {v13, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    .line 283
    .line 284
    new-instance v1, Ll/czf;

    .line 285
    .line 286
    move-object v6, p0

    .line 287
    move-object v4, p1

    .line 288
    invoke-direct/range {v1 .. v6}, Ll/czf;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/FakeGuideData;Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 289
    .line 290
    .line 291
    invoke-static {v12, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 292
    .line 293
    .line 294
    new-instance p0, Ll/dzf;

    .line 295
    .line 296
    invoke-direct {p0, v6, v2}, Ll/dzf;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-static {v13, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 300
    .line 301
    .line 302
    :goto_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 303
    .line 304
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 305
    .line 306
    invoke-virtual {p0}, Ll/dkb;->o9()Lrx/c;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 311
    .line 312
    .line 313
    move-result-object p0

    .line 314
    new-instance p1, Ll/ezf;

    .line 315
    .line 316
    invoke-direct {p1}, Ll/ezf;-><init>()V

    .line 317
    .line 318
    .line 319
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    invoke-virtual {v6, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    new-instance p1, Ll/fzf;

    .line 328
    .line 329
    invoke-direct {p1, v5}, Ll/fzf;-><init>(Ll/jl80;)V

    .line 330
    .line 331
    .line 332
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    new-instance p1, Ll/gzf;

    .line 341
    .line 342
    invoke-direct {p1, p0, v0}, Ll/gzf;-><init>(Ll/kcg0;Ll/l4g0;)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v5, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 346
    .line 347
    .line 348
    invoke-static {v6}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 349
    .line 350
    .line 351
    move-result p0

    .line 352
    if-eqz p0, :cond_5

    .line 353
    .line 354
    invoke-virtual {v5}, Ll/jl80;->show()V

    .line 355
    .line 356
    .line 357
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 358
    .line 359
    .line 360
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 361
    .line 362
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 363
    .line 364
    iget-object p0, p0, Ll/dkb;->r5:Ll/byd0;

    .line 365
    .line 366
    invoke-static {}, Ll/pzi0;->o()J

    .line 367
    .line 368
    .line 369
    move-result-wide v0

    .line 370
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 375
    .line 376
    .line 377
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 378
    .line 379
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 380
    .line 381
    iget-object p0, p0, Ll/dkb;->s5:Ll/vxd0;

    .line 382
    .line 383
    const/4 p1, 0x1

    .line 384
    invoke-virtual {p0, p1}, Ll/vxd0;->a(I)V

    .line 385
    .line 386
    .line 387
    :cond_5
    :goto_3
    return-void
.end method

.method public static synthetic a(Ll/jl80;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isAudit()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic c(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const-string p0, "noPictureDlg"

    .line 2
    .line 3
    sput-object p0, Ll/a0g;->d:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic d(Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/a0g;->a:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/a0g;->b:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f()V
    .locals 3

    .line 1
    const-string v0, "button_type_fake"

    .line 2
    .line 3
    const-string v1, "close"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_fake_togood_privacy_button"

    .line 14
    .line 15
    const-string v2, "p_fake_togood_privacy"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic g(Ljava/lang/String;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "e_choose_close"

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    invoke-static {p0}, Ll/gv20;->k(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, p1, p3, v0}, Ll/ks90;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "e_fake_alert_popup_example"

    .line 12
    .line 13
    invoke-static {p0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/jl80;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p4, "male"

    .line 2
    .line 3
    invoke-static {p4}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0, p1}, Ll/a0g;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string p1, "fake_gender"

    .line 25
    .line 26
    invoke-interface {p0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    const-string p4, "female"

    .line 44
    .line 45
    :cond_1
    const-string p1, "fake_gender_original"

    .line 46
    .line 47
    invoke-interface {p0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    const-string p1, "e_fake_alert_gender"

    .line 51
    .line 52
    invoke-static {p1, p3, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-static {p0, p2, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "e_change_avatar"

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic k(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const-class v0, Ll/jl80;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "p_fake_togood_privacy"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/jl80$a;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    const-string v2, "\u9690\u79c1\u4fdd\u62a4\u529f\u80fd\u53ef\u7528"

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "\u4e3a\u4e86\u4fdd\u62a4\u60a8\u7684\u9690\u79c1\uff0c\u60a8\u53ef\u4ee5\u9009\u62e9\u53ea\u5bf9\u60a8\u53f3\u6ed1\u8fc7\u7684\u4eba\u53ef\u89c1"

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ll/lzf;

    .line 56
    .line 57
    invoke-direct {v2, p1, p0}, Ll/lzf;-><init>(Lcom/p1/mobile/putong/core/data/PrivacyMembershipSetting;Lcom/p1/mobile/android/app/Act;)V

    .line 58
    .line 59
    .line 60
    const-string p0, "\u6253\u5f00"

    .line 61
    .line 62
    invoke-virtual {v1, p0, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance p1, Ll/mzf;

    .line 67
    .line 68
    invoke-direct {p1}, Ll/mzf;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v1, "\u4e0d\u7528\u4e86"

    .line 72
    .line 73
    invoke-virtual {p0, v1, p1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance p1, Ll/nzf;

    .line 78
    .line 79
    invoke-direct {p1, v0}, Ll/nzf;-><init>(Ll/l4g0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/fake/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/fake/a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/fake/a;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic n(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/dkb;->q1:Ll/jxd0;

    .line 6
    .line 7
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p0, v0}, Ll/dkb;->va(I)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 43
    .line 44
    .line 45
    sget-object p0, Ll/a0g;->b:Lrx/subjects/b;

    .line 46
    .line 47
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->R5()V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic o(Ll/kcg0;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/FakeGuideData;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->identifier:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic q(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-nez p5, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    invoke-static {p2, p3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-virtual {p4}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic r(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-nez p5, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    invoke-static {p2, p3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-virtual {p4}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic s()V
    .locals 1

    .line 1
    const-string v0, "\u66f4\u6362\u6210\u529f"

    .line 2
    .line 3
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-static {p0, p2, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "e_change_avatar"

    .line 21
    .line 22
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic u(Ll/jl80;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/jl80;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p4, "female"

    .line 2
    .line 3
    invoke-static {p4}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0, p1}, Ll/a0g;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string p1, "fake_gender"

    .line 25
    .line 26
    invoke-interface {p0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string p4, "male"

    .line 45
    .line 46
    :goto_0
    const-string p1, "fake_gender_original"

    .line 47
    .line 48
    invoke-interface {p0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    const-string p1, "e_fake_alert_gender"

    .line 52
    .line 53
    invoke-static {p1, p3, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/data/FakeGuideData;Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->identifier:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Ljava/lang/String;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "e_choose_close"

    .line 2
    .line 3
    invoke-static {p2, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic z(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/FakeGuideData;Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p5, "e_change_secondary_avatar"

    .line 2
    .line 3
    invoke-static {p5, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 7
    .line 8
    new-instance p5, Ll/izf;

    .line 9
    .line 10
    invoke-direct {p5, p2}, Ll/izf;-><init>(Lcom/p1/mobile/putong/core/data/FakeGuideData;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, p5}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-ltz p0, :cond_1

    .line 18
    .line 19
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-lt p0, p2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 33
    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 44
    .line 45
    .line 46
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 57
    .line 58
    .line 59
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 60
    .line 61
    invoke-static {p2, p3, p0}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/jzf;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/jzf;-><init>()V

    .line 67
    .line 68
    .line 69
    const/4 p2, 0x0

    .line 70
    invoke-static {p4, p1, p0, p2}, Ll/tr90;->D(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    :goto_0
    invoke-virtual {p3}, Ll/g1e;->dismiss()V

    .line 75
    .line 76
    .line 77
    return-void
.end method
