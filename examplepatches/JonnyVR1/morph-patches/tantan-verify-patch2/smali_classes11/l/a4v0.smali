.class public final Ll/a4v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e5v0;


# static fields
.field public static final h:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Ll/v2v0;

.field public final b:Ll/xvw0;

.field public final c:Ll/o7w0;

.field public final d:Ljava/util/concurrent/ScheduledExecutorService;

.field public final e:Ll/u9v0;

.field public final f:Ll/cew0;

.field public final g:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "Received error HTTP response code: (.*)"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/a4v0;->h:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/o7w0;Ll/v2v0;Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ll/u9v0;Ll/cew0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a4v0;->g:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/a4v0;->c:Ll/o7w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/a4v0;->a:Ll/v2v0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/a4v0;->b:Ll/xvw0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/a4v0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 13
    .line 14
    iput-object p6, p0, Ll/a4v0;->e:Ll/u9v0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/a4v0;->f:Ll/cew0;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic b(Ll/a4v0;)Ll/u9v0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a4v0;->e:Ll/u9v0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d()Ljava/util/regex/Pattern;
    .locals 1

    .line 1
    sget-object v0, Ll/a4v0;->h:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/a4v0;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ll/a4v0;->a:Ll/v2v0;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Ll/v2v0;->b(Lcom/google/android/gms/internal/ads/zzbze;)Ll/hpr;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/16 v1, 0xb

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v0}, Ll/bew0;->d(Ll/hpr;Ll/rdw0;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/x3v0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/x3v0;-><init>(Ll/a4v0;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Ll/a4v0;->b:Ll/xvw0;

    .line 24
    .line 25
    invoke-static {p1, v1, v2}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v1, Ll/sgs0;->v5:Ll/dgs0;

    .line 30
    .line 31
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    sget-object v1, Ll/sgs0;->x5:Ll/dgs0;

    .line 48
    .line 49
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/Integer;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    int-to-long v1, v1

    .line 64
    iget-object v3, p0, Ll/a4v0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 65
    .line 66
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 67
    .line 68
    invoke-static {p1, v1, v2, v4, v3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget-object v1, Ll/y3v0;->a:Ll/y3v0;

    .line 73
    .line 74
    sget-object v2, Ll/oct0;->f:Ll/xvw0;

    .line 75
    .line 76
    const-class v3, Ljava/util/concurrent/TimeoutException;

    .line 77
    .line 78
    invoke-static {p1, v3, v1, v2}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    :cond_0
    iget-object v1, p0, Ll/a4v0;->f:Ll/cew0;

    .line 83
    .line 84
    invoke-static {p1, v1, v0}, Ll/bew0;->a(Ll/hpr;Ll/cew0;Ll/rdw0;)V

    .line 85
    .line 86
    .line 87
    new-instance v0, Ll/z3v0;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Ll/z3v0;-><init>(Ll/a4v0;)V

    .line 90
    .line 91
    .line 92
    sget-object p0, Ll/oct0;->f:Ll/xvw0;

    .line 93
    .line 94
    invoke-static {p1, v0, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 95
    .line 96
    .line 97
    return-object p1
.end method

.method public final synthetic c(Ljava/io/InputStream;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b7w0;

    .line 2
    .line 3
    new-instance v1, Ll/y6w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/a4v0;->c:Ll/o7w0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/y6w0;-><init>(Ll/o7w0;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ljava/io/InputStreamReader;

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/a7w0;->a(Ljava/io/Reader;)Ll/a7w0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, v1, p0}, Ll/b7w0;-><init>(Ll/y6w0;Ll/a7w0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
