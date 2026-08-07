.class public final Lcom/surveysparrow/ss_android_sdk/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static q:Z


# instance fields
.field private a:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

.field private b:Landroid/app/Activity;

.field private c:I

.field private d:Ljava/lang/CharSequence;

.field private e:Z

.field private f:J

.field private g:I

.field private h:Ljava/lang/CharSequence;

.field private i:Ljava/lang/CharSequence;

.field private j:Ljava/lang/CharSequence;

.field private k:Ljava/lang/CharSequence;

.field private l:Ljava/lang/String;

.field private m:J

.field private n:J

.field private o:I

.field private p:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/surveysparrow/ss_android_sdk/SsSurvey;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/kgc0;->a:I

    .line 5
    .line 6
    iput v0, p0, Lcom/surveysparrow/ss_android_sdk/c;->c:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/surveysparrow/ss_android_sdk/c;->e:Z

    .line 10
    .line 11
    const-wide/16 v1, 0xbb8

    .line 12
    .line 13
    iput-wide v1, p0, Lcom/surveysparrow/ss_android_sdk/c;->f:J

    .line 14
    .line 15
    const-wide/32 v1, 0x19bfcc00

    .line 16
    .line 17
    .line 18
    iput-wide v1, p0, Lcom/surveysparrow/ss_android_sdk/c;->m:J

    .line 19
    .line 20
    const-wide/32 v1, 0x337f9800

    .line 21
    .line 22
    .line 23
    iput-wide v1, p0, Lcom/surveysparrow/ss_android_sdk/c;->n:J

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    iput v1, p0, Lcom/surveysparrow/ss_android_sdk/c;->o:I

    .line 27
    .line 28
    iput v0, p0, Lcom/surveysparrow/ss_android_sdk/c;->p:I

    .line 29
    .line 30
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/c;->a:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/c;->b:Landroid/app/Activity;

    .line 33
    .line 34
    sget v0, Lcom/surveysparrow/ss_android_sdk/R$string;->f:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/surveysparrow/ss_android_sdk/c;->d:Ljava/lang/CharSequence;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "com.surveysparrow.android-sdk.SsSurveySharedPref."

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->getSurveyToken()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/c;->l:Ljava/lang/String;

    .line 61
    .line 62
    sget p2, Lcom/surveysparrow/ss_android_sdk/R$string;->d:I

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/c;->h:Ljava/lang/CharSequence;

    .line 69
    .line 70
    sget p2, Lcom/surveysparrow/ss_android_sdk/R$string;->a:I

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/c;->i:Ljava/lang/CharSequence;

    .line 77
    .line 78
    sget p2, Lcom/surveysparrow/ss_android_sdk/R$string;->c:I

    .line 79
    .line 80
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    iput-object p2, p0, Lcom/surveysparrow/ss_android_sdk/c;->j:Ljava/lang/CharSequence;

    .line 85
    .line 86
    sget p2, Lcom/surveysparrow/ss_android_sdk/R$string;->b:I

    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/surveysparrow/ss_android_sdk/c;->k:Ljava/lang/CharSequence;

    .line 93
    .line 94
    return-void
.end method

.method private b()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/c;->b:Landroid/app/Activity;

    .line 2
    .line 3
    const-string v0, "connectivity"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

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

.method public static c(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "com.surveysparrow.android-sdk.SsSurveySharedPref."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "IS_ALREADY_TAKEN"

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 28
    .line 29
    .line 30
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static e(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-object v0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    sget-boolean v0, Lcom/surveysparrow/ss_android_sdk/c;->q:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "SS_DEBUG_LOG"

    .line 21
    .line 22
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method


# virtual methods
.method public a(Z)Lcom/surveysparrow/ss_android_sdk/c;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/surveysparrow/ss_android_sdk/c;->e:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/surveysparrow/ss_android_sdk/c;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/c;->b:Landroid/app/Activity;

    .line 8
    .line 9
    sget p1, Lcom/surveysparrow/ss_android_sdk/R$string;->e:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/surveysparrow/ss_android_sdk/c;->b:Landroid/app/Activity;

    .line 23
    .line 24
    const-class v2, Lcom/surveysparrow/ss_android_sdk/SsSurveyActivity;

    .line 25
    .line 26
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 27
    .line 28
    .line 29
    const-string v1, "SS_SURVEY"

    .line 30
    .line 31
    iget-object v2, p0, Lcom/surveysparrow/ss_android_sdk/c;->a:Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const-string v1, "SS_ACTIVITY_THEME"

    .line 37
    .line 38
    iget v2, p0, Lcom/surveysparrow/ss_android_sdk/c;->c:I

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    const-string v1, "SS_APPBAR_TITLE"

    .line 44
    .line 45
    iget-object v2, p0, Lcom/surveysparrow/ss_android_sdk/c;->d:Ljava/lang/CharSequence;

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    const-string v1, "SS_BACK_BUTTON"

    .line 51
    .line 52
    iget-boolean v2, p0, Lcom/surveysparrow/ss_android_sdk/c;->e:Z

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    const-string v1, "SS_WAIT_TIME"

    .line 58
    .line 59
    iget-wide v2, p0, Lcom/surveysparrow/ss_android_sdk/c;->f:J

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    const-string v1, "widgetContactId"

    .line 65
    .line 66
    iget v2, p0, Lcom/surveysparrow/ss_android_sdk/c;->g:I

    .line 67
    .line 68
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/surveysparrow/ss_android_sdk/c;->b:Landroid/app/Activity;

    .line 72
    .line 73
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
