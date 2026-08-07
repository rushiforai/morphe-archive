.class final Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->callStart(Ll/ry3;)V
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

.field final synthetic this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;


# direct methods
.method public constructor <init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->$call:Ll/ry3;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 131
    invoke-virtual {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->g()Ll/t4f$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->g()Ll/t4f$b;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->$call:Ll/ry3;

    .line 16
    .line 17
    invoke-interface {v1, v2}, Ll/t4f$b;->create(Ll/ry3;)Ll/t4f;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->d(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/t4f;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->f()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/t4f;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->$call:Ll/ry3;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Ll/t4f;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->$call:Ll/ry3;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->$call:Ll/ry3;

    .line 66
    .line 67
    invoke-interface {v0}, Ll/ry3;->request()Ll/x1d0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-class v1, Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 83
    .line 84
    .line 85
    move-result-wide v1

    .line 86
    invoke-virtual {v0, v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->E(J)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 96
    .line 97
    .line 98
    move-result-wide v1

    .line 99
    invoke-virtual {v0, v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->O(J)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object v1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->$call:Ll/ry3;

    .line 109
    .line 110
    invoke-interface {v1}, Ll/ry3;->request()Ll/x1d0;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->J(Ll/x1d0;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;->this$0:Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;

    .line 118
    .line 119
    invoke-static {p0}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 124
    .line 125
    .line 126
    move-result-wide v0

    .line 127
    invoke-virtual {p0, v0, v1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->y(J)V

    .line 128
    .line 129
    .line 130
    return-void
.end method
