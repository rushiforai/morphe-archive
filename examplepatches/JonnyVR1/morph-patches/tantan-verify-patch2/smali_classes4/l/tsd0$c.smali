.class public Ll/tsd0$c;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tsd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_2

    .line 5
    .line 6
    const-wide/16 v1, 0x1388

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v4, 0x4

    .line 12
    if-eq v0, v4, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ll/tsd0;->e()Ll/tsd0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/tsd0;->b(Ll/tsd0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/tsd0;->e()Ll/tsd0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0, v3, v1, v2}, Ll/tsd0;->a(Ll/tsd0;IJ)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-static {}, Ll/usd0;->h()V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x32

    .line 34
    .line 35
    invoke-static {v0}, Ll/usd0;->n(I)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/tsd0;->e()Ll/tsd0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0, v3, v1, v2}, Ll/tsd0;->a(Ll/tsd0;IJ)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-static {}, Ll/usd0;->j()V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
