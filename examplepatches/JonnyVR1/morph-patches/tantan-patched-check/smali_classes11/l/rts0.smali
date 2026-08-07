.class public final synthetic Ll/rts0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mkt0;


# instance fields
.field public final synthetic a:Ll/cus0;


# direct methods
.method public synthetic constructor <init>(Ll/cus0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rts0;->a:Ll/cus0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 9

    .line 1
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object p0, p0, Ll/rts0;->a:Ll/cus0;

    .line 10
    .line 11
    iget-wide v7, p0, Ll/cus0;->c:J

    .line 12
    .line 13
    sub-long/2addr v0, v7

    .line 14
    iget-object v6, p0, Ll/cus0;->b:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v2, "LoadNewJavascriptEngine(onEngLoaded) latency is "

    .line 35
    .line 36
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, " ms."

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object v0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 55
    .line 56
    new-instance v2, Ll/yts0;

    .line 57
    .line 58
    iget-object v3, p0, Ll/cus0;->a:Ll/bvs0;

    .line 59
    .line 60
    iget-object v4, p0, Ll/cus0;->d:Ll/avs0;

    .line 61
    .line 62
    iget-object v5, p0, Ll/cus0;->e:Ll/ots0;

    .line 63
    .line 64
    invoke-direct/range {v2 .. v8}, Ll/yts0;-><init>(Ll/bvs0;Ll/avs0;Ll/ots0;Ljava/util/ArrayList;J)V

    .line 65
    .line 66
    .line 67
    sget-object p0, Ll/sgs0;->c:Ll/dgs0;

    .line 68
    .line 69
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Ljava/lang/Integer;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    int-to-long v3, p0

    .line 84
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 85
    .line 86
    .line 87
    return-void
.end method
