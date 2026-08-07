.class public final Lcom/google/android/exoplayer2/q$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/j;
.implements Lcom/google/android/exoplayer2/drm/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/q$c;

.field public final synthetic b:Lcom/google/android/exoplayer2/q;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/q;Lcom/google/android/exoplayer2/q$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/exoplayer2/q$a;->a:Lcom/google/android/exoplayer2/q$c;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic A(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/ktx;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/source/j;->p0(ILcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic C(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/j;->L(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic D(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/drm/b;->j0(ILcom/google/android/exoplayer2/source/i$b;Ljava/lang/Exception;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic E(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1}, Lcom/google/android/exoplayer2/drm/b;->Q(ILcom/google/android/exoplayer2/source/i$b;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object p0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    move-object v2, p0

    .line 18
    check-cast v2, Lcom/google/android/exoplayer2/source/i$b;

    .line 19
    .line 20
    move-object v3, p2

    .line 21
    move-object v4, p3

    .line 22
    move-object v5, p4

    .line 23
    move v6, p5

    .line 24
    invoke-interface/range {v0 .. v6}, Lcom/google/android/exoplayer2/source/j;->Z(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1}, Lcom/google/android/exoplayer2/drm/b;->a0(ILcom/google/android/exoplayer2/source/i$b;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic n(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/j;->B(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic p(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1}, Lcom/google/android/exoplayer2/drm/b;->q0(ILcom/google/android/exoplayer2/source/i$b;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic s(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1, p2, p3}, Lcom/google/android/exoplayer2/source/j;->Y(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic u(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/drm/b;->P(ILcom/google/android/exoplayer2/source/i$b;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic x(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-interface {p0, v0, p1}, Lcom/google/android/exoplayer2/drm/b;->N(ILcom/google/android/exoplayer2/source/i$b;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic z(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/ktx;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/q;->e(Lcom/google/android/exoplayer2/q;)Ll/dk0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 18
    .line 19
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/google/android/exoplayer2/source/i$b;

    .line 24
    .line 25
    invoke-interface {p0, v0, p1, p2}, Lcom/google/android/exoplayer2/source/j;->V(ILcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public B(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/q6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p3, p4}, Ll/q6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;
    .locals 2
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/exoplayer2/source/i$b;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/exoplayer2/source/i$b;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Lcom/google/android/exoplayer2/q$a;->a:Lcom/google/android/exoplayer2/q$c;

    .line 5
    .line 6
    invoke-static {v1, p2}, Lcom/google/android/exoplayer2/q;->c(Lcom/google/android/exoplayer2/q$c;Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/source/i$b;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    move-object v0, p2

    .line 14
    :cond_1
    iget-object p0, p0, Lcom/google/android/exoplayer2/q$a;->a:Lcom/google/android/exoplayer2/q$c;

    .line 15
    .line 16
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/q;->d(Lcom/google/android/exoplayer2/q$c;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public L(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/o6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p3, p4}, Ll/o6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public N(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/k6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/k6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public P(ILcom/google/android/exoplayer2/source/i$b;I)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/p6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p3}, Ll/p6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;I)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public Q(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/t6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/t6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public V(ILcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/s6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p3}, Ll/s6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/ktx;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public Y(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/i6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p3, p4}, Ll/i6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public Z(ILcom/google/android/exoplayer2/source/i$b;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move-object p1, p0

    .line 14
    new-instance p0, Ll/r6y;

    .line 15
    .line 16
    invoke-direct/range {p0 .. p6}, Ll/r6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;Ljava/io/IOException;Z)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, p0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public a0(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/j6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/j6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public j0(ILcom/google/android/exoplayer2/source/i$b;Ljava/lang/Exception;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/n6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p3}, Ll/n6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ljava/lang/Exception;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public p0(ILcom/google/android/exoplayer2/source/i$b;Ll/ktx;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/l6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p3}, Ll/l6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/ktx;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public q0(ILcom/google/android/exoplayer2/source/i$b;)V
    .locals 1
    .param p2    # Lcom/google/android/exoplayer2/source/i$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/exoplayer2/q$a;->F(ILcom/google/android/exoplayer2/source/i$b;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/exoplayer2/q$a;->b:Lcom/google/android/exoplayer2/q;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/google/android/exoplayer2/q;->b(Lcom/google/android/exoplayer2/q;)Ll/sxk;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/m6y;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/m6y;-><init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p2, v0}, Ll/sxk;->i(Ljava/lang/Runnable;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
