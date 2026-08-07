.class public final Ll/j6z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/tar0;


# direct methods
.method public constructor <init>(Ll/tar0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j6z0;->a:Ll/tar0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    const-string v0, "SignalGeneratorImpl.initializeWebViewForSignalCollection"

    .line 2
    .line 3
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/j6z0;->a:Ll/tar0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/tar0;->X8(Ll/tar0;)Ll/cxu0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v2, Landroid/util/Pair;

    .line 21
    .line 22
    const-string v3, "sgf_reason"

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-direct {v2, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    new-instance v3, Landroid/util/Pair;

    .line 32
    .line 33
    iget-object v4, p0, Ll/j6z0;->a:Ll/tar0;

    .line 34
    .line 35
    invoke-static {v4}, Ll/tar0;->u8(Ll/tar0;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v5, "sgi_rn"

    .line 48
    .line 49
    invoke-direct {v3, v5, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    filled-new-array {v2, v3}, [Landroid/util/Pair;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v3, "sgf"

    .line 57
    .line 58
    invoke-static {v1, v0, v3, v2}, Ll/qyv0;->c(Ll/cxu0;Ll/swu0;Ljava/lang/String;[Landroid/util/Pair;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "Failed to initialize webview for loading SDKCore. "

    .line 62
    .line 63
    invoke-static {v0, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    sget-object p1, Ll/sgs0;->w9:Ll/dgs0;

    .line 67
    .line 68
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_0

    .line 83
    .line 84
    iget-object p1, p0, Ll/j6z0;->a:Ll/tar0;

    .line 85
    .line 86
    invoke-static {p1}, Ll/tar0;->t8(Ll/tar0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_0

    .line 95
    .line 96
    iget-object p1, p0, Ll/j6z0;->a:Ll/tar0;

    .line 97
    .line 98
    invoke-static {p1}, Ll/tar0;->u8(Ll/tar0;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    sget-object v0, Ll/sgs0;->x9:Ll/dgs0;

    .line 107
    .line 108
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ljava/lang/Integer;

    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-ge p1, v0, :cond_0

    .line 123
    .line 124
    iget-object p0, p0, Ll/j6z0;->a:Ll/tar0;

    .line 125
    .line 126
    invoke-static {p0}, Ll/tar0;->y8(Ll/tar0;)V

    .line 127
    .line 128
    .line 129
    :cond_0
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/rqr0;

    .line 2
    .line 3
    const-string p1, "Initialized webview successfully for SDKCore."

    .line 4
    .line 5
    invoke-static {p1}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/sgs0;->w9:Ll/dgs0;

    .line 9
    .line 10
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p0, Ll/j6z0;->a:Ll/tar0;

    .line 27
    .line 28
    invoke-static {p1}, Ll/tar0;->X8(Ll/tar0;)Ll/cxu0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p1}, Ll/tar0;->W8(Ll/tar0;)Ll/swu0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Landroid/util/Pair;

    .line 37
    .line 38
    invoke-static {p1}, Ll/tar0;->u8(Ll/tar0;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v3, "sgi_rn"

    .line 51
    .line 52
    invoke-direct {v2, v3, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    filled-new-array {v2}, [Landroid/util/Pair;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v2, "sgs"

    .line 60
    .line 61
    invoke-static {v0, v1, v2, p1}, Ll/qyv0;->c(Ll/cxu0;Ll/swu0;Ljava/lang/String;[Landroid/util/Pair;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/j6z0;->a:Ll/tar0;

    .line 65
    .line 66
    invoke-static {p0}, Ll/tar0;->t8(Ll/tar0;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method
