.class public Ll/r0f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r0f$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/cy3;

.field public final c:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/ye3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ye3<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/a7h0;Ll/cy3;Ll/ye3;Ll/ye3;Ll/wk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a7h0<",
            "Ll/g4e;",
            ">;",
            "Ll/cy3;",
            "Ll/ye3;",
            "Ll/ye3;",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r0f;->a:Ll/a7h0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/r0f;->b:Ll/cy3;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r0f;->d:Ll/ye3;

    .line 9
    .line 10
    iput-object p4, p0, Ll/r0f;->e:Ll/ye3;

    .line 11
    .line 12
    iput-object p5, p0, Ll/r0f;->c:Ll/wk90;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "EncodedProbeProducer#produceResults"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/r0f;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v0, p2, v1}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/r0f$a;

    .line 24
    .line 25
    iget-object v5, p0, Ll/r0f;->a:Ll/a7h0;

    .line 26
    .line 27
    iget-object v6, p0, Ll/r0f;->b:Ll/cy3;

    .line 28
    .line 29
    iget-object v7, p0, Ll/r0f;->d:Ll/ye3;

    .line 30
    .line 31
    iget-object v8, p0, Ll/r0f;->e:Ll/ye3;

    .line 32
    .line 33
    move-object v3, p1

    .line 34
    move-object v4, p2

    .line 35
    invoke-direct/range {v2 .. v8}, Ll/r0f$a;-><init>(Ll/z06;Ll/yk90;Ll/a7h0;Ll/cy3;Ll/ye3;Ll/ye3;)V

    .line 36
    .line 37
    .line 38
    const-string p1, "EncodedProbeProducer"

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-interface {v0, v4, p1, p2}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/i9j;->d()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const-string p1, "mInputProducer.produceResult"

    .line 51
    .line 52
    invoke-static {p1}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p0, p0, Ll/r0f;->c:Ll/wk90;

    .line 56
    .line 57
    invoke-interface {p0, v2, v4}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/i9j;->d()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    invoke-static {}, Ll/i9j;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    :cond_2
    invoke-static {}, Ll/i9j;->d()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_3

    .line 74
    .line 75
    invoke-static {}, Ll/i9j;->b()V

    .line 76
    .line 77
    .line 78
    :cond_3
    return-void

    .line 79
    :catchall_0
    move-exception v0

    .line 80
    move-object p0, v0

    .line 81
    invoke-static {}, Ll/i9j;->d()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    invoke-static {}, Ll/i9j;->b()V

    .line 88
    .line 89
    .line 90
    :cond_4
    throw p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "EncodedProbeProducer"

    .line 2
    .line 3
    return-object p0
.end method
