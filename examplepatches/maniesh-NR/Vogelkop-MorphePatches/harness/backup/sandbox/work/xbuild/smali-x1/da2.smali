.class public final Lda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lea2;


# instance fields
.field public final a:Ljava/lang/Class;

.field public final b:I

.field public final c:I

.field public final d:Ljr9;


# direct methods
.method public constructor <init>(Ljava/lang/Class;IILjr9;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lda2;->a:Ljava/lang/Class;

    iput p2, p0, Lda2;->b:I

    iput p3, p0, Lda2;->c:I

    iput-object p4, p0, Lda2;->d:Ljr9;

    return-void
.end method


# virtual methods
.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 4

    iget v0, p0, Lda2;->b:I

    if-eq v0, p2, :cond_a

    iget v0, p0, Lda2;->c:I

    if-eq v0, p2, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lda2;->d:Ljr9;

    invoke-interface {p0, p1}, Ljr9;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lab2;

    return-object p0
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    iget-object p2, p0, Lda2;->a:Ljava/lang/Class;

    invoke-virtual {p2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    iget-boolean p1, p3, Lca2;->a:Z

    if-eqz p1, :cond_11

    iget p0, p0, Lda2;->b:I

    return p0

    :cond_11
    iget p0, p0, Lda2;->c:I

    return p0
.end method
