.class public Ll/c2t;
.super Ll/c0j0;
.source "SourceFile"


# instance fields
.field public a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c0j0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/c2t;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/Runnable;Ll/zxi0;)Ll/wxl;
    .locals 1

    .line 1
    iget p0, p0, Ll/c2t;->a:I

    .line 2
    .line 3
    const/16 v0, 0xa

    .line 4
    .line 5
    if-gt p0, v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/izq$a;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/izq$a;-><init>(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Ll/izq$a;

    .line 14
    .line 15
    invoke-direct {v0, p1, p0}, Ll/izq$a;-><init>(Ljava/lang/Runnable;I)V

    .line 16
    .line 17
    .line 18
    move-object p0, v0

    .line 19
    :goto_0
    invoke-virtual {p2}, Ll/zxi0;->a()Ljava/util/concurrent/ScheduledExecutorService;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/izq$a;->a(Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method
