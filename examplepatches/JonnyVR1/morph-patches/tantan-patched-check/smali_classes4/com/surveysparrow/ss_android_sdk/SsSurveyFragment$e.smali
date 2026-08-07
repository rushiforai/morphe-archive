.class Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field final synthetic a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;


# direct methods
.method private constructor <init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;-><init>(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)V

    return-void
.end method


# virtual methods
.method public captureImage()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->d4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->e4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Z)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "android.permission.CAMERA"

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->j4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/c60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v1}, Ll/c60;->b(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 40
    .line 41
    const-string v1, "android.media.action.IMAGE_CAPTURE"

    .line 42
    .line 43
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 61
    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    invoke-static {p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->Y3(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/c60;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0, v0}, Ll/c60;->b(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    const/4 v0, 0x0

    .line 73
    invoke-static {p0, v0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->e4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;Z)Z

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public shareData(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment$e;->a:Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->G:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;->i4(Lcom/surveysparrow/ss_android_sdk/SsSurveyFragment;)Ll/sn50;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Lcom/surveysparrow/ss_android_sdk/c;->e(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ll/sn50;->m(Lorg/json/JSONObject;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
