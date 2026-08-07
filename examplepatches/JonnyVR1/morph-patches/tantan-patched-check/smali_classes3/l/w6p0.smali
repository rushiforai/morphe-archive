.class public Ll/w6p0;
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
        "Ll/y6p0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/y6p0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y6p0<",
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
    iput-object p1, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/w6p0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/w6p0;->e(Ll/nsv;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/w6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w6p0;->d(Landroid/view/View;)V

    return-void
.end method

.method private synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w6p0;->a:Ll/y6p0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/y6p0;->r4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic e(Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/w6p0;->a:Ll/y6p0;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ll/y6p0;->q4(Ll/nsv;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/w6p0;->a:Ll/y6p0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/atm0;->Z3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

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

.method public c(Ll/y6p0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y6p0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w6p0;->a:Ll/y6p0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
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
    if-eqz p1, :cond_5

    .line 2
    .line 3
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-object v0, p0, Ll/w6p0;->a:Ll/y6p0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/y6p0;->o4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-static {p1}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/e3t;->d()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 45
    .line 46
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    :goto_0
    if-eqz v1, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 57
    .line 58
    if-eqz p0, :cond_6

    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    iget-object v1, p0, Ll/w6p0;->a:Ll/y6p0;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ll/y6p0;->n4(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    new-instance p1, Ll/u6p0;

    .line 76
    .line 77
    invoke-direct {p1, p0}, Ll/u6p0;-><init>(Ll/w6p0;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 81
    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    sget v1, Ll/obc0;->W8:I

    .line 85
    .line 86
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 94
    .line 95
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    new-instance v0, Ll/v6p0;

    .line 100
    .line 101
    invoke-direct {v0, p0, p1}, Ll/v6p0;-><init>(Ll/w6p0;Ll/nsv;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 105
    .line 106
    if-eqz p1, :cond_4

    .line 107
    .line 108
    sget v1, Ll/obc0;->C9:I

    .line 109
    .line 110
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 118
    .line 119
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 123
    .line 124
    if-eqz p0, :cond_6

    .line 125
    .line 126
    const/4 p1, 0x1

    .line 127
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_5
    :goto_2
    iget-object p0, p0, Ll/w6p0;->b:Landroid/widget/ImageView;

    .line 132
    .line 133
    if-eqz p0, :cond_6

    .line 134
    .line 135
    const/16 p1, 0x8

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 138
    .line 139
    .line 140
    :cond_6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/y6p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w6p0;->c(Ll/y6p0;)V

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
