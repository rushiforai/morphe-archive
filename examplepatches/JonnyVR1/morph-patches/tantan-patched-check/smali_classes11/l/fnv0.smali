.class public final Ll/fnv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/xvw0;

.field public final c:Landroid/content/Context;

.field public final d:Ll/o7w0;

.field public final e:Landroid/view/View;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/xvw0;Landroid/content/Context;Ll/o7w0;Landroid/view/ViewGroup;)V
    .locals 0
    .param p5    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fnv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fnv0;->b:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/fnv0;->c:Landroid/content/Context;

    .line 9
    .line 10
    iput-object p4, p0, Ll/fnv0;->d:Ll/o7w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/fnv0;->e:Landroid/view/View;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/gnv0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fnv0;->d:Ll/o7w0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fnv0;->c:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->e:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 6
    .line 7
    new-instance v2, Ll/gnv0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fnv0;->c()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v2, v1, v0, p0}, Ll/gnv0;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-object v2
.end method

.method public final synthetic b()Ll/gnv0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fnv0;->d:Ll/o7w0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fnv0;->c:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->e:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 6
    .line 7
    new-instance v2, Ll/gnv0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fnv0;->c()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v2, v1, v0, p0}, Ll/gnv0;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-object v2
.end method

.method public final c()Ljava/util/List;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/fnv0;->e:Landroid/view/View;

    .line 7
    .line 8
    :goto_0
    if-eqz p0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    move-object v2, v1

    .line 22
    check-cast v2, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v2, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const/4 p0, -0x1

    .line 30
    :goto_1
    new-instance v2, Landroid/os/Bundle;

    .line 31
    .line 32
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "type"

    .line 44
    .line 45
    invoke-virtual {v2, v4, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string v3, "index_of_child"

    .line 49
    .line 50
    invoke-virtual {v2, v3, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    instance-of p0, v1, Landroid/view/View;

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    move-object p0, v1

    .line 61
    check-cast p0, Landroid/view/View;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    :goto_2
    return-object v0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fnv0;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/sgs0;->Aa:Ll/dgs0;

    .line 7
    .line 8
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/fnv0;->b:Ll/xvw0;

    .line 25
    .line 26
    new-instance v1, Ll/dnv0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/dnv0;-><init>(Ll/fnv0;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    iget-object v0, p0, Ll/fnv0;->a:Ll/xvw0;

    .line 37
    .line 38
    new-instance v1, Ll/env0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/env0;-><init>(Ll/fnv0;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method
