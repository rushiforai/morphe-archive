.class public Ll/r660$c;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r660;
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
    .locals 8

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    const/16 v1, 0x32

    .line 7
    .line 8
    const-wide/16 v2, 0x1388

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    const-wide/16 v5, 0x3e8

    .line 14
    .line 15
    const/4 v7, 0x2

    .line 16
    if-eq v0, v7, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/r660;->b(Ll/r660;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0, v4, v2, v3}, Ll/r660;->a(Ll/r660;IJ)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0, v7, v5, v6}, Ll/r660;->a(Ll/r660;IJ)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-static {v1}, Ll/t660;->p(I)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0, v7, v5, v6}, Ll/r660;->a(Ll/r660;IJ)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    invoke-static {}, Ll/t660;->i()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/t660;->q(I)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0, v4, v2, v3}, Ll/r660;->a(Ll/r660;IJ)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c(Landroid/content/Context;)Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->i()V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-static {}, Ll/t660;->l()V

    .line 81
    .line 82
    .line 83
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
