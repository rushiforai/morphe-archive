.class public Ll/ub40$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qol$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ub40;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ub40;


# direct methods
.method public constructor <init>(Ll/ub40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ub40;->l(Ll/ub40;)Ll/j90;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 14
    .line 15
    invoke-static {v0}, Ll/ub40;->l(Ll/ub40;)Ll/j90;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Ll/j90;->K(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 23
    .line 24
    iget-object v0, v0, Ll/ub40;->c:Landroid/widget/ImageView;

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v2, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 31
    .line 32
    invoke-static {v2}, Ll/ub40;->k(Ll/ub40;)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    const/4 v3, 0x0

    .line 37
    const/4 v4, 0x1

    .line 38
    if-ge v1, v2, :cond_0

    .line 39
    .line 40
    move v1, v4

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v1, v3

    .line 43
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 47
    .line 48
    iget-object v0, v0, Ll/ub40;->d:Lv/VRecyclerView;

    .line 49
    .line 50
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iget-object v2, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 55
    .line 56
    invoke-static {v2}, Ll/ub40;->k(Ll/ub40;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-lt v1, v2, :cond_1

    .line 61
    .line 62
    move v3, v4

    .line 63
    :cond_1
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object v0, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 67
    .line 68
    invoke-static {v0}, Ll/ub40;->m(Ll/ub40;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Ll/ub40$a;->a:Ll/ub40;

    .line 75
    .line 76
    invoke-static {p0, p1}, Ll/ub40;->n(Ll/ub40;Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
