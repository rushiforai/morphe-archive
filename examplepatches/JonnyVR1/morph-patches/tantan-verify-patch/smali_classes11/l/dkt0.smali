.class public Ll/dkt0;
.super Ll/gjt0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/wit0;Ll/fcs0;ZLl/qbv0;)V
    .locals 7
    .param p4    # Ll/qbv0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v4, Ll/r0t0;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/wit0;->M()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/vfs0;

    .line 8
    .line 9
    invoke-interface {p1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Ll/vfs0;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v4, p1, v0, v1}, Ll/r0t0;-><init>(Ll/wit0;Landroid/content/Context;Ll/vfs0;)V

    .line 17
    .line 18
    .line 19
    const/4 v5, 0x0

    .line 20
    move-object v0, p0

    .line 21
    move-object v1, p1

    .line 22
    move-object v2, p2

    .line 23
    move v3, p3

    .line 24
    move-object v6, p4

    .line 25
    invoke-direct/range {v0 .. v6}, Ll/gjt0;-><init>(Ll/wit0;Ll/fcs0;ZLl/r0t0;Ll/m0t0;Ll/qbv0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final zzO(Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;
    .locals 2
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    instance-of v0, p1, Ll/wit0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "Tried to intercept request from a WebView that wasn\'t an AdWebView."

    .line 6
    .line 7
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    check-cast p1, Ll/wit0;

    .line 13
    .line 14
    iget-object v0, p0, Ll/gjt0;->zza:Ll/w8t0;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-interface {v0, p2, p3, v1}, Ll/w8t0;->b(Ljava/lang/String;Ljava/util/Map;I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    new-instance v0, Ljava/io/File;

    .line 23
    .line 24
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "mraid.js"

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    if-nez p3, :cond_2

    .line 40
    .line 41
    sget-object p3, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 42
    .line 43
    :cond_2
    invoke-super {p0, p2, p3}, Ll/gjt0;->zzc(Ljava/lang/String;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_3
    invoke-interface {p1}, Ll/wit0;->zzN()Ll/nkt0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    if-eqz p0, :cond_4

    .line 53
    .line 54
    invoke-interface {p1}, Ll/wit0;->zzN()Ll/nkt0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0}, Ll/nkt0;->zzF()V

    .line 59
    .line 60
    .line 61
    :cond_4
    invoke-interface {p1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/xkt0;->i()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    sget-object p0, Ll/sgs0;->O:Ll/dgs0;

    .line 72
    .line 73
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p2, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_5
    invoke-interface {p1}, Ll/wit0;->a0()Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_6

    .line 89
    .line 90
    sget-object p0, Ll/sgs0;->N:Ll/dgs0;

    .line 91
    .line 92
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    sget-object p0, Ll/sgs0;->M:Ll/dgs0;

    .line 104
    .line 105
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Ljava/lang/String;

    .line 114
    .line 115
    :goto_0
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 116
    .line 117
    .line 118
    invoke-interface {p1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-interface {p1}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object p1, p1, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {p2, p1, p0}, Lcom/google/android/gms/ads/internal/util/b;->Y(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method
