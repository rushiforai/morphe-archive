.class public Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static c:Ljava/lang/String; = "check_type"

.field public static d:Ljava/lang/String; = "just_finish"

.field public static e:Ljava/lang/String; = "toast"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->a2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->b2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    return-void
.end method

.method private synthetic a2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public final Z1(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

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
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic b2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->c2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final c2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->c:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->d:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->e:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 42
    .line 43
    .line 44
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v0, "startData"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->Z1(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    const-string v0, "voice"

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const-string v0, "live"

    .line 66
    .line 67
    :goto_0
    new-instance v1, Ll/pvn$a;

    .line 68
    .line 69
    new-instance v2, Ll/d1n;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/d1n;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Ll/e1n;

    .line 75
    .line 76
    invoke-direct {v3, p0, p1}, Ll/e1n;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 77
    .line 78
    .line 79
    invoke-direct {v1, v2, v3}, Ll/pvn$a;-><init>(Ll/x20;Ll/x20;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/pvn;->c(Ljava/lang/String;Ll/ga1;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
