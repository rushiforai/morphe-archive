.class public final Ll/x3u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k8u0;
.implements Ll/k7u0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/q6w0;

.field public final c:Ll/w1t0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/q6w0;Ll/w1t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x3u0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/x3u0;->b:Ll/q6w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/x3u0;->c:Ll/w1t0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final B(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final K(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final P(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final zzr()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x3u0;->b:Ll/q6w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/q6w0;->e0:Ll/x1t0;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, v0, Ll/x1t0;->a:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/x3u0;->b:Ll/q6w0;

    .line 18
    .line 19
    iget-object v1, v1, Ll/q6w0;->e0:Ll/x1t0;

    .line 20
    .line 21
    iget-object v1, v1, Ll/x1t0;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/x3u0;->b:Ll/q6w0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/q6w0;->e0:Ll/x1t0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/x1t0;->b:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method
