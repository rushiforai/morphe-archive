.class public Ll/qu2$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cmb0$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qu2;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 1

    .line 1
    iget-object p0, p3, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 2
    .line 3
    const-string p1, "xlog.upload"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    :try_start_0
    iget-object p0, p3, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 16
    .line 17
    .line 18
    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    goto :goto_0

    .line 20
    :catch_0
    const-wide/16 p0, 0x0

    .line 21
    .line 22
    :goto_0
    iget-object p2, p3, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-nez p2, :cond_1

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    :try_start_1
    new-instance p4, Lorg/json/JSONObject;

    .line 34
    .line 35
    iget-object v0, p3, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 38
    .line 39
    invoke-direct {p4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 40
    .line 41
    .line 42
    :try_start_2
    const-string v0, "Type"

    .line 43
    .line 44
    invoke-virtual {p4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 48
    goto :goto_2

    .line 49
    :catch_1
    move-exception v0

    .line 50
    goto :goto_1

    .line 51
    :catch_2
    move-exception v0

    .line 52
    move-object p4, p2

    .line 53
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :goto_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    iget-object p2, p3, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 63
    .line 64
    iget-object p3, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p0, p1, p3, p2}, Ll/qu2;->k(JLjava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_0
    invoke-static {p2, p4, p0, p1}, Ll/qu2;->j(Ljava/lang/String;Lorg/json/JSONObject;J)V

    .line 73
    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_1
    iget-object p2, p3, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 77
    .line 78
    iget-object p3, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {p0, p1, p3, p2}, Ll/qu2;->k(JLjava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :goto_3
    const/4 p0, 0x1

    .line 86
    return p0

    .line 87
    :cond_2
    const/4 p0, 0x0

    .line 88
    return p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
