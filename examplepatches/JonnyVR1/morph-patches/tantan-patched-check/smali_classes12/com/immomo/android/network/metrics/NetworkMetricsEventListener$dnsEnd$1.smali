.class final Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic $call:Ll/ry3;

.field final synthetic $domainName:Ljava/lang/String;

.field final synthetic $inetAddressList:Ljava/util/List;

.field final synthetic this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$call:Ll/ry3;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$domainName:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$inetAddressList:Ljava/util/List;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 122
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->f()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/t4f;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$call:Ll/ry3;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$domainName:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v4, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$inetAddressList:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3, v4}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Ll/t4f;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$call:Ll/ry3;

    .line 42
    .line 43
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$domainName:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$inetAddressList:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2, v3}, Ll/t4f;->dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    invoke-virtual {v0, v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->F(J)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;->$inetAddressList:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ljava/net/InetAddress;

    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v2, ","

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-lez p0, :cond_3

    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    add-int/lit8 p0, p0, -0x1

    .line 110
    .line 111
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {v0, p0}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->A(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method
