.class public Ll/lhu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/wiu0;

.field public final b:Ll/wit0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wiu0;Ll/wit0;)V
    .locals 0
    .param p2    # Ll/wit0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lhu0;->a:Ll/wiu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lhu0;->b:Ll/wit0;

    .line 7
    .line 8
    return-void
.end method

.method public static final h(Ll/odw0;)Ll/yfu0;
    .locals 2

    .line 1
    new-instance v0, Ll/yfu0;

    .line 2
    .line 3
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static final i(Ll/hju0;)Ll/yfu0;
    .locals 2

    .line 1
    new-instance v0, Ll/yfu0;

    .line 2
    .line 3
    sget-object v1, Ll/oct0;->f:Ll/xvw0;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public final a()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lhu0;->b:Ll/wit0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final b()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lhu0;->b:Ll/wit0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final c()Ll/wit0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lhu0;->b:Ll/wit0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Ljava/util/concurrent/Executor;)Ll/yfu0;
    .locals 2

    .line 1
    new-instance v0, Ll/yfu0;

    .line 2
    .line 3
    new-instance v1, Ll/khu0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/lhu0;->b:Ll/wit0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/khu0;-><init>(Ll/wit0;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1, p1}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final e()Ll/wiu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhu0;->a:Ll/wiu0;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/u3u0;)Ljava/util/Set;
    .locals 1

    .line 1
    sget-object p0, Ll/oct0;->f:Ll/xvw0;

    .line 2
    .line 3
    new-instance v0, Ll/yfu0;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public g(Ll/u3u0;)Ljava/util/Set;
    .locals 1

    .line 1
    sget-object p0, Ll/oct0;->f:Ll/xvw0;

    .line 2
    .line 3
    new-instance v0, Ll/yfu0;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
