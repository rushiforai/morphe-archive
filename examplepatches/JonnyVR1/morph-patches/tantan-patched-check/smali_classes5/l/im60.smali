.class public Ll/im60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/i2m;
.implements Ll/y3m;


# instance fields
.field public A:Z

.field public B:Ljava/lang/Object;

.field public C:D

.field public D:D

.field public E:Lcom/p1/mobile/putong/core/data/Privilege;

.field public F:Ljava/lang/String;

.field public G:Z

.field public H:Ll/kcg0;

.field public I:Lcom/p1/mobile/putong/core/ui/purchase/b;

.field public J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

.field public K:Ll/z3m;

.field public L:Ljava/lang/CharSequence;

.field public M:Z

.field public N:Z

.field public O:Ljava/lang/String;

.field public P:Z

.field public Q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end field

.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VFrame;

.field public k:Landroid/widget/TextView;

.field public l:Lv/VText;

.field public m:Landroid/widget/TextView;

.field public n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

.field public o:Landroid/widget/Space;

.field public p:Landroid/view/View;

.field public q:Lcom/p1/mobile/android/app/Act;

.field public r:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public s:Z

.field public t:Ljava/lang/String;

.field public u:Z

.field public v:Ll/a30;
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

.field public w:Ll/a30;
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

.field public x:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public y:Lcom/p1/mobile/putong/data/PayMethod;

.field public z:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iput-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/im60;->A:Z

    .line 11
    .line 12
    const-string v1, ""

    .line 13
    .line 14
    iput-object v1, p0, Ll/im60;->L:Ljava/lang/CharSequence;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-boolean v2, p0, Ll/im60;->M:Z

    .line 18
    .line 19
    iput-boolean v2, p0, Ll/im60;->N:Z

    .line 20
    .line 21
    iput-object v1, p0, Ll/im60;->O:Ljava/lang/String;

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/im60;->P:Z

    .line 24
    .line 25
    new-instance v0, Ll/zl60;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/zl60;-><init>(Ll/im60;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/im60;->Q:Ll/y20;

    .line 31
    .line 32
    iput-object p1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    iput-object p2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic j(Ll/im60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/im60;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/im60;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/im60;->Q(Ll/y20;)V

    return-void
.end method

.method public static synthetic l(Ll/im60;Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/im60;->T(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    return-void
.end method

.method public static synthetic m(Ll/im60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/im60;->R()V

    return-void
.end method

.method public static synthetic n(Ll/im60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/im60;->S()V

    return-void
.end method

.method public static synthetic o(Ll/im60;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/im60;->U(Ll/y20;)V

    return-void
.end method

.method public static synthetic p(Ll/im60;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/im60;->P(Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method

.method public static synthetic q(Ll/im60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/im60;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Ll/im60;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/im60;->V(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private u()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    sget v2, Ll/jbc0;->T4:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/im60;->h:Lv/VText;

    .line 23
    .line 24
    const-string v1, "#cc000000"

    .line 25
    .line 26
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/im60;->h:Lv/VText;

    .line 34
    .line 35
    const/4 v1, 0x3

    .line 36
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/im60;->f:Lv/VImage;

    .line 44
    .line 45
    sget v0, Ll/jbc0;->u4:I

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    invoke-static {v0}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    sget v1, Ll/jbc0;->L:I

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 74
    .line 75
    invoke-static {v0}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    sget v1, Ll/jbc0;->xb:I

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 96
    .line 97
    invoke-static {v0}, Ll/wib0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_3

    .line 102
    .line 103
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 104
    .line 105
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    sget v1, Ll/jbc0;->M9:I

    .line 108
    .line 109
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_3
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 118
    .line 119
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_4

    .line 124
    .line 125
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 126
    .line 127
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    sget v1, Ll/jbc0;->L9:I

    .line 130
    .line 131
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_4
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 140
    .line 141
    invoke-static {v0}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_6

    .line 146
    .line 147
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 148
    .line 149
    invoke-static {v0}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_5

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_5
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 157
    .line 158
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    sget v1, Ll/jbc0;->N9:I

    .line 161
    .line 162
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_6
    :goto_0
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 171
    .line 172
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 173
    .line 174
    sget v1, Ll/jbc0;->M9:I

    .line 175
    .line 176
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 181
    .line 182
    .line 183
    return-void
.end method


# virtual methods
.method public A()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public B()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

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
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string p0, ""

    .line 29
    .line 30
    return-object p0
.end method

.method public C(Ll/y20;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wn60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v3, p0, Ll/im60;->t:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Ll/im60;->B:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/pta;->j()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Ll/wn60;->D(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/pta;->x(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0, v0}, Ll/im60;->y(Ll/wn60;)Ll/wn60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Ll/wn60;->g(Ll/y20;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public D()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_purchase_intermediate_page"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "tooltips_trigger_mode"

    .line 16
    .line 17
    const-string v2, "active"

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p0, Ll/im60;->t:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v2}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "purchaseShowFrom"

    .line 30
    .line 31
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const-string v4, "productType"

    .line 46
    .line 47
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {p0}, Ll/im60;->B()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    if-nez v4, :cond_0

    .line 56
    .line 57
    const-string v4, ""

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {p0}, Ll/im60;->B()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    :goto_0
    const-string v5, "skuID"

    .line 65
    .line 66
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    filled-new-array {v1, v2, v3, v4}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/bo60;

    .line 78
    .line 79
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    iget-object v3, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 82
    .line 83
    invoke-direct {v1, v2, v3}, Ll/bo60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ll/bo60;->r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-boolean v2, p0, Ll/im60;->P:Z

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ll/bo60;->l(Z)Ll/bo60;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object p0, p0, Ll/im60;->Q:Ll/y20;

    .line 99
    .line 100
    invoke-virtual {v1, p0}, Ll/bo60;->q(Ll/y20;)Ll/bo60;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    new-instance v1, Ll/hm60;

    .line 105
    .line 106
    invoke-direct {v1, v0}, Ll/hm60;-><init>(Ll/l4g0;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v1}, Ll/bo60;->p(Landroid/content/DialogInterface$OnDismissListener;)Ll/bo60;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Ll/bo60;->s()V

    .line 114
    .line 115
    .line 116
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public E(Ll/y20;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wn60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v3, p0, Ll/im60;->t:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Ll/im60;->B:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/im60;->y(Ll/wn60;)Ll/wn60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Ll/wn60;->h(Ll/y20;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final F()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/ueh0;->m(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public G(Ll/y20;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wn60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v3, p0, Ll/im60;->t:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Ll/im60;->B:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/im60;->y(Ll/wn60;)Ll/wn60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/tab0;->z()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/im60;->K:Ll/z3m;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    iget-object v1, p0, Ll/im60;->K:Ll/z3m;

    .line 57
    .line 58
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-interface {v1, p0}, Ll/z3m;->d(I)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ll/wn60;->y(Lcom/p1/mobile/putong/core/data/Merchandise;)Ll/wn60;

    .line 73
    .line 74
    .line 75
    :cond_0
    invoke-virtual {v0, p1}, Ll/wn60;->j(Ll/y20;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public H(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->P(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->E(Z)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final I()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

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
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public J()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/im60;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public final K()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/im60;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "PURCHASE_DIALOG_TAB"

    .line 8
    .line 9
    iput-object v0, p0, Ll/im60;->O:Ljava/lang/String;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/im60;->M()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const-string v0, "PURCHASE_DIALOG_SINGLE"

    .line 19
    .line 20
    iput-object v0, p0, Ll/im60;->O:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/im60;->O:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Ll/pta;->s(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    invoke-static {v0}, Ll/wib0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/im60;->N()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/im60;->M()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    :cond_2
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_3
    const/4 p0, 0x0

    .line 53
    return p0
.end method

.method public final L()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v2, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->h()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    return v1

    .line 40
    :cond_2
    :goto_0
    return v3

    .line 41
    :cond_3
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->i()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    return v1

    .line 65
    :cond_5
    :goto_1
    return v3
.end method

.method public final M()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

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
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->V()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/im60;->I()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final N()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

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
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->G()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/im60;->I()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->O()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const-string p1, "e_purchase_boost_svip_guide"

    .line 15
    .line 16
    const-string v0, "p_purchase_page"

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    iget-object p0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    invoke-static {p0}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const-string p0, "p_accelerate_pop,svip_guide"

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string p0, "p_purchase_page,e_purchase_boost_svip_guide,click"

    .line 35
    .line 36
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 37
    .line 38
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 1

    .line 1
    const-string v0, "alipay"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/im60;->a0()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string v0, "wechat"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/im60;->f0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const-string v0, "jingdong"

    .line 26
    .line 27
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/im60;->b0()V

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public final synthetic Q(Ll/y20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

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
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->V()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->r0()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Ll/im60;->Y(Lcom/p1/mobile/putong/data/PayMethod;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic R()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

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
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 10
    .line 11
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D(Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 25
    .line 26
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->N(Ljava/lang/Boolean;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-static {}, Ll/pta;->p()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/im60;->K:Ll/z3m;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 59
    .line 60
    invoke-interface {v0, p0}, Ll/z3m;->b(I)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public final synthetic S()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

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
    iget-object v0, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->V()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->r0()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/im60;->K:Ll/z3m;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/z3m;->a(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U(Ll/y20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/im60;->Y(Lcom/p1/mobile/putong/data/PayMethod;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic V(Ll/y20;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/pta;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0}, Ll/im60;->K()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    iget-object p2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-static {p2}, Ll/g6b;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    invoke-static {p2}, Ll/g6b;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    :cond_0
    iget-object p2, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 29
    .line 30
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    iget-object p2, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 37
    .line 38
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    :cond_1
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_2

    .line 67
    .line 68
    iget-object p2, p0, Ll/im60;->K:Ll/z3m;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 79
    .line 80
    invoke-interface {p2, v0}, Ll/z3m;->c(I)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p()I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 101
    .line 102
    invoke-static {p2, v1}, Ll/pta;->l(ILcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/text/SpannableStringBuilder;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 107
    .line 108
    new-instance v4, Ll/cm60;

    .line 109
    .line 110
    invoke-direct {v4, p0, p1}, Ll/cm60;-><init>(Ll/im60;Ll/y20;)V

    .line 111
    .line 112
    .line 113
    new-instance v5, Ll/dm60;

    .line 114
    .line 115
    invoke-direct {v5, p0}, Ll/dm60;-><init>(Ll/im60;)V

    .line 116
    .line 117
    .line 118
    const/4 v3, 0x0

    .line 119
    invoke-static/range {v0 .. v5}, Ll/pta;->D(Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/core/data/PurchaseType;Lorg/json/JSONObject;Ll/x20;Ll/x20;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    iget-object p1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 124
    .line 125
    new-instance p2, Ll/em60;

    .line 126
    .line 127
    invoke-direct {p2, p0}, Ll/em60;-><init>(Ll/im60;)V

    .line 128
    .line 129
    .line 130
    invoke-static {p1, v1, p2}, Ll/pta;->B(Lcom/p1/mobile/android/app/Act;Lorg/json/JSONObject;Ll/x20;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 135
    .line 136
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_5

    .line 141
    .line 142
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_5

    .line 155
    .line 156
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    iget-object v2, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 163
    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    goto :goto_0

    .line 171
    :cond_4
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 180
    .line 181
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 182
    .line 183
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 184
    .line 185
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-nez v2, :cond_5

    .line 190
    .line 191
    iget-wide v5, p0, Ll/im60;->C:D

    .line 192
    .line 193
    cmpg-double v2, v3, v5

    .line 194
    .line 195
    if-gtz v2, :cond_5

    .line 196
    .line 197
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    const-string v2, "svip"

    .line 202
    .line 203
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_5

    .line 208
    .line 209
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->v1:I

    .line 210
    .line 211
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_5
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_9

    .line 224
    .line 225
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 226
    .line 227
    invoke-static {v0}, Ll/g6b;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_9

    .line 232
    .line 233
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 234
    .line 235
    invoke-static {v0}, Ll/g6b;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-eqz v0, :cond_6

    .line 240
    .line 241
    if-nez p2, :cond_9

    .line 242
    .line 243
    :cond_6
    iget-object p2, p0, Ll/im60;->K:Ll/z3m;

    .line 244
    .line 245
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    if-eqz p2, :cond_9

    .line 250
    .line 251
    iget-object p2, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 252
    .line 253
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p2

    .line 257
    if-eqz p2, :cond_9

    .line 258
    .line 259
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 264
    .line 265
    .line 266
    move-result-object p2

    .line 267
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_7

    .line 272
    .line 273
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_8

    .line 278
    .line 279
    :cond_7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-eqz v0, :cond_9

    .line 284
    .line 285
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-eqz v0, :cond_9

    .line 290
    .line 291
    iget-object v0, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 292
    .line 293
    const-string v2, "alipay"

    .line 294
    .line 295
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    if-eqz v0, :cond_9

    .line 300
    .line 301
    :cond_8
    iget-object v0, p0, Ll/im60;->K:Ll/z3m;

    .line 302
    .line 303
    iget v2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 304
    .line 305
    invoke-interface {v0, v2}, Ll/z3m;->c(I)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    if-eqz v2, :cond_9

    .line 314
    .line 315
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p()I

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 324
    .line 325
    iget-object v3, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 326
    .line 327
    invoke-static {v2, v0, v3}, Ll/bn60;->P(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/CharSequence;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    new-instance v3, Ll/fm60;

    .line 332
    .line 333
    invoke-direct {v3, p0, p2}, Ll/fm60;-><init>(Ll/im60;Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 334
    .line 335
    .line 336
    new-instance p2, Ll/gm60;

    .line 337
    .line 338
    invoke-direct {p2, p0, p1}, Ll/gm60;-><init>(Ll/im60;Ll/y20;)V

    .line 339
    .line 340
    .line 341
    invoke-static {v2, v0, v1, v3, p2}, Ll/bn60;->W(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;Lorg/json/JSONObject;Ll/x20;Ll/x20;)V

    .line 342
    .line 343
    .line 344
    return-void

    .line 345
    :cond_9
    iget-object p2, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 346
    .line 347
    invoke-virtual {p0, p2, p1}, Ll/im60;->Y(Lcom/p1/mobile/putong/data/PayMethod;Ll/y20;)V

    .line 348
    .line 349
    .line 350
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/im60;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/im60;->z()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p0}, Ll/im60;->B()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    const-string v6, "jingdong"

    .line 26
    .line 27
    const-string v7, "wechat"

    .line 28
    .line 29
    const-string v8, "alipay"

    .line 30
    .line 31
    const/4 v9, 0x0

    .line 32
    const/4 v10, 0x1

    .line 33
    const/4 v11, -0x1

    .line 34
    sparse-switch v5, :sswitch_data_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :sswitch_0
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-nez v4, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v11, 0x2

    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    move v11, v10

    .line 55
    goto :goto_0

    .line 56
    :sswitch_2
    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-nez v4, :cond_2

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    move v11, v9

    .line 64
    :goto_0
    packed-switch v11, :pswitch_data_0

    .line 65
    .line 66
    .line 67
    const/4 v6, 0x0

    .line 68
    goto :goto_1

    .line 69
    :pswitch_0
    move-object v6, v7

    .line 70
    goto :goto_1

    .line 71
    :pswitch_1
    move-object v6, v8

    .line 72
    :goto_1
    :pswitch_2
    :try_start_0
    const-string v4, "platform"

    .line 73
    .line 74
    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    const-string v4, "skuID"

    .line 78
    .line 79
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    const-string v2, "purchaseShowFrom"

    .line 83
    .line 84
    iget-object v4, p0, Ll/im60;->t:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v4}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    .line 92
    .line 93
    const-string v2, "productType"

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/im60;->A()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    const-string v2, "price"

    .line 103
    .line 104
    invoke-virtual {v3, v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 105
    .line 106
    .line 107
    const-string v0, "if_discount"

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/im60;->L()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 117
    .line 118
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_3

    .line 123
    .line 124
    const-string v0, "duration"

    .line 125
    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ll/im60;->x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v2, "M"

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :catch_0
    move-exception p0

    .line 156
    goto :goto_8

    .line 157
    :cond_3
    :goto_2
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 158
    .line 159
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_4

    .line 164
    .line 165
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-eqz p0, :cond_4

    .line 172
    .line 173
    move p0, v10

    .line 174
    goto :goto_3

    .line 175
    :cond_4
    move p0, v9

    .line 176
    :goto_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_5

    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 195
    .line 196
    .line 197
    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    if-eqz v0, :cond_5

    .line 199
    .line 200
    move v0, v10

    .line 201
    goto :goto_4

    .line 202
    :cond_5
    move v0, v9

    .line 203
    :goto_4
    const-string v1, "yes"

    .line 204
    .line 205
    const-string v2, "no_secret_payment"

    .line 206
    .line 207
    const-string v4, "no"

    .line 208
    .line 209
    if-eqz p0, :cond_8

    .line 210
    .line 211
    :try_start_1
    invoke-static {p1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-eqz p0, :cond_6

    .line 216
    .line 217
    if-eqz v0, :cond_6

    .line 218
    .line 219
    move v9, v10

    .line 220
    :cond_6
    if-eqz v9, :cond_7

    .line 221
    .line 222
    move-object p0, v1

    .line 223
    goto :goto_5

    .line 224
    :cond_7
    move-object p0, v4

    .line 225
    :goto_5
    invoke-virtual {v3, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 226
    .line 227
    .line 228
    goto :goto_6

    .line 229
    :cond_8
    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 230
    .line 231
    .line 232
    :goto_6
    const-string p0, "user_secret_staus"

    .line 233
    .line 234
    if-eqz v0, :cond_9

    .line 235
    .line 236
    goto :goto_7

    .line 237
    :cond_9
    move-object v1, v4

    .line 238
    :goto_7
    invoke-virtual {v3, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 239
    .line 240
    .line 241
    goto :goto_9

    .line 242
    :goto_8
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 243
    .line 244
    .line 245
    :goto_9
    const-string p0, "e_purchase_button"

    .line 246
    .line 247
    const-string p1, "p_purchase_page"

    .line 248
    .line 249
    invoke-static {p0, p1, v3}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :sswitch_data_0
    .sparse-switch
        -0x545695b6 -> :sswitch_2
        -0x2f3174da -> :sswitch_1
        0x773a8ebc -> :sswitch_0
    .end sparse-switch

    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public final Y(Lcom/p1/mobile/putong/data/PayMethod;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/im60;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_3

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string v0, "alipay"

    .line 23
    .line 24
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Ll/im60;->C(Ll/y20;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ll/im60;->X(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string v0, "wechat"

    .line 42
    .line 43
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Ll/im60;->G(Ll/y20;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/im60;->X(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const-string v0, "jingdong"

    .line 61
    .line 62
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0, p2}, Ll/im60;->E(Ll/y20;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Ll/im60;->X(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    return-void
.end method

.method public final Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im60;->i:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/im60;->i:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/im60;->L:Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/im60;->i:Lv/VText;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    iput-object v0, p0, Ll/im60;->L:Ljava/lang/CharSequence;

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 5

    .line 1
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->S2:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/im60;->t(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/im60;->h:Lv/VText;

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Ll/im60;->u()V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 31
    .line 32
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->setPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Ll/im60;->c:Lv/VText;

    .line 38
    .line 39
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Ll/im60;->c:Lv/VText;

    .line 47
    .line 48
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget v3, Ll/h9c0;->a0:I

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    const/high16 p2, 0x40400000    # 3.0f

    .line 64
    .line 65
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iget-object v2, p0, Ll/im60;->o:Landroid/widget/Space;

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    new-array v4, v3, [Landroid/view/View;

    .line 73
    .line 74
    aput-object v2, v4, v1

    .line 75
    .line 76
    invoke-static {p2, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 80
    .line 81
    const/high16 v2, 0x422c0000    # 43.0f

    .line 82
    .line 83
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-static {p2, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 88
    .line 89
    .line 90
    iget-object p2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 91
    .line 92
    invoke-static {p2}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-eqz p2, :cond_0

    .line 97
    .line 98
    iget-object p2, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 99
    .line 100
    const/high16 v2, 0x41f00000    # 30.0f

    .line 101
    .line 102
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    invoke-static {p2, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    iget-object p2, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 110
    .line 111
    const/high16 v2, 0x42100000    # 36.0f

    .line 112
    .line 113
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    invoke-static {p2, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Ll/im60;->h:Lv/VText;

    .line 121
    .line 122
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {p2, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 130
    .line 131
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->a:Lv/VText;

    .line 132
    .line 133
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-virtual {p2, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 138
    .line 139
    .line 140
    :cond_0
    iget-object p2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 141
    .line 142
    invoke-static {p2}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    if-eqz p2, :cond_1

    .line 147
    .line 148
    iget-object p2, p0, Ll/im60;->k:Landroid/widget/TextView;

    .line 149
    .line 150
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Ll/im60;->j:Lv/VFrame;

    .line 154
    .line 155
    const/high16 v2, 0x42600000    # 56.0f

    .line 156
    .line 157
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    invoke-static {p2, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_1
    iget-object p2, p0, Ll/im60;->j:Lv/VFrame;

    .line 166
    .line 167
    const/high16 v2, 0x42980000    # 76.0f

    .line 168
    .line 169
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    invoke-static {p2, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 174
    .line 175
    .line 176
    :goto_0
    iget-object p2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 177
    .line 178
    invoke-static {p2}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-nez p2, :cond_3

    .line 183
    .line 184
    iget-object p2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 185
    .line 186
    invoke-static {p2}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-eqz p2, :cond_2

    .line 191
    .line 192
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 193
    .line 194
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->v9()Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-nez p2, :cond_2

    .line 203
    .line 204
    invoke-static {}, Ll/joa;->M3()Z

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    if-nez p2, :cond_2

    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_2
    iget-object p0, p0, Ll/im60;->j:Lv/VFrame;

    .line 212
    .line 213
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 214
    .line 215
    .line 216
    return-object p1

    .line 217
    :cond_3
    :goto_1
    iget-object p2, p0, Ll/im60;->j:Lv/VFrame;

    .line 218
    .line 219
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 220
    .line 221
    .line 222
    iget-object p2, p0, Ll/im60;->l:Lv/VText;

    .line 223
    .line 224
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p2, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 229
    .line 230
    .line 231
    iget-object p2, p0, Ll/im60;->l:Lv/VText;

    .line 232
    .line 233
    new-instance v0, Ll/yl60;

    .line 234
    .line 235
    invoke-direct {v0, p0}, Ll/yl60;-><init>(Ll/im60;)V

    .line 236
    .line 237
    .line 238
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 239
    .line 240
    .line 241
    const-string p0, "e_purchase_boost_svip_guide"

    .line 242
    .line 243
    const-string p2, "p_purchase_page"

    .line 244
    .line 245
    invoke-static {p0, p2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    return-object p1
.end method

.method public a0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v2, p0, Ll/im60;->c:Lv/VText;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->h:I

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->R9:I

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 32
    .line 33
    .line 34
    :goto_0
    sget v0, Ll/jbc0;->da:I

    .line 35
    .line 36
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    invoke-static {v2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget v0, Ll/jbc0;->t4:I

    .line 45
    .line 46
    iget-object v2, p0, Ll/im60;->c:Lv/VText;

    .line 47
    .line 48
    const-string v3, "#ccE8CA8A"

    .line 49
    .line 50
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v2, p0, Ll/im60;->b:Lv/VImage;

    .line 58
    .line 59
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 60
    .line 61
    .line 62
    const-string v0, "alipay"

    .line 63
    .line 64
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iput-object v2, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 69
    .line 70
    iget-object v2, p0, Ll/im60;->z:Ll/y20;

    .line 71
    .line 72
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_2

    .line 77
    .line 78
    iget-object v2, p0, Ll/im60;->z:Ll/y20;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    const/4 v2, 0x1

    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v1, p0, Ll/im60;->d:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 120
    .line 121
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mi()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_5

    .line 138
    .line 139
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->G8()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    iget-object v4, p0, Ll/im60;->d:Lv/VText;

    .line 156
    .line 157
    if-nez v3, :cond_4

    .line 158
    .line 159
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 163
    .line 164
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_4
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    :cond_5
    :goto_1
    invoke-virtual {p0}, Ll/im60;->r0()V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Ll/im60;->g0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-static {v0}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-static {v0}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Ll/im60;->h:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/z7a;->r0(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const-string v1, "%s%s\u5143\u83b7\u53d6"

    .line 60
    .line 61
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    iget-boolean p1, p0, Ll/im60;->A:Z

    .line 74
    .line 75
    if-eqz p1, :cond_5

    .line 76
    .line 77
    const/4 p1, 0x0

    .line 78
    iput-boolean p1, p0, Ll/im60;->A:Z

    .line 79
    .line 80
    iget-object p1, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 81
    .line 82
    const-string v0, "wechat"

    .line 83
    .line 84
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_4

    .line 89
    .line 90
    iget-object p0, p0, Ll/im60;->z:Ll/y20;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    iget-object p1, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 101
    .line 102
    const-string v0, "alipay"

    .line 103
    .line 104
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_5

    .line 109
    .line 110
    iget-object p0, p0, Ll/im60;->z:Ll/y20;

    .line 111
    .line 112
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    :cond_5
    :goto_0
    return-void
.end method

.method public b0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/im60;->c:Lv/VText;

    .line 8
    .line 9
    const-string v2, "\u4eac\u4e1c\u652f\u4ed8"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/jbc0;->ea:I

    .line 15
    .line 16
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-static {v2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    sget v0, Ll/jbc0;->v4:I

    .line 25
    .line 26
    iget-object v2, p0, Ll/im60;->c:Lv/VText;

    .line 27
    .line 28
    const-string v3, "#ccE8CA8A"

    .line 29
    .line 30
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v2, p0, Ll/im60;->b:Lv/VImage;

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    const-string v0, "jingdong"

    .line 43
    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iput-object v2, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 49
    .line 50
    iget-object v2, p0, Ll/im60;->z:Ll/y20;

    .line 51
    .line 52
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    iget-object v2, p0, Ll/im60;->z:Ll/y20;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/im60;->e:Lv/VText;

    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    invoke-virtual {p0}, Ll/im60;->r0()V

    .line 93
    .line 94
    .line 95
    :goto_0
    const/4 v0, 0x1

    .line 96
    invoke-virtual {p0, v0}, Ll/im60;->H(Z)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public c0(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "#E8CA8A"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "#d9d9d9"

    .line 17
    .line 18
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    :goto_0
    iget-object v1, p0, Ll/im60;->m:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/im60;->m:Landroid/widget/TextView;

    .line 28
    .line 29
    const-string v1, "\u4e0d\uff0c\u8c22\u8c22"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/im60;->m:Landroid/widget/TextView;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/im60;->m:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public d()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/im60;->w:Ll/a30;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/im60;->w:Ll/a30;

    .line 10
    .line 11
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v3, p0, Ll/im60;->t:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 26
    .line 27
    :goto_0
    invoke-interface {v0, v1, v2, p0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final d0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Ll/tab0;->k(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public e()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/im60;->v:Ll/a30;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/im60;->v:Ll/a30;

    .line 10
    .line 11
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iget-object v3, p0, Ll/im60;->t:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 26
    .line 27
    :goto_0
    invoke-interface {v0, v1, v2, p0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public final e0(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/im60;->i:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/im60;->i:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/im60;->i:Lv/VText;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1, p1, p1, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/lq60;

    .line 5
    .line 6
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v2, p0, Ll/im60;->t:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v3, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    iget-object v5, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 13
    .line 14
    move-object v4, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Ll/lq60;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/oq60;

    .line 19
    .line 20
    invoke-direct {p1, v0}, Ll/oq60;-><init>(Ll/lq60;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ll/oq60;->b()Ll/mq60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Ll/im60;->h:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/mq60;->b()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/im60;->i:Lv/VText;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 43
    .line 44
    invoke-static {v0}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 51
    .line 52
    invoke-static {v0}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    :cond_1
    iget-object v0, p0, Ll/im60;->h:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v3}, Ll/z7a;->r0(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    const-string v3, "%s%s\u5143\u83b7\u53d6"

    .line 95
    .line 96
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    :cond_2
    iget-boolean v0, p0, Ll/im60;->G:Z

    .line 104
    .line 105
    if-nez v0, :cond_3

    .line 106
    .line 107
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 114
    .line 115
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, Ll/v5b0;->y(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_3

    .line 134
    .line 135
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const-string v2, "lowPriceCustomerVIP"

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->isBelongPromotion(Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    invoke-virtual {p0, v4}, Ll/im60;->d0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ll/mq60;->c()Ljava/lang/CharSequence;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p0, v0}, Ll/im60;->e0(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    goto/16 :goto_1

    .line 162
    .line 163
    :cond_3
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    const/4 v2, 0x1

    .line 168
    if-eqz v0, :cond_5

    .line 169
    .line 170
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 171
    .line 172
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_5

    .line 177
    .line 178
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-static {v0}, Ll/v5b0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_5

    .line 191
    .line 192
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {v0}, Ll/pta;->v(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_4

    .line 201
    .line 202
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 203
    .line 204
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-static {v3}, Ll/pta;->n(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 216
    .line 217
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 218
    .line 219
    .line 220
    goto :goto_0

    .line 221
    :cond_4
    invoke-virtual {p0, v4}, Ll/im60;->d0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 222
    .line 223
    .line 224
    :goto_0
    invoke-virtual {p1}, Ll/mq60;->c()Ljava/lang/CharSequence;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p0, v0}, Ll/im60;->e0(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    goto/16 :goto_1

    .line 232
    .line 233
    :cond_5
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_6

    .line 238
    .line 239
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 240
    .line 241
    invoke-static {v0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-eqz v0, :cond_6

    .line 246
    .line 247
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-static {v0}, Ll/v5b0;->u(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-eqz v0, :cond_6

    .line 260
    .line 261
    invoke-virtual {p0, v4}, Ll/im60;->d0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p1}, Ll/mq60;->c()Ljava/lang/CharSequence;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-virtual {p0, v0}, Ll/im60;->e0(Ljava/lang/CharSequence;)V

    .line 269
    .line 270
    .line 271
    goto/16 :goto_1

    .line 272
    .line 273
    :cond_6
    iget-boolean v0, p0, Ll/im60;->G:Z

    .line 274
    .line 275
    if-nez v0, :cond_7

    .line 276
    .line 277
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-eqz v0, :cond_7

    .line 282
    .line 283
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 284
    .line 285
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-eqz v0, :cond_7

    .line 290
    .line 291
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    const-string v3, "tttVip"

    .line 300
    .line 301
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 302
    .line 303
    .line 304
    move-result-object v3

    .line 305
    const-string v5, "lowPrice3Month"

    .line 306
    .line 307
    invoke-static {v0, v3, v5}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_7

    .line 312
    .line 313
    invoke-virtual {p0, v4}, Ll/im60;->d0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {p1}, Ll/mq60;->c()Ljava/lang/CharSequence;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-virtual {p0, v0}, Ll/im60;->e0(Ljava/lang/CharSequence;)V

    .line 321
    .line 322
    .line 323
    goto :goto_1

    .line 324
    :cond_7
    invoke-virtual {p1}, Ll/mq60;->c()Ljava/lang/CharSequence;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    if-nez v0, :cond_9

    .line 333
    .line 334
    iget-boolean v0, p0, Ll/im60;->G:Z

    .line 335
    .line 336
    iget-object v3, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 337
    .line 338
    if-eqz v0, :cond_8

    .line 339
    .line 340
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 341
    .line 342
    .line 343
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 344
    .line 345
    invoke-virtual {p1}, Ll/mq60;->c()Ljava/lang/CharSequence;

    .line 346
    .line 347
    .line 348
    move-result-object v2

    .line 349
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c(Ljava/lang/CharSequence;)V

    .line 350
    .line 351
    .line 352
    goto :goto_1

    .line 353
    :cond_8
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {p0}, Ll/im60;->w()V

    .line 357
    .line 358
    .line 359
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 360
    .line 361
    invoke-virtual {p1}, Ll/mq60;->c()Ljava/lang/CharSequence;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c(Ljava/lang/CharSequence;)V

    .line 366
    .line 367
    .line 368
    goto :goto_1

    .line 369
    :cond_9
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 370
    .line 371
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 372
    .line 373
    .line 374
    move-result v0

    .line 375
    if-eqz v0, :cond_b

    .line 376
    .line 377
    iget-object v0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 378
    .line 379
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-nez v0, :cond_b

    .line 384
    .line 385
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 386
    .line 387
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 388
    .line 389
    .line 390
    iget-boolean v0, p0, Ll/im60;->M:Z

    .line 391
    .line 392
    if-nez v0, :cond_a

    .line 393
    .line 394
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 395
    .line 396
    const-string v1, "\u9650\u65f6\u4f18\u60e0"

    .line 397
    .line 398
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c(Ljava/lang/CharSequence;)V

    .line 399
    .line 400
    .line 401
    :cond_a
    move v1, v2

    .line 402
    goto :goto_1

    .line 403
    :cond_b
    iget-boolean v0, p0, Ll/im60;->M:Z

    .line 404
    .line 405
    if-nez v0, :cond_c

    .line 406
    .line 407
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 408
    .line 409
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 410
    .line 411
    .line 412
    :cond_c
    :goto_1
    iget-object v0, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 413
    .line 414
    const-string v2, "alipay"

    .line 415
    .line 416
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 417
    .line 418
    .line 419
    move-result v0

    .line 420
    if-eqz v0, :cond_d

    .line 421
    .line 422
    iget-object v0, p0, Ll/im60;->c:Lv/VText;

    .line 423
    .line 424
    invoke-virtual {p1}, Ll/mq60;->a()Ljava/lang/CharSequence;

    .line 425
    .line 426
    .line 427
    move-result-object p1

    .line 428
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 429
    .line 430
    .line 431
    goto :goto_2

    .line 432
    :cond_d
    iget-object v0, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 433
    .line 434
    const-string v2, "wechat"

    .line 435
    .line 436
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 437
    .line 438
    .line 439
    move-result v0

    .line 440
    if-eqz v0, :cond_e

    .line 441
    .line 442
    iget-object v0, p0, Ll/im60;->c:Lv/VText;

    .line 443
    .line 444
    invoke-virtual {p1}, Ll/mq60;->d()Ljava/lang/CharSequence;

    .line 445
    .line 446
    .line 447
    move-result-object p1

    .line 448
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 449
    .line 450
    .line 451
    :cond_e
    :goto_2
    iput-boolean v1, p0, Ll/im60;->N:Z

    .line 452
    .line 453
    return-void
.end method

.method public f0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/im60;->c:Lv/VText;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->X9:I

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    sget v0, Ll/jbc0;->fa:I

    .line 15
    .line 16
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-static {v2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    sget v0, Ll/jbc0;->w4:I

    .line 25
    .line 26
    iget-object v2, p0, Ll/im60;->c:Lv/VText;

    .line 27
    .line 28
    const-string v3, "#ccE8CA8A"

    .line 29
    .line 30
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v2, p0, Ll/im60;->b:Lv/VImage;

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    const-string v0, "wechat"

    .line 43
    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iput-object v2, p0, Ll/im60;->y:Lcom/p1/mobile/putong/data/PayMethod;

    .line 49
    .line 50
    iget-object v2, p0, Ll/im60;->z:Ll/y20;

    .line 51
    .line 52
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    iget-object v2, p0, Ll/im60;->z:Ll/y20;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/4 v2, 0x1

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mi()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->xb()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    iget-object v4, p0, Ll/im60;->d:Lv/VText;

    .line 119
    .line 120
    if-nez v3, :cond_3

    .line 121
    .line 122
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/im60;->d:Lv/VText;

    .line 126
    .line 127
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_3
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    :cond_4
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_5

    .line 147
    .line 148
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 149
    .line 150
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_7

    .line 155
    .line 156
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_6

    .line 169
    .line 170
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 171
    .line 172
    invoke-static {v0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_7

    .line 177
    .line 178
    :cond_6
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 179
    .line 180
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_8

    .line 185
    .line 186
    :cond_7
    move v1, v2

    .line 187
    :cond_8
    invoke-virtual {p0, v1}, Ll/im60;->H(Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Ll/im60;->r0()V

    .line 191
    .line 192
    .line 193
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/im60;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

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
    iget-object p0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public h0(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->E:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/im60;->h:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-static {v1}, Ll/z090;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/xl60;->l()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/im60;->a0()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/im60;->f0()V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object v0, p0, Ll/im60;->g:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    new-instance v1, Ll/am60;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/am60;-><init>(Ll/im60;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/im60;->a:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    new-instance v0, Ll/bm60;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/bm60;-><init>(Ll/im60;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public i0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/im60;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public j0(Ll/a30;)V
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
    iput-object p1, p0, Ll/im60;->w:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public k0(Ll/a30;)V
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
    iput-object p1, p0, Ll/im60;->v:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public l0(Ll/z3m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->K:Ll/z3m;

    .line 2
    .line 3
    return-void
.end method

.method public m0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->F:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public n0(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/im60;->z:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/core/ui/purchase/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->I:Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 2
    .line 3
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->J:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 2
    .line 3
    return-void
.end method

.method public q0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/im60;->B:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method

.method public final r0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/im60;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/im60;->H:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s0(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/im60;->D:D

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/im60;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jm60;->a(Ll/im60;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t0(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/im60;->C:D

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/im60;->w()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/im60;->h:Lv/VText;

    .line 20
    .line 21
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->y8:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/im60;->c:Lv/VText;

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/im60;->Z()V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final v()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-wide v0, p0, Ll/im60;->D:D

    .line 16
    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmpl-double v0, v0, v2

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/joa;->G3()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 44
    .line 45
    new-instance v2, Ljava/text/DecimalFormat;

    .line 46
    .line 47
    const-string v3, "#.#"

    .line 48
    .line 49
    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-wide v3, p0, Ll/im60;->D:D

    .line 53
    .line 54
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "\u652f\u4ed8\u8fd4\uffe5%s"

    .line 63
    .line 64
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iput-boolean v1, p0, Ll/im60;->M:Z

    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    const/4 v0, 0x0

    .line 75
    iput-boolean v0, p0, Ll/im60;->M:Z

    .line 76
    .line 77
    iget-boolean v1, p0, Ll/im60;->N:Z

    .line 78
    .line 79
    iget-object p0, p0, Ll/im60;->n:Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;

    .line 80
    .line 81
    if-eqz v1, :cond_1

    .line 82
    .line 83
    const-string v0, "\u9650\u65f6\u4f18\u60e0"

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/PromotionPendantView;->c(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final w()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/im60;->C:D

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmpl-double v0, v0, v2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-wide v0, p0, Ll/im60;->C:D

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    double-to-long v0, v0

    .line 24
    const-wide/16 v2, 0x0

    .line 25
    .line 26
    cmp-long v0, v0, v2

    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    iget-wide v0, p0, Ll/im60;->C:D

    .line 31
    .line 32
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    double-to-long v0, v0

    .line 37
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->t1:I

    .line 40
    .line 41
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/im60;->L:Ljava/lang/CharSequence;

    .line 54
    .line 55
    iget-object v1, p0, Ll/im60;->i:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/im60;->i:Lv/VText;

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {p0}, Ll/im60;->Z()V

    .line 68
    .line 69
    .line 70
    const-string v0, ""

    .line 71
    .line 72
    iput-object v0, p0, Ll/im60;->L:Ljava/lang/CharSequence;

    .line 73
    .line 74
    :goto_0
    invoke-virtual {p0}, Ll/im60;->u0()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public x()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public y(Ll/wn60;)Ll/wn60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ll/wn60;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/wn60;->s(Lcom/p1/mobile/putong/core/ui/purchase/d;)Ll/wn60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/im60;->E:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/wn60;->v(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/wn60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Ll/im60;->F:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/wn60;->z(Ljava/lang/String;)Ll/wn60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, p0}, Ll/wn60;->B(Ll/y3m;)Ll/wn60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public z()D
    .locals 2

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 13
    .line 14
    if-eqz v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->h()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 42
    .line 43
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 44
    .line 45
    return-wide v0

    .line 46
    :cond_2
    :goto_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    return-wide v0

    .line 51
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_5

    .line 64
    .line 65
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->i()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_4
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 77
    .line 78
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 79
    .line 80
    return-wide v0

    .line 81
    :cond_5
    :goto_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getFirstCouponPrice()D

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    return-wide v0
.end method
