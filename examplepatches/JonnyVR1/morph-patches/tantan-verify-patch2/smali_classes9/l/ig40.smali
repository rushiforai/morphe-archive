.class public Ll/ig40;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public m:I

.field public n:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

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
    iput-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/ig40;->o:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic q(Ll/ig40;ILjava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ig40;->z(ILjava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method

.method public static synthetic r(Ll/ig40;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig40;->A(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic s(Ll/ig40;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ig40;->x(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    return-void
.end method

.method public static synthetic t(Ll/ig40;ILjava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ig40;->y(ILjava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method

.method public static synthetic u(Landroid/view/View;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method


# virtual methods
.method public final synthetic A(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/ig40;->o:Z

    .line 6
    .line 7
    invoke-static {}, Ll/g6b;->d()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-boolean p1, p0, Ll/ig40;->o:Z

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/ig40;->v(Ljava/lang/Boolean;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public C(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ig40;->getCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x2

    .line 16
    if-ne v0, v1, :cond_6

    .line 17
    .line 18
    iget-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 19
    .line 20
    iget-object v1, p0, Ll/ig40;->e:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/view/View;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_4

    .line 45
    .line 46
    iget-object v1, p0, Ll/ig40;->e:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 53
    .line 54
    invoke-static {v1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    const-string v1, "vip"

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    const-string v1, "svip"

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    const/4 v1, 0x0

    .line 73
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_3

    .line 78
    .line 79
    iget-object v2, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 80
    .line 81
    iget-object v3, p0, Ll/ig40;->e:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Landroid/view/View;

    .line 92
    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->X()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const-string v2, "tab_type"

    .line 100
    .line 101
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    filled-new-array {v1}, [Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const-string v2, "e_purchase_tab"

    .line 110
    .line 111
    invoke-static {v2, p1, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->W()V

    .line 117
    .line 118
    .line 119
    iget-boolean p0, p0, Ll/ig40;->o:Z

    .line 120
    .line 121
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h0(Z)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_4
    instance-of p1, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 126
    .line 127
    if-eqz p1, :cond_5

    .line 128
    .line 129
    iget-object p1, p0, Ll/ig40;->h:Ljava/lang/String;

    .line 130
    .line 131
    iput-object p1, p0, Ll/ig40;->h:Ljava/lang/String;

    .line 132
    .line 133
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setFrom(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->W()V

    .line 139
    .line 140
    .line 141
    :cond_5
    :goto_1
    return-void

    .line 142
    :cond_6
    iget-object v0, p0, Ll/ig40;->h:Ljava/lang/String;

    .line 143
    .line 144
    iput-object v0, p0, Ll/ig40;->h:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 147
    .line 148
    iget-object v1, p0, Ll/ig40;->e:Ljava/util/List;

    .line 149
    .line 150
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 159
    .line 160
    iget-object v1, p0, Ll/ig40;->h:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setFrom(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 166
    .line 167
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 168
    .line 169
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->W()V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public D(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ig40;->n:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public E(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ig40;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ig40;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public G(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ig40;->k:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public H(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ig40;->j:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public I(Ljava/util/List;Ljava/util/List;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ig40;->e:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ig40;->g:Ljava/util/List;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ig40;->f:Ll/y20;

    .line 6
    .line 7
    return-void
.end method

.method public J(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ig40;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public K(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 11
    .line 12
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Landroid/view/View;

    .line 23
    .line 24
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f0()V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p2, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public m(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/ig40;->i:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/gg40;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ll/gg40;-><init>(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-ne v0, p0, :cond_0

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->W()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/rec0;->H2:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 17
    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const/4 v4, 0x0

    .line 36
    if-nez v3, :cond_0

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    :cond_0
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 53
    .line 54
    iget-object v5, p0, Ll/ig40;->e:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v5, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    if-ne v3, v5, :cond_1

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    new-instance v4, Ll/dg40;

    .line 67
    .line 68
    invoke-direct {v4, p0, p2, v1}, Ll/dg40;-><init>(Ll/ig40;ILjava/util/List;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-interface {v3}, Ll/r97;->f()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_2

    .line 88
    .line 89
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 90
    .line 91
    iget-object v5, p0, Ll/ig40;->e:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v5, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    if-ne v3, v5, :cond_2

    .line 98
    .line 99
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    new-instance v4, Ll/eg40;

    .line 104
    .line 105
    invoke-direct {v4, p0, p2, v3, v1}, Ll/eg40;-><init>(Ll/ig40;ILjava/util/List;Ljava/util/List;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    :goto_0
    new-instance v3, Ll/cg40;

    .line 112
    .line 113
    invoke-direct {v3, v0}, Ll/cg40;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 114
    .line 115
    .line 116
    iget-object v4, p0, Ll/ig40;->e:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    check-cast v4, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 123
    .line 124
    iget-object v5, p0, Ll/ig40;->g:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v5, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    check-cast v5, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 131
    .line 132
    invoke-virtual {v3, v4, v5}, Ll/cg40;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/cg40;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {v3, v1}, Ll/cg40;->h(Ljava/util/List;)Ll/cg40;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v3, p0, Ll/ig40;->f:Ll/y20;

    .line 141
    .line 142
    invoke-virtual {v1, v3}, Ll/cg40;->d(Ll/y20;)Ll/cg40;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    iget-object v3, p0, Ll/ig40;->j:Ll/a30;

    .line 147
    .line 148
    invoke-virtual {v1, v3}, Ll/cg40;->g(Ll/a30;)Ll/cg40;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iget-object v3, p0, Ll/ig40;->k:Ll/y20;

    .line 153
    .line 154
    invoke-virtual {v1, v3}, Ll/cg40;->f(Ll/y20;)Ll/cg40;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    new-instance v3, Ll/fg40;

    .line 159
    .line 160
    invoke-direct {v3, p0}, Ll/fg40;-><init>(Ll/ig40;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, v3}, Ll/cg40;->b(Ll/y20;)Ll/cg40;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iget-object v3, p0, Ll/ig40;->h:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v1, v3}, Ll/cg40;->e(Ljava/lang/String;)Ll/cg40;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iget-object v3, p0, Ll/ig40;->n:Ll/z20;

    .line 174
    .line 175
    invoke-virtual {v1, v3}, Ll/cg40;->c(Ll/z20;)Ll/cg40;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    iget v3, p0, Ll/ig40;->m:I

    .line 180
    .line 181
    if-eq p2, v3, :cond_3

    .line 182
    .line 183
    const/4 v2, 0x1

    .line 184
    :cond_3
    invoke-virtual {v1, v2}, Ll/cg40;->a(Z)V

    .line 185
    .line 186
    .line 187
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    iget-object p1, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 198
    .line 199
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 200
    .line 201
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 206
    .line 207
    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    return-object v0
.end method

.method public final v(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ig40;->e:Ljava/util/List;

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
    iget-object v0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/hg40;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/hg40;-><init>(Ll/ig40;Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public w(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ig40;->K(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ig40;->l:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h0(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic y(ILjava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-ge p1, v0, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ll/ig40;->g:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipExtra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 46
    .line 47
    if-ne p3, v0, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 56
    .line 57
    invoke-static {p0, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p2, v2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-ge p1, v0, :cond_1

    .line 80
    .line 81
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-ne p3, v0, :cond_1

    .line 88
    .line 89
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 96
    .line 97
    invoke-static {p0, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-interface {p2, v2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_2

    .line 110
    .line 111
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 118
    .line 119
    invoke-static {p0, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    :cond_2
    return-void
.end method

.method public final synthetic z(ILjava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-ge p1, v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/ig40;->g:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_0

    .line 39
    .line 40
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipExtra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 41
    .line 42
    if-ne p4, p2, :cond_0

    .line 43
    .line 44
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 51
    .line 52
    invoke-static {p0, p4}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {p3, v2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget-object p2, p0, Ll/ig40;->g:Ljava/util/List;

    .line 61
    .line 62
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_1

    .line 67
    .line 68
    iget-object p2, p0, Ll/ig40;->g:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-ge p1, p2, :cond_1

    .line 75
    .line 76
    iget-object p2, p0, Ll/ig40;->g:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    if-ne p4, p2, :cond_1

    .line 83
    .line 84
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 91
    .line 92
    invoke-static {p0, p4}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p3, v2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    if-eqz p2, :cond_2

    .line 105
    .line 106
    iget-object p0, p0, Ll/ig40;->e:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    check-cast p0, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 113
    .line 114
    invoke-static {p0, p4}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    :cond_2
    return-void
.end method
