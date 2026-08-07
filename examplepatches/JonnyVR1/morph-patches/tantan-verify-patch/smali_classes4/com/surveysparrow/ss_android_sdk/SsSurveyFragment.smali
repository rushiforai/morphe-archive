.class public final Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SetJavaScriptEnabled"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;
    }
.end annotation


# instance fields
.field private A:Ljava/lang/String;

.field private B:I

.field private C:Landroid/widget/ProgressBar;

.field private D:Landroid/animation/ObjectAnimator;

.field public E:Lorg/json/JSONObject;

.field private F:Ll/sn50;

.field public G:Ljava/lang/Boolean;

.field private H:Ll/rn50;

.field private I:Z

.field private J:Ll/c60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/c60<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private K:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private L:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private M:Landroid/net/Uri;

.field private N:Landroid/webkit/WebView;

.field private O:Ll/c60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/c60<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->B:I

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    iput-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->G:Ljava/lang/Boolean;

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->I:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->M:Landroid/net/Uri;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic V3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    new-instance p1, Landroid/content/Intent;

    .line 12
    .line 13
    const-string v1, "android.media.action.IMAGE_CAPTURE"

    .line 14
    .line 15
    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->J:Ll/c60;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/c60;->b(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iput-boolean v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->I:Z

    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iput-boolean v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->I:Z

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic W3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroidx/activity/result/ActivityResult;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->b()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p1}, Landroidx/activity/result/ActivityResult;->a()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-direct {p0, v0, p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->k4(ILandroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic X3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/c60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->J:Ll/c60;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic a4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/rn50;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->H:Ll/rn50;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/webkit/ValueCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic d4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->I:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/widget/ProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->C:Landroid/widget/ProgressBar;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->D:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/animation/ObjectAnimator;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->D:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/sn50;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->F:Ll/sn50;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/c60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->O:Ll/c60;

    .line 2
    .line 3
    return-object p0
.end method

.method private k4(ILandroid/content/Intent;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    if-ne p1, v1, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v2, "data"

    .line 12
    .line 13
    invoke-virtual {p2, v2}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Landroid/graphics/Bitmap;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    new-instance v2, Ljava/io/File;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    new-instance v4, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v5, "image_"

    .line 34
    .line 35
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v5, ".png"

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iput-object v3, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->M:Landroid/net/Uri;

    .line 62
    .line 63
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    .line 64
    .line 65
    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    :try_start_1
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 69
    .line 70
    const/16 v4, 0x64

    .line 71
    .line 72
    invoke-virtual {p2, v2, v4, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 73
    .line 74
    .line 75
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->M:Landroid/net/Uri;

    .line 78
    .line 79
    filled-new-array {v2}, [Landroid/net/Uri;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {p2, v2}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    .line 85
    .line 86
    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :catchall_0
    move-exception p2

    .line 91
    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :catchall_1
    move-exception v2

    .line 96
    :try_start_4
    invoke-virtual {p2, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    :goto_0
    throw p2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 100
    :catch_0
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 101
    .line 102
    invoke-interface {p2, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    :goto_1
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 106
    .line 107
    :cond_0
    if-eq p1, v1, :cond_1

    .line 108
    .line 109
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 110
    .line 111
    invoke-interface {p1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 115
    .line 116
    :cond_1
    const/4 p1, 0x0

    .line 117
    iput-boolean p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->I:Z

    .line 118
    .line 119
    return-void
.end method


# virtual methods
.method public l4(Ll/rn50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->H:Ll/rn50;

    .line 2
    .line 3
    return-void
.end method

.method public m4(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->B:I

    .line 2
    .line 3
    return-void
.end method

.method public n4(Lcom/surveysparrow/ss_android_sdk/SsSurvey;)Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 2
    .line 3
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    .line 1
    const/16 v0, 0x4a0

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne p1, v0, :cond_4

    .line 6
    .line 7
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    if-ne p2, v1, :cond_2

    .line 13
    .line 14
    if-eqz p3, :cond_2

    .line 15
    .line 16
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 p2, 0x0

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Landroid/content/ClipData;->getItemCount()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    new-array v0, p1, [Landroid/net/Uri;

    .line 32
    .line 33
    :goto_0
    if-ge p2, p1, :cond_3

    .line 34
    .line 35
    invoke-virtual {p3}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, p2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    aput-object v1, v0, p2

    .line 48
    .line 49
    add-int/lit8 p2, p2, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    const/4 p1, 0x1

    .line 59
    new-array v0, p1, [Landroid/net/Uri;

    .line 60
    .line 61
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    aput-object p1, v0, p2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    move-object v0, v2

    .line 69
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 70
    .line 71
    invoke-interface {p1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->L:Landroid/webkit/ValueCallback;

    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    const/16 v0, 0x49f

    .line 78
    .line 79
    if-ne p1, v0, :cond_8

    .line 80
    .line 81
    iget-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->K:Landroid/webkit/ValueCallback;

    .line 82
    .line 83
    if-nez p1, :cond_5

    .line 84
    .line 85
    :goto_2
    return-void

    .line 86
    :cond_5
    if-eqz p3, :cond_7

    .line 87
    .line 88
    if-eq p2, v1, :cond_6

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_6
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    goto :goto_4

    .line 96
    :cond_7
    :goto_3
    move-object p1, v2

    .line 97
    :goto_4
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->K:Landroid/webkit/ValueCallback;

    .line 98
    .line 99
    invoke-interface {p2, p1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iput-object v2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->K:Landroid/webkit/ValueCallback;

    .line 103
    .line 104
    return-void

    .line 105
    :cond_8
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->A:Ljava/lang/String;

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    check-cast p1, Ll/sn50;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->F:Ll/sn50;

    .line 21
    .line 22
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setRetainInstance(Z)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/z50;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/z50;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/v0g0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/v0g0;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->registerForActivityResult(Ll/x50;Ll/w50;)Ll/c60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->O:Ll/c60;

    .line 23
    .line 24
    new-instance p1, Ll/a60;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/a60;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/w0g0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/w0g0;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->registerForActivityResult(Ll/x50;Ll/w50;)Ll/c60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->J:Ll/c60;

    .line 39
    .line 40
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    .line 1
    const-string p1, "widgetContactId"

    .line 2
    .line 3
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->A:Ljava/lang/String;

    .line 4
    .line 5
    const-string p3, "SsSurveyActivity"

    .line 6
    .line 7
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 p3, 0x0

    .line 12
    if-nez p2, :cond_1

    .line 13
    .line 14
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getCustomParams()[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "https://"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getDomain()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, "/sdk/validate-survey/"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getSurveyToken()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ljava/util/concurrent/CompletableFuture;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v2, Lcom/surveysparrow/ss_android_sdk/a;

    .line 60
    .line 61
    new-instance v3, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;

    .line 62
    .line 63
    invoke-direct {v3, p0, v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Ljava/util/concurrent/CompletableFuture;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {v2, v0, p2, v3}, Lcom/surveysparrow/ss_android_sdk/a;-><init>(Ljava/lang/String;[Lcom/surveysparrow/ss_android_sdk/SsSurvey$a;Lcom/surveysparrow/ss_android_sdk/a$a;)V

    .line 67
    .line 68
    .line 69
    filled-new-array {v0}, [Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {v2, p2}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/util/concurrent/CompletableFuture;->join()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    :try_start_0
    invoke-virtual {v1}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    check-cast p2, Ljava/lang/String;

    .line 84
    .line 85
    new-instance v0, Lorg/json/JSONObject;

    .line 86
    .line 87
    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    const-string p2, "active"

    .line 94
    .line 95
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-nez p2, :cond_0

    .line 100
    .line 101
    return-object p3

    .line 102
    :cond_0
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-eqz p2, :cond_1

    .line 107
    .line 108
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iput p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->B:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :catch_0
    move-exception p1

    .line 116
    new-instance p2, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v0, "Error in  processing  apiCallTask json"

    .line 119
    .line 120
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string p2, "SS_VALIDATION"

    .line 131
    .line 132
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    :cond_1
    :goto_0
    new-instance p1, Landroid/widget/FrameLayout;

    .line 136
    .line 137
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/FragmentActivity;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    invoke-direct {p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 142
    .line 143
    .line 144
    new-instance p2, Landroid/widget/ProgressBar;

    .line 145
    .line 146
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    const v1, 0x1010078

    .line 151
    .line 152
    .line 153
    invoke-direct {p2, v0, p3, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 154
    .line 155
    .line 156
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->C:Landroid/widget/ProgressBar;

    .line 157
    .line 158
    const/16 v0, 0x64

    .line 159
    .line 160
    invoke-virtual {p2, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 161
    .line 162
    .line 163
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->C:Landroid/widget/ProgressBar;

    .line 164
    .line 165
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 166
    .line 167
    const/4 v1, 0x6

    .line 168
    const/16 v2, 0x30

    .line 169
    .line 170
    const/4 v3, -0x1

    .line 171
    invoke-direct {v0, v3, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    .line 176
    .line 177
    new-instance p2, Landroid/webkit/WebView;

    .line 178
    .line 179
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-direct {p2, v0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 184
    .line 185
    .line 186
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->N:Landroid/webkit/WebView;

    .line 187
    .line 188
    invoke-virtual {p2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    const/4 v0, 0x1

    .line 193
    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 194
    .line 195
    .line 196
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->N:Landroid/webkit/WebView;

    .line 197
    .line 198
    invoke-virtual {p2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 203
    .line 204
    .line 205
    iget-object p2, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->N:Landroid/webkit/WebView;

    .line 206
    .line 207
    new-instance v1, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;

    .line 208
    .line 209
    invoke-direct {v1, p0, p3}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;)V

    .line 210
    .line 211
    .line 212
    const-string p3, "SsAndroidSdk"

    .line 213
    .line 214
    invoke-virtual {p2, v1, p3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    new-instance p2, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 218
    .line 219
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 220
    .line 221
    .line 222
    move-result-object p3

    .line 223
    invoke-direct {p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 224
    .line 225
    .line 226
    new-instance p3, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 227
    .line 228
    invoke-direct {p3, v3, v3}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p2, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    .line 233
    .line 234
    new-instance p3, Landroid/widget/ImageButton;

    .line 235
    .line 236
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-direct {p3, v1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 241
    .line 242
    .line 243
    sget v1, Ll/rbc0;->a:I

    .line 244
    .line 245
    invoke-virtual {p3, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 246
    .line 247
    .line 248
    sget v1, Ll/rbc0;->b:I

    .line 249
    .line 250
    invoke-virtual {p3, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p3, v0}, Landroid/view/View;->setClickable(Z)V

    .line 254
    .line 255
    .line 256
    const/16 v1, 0xa

    .line 257
    .line 258
    invoke-virtual {p3, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 259
    .line 260
    .line 261
    const/16 v1, 0x8

    .line 262
    .line 263
    invoke-virtual {p3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 264
    .line 265
    .line 266
    new-instance v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 267
    .line 268
    const/4 v2, -0x2

    .line 269
    invoke-direct {v1, v2, v2}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    const/high16 v3, 0x41a00000    # 20.0f

    .line 281
    .line 282
    invoke-static {v0, v3, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    float-to-int v0, v0

    .line 287
    const/4 v2, 0x0

    .line 288
    iput v2, v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->s:I

    .line 289
    .line 290
    iput v2, v1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 291
    .line 292
    invoke-virtual {v1, v2, v0, v0, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {p3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getProperties()Ljava/util/HashMap;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    if-eqz v0, :cond_2

    .line 308
    .line 309
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getProperties()Ljava/util/HashMap;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    goto :goto_1

    .line 316
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    .line 317
    .line 318
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 319
    .line 320
    .line 321
    :goto_1
    new-instance v1, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;

    .line 322
    .line 323
    invoke-direct {v1, p0, p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$b;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/widget/FrameLayout;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {p3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 327
    .line 328
    .line 329
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->N:Landroid/webkit/WebView;

    .line 330
    .line 331
    new-instance v2, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$c;

    .line 332
    .line 333
    invoke-direct {v2, p0, v0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$c;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Ljava/util/HashMap;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 337
    .line 338
    .line 339
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->N:Landroid/webkit/WebView;

    .line 340
    .line 341
    new-instance v2, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;

    .line 342
    .line 343
    invoke-direct {v2, p0, p3}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$d;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Landroid/widget/ImageButton;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 347
    .line 348
    .line 349
    iget-object p3, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->N:Landroid/webkit/WebView;

    .line 350
    .line 351
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->z:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 352
    .line 353
    invoke-virtual {v1}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getSsUrl()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    invoke-virtual {p3, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    iget-object p3, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->N:Landroid/webkit/WebView;

    .line 361
    .line 362
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 363
    .line 364
    .line 365
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->C:Landroid/widget/ProgressBar;

    .line 366
    .line 367
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 368
    .line 369
    .line 370
    const-string p0, "isCloseButtonEnabled"

    .line 371
    .line 372
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 373
    .line 374
    .line 375
    move-result p3

    .line 376
    if-eqz p3, :cond_3

    .line 377
    .line 378
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 379
    .line 380
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    invoke-virtual {p3, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result p0

    .line 388
    if-eqz p0, :cond_4

    .line 389
    .line 390
    :cond_3
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 391
    .line 392
    .line 393
    :cond_4
    return-object p1
.end method
