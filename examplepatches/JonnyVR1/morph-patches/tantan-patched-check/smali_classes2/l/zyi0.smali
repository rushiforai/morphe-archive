.class public Ll/zyi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zyi0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:[Ll/azi0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ll/azi0<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>([Ll/azi0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ll/azi0<",
            "Ll/n0f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, [Ll/azi0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/zyi0;->a:[Ll/azi0;

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    array-length p1, p1

    .line 14
    invoke-static {p0, p1}, Ll/wn80;->e(II)I

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic c(Ll/zyi0;ILl/z06;Ll/yk90;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zyi0;->e(ILl/z06;Ll/yk90;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->s()Ll/q3d0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1, v2, v1}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0, p1, p2}, Ll/zyi0;->e(ILl/z06;Ll/yk90;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p1, v2, v1}, Ll/z06;->b(Ljava/lang/Object;I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final d(ILl/q3d0;)I
    .locals 2

    .line 1
    :goto_0
    iget-object v0, p0, Ll/zyi0;->a:[Ll/azi0;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-ge p1, v1, :cond_1

    .line 5
    .line 6
    aget-object v0, v0, p1

    .line 7
    .line 8
    invoke-interface {v0, p2}, Ll/azi0;->a(Ll/q3d0;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return p1

    .line 15
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method public final e(ILl/z06;Ll/yk90;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-interface {p3}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->s()Ll/q3d0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/zyi0;->d(ILl/q3d0;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, -0x1

    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/zyi0;->a:[Ll/azi0;

    .line 19
    .line 20
    aget-object v0, v0, p1

    .line 21
    .line 22
    new-instance v1, Ll/zyi0$a;

    .line 23
    .line 24
    invoke-direct {v1, p0, p2, p3, p1}, Ll/zyi0$a;-><init>(Ll/zyi0;Ll/z06;Ll/yk90;I)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1, p3}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0
.end method
