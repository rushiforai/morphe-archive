.class public abstract Ll/o1i0;
.super Ll/j1i0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "V:",
        "Landroid/view/View;",
        ">",
        "Ll/j1i0<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public b:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field public c:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TT;TV;>;"
        }
    .end annotation
.end field

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "TV;>;"
        }
    .end annotation
.end field

.field public e:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "TV;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/j1i0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/o1i0;->c:Ljava/util/HashMap;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/o1i0;->f:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic f(Ll/o1i0;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/o1i0;->k(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Landroid/view/View;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/o1i0;->e:Ll/qcj;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-interface {p2, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    iget-object p2, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/4 v0, 0x0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eqz p2, :cond_3

    .line 27
    .line 28
    iget-object p2, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    if-eq p1, p2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p2, v2}, Landroid/view/View;->setSelected(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-boolean p2, p0, Ll/o1i0;->f:Z

    .line 43
    .line 44
    if-eqz p2, :cond_2

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 57
    .line 58
    :goto_0
    iget-object p2, p0, Ll/o1i0;->d:Ll/y20;

    .line 59
    .line 60
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_5

    .line 65
    .line 66
    iget-object p0, p0, Ll/o1i0;->d:Ll/y20;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-eqz p2, :cond_4

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    move-object p1, v0

    .line 76
    :goto_1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :cond_5
    :goto_2
    return-void
.end method


# virtual methods
.method public c(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TV;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o1i0;->h(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p2}, Ll/o1i0;->j(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Ll/o1i0;->c:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/n1i0;

    .line 15
    .line 16
    invoke-direct {p2, p0, p1}, Ll/n1i0;-><init>(Ll/o1i0;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-object p1
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public abstract h(Landroid/view/ViewGroup;I)Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TV;"
        }
    .end annotation
.end method

.method public i()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract j(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation
.end method

.method public l()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/o1i0;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public m(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "TV;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/o1i0;->e:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public n(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "TV;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/o1i0;->d:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public o(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o1i0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/view/View;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/o1i0;->b:Landroid/view/View;

    .line 31
    .line 32
    return-void
.end method
