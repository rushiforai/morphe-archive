.class public Ll/jn00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zm00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VList;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VEditText;

.field public d:Lv/VText;

.field public e:Landroid/view/View;

.field public f:Ll/zm00;

.field public g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

.field public h:Landroid/view/View;

.field public i:Ll/pk00;

.field public j:Ll/vh00;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/jn00;->k:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Ll/an00;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/an00;-><init>(Ll/jn00;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/jn00;->l:Ll/y20;

    .line 18
    .line 19
    iput-object p1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/jn00;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jn00;->u(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic b(Ll/jn00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jn00;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/jn00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jn00;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/jn00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jn00;->p()V

    return-void
.end method

.method public static synthetic e(Ll/jn00;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jn00;->w(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic f(Ll/jn00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jn00;->x(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i(Ll/jn00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jn00;->y(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j(Ll/jn00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jn00;->v(Landroid/view/View;)V

    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jn00;->c:Lv/VEditText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 7
    .line 8
    iget-object p0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic x(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jn00;->a:Lv/VList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ll/bn00;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/bn00;-><init>(Ll/jn00;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iget-object p1, p0, Ll/jn00;->a:Lv/VList;

    .line 32
    .line 33
    iget-object v0, p0, Ll/jn00;->k:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    iget-object p0, p0, Ll/jn00;->a:Lv/VList;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-virtual {p1, v0, p0}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    sget-object v1, Ll/uqb0;->Z:Ll/a4j;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 30
    .line 31
    new-instance v2, Ll/gn00;

    .line 32
    .line 33
    invoke-direct {v2, p0, v0}, Ll/gn00;-><init>(Ll/jn00;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/k3h;->z0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Ll/jn00;->f:Ll/zm00;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/zm00;->V0(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public B(Ll/vg60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/common/collect/Lists;->q(Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/jn00;->k:Ljava/util/List;

    .line 8
    .line 9
    iget-object v0, p0, Ll/jn00;->i:Ll/pk00;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ll/pk00;->d(Ll/vg60;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/jn00;->j:Ll/vh00;

    .line 15
    .line 16
    iget-object p0, p0, Ll/jn00;->k:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/vh00;->t(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jn00;->i:Ll/pk00;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/pk00;->c(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jn00;->i:Ll/pk00;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/pk00;->f(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jn00;->i:Ll/pk00;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/pk00;->a(Lcom/p1/mobile/putong/data/User;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zm00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jn00;->m(Ll/zm00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jn00;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public init()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->L3:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/jn00;->i:Ll/pk00;

    .line 9
    .line 10
    iget-object v1, p0, Ll/jn00;->f:Ll/zm00;

    .line 11
    .line 12
    iget-object v2, v1, Ll/zm00;->c:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v3, v1, Ll/zm00;->b:Ljava/lang/String;

    .line 15
    .line 16
    iget-boolean v4, v1, Ll/zm00;->d:Z

    .line 17
    .line 18
    iget-boolean v1, v1, Ll/zm00;->e:Z

    .line 19
    .line 20
    invoke-interface {v0, v2, v3, v4, v1}, Ll/pk00;->e(Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/jn00;->a:Lv/VList;

    .line 24
    .line 25
    iget-object v1, p0, Ll/jn00;->h:Landroid/view/View;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/jn00;->a:Lv/VList;

    .line 33
    .line 34
    iget-object v1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Ll/tec0;->W3:I

    .line 41
    .line 42
    iget-object v4, p0, Ll/jn00;->a:Lv/VList;

    .line 43
    .line 44
    invoke-virtual {v1, v2, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Landroid/view/View;

    .line 52
    .line 53
    iget-object v1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 56
    .line 57
    .line 58
    const/high16 v1, 0x42400000    # 48.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumHeight(I)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v3}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/jn00;->a:Lv/VList;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/vh00;

    .line 76
    .line 77
    iget-object v1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 78
    .line 79
    invoke-direct {v0, v1}, Ll/vh00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Ll/jn00;->j:Ll/vh00;

    .line 83
    .line 84
    iget-object v1, p0, Ll/jn00;->a:Lv/VList;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/jn00;->a:Lv/VList;

    .line 90
    .line 91
    iget-object v1, p0, Ll/jn00;->j:Ll/vh00;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/AbsListView;->setRecyclerListener(Landroid/widget/AbsListView$RecyclerListener;)V

    .line 94
    .line 95
    .line 96
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 97
    .line 98
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 99
    .line 100
    iget-object v1, p0, Ll/jn00;->f:Ll/zm00;

    .line 101
    .line 102
    iget-object v1, v1, Ll/zm00;->c:Ljava/lang/String;

    .line 103
    .line 104
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->shouldLockComment(Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v1, p0, Ll/jn00;->e:Landroid/view/View;

    .line 109
    .line 110
    const/4 v2, 0x1

    .line 111
    if-eqz v0, :cond_0

    .line 112
    .line 113
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/jn00;->e:Landroid/view/View;

    .line 117
    .line 118
    new-instance v1, Ll/cn00;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/cn00;-><init>(Ll/jn00;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    :goto_0
    iget-object v0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 131
    .line 132
    new-instance v1, Ll/dn00;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ll/dn00;-><init>(Ll/jn00;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    new-instance v1, Ll/en00;

    .line 147
    .line 148
    invoke-direct {v1, p0}, Ll/en00;-><init>(Ll/jn00;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/jn00;->d:Lv/VText;

    .line 159
    .line 160
    new-instance v1, Ll/fn00;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Ll/fn00;-><init>(Ll/jn00;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    .line 167
    .line 168
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 169
    .line 170
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 171
    .line 172
    iget-object v1, p0, Ll/jn00;->f:Ll/zm00;

    .line 173
    .line 174
    iget-object v1, v1, Ll/zm00;->c:Ljava/lang/String;

    .line 175
    .line 176
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    iget-object v1, p0, Ll/jn00;->b:Landroid/widget/LinearLayout;

    .line 181
    .line 182
    if-eqz v0, :cond_1

    .line 183
    .line 184
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_1
    iget-object p0, p0, Ll/jn00;->f:Ll/zm00;

    .line 189
    .line 190
    iget-boolean p0, p0, Ll/zm00;->e:Z

    .line 191
    .line 192
    xor-int/2addr p0, v2

    .line 193
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kn00;->b(Ll/jn00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 8
    .line 9
    new-instance v1, Ll/hn00;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/hn00;-><init>(Ll/jn00;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v2, 0xc8

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public m(Ll/zm00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jn00;->f:Ll/zm00;

    .line 2
    .line 3
    return-void
.end method

.method public n(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/tec0;->r4:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/jn00;->h:Landroid/view/View;

    .line 15
    .line 16
    check-cast p2, Ll/pk00;

    .line 17
    .line 18
    iput-object p2, p0, Ll/jn00;->i:Ll/pk00;

    .line 19
    .line 20
    iget-object p2, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 21
    .line 22
    iget-object p0, p0, Ll/jn00;->l:Ll/y20;

    .line 23
    .line 24
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/android/app/Act;->setKeyboardListener(Landroid/view/View;Ll/y20;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jn00;->a:Lv/VList;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jn00;->k:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p0, v1}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jn00;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "moment_detail"

    .line 10
    .line 11
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic u(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jn00;->c:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p1, p0, Ll/jn00;->d:Lv/VText;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/jn00;->d:Lv/VText;

    .line 31
    .line 32
    iget-object p0, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget v0, Ll/k9c0;->k0:I

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/jn00;->d:Lv/VText;

    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/jn00;->d:Lv/VText;

    .line 55
    .line 56
    iget-object p0, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget v0, Ll/k9c0;->m0:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 2
    .line 3
    iget-object v0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/jn00;->c:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/jn00;->f:Ll/zm00;

    .line 14
    .line 15
    iget-object p1, p1, Ll/zm00;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Ll/mrb0;->X(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 28
    .line 29
    const-string p1, ""

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p0}, Ll/jn00;->A()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic w(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jn00;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jn00;->c:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic y(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jn00;->f:Ll/zm00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zm00;->V0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jn00;->i:Ll/pk00;

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
    iget-object p0, p0, Ll/jn00;->i:Ll/pk00;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/pk00;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
