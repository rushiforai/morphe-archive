.class public final Ll/sqs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final a:Ll/rqs0;


# direct methods
.method public constructor <init>(Ll/rqs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sqs0;->a:Ll/rqs0;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/wit0;Ll/rqs0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sqs0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/sqs0;-><init>(Ll/rqs0;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "/reward"

    .line 7
    .line 8
    invoke-interface {p0, p1, v0}, Ll/wit0;->j0(Ljava/lang/String;Ll/bqs0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 2

    .line 1
    const-string p1, "action"

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "grant"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    :try_start_0
    const-string v0, "amount"

    .line 19
    .line 20
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v1, "type"

    .line 31
    .line 32
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_0

    .line 43
    .line 44
    new-instance v1, Lcom/google/android/gms/internal/ads/zzcag;

    .line 45
    .line 46
    invoke-direct {v1, p2, v0}, Lcom/google/android/gms/internal/ads/zzcag;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    move-object p1, v1

    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception p2

    .line 52
    const-string v0, "Unable to parse reward amount."

    .line 53
    .line 54
    invoke-static {v0, p2}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/sqs0;->a:Ll/rqs0;

    .line 58
    .line 59
    invoke-interface {p0, p1}, Ll/rqs0;->f0(Lcom/google/android/gms/internal/ads/zzcag;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    const-string p2, "video_start"

    .line 64
    .line 65
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_2

    .line 70
    .line 71
    iget-object p0, p0, Ll/sqs0;->a:Ll/rqs0;

    .line 72
    .line 73
    invoke-interface {p0}, Ll/rqs0;->zzc()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    const-string p2, "video_complete"

    .line 78
    .line 79
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iget-object p0, p0, Ll/sqs0;->a:Ll/rqs0;

    .line 86
    .line 87
    invoke-interface {p0}, Ll/rqs0;->zzb()V

    .line 88
    .line 89
    .line 90
    :cond_3
    return-void
.end method
