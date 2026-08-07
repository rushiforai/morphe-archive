.class public final Ll/lxr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/uzr0;

.field public final d:Ll/cas0;

.field public final e:Ljava/util/List;

.field public final f:Lcom/google/android/gms/internal/ads/zzgaa;

.field public final g:Ll/ods0;

.field public final h:Ll/xms0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uzr0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/uzr0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lxr0;->c:Ll/uzr0;

    .line 10
    .line 11
    new-instance v0, Ll/cas0;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Ll/cas0;-><init>(Ll/i7s0;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/lxr0;->d:Ll/cas0;

    .line 18
    .line 19
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 20
    .line 21
    iput-object v0, p0, Ll/lxr0;->e:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/lxr0;->f:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 28
    .line 29
    new-instance v0, Ll/ods0;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/ods0;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/lxr0;->g:Ll/ods0;

    .line 35
    .line 36
    sget-object v0, Ll/xms0;->c:Ll/xms0;

    .line 37
    .line 38
    iput-object v0, p0, Ll/lxr0;->h:Ll/xms0;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/lxr0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lxr0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Landroid/net/Uri;)Ll/lxr0;
    .locals 0
    .param p1    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/lxr0;->b:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/trs0;
    .locals 13

    .line 1
    iget-object v1, p0, Ll/lxr0;->b:Landroid/net/Uri;

    .line 2
    .line 3
    const/4 v12, 0x0

    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    iget-object v5, p0, Ll/lxr0;->e:Ljava/util/List;

    .line 7
    .line 8
    iget-object v7, p0, Ll/lxr0;->f:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 9
    .line 10
    new-instance v0, Ll/zis0;

    .line 11
    .line 12
    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    const/4 v11, 0x0

    .line 18
    const/4 v2, 0x0

    .line 19
    const/4 v3, 0x0

    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v6, 0x0

    .line 22
    const/4 v8, 0x0

    .line 23
    invoke-direct/range {v0 .. v11}, Ll/zis0;-><init>(Landroid/net/Uri;Ljava/lang/String;Ll/jbs0;Ll/bwr0;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzgaa;Ljava/lang/Object;JLl/rhs0;)V

    .line 24
    .line 25
    .line 26
    move-object v4, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object v4, v12

    .line 29
    :goto_0
    new-instance v1, Ll/trs0;

    .line 30
    .line 31
    iget-object v0, p0, Ll/lxr0;->a:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    const-string v0, ""

    .line 36
    .line 37
    :cond_1
    move-object v2, v0

    .line 38
    iget-object v0, p0, Ll/lxr0;->c:Ll/uzr0;

    .line 39
    .line 40
    new-instance v3, Ll/t4s0;

    .line 41
    .line 42
    invoke-direct {v3, v0, v12}, Ll/t4s0;-><init>(Ll/uzr0;Ll/l3s0;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/lxr0;->g:Ll/ods0;

    .line 46
    .line 47
    new-instance v5, Ll/jfs0;

    .line 48
    .line 49
    invoke-direct {v5, v0, v12}, Ll/jfs0;-><init>(Ll/ods0;Ll/oes0;)V

    .line 50
    .line 51
    .line 52
    iget-object v7, p0, Ll/lxr0;->h:Ll/xms0;

    .line 53
    .line 54
    sget-object v6, Ll/rzs0;->y:Ll/rzs0;

    .line 55
    .line 56
    const/4 v8, 0x0

    .line 57
    invoke-direct/range {v1 .. v8}, Ll/trs0;-><init>(Ljava/lang/String;Ll/t4s0;Ll/zis0;Ll/jfs0;Ll/rzs0;Ll/xms0;Ll/wqs0;)V

    .line 58
    .line 59
    .line 60
    return-object v1
.end method
