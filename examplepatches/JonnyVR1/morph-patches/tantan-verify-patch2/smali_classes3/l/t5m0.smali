.class public Ll/t5m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/v5m0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/v5m0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v5m0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public b:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/t5m0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t5m0;->e(Ll/nsv;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/t5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t5m0;->d(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ll/v5m0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5m0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t5m0;->a:Ll/v5m0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t5m0;->a:Ll/v5m0;

    .line 2
    .line 3
    sget-object p1, Ll/zdm0;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/v5m0;->q4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/t5m0;->a:Ll/v5m0;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ll/v5m0;->p4(Ll/nsv;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/t5m0;->a:Ll/v5m0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/atm0;->Z3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f(Ll/nsv;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 25
    .line 26
    if-eqz p0, :cond_5

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object v1, p0, Ll/t5m0;->a:Ll/v5m0;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ll/v5m0;->n4(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    new-instance p1, Ll/r5m0;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Ll/r5m0;-><init>(Ll/t5m0;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    sget v1, Ll/obc0;->W8:I

    .line 53
    .line 54
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 62
    .line 63
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    new-instance v0, Ll/s5m0;

    .line 68
    .line 69
    invoke-direct {v0, p0, p1}, Ll/s5m0;-><init>(Ll/t5m0;Ll/nsv;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 73
    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    sget v1, Ll/obc0;->C9:I

    .line 77
    .line 78
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 86
    .line 87
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 91
    .line 92
    if-eqz p0, :cond_5

    .line 93
    .line 94
    const/4 p1, 0x1

    .line 95
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/t5m0;->b:Landroid/widget/ImageView;

    .line 100
    .line 101
    if-eqz p0, :cond_5

    .line 102
    .line 103
    const/16 p1, 0x8

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 106
    .line 107
    .line 108
    :cond_5
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v5m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t5m0;->c(Ll/v5m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
