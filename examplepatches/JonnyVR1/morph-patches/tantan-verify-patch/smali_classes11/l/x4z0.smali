.class public final Ll/x4z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/p2t0;

.field public final synthetic b:Z

.field public final synthetic c:Ll/tar0;


# direct methods
.method public constructor <init>(Ll/tar0;Ll/p2t0;Z)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/x4z0;->a:Ll/p2t0;

    .line 2
    .line 3
    iput-boolean p3, p0, Ll/x4z0;->b:Z

    .line 4
    .line 5
    iput-object p1, p0, Ll/x4z0;->c:Ll/tar0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const-string v0, "Internal error: "

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Ll/x4z0;->a:Ll/p2t0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p0, p1}, Ll/p2t0;->c(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    const-string p1, ""

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 5

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p0, Ll/x4z0;->c:Ll/tar0;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/tar0;->x8(Ll/tar0;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x4z0;->a:Ll/p2t0;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/p2t0;->h0(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/x4z0;->c:Ll/tar0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/tar0;->E8(Ll/tar0;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/x4z0;->b:Z

    .line 22
    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/net/Uri;

    .line 40
    .line 41
    iget-object v1, p0, Ll/x4z0;->c:Ll/tar0;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/tar0;->G8(Landroid/net/Uri;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/4 v2, 0x0

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    iget-object v1, p0, Ll/x4z0;->c:Ll/tar0;

    .line 51
    .line 52
    invoke-static {v1}, Ll/tar0;->f9(Ll/tar0;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    const-string v4, "1"

    .line 57
    .line 58
    invoke-static {v1, v0, v3, v4}, Ll/tar0;->T8(Ll/tar0;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p0, Ll/x4z0;->c:Ll/tar0;

    .line 63
    .line 64
    invoke-static {v1}, Ll/tar0;->a9(Ll/tar0;)Ll/yew0;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v1, v0, v2}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    sget-object v1, Ll/sgs0;->x7:Ll/dgs0;

    .line 77
    .line 78
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Ljava/lang/Boolean;

    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_1

    .line 93
    .line 94
    iget-object v1, p0, Ll/x4z0;->c:Ll/tar0;

    .line 95
    .line 96
    invoke-static {v1}, Ll/tar0;->a9(Ll/tar0;)Ll/yew0;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v1, v0, v2}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_3
    return-void

    .line 109
    :catch_0
    move-exception p0

    .line 110
    const-string p1, ""

    .line 111
    .line 112
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method
