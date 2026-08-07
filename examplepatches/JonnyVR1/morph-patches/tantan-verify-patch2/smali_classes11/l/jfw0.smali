.class public final Ll/jfw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/lfw0;

.field public final b:Landroid/webkit/WebView;

.field public final c:Ljava/util/List;

.field public final d:Ljava/util/Map;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final g:Lcom/google/android/gms/internal/ads/zzfog;


# direct methods
.method public constructor <init>(Ll/lfw0;Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzfog;)V
    .locals 0
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Ll/jfw0;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance p3, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p3, p0, Ll/jfw0;->d:Ljava/util/Map;

    .line 17
    .line 18
    iput-object p1, p0, Ll/jfw0;->a:Ll/lfw0;

    .line 19
    .line 20
    iput-object p2, p0, Ll/jfw0;->b:Landroid/webkit/WebView;

    .line 21
    .line 22
    iput-object p7, p0, Ll/jfw0;->g:Lcom/google/android/gms/internal/ads/zzfog;

    .line 23
    .line 24
    iput-object p5, p0, Ll/jfw0;->f:Ljava/lang/String;

    .line 25
    .line 26
    const-string p1, ""

    .line 27
    .line 28
    iput-object p1, p0, Ll/jfw0;->e:Ljava/lang/String;

    .line 29
    .line 30
    return-void
.end method

.method public static b(Ll/lfw0;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)Ll/jfw0;
    .locals 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/jfw0;

    .line 2
    .line 3
    const-string v6, ""

    .line 4
    .line 5
    sget-object v7, Lcom/google/android/gms/internal/ads/zzfog;->zza:Lcom/google/android/gms/internal/ads/zzfog;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    move-object v5, p2

    .line 12
    invoke-direct/range {v0 .. v7}, Ll/jfw0;-><init>(Ll/lfw0;Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzfog;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static c(Ll/lfw0;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)Ll/jfw0;
    .locals 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/jfw0;

    .line 2
    .line 3
    const-string v6, ""

    .line 4
    .line 5
    sget-object v7, Lcom/google/android/gms/internal/ads/zzfog;->zzc:Lcom/google/android/gms/internal/ads/zzfog;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x0

    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    move-object v5, p2

    .line 12
    invoke-direct/range {v0 .. v7}, Ll/jfw0;-><init>(Ll/lfw0;Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzfog;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public final a()Landroid/webkit/WebView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfw0;->b:Landroid/webkit/WebView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Lcom/google/android/gms/internal/ads/zzfog;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfw0;->g:Lcom/google/android/gms/internal/ads/zzfog;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/lfw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfw0;->a:Ll/lfw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jfw0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfw0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfw0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final i()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfw0;->d:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
