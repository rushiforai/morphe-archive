.class public final Lj4a;
.super Ltx7;
.source "SourceFile"


# instance fields
.field public final e:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final f:I

.field public final g:Ld4a;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/GridLayoutManager;ILd4a;)V
    .registers 4

    invoke-direct {p0}, Ltx7;-><init>()V

    iput-object p1, p0, Lj4a;->e:Landroidx/recyclerview/widget/GridLayoutManager;

    iput p2, p0, Lj4a;->f:I

    iput-object p3, p0, Lj4a;->g:Ld4a;

    return-void
.end method


# virtual methods
.method public final f(I)I
    .registers 4

    iget-object v0, p0, Lj4a;->g:Ld4a;

    invoke-interface {v0, p1}, Ld4a;->getItem(I)Le4a;

    move-result-object p1

    iget-object v0, p0, Lj4a;->e:Landroidx/recyclerview/widget/GridLayoutManager;

    iget v0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-interface {p1}, Le4a;->b()La26;

    move-result-object p1

    sget-object v1, Lg4a;->p:Lg4a;

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    iget p0, p0, Lj4a;->f:I

    div-int/2addr v0, p0

    return v0

    :cond_1a
    sget-object p0, Lg4a;->o:Lg4a;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_23

    return v0

    :cond_23
    instance-of p0, p1, Lf4a;

    if-eqz p0, :cond_2a

    div-int/lit8 v0, v0, 0x2

    return v0

    :cond_2a
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0
.end method
