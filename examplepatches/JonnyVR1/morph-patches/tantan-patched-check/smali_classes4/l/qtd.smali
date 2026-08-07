.class public Ll/qtd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y6k0;


# instance fields
.field public A:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

.field public B:Lcom/p1/mobile/android/app/Act;

.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;

.field public e:Lv/VImage;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VText;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public m:Lv/VImage;

.field public n:Lv/VText;

.field public o:Landroid/widget/LinearLayout;

.field public p:Landroid/widget/LinearLayout;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/LinearLayout;

.field public t:Landroid/widget/TextView;

.field public u:Landroid/widget/TextView;

.field public v:Landroid/view/View;

.field public w:Lv/VLinear;

.field public x:Lv/VDraweeView;

.field public y:Landroid/widget/TextView;

.field public z:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qtd;->B:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic w(Ll/qtd;Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/qtd;->A(Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/qtd;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qtd;->B(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "state_id"

    .line 6
    .line 7
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    filled-new-array {p3}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    const-string v0, "e_my_state"

    .line 16
    .line 17
    const-string v1, "p_navigation_view"

    .line 18
    .line 19
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget-object p0, p0, Ll/qtd;->B:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p3, p0, p2, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic B(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/qtd;->A:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public a()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qtd;->w:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qtd;->z:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/qtd;->A:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qtd;->w:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/qtd;->v:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/qtd;->n:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public d()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qtd;->m:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;Ll/bkj0;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qtd;->w:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, -0x2

    .line 8
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 9
    .line 10
    iget-object v1, p0, Ll/qtd;->w:Lv/VLinear;

    .line 11
    .line 12
    sget v2, Ll/qa00;->h:I

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    sget v4, Ll/qa00;->j:I

    .line 19
    .line 20
    iget-object v5, p0, Ll/qtd;->w:Lv/VLinear;

    .line 21
    .line 22
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/qtd;->w:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/qtd;->x:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Ll/qa00;->r:I

    .line 41
    .line 42
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 43
    .line 44
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 45
    .line 46
    iget-object v1, p0, Ll/qtd;->x:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 58
    .line 59
    sget v1, Ll/qa00;->c:I

    .line 60
    .line 61
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 62
    .line 63
    iget-object v1, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 69
    .line 70
    const/high16 v1, 0x41400000    # 12.0f

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/qtd;->z:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 83
    .line 84
    iget-object v1, p0, Ll/qtd;->B:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget v2, Ll/c9c0;->p:I

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 100
    .line 101
    iget-object v1, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v1, Ljava/lang/CharSequence;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/qtd;->x:Lv/VDraweeView;

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 115
    .line 116
    iget-object v1, p0, Ll/qtd;->x:Lv/VDraweeView;

    .line 117
    .line 118
    iget-object v2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 119
    .line 120
    check-cast v2, Ljava/lang/String;

    .line 121
    .line 122
    const/high16 v3, 0x41c00000    # 24.0f

    .line 123
    .line 124
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/qtd;->w:Lv/VLinear;

    .line 136
    .line 137
    new-instance v1, Ll/otd;

    .line 138
    .line 139
    invoke-direct {v1, p0, p2, p1}, Ll/otd;-><init>(Ll/qtd;Ll/bkj0;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public g()Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qtd;->l:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qtd;->e:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qtd;->f:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/qtd;->n:Lv/VText;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/qtd;->n:Lv/VText;

    .line 16
    .line 17
    iget-object p0, p0, Ll/qtd;->B:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Dj:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 v0, 0x1

    .line 30
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/qtd;->n:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qtd;->y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/qtd;->z()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qtd;->p:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qtd;->s:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qa00;->O:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/qtd;->c:Lv/VDraweeView;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, p0, p1, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n(Landroid/view/View$OnClickListener;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qtd;->w:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/qa00;->N:I

    .line 8
    .line 9
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    iget-object v1, p0, Ll/qtd;->w:Lv/VLinear;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/qtd;->x:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Ll/qa00;->o:I

    .line 23
    .line 24
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 25
    .line 26
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 27
    .line 28
    iget-object v1, p0, Ll/qtd;->x:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 43
    .line 44
    sget v1, Ll/qa00;->d:I

    .line 45
    .line 46
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 47
    .line 48
    iget-object v1, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 54
    .line 55
    const/high16 v1, 0x41400000    # 12.0f

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/qtd;->z:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 68
    .line 69
    iget-object v1, p0, Ll/qtd;->B:Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    sget v2, Ll/c9c0;->k0:I

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/qtd;->y:Landroid/widget/TextView;

    .line 85
    .line 86
    const-string v1, "\u72b6\u6001"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 92
    .line 93
    iget-object v1, p0, Ll/qtd;->x:Lv/VDraweeView;

    .line 94
    .line 95
    sget v2, Ll/dbc0;->Yg:I

    .line 96
    .line 97
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/qtd;->w:Lv/VLinear;

    .line 101
    .line 102
    new-instance v1, Ll/ptd;

    .line 103
    .line 104
    invoke-direct {v1, p0, p1}, Ll/ptd;-><init>(Ll/qtd;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qtd;->q:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 8
    .line 9
    iget v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followers:I

    .line 10
    .line 11
    invoke-static {v1}, Ll/q8g0;->t(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/qtd;->t:Landroid/widget/TextView;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 25
    .line 26
    iget p1, p1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followings:I

    .line 27
    .line 28
    invoke-static {p1}, Ll/q8g0;->t(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y6k0;->s()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qtd;->z()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public t()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qtd;->j:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qtd;->A:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->p()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qtd;->k:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rtd;->b(Ll/qtd;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final z()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qtd;->e:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/qtd;->f:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/gra;->e2()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/CharSequence;

    .line 30
    .line 31
    const-string v3, "marryMode"

    .line 32
    .line 33
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Ll/qtd;->d:Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;

    .line 40
    .line 41
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/qtd;->f:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/qtd;->e:Lv/VImage;

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Ll/qtd;->e:Lv/VImage;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/qtd;->f:Landroid/widget/FrameLayout;

    .line 61
    .line 62
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Ll/qtd;->d:Lcom/p1/mobile/putong/core/newui/view/RoundedRectangleProgressView;

    .line 66
    .line 67
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->fs()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    iget-object v0, p0, Ll/qtd;->h:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 87
    .line 88
    const/high16 v1, 0x43020000    # 130.0f

    .line 89
    .line 90
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 95
    .line 96
    iget-object p0, p0, Ll/qtd;->h:Landroid/widget/LinearLayout;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    return-void
.end method
