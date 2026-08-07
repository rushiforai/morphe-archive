.class public final Ll/dzy0;
.super Ll/yyy0;
.source "SourceFile"


# static fields
.field public static final i:Ljava/lang/Object;


# instance fields
.field public final g:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final h:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/dzy0;->i:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/d0u0;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/yyy0;-><init>(Ll/d0u0;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/dzy0;->g:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p3, p0, Ll/dzy0;->h:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public static q(Ll/trs0;)Ll/dzy0;
    .locals 3

    .line 1
    new-instance v0, Ll/dzy0;

    .line 2
    .line 3
    new-instance v1, Ll/ezy0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ezy0;-><init>(Ll/trs0;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Ll/wyt0;->p:Ljava/lang/Object;

    .line 9
    .line 10
    sget-object v2, Ll/dzy0;->i:Ljava/lang/Object;

    .line 11
    .line 12
    invoke-direct {v0, v1, p0, v2}, Ll/dzy0;-><init>(Ll/d0u0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static r(Ll/d0u0;Ljava/lang/Object;Ljava/lang/Object;)Ll/dzy0;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/dzy0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/dzy0;-><init>(Ll/d0u0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static bridge synthetic s(Ll/dzy0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dzy0;->h:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)I
    .locals 1

    .line 1
    sget-object v0, Ll/dzy0;->i:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/dzy0;->h:Ljava/lang/Object;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move-object p1, v0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/yyy0;->f:Ll/d0u0;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/d0u0;->a(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public final d(ILl/hwt0;Z)Ll/hwt0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yyy0;->f:Ll/d0u0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/d0u0;->d(ILl/hwt0;Z)Ll/hwt0;

    .line 4
    .line 5
    .line 6
    iget-object p1, p2, Ll/hwt0;->b:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object p0, p0, Ll/dzy0;->h:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    sget-object p0, Ll/dzy0;->i:Ljava/lang/Object;

    .line 19
    .line 20
    iput-object p0, p2, Ll/hwt0;->b:Ljava/lang/Object;

    .line 21
    .line 22
    :cond_0
    return-object p2
.end method

.method public final e(ILl/wyt0;J)Ll/wyt0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yyy0;->f:Ll/d0u0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/d0u0;->e(ILl/wyt0;J)Ll/wyt0;

    .line 4
    .line 5
    .line 6
    iget-object p1, p2, Ll/wyt0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iget-object p0, p0, Ll/dzy0;->g:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Ll/wyt0;->p:Ljava/lang/Object;

    .line 17
    .line 18
    iput-object p0, p2, Ll/wyt0;->a:Ljava/lang/Object;

    .line 19
    .line 20
    :cond_0
    return-object p2
.end method

.method public final f(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yyy0;->f:Ll/d0u0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/d0u0;->f(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/dzy0;->h:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {p1, p0}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Ll/dzy0;->i:Ljava/lang/Object;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    return-object p1
.end method

.method public final p(Ll/d0u0;)Ll/dzy0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dzy0;->g:Ljava/lang/Object;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dzy0;->h:Ljava/lang/Object;

    .line 4
    .line 5
    new-instance v1, Ll/dzy0;

    .line 6
    .line 7
    invoke-direct {v1, p1, v0, p0}, Ll/dzy0;-><init>(Ll/d0u0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v1
.end method
