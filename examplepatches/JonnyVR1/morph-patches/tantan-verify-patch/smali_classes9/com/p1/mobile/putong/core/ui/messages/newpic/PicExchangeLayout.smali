.class public Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final v:I


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/ImageView;

.field public k:Landroid/widget/ImageView;

.field public l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

.field public m:Landroid/widget/ImageView;

.field public n:Ll/jl70;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Z

.field public r:I

.field public s:Landroid/animation/AnimatorSet;

.field public t:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field public u:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 6
    .line 7
    sget v1, Ll/qa00;->q:I

    .line 8
    .line 9
    sub-int/2addr v0, v1

    .line 10
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->v:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "key_bubble_random_guide"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->o:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "key_bubble_limit_guide"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->p:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q:Z

    .line 14
    .line 15
    const/4 p1, -0x1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r:I

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const-string p1, "key_bubble_random_guide"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->o:Ljava/lang/String;

    .line 21
    const-string p1, "key_bubble_limit_guide"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->p:Ljava/lang/String;

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q:Z

    const/4 p1, -0x1

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    const-string p1, "key_bubble_random_guide"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->o:Ljava/lang/String;

    .line 26
    const-string p1, "key_bubble_limit_guide"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->p:Ljava/lang/String;

    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q:Z

    const/4 p1, -0x1

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r:I

    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/jl70;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->C0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "e_photo_album"

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic c(Ll/jl70;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->E0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "e_camera_switch"

    .line 13
    .line 14
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->u(Ll/jl70;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->v(Ll/jl70;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->w(Ll/jl70;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;ILjava/util/List;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t(ILjava/util/List;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->x(Ll/jl70;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->C()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->z(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->A(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)Ll/jl70;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    return-object p0
.end method


# virtual methods
.method public final synthetic A(Ljava/util/List;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->h:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {p1, v0}, Ll/g96;->b(Ljava/util/List;I)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final B()V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->U3:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-object v0, v1

    .line 24
    :goto_0
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto/16 :goto_3

    .line 27
    .line 28
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 29
    .line 30
    iget-object v2, v2, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 31
    .line 32
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 33
    .line 34
    const/4 v3, 0x5

    .line 35
    const/4 v4, 0x1

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->c:Lv/VLinear;

    .line 39
    .line 40
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    invoke-static {}, Ll/pzi0;->o()J

    .line 47
    .line 48
    .line 49
    move-result-wide v5

    .line 50
    iget-wide v7, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunTime:J

    .line 51
    .line 52
    invoke-static {v5, v6, v7, v8}, Ll/pzi0;->C(JJ)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-nez v2, :cond_1

    .line 57
    .line 58
    iget v2, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunNum:I

    .line 59
    .line 60
    if-ge v2, v3, :cond_1

    .line 61
    .line 62
    add-int/2addr v2, v4

    .line 63
    iput v2, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunNum:I

    .line 64
    .line 65
    invoke-static {}, Ll/pzi0;->o()J

    .line 66
    .line 67
    .line 68
    move-result-wide v1

    .line 69
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->switchFunTime:J

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->p:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->e:Landroid/widget/TextView;

    .line 74
    .line 75
    const-string v3, "\u5207\u6362\u73a9\u6cd5"

    .line 76
    .line 77
    :goto_1
    move-object v9, v2

    .line 78
    move-object v2, v1

    .line 79
    move-object v1, v9

    .line 80
    goto :goto_2

    .line 81
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 82
    .line 83
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    invoke-static {}, Ll/pzi0;->o()J

    .line 90
    .line 91
    .line 92
    move-result-wide v5

    .line 93
    iget-wide v7, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomTime:J

    .line 94
    .line 95
    invoke-static {v5, v6, v7, v8}, Ll/pzi0;->C(JJ)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-nez v2, :cond_2

    .line 100
    .line 101
    iget v2, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomNum:I

    .line 102
    .line 103
    if-ge v2, v3, :cond_2

    .line 104
    .line 105
    add-int/2addr v2, v4

    .line 106
    iput v2, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomNum:I

    .line 107
    .line 108
    invoke-static {}, Ll/pzi0;->o()J

    .line 109
    .line 110
    .line 111
    move-result-wide v1

    .line 112
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->randomTime:J

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->o:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 117
    .line 118
    const-string v3, "\u968f\u673a\u4e00\u5f20"

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    const-string v2, ""

    .line 122
    .line 123
    move-object v3, v2

    .line 124
    :goto_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-nez v5, :cond_3

    .line 129
    .line 130
    new-instance v5, Lcom/p1/mobile/android/ui/bubble/a;

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    invoke-direct {v5, v6}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v5, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    const/high16 v6, 0x40e00000    # 7.0f

    .line 144
    .line 145
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    invoke-virtual {v3, v6}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    const/16 v6, 0x5a

    .line 154
    .line 155
    invoke-virtual {v3, v6}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    const/high16 v6, -0x3f000000    # -8.0f

    .line 160
    .line 161
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    invoke-virtual {v3, v6}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    const-wide/16 v6, 0x1388

    .line 170
    .line 171
    invoke-virtual {v3, v6, v7}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    new-instance v4, Ll/tk70;

    .line 180
    .line 181
    invoke-direct {v4, p0}, Ll/tk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->d(Lcom/p1/mobile/android/ui/bubble/a$b;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 189
    .line 190
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 191
    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p0, v5, v1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 201
    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 203
    .line 204
    iget-object p0, p0, Ll/dkb;->U3:Ll/wyd0;

    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PicExchangeEditPopWindowConfig;->toJson()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    :cond_3
    :goto_3
    return-void
.end method

.method public final C()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->u:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q:Z

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->h:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final D()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-long v1, v1

    .line 26
    const-wide/16 v3, 0x96

    .line 27
    .line 28
    mul-long/2addr v1, v3

    .line 29
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    const/4 v5, 0x3

    .line 39
    new-array v6, v5, [F

    .line 40
    .line 41
    fill-array-data v6, :array_0

    .line 42
    .line 43
    .line 44
    const-string v7, "scaleX"

    .line 45
    .line 46
    invoke-static {v4, v7, v6}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    new-array v5, v5, [F

    .line 53
    .line 54
    fill-array-data v5, :array_1

    .line 55
    .line 56
    .line 57
    const-string v7, "scaleY"

    .line 58
    .line 59
    invoke-static {v6, v7, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    filled-new-array {v4, v5}, [Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 68
    .line 69
    .line 70
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s:Landroid/animation/AnimatorSet;

    .line 71
    .line 72
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 73
    .line 74
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3, v4}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s:Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    invoke-virtual {v3, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s:Landroid/animation/AnimatorSet;

    .line 86
    .line 87
    new-instance v2, Ll/uk70;

    .line 88
    .line 89
    invoke-direct {v2, p0, v0}, Ll/uk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ljava/util/List;)V

    .line 90
    .line 91
    .line 92
    new-instance v0, Ll/vk70;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/vk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)V

    .line 95
    .line 96
    .line 97
    new-instance v3, Ll/vk70;

    .line 98
    .line 99
    invoke-direct {v3, p0}, Ll/vk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v2, v0, v3}, Ll/gt0;->h(Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s:Landroid/animation/AnimatorSet;

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 112
    .line 113
    .line 114
    :cond_1
    :goto_0
    return-void

    .line 115
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f733333    # 0.95f
        0x3f800000    # 1.0f
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f733333    # 0.95f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final E(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->f:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->F0(Ll/wo50;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final F()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->p0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->c:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->f:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->f:Landroid/widget/TextView;

    .line 24
    .line 25
    const-string v3, "\u62cd\u4e00\u5f20\u56de\u590d\uff0c\u4e0e\u5bf9\u65b9\u4ea4\u6362"

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->k:Landroid/widget/ImageView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 33
    .line 34
    iget-object p0, p0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 37
    .line 38
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 39
    .line 40
    if-ne p0, v3, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move v1, v2

    .line 44
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 49
    .line 50
    iget-object v0, v0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 53
    .line 54
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 55
    .line 56
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->c:Lv/VLinear;

    .line 57
    .line 58
    if-ne v0, v3, :cond_6

    .line 59
    .line 60
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->f:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->d:Landroid/widget/TextView;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 71
    .line 72
    iget-object v1, v1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 73
    .line 74
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 75
    .line 76
    const-string v3, "#80FFFFFF"

    .line 77
    .line 78
    const-string v4, "#ffffffff"

    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    goto :goto_1

    .line 87
    :cond_2
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->e:Landroid/widget/TextView;

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 97
    .line 98
    iget-object v1, v1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 99
    .line 100
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 101
    .line 102
    if-nez v1, :cond_3

    .line 103
    .line 104
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    goto :goto_2

    .line 109
    :cond_3
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sget v1, Ll/ibc0;->F5:I

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/high16 v1, 0x41400000    # 12.0f

    .line 127
    .line 128
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    const/high16 v3, 0x40400000    # 3.0f

    .line 133
    .line 134
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    invoke-virtual {v0, v2, v2, v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->d:Landroid/widget/TextView;

    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 144
    .line 145
    iget-object v2, v2, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 146
    .line 147
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 148
    .line 149
    const/4 v3, 0x0

    .line 150
    if-eqz v2, :cond_4

    .line 151
    .line 152
    move-object v2, v0

    .line 153
    goto :goto_3

    .line 154
    :cond_4
    move-object v2, v3

    .line 155
    :goto_3
    invoke-virtual {v1, v3, v3, v3, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->e:Landroid/widget/TextView;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 161
    .line 162
    iget-object p0, p0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 163
    .line 164
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 165
    .line 166
    if-eqz p0, :cond_5

    .line 167
    .line 168
    move-object v0, v3

    .line 169
    :cond_5
    invoke-virtual {v1, v3, v3, v3, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_6
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->f:Landroid/widget/TextView;

    .line 177
    .line 178
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->f:Landroid/widget/TextView;

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 184
    .line 185
    iget-object v1, v1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 186
    .line 187
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 188
    .line 189
    if-eqz v1, :cond_7

    .line 190
    .line 191
    const-string v1, "\u7acb\u5373\u53d1\u9001\uff0c\u5bf9\u65b9\u56de\u62cd\u540e\u624d\u53ef\u67e5\u770b"

    .line 192
    .line 193
    goto :goto_4

    .line 194
    :cond_7
    const-string v1, "\u7acb\u5373\u53d1\u9001\uff0c\u5bf9\u65b9\u4ec5\u53ef\u9650\u65f6\u67e5\u770b"

    .line 195
    .line 196
    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->a:Landroid/widget/ImageView;

    .line 200
    .line 201
    sget v1, Ll/ibc0;->C5:I

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 204
    .line 205
    .line 206
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->k:Landroid/widget/ImageView;

    .line 207
    .line 208
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public G()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout$b;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    aget v0, v0, v1

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eq v0, v2, :cond_3

    .line 18
    .line 19
    const/4 v3, 0x2

    .line 20
    if-eq v0, v3, :cond_2

    .line 21
    .line 22
    const/4 v3, 0x3

    .line 23
    if-eq v0, v3, :cond_1

    .line 24
    .line 25
    const/4 v3, 0x4

    .line 26
    if-eq v0, v3, :cond_0

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 46
    .line 47
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 51
    .line 52
    sget v1, Ll/ibc0;->J5:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 64
    .line 65
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 69
    .line 70
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 74
    .line 75
    sget v1, Ll/ibc0;->G5:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 81
    .line 82
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 86
    .line 87
    sget v1, Ll/ibc0;->H5:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 94
    .line 95
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 99
    .line 100
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 104
    .line 105
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 109
    .line 110
    sget v1, Ll/ibc0;->D5:I

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 116
    .line 117
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 121
    .line 122
    sget v1, Ll/ibc0;->H5:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 129
    .line 130
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 134
    .line 135
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->a:Landroid/widget/ImageView;

    .line 139
    .line 140
    sget v1, Ll/ibc0;->E5:I

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 146
    .line 147
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 151
    .line 152
    sget v1, Ll/ibc0;->G5:I

    .line 153
    .line 154
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 158
    .line 159
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 163
    .line 164
    sget v1, Ll/ibc0;->J5:I

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->k:Landroid/widget/ImageView;

    .line 170
    .line 171
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 172
    .line 173
    .line 174
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->F()V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bl70;->a(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->o(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s:Landroid/animation/AnimatorSet;

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 19
    .line 20
    iget-object v0, v0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, v2, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 40
    .line 41
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "e_newphoto_close"

    .line 48
    .line 49
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v0, v2, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 61
    .line 62
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string v0, "e_newphoto_back"

    .line 69
    .line 70
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->p:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final r(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->u:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r:I

    .line 12
    .line 13
    const-wide/16 v1, 0x96

    .line 14
    .line 15
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    const-wide/16 v4, 0xa

    .line 18
    .line 19
    invoke-static {v4, v5, v1, v2, v3}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/lk70;

    .line 36
    .line 37
    invoke-direct {v2, p0, v0, p1}, Ll/lk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;ILjava/util/List;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ll/mk70;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/mk70;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v1, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->u:Ll/kcg0;

    .line 54
    .line 55
    return-void
.end method

.method public s(Ll/jl70;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->v:I

    .line 12
    .line 13
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 14
    .line 15
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->d:Landroid/widget/TextView;

    .line 23
    .line 24
    new-instance v2, Ll/kk70;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1}, Ll/kk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->e:Landroid/widget/TextView;

    .line 33
    .line 34
    new-instance v2, Ll/nk70;

    .line 35
    .line 36
    invoke-direct {v2, p0, p1}, Ll/nk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->j:Landroid/widget/ImageView;

    .line 43
    .line 44
    new-instance v2, Ll/ok70;

    .line 45
    .line 46
    invoke-direct {v2, p0, p1}, Ll/ok70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->i:Landroid/widget/ImageView;

    .line 53
    .line 54
    new-instance v2, Ll/pk70;

    .line 55
    .line 56
    invoke-direct {v2, p0, p1}, Ll/pk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v2, "ext_uid"

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->k:Landroid/widget/ImageView;

    .line 75
    .line 76
    new-instance v3, Ll/qk70;

    .line 77
    .line 78
    invoke-direct {v3, p1, v0}, Ll/qk70;-><init>(Ll/jl70;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->a:Landroid/widget/ImageView;

    .line 85
    .line 86
    new-instance v2, Ll/rk70;

    .line 87
    .line 88
    invoke-direct {v2, p0}, Ll/rk70;-><init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->b:Ll/bbh0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/bbh0;->j()Landroid/view/SurfaceView;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 105
    .line 106
    .line 107
    new-instance v0, Landroid/widget/ImageView;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-direct {v0, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 117
    .line 118
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 119
    .line 120
    sget v2, Ll/qa00;->s:I

    .line 121
    .line 122
    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 123
    .line 124
    .line 125
    const v2, 0x800005

    .line 126
    .line 127
    .line 128
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 129
    .line 130
    sget v2, Ll/qa00;->m:I

    .line 131
    .line 132
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 133
    .line 134
    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 135
    .line 136
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 137
    .line 138
    sget v3, Ll/ibc0;->I5:I

    .line 139
    .line 140
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 141
    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g:Landroid/widget/FrameLayout;

    .line 144
    .line 145
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 146
    .line 147
    invoke-virtual {v2, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->m:Landroid/widget/ImageView;

    .line 151
    .line 152
    new-instance v2, Ll/sk70;

    .line 153
    .line 154
    invoke-direct {v2, p1}, Ll/sk70;-><init>(Ll/jl70;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 158
    .line 159
    .line 160
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;-><init>(Landroid/content/Context;)V

    .line 167
    .line 168
    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 170
    .line 171
    const/high16 v0, 0x41c00000    # 24.0f

    .line 172
    .line 173
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    int-to-float v0, v0

    .line 178
    invoke-virtual {p1, v0}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->g:Landroid/widget/FrameLayout;

    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 184
    .line 185
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 189
    .line 190
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->getCancelView()Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-eqz p1, :cond_0

    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 201
    .line 202
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->getCancelView()Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    const/4 v0, 0x0

    .line 207
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->B()V

    .line 214
    .line 215
    .line 216
    const/high16 p1, 0x43960000    # 300.0f

    .line 217
    .line 218
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    add-int/2addr p1, v1

    .line 223
    invoke-static {}, Ll/bnl0;->F0()I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    add-int/2addr p1, v0

    .line 228
    invoke-static {}, Ll/bnl0;->w0()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-ge v0, p1, :cond_1

    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->b:Landroid/widget/FrameLayout;

    .line 235
    .line 236
    const/high16 v0, 0x41200000    # 10.0f

    .line 237
    .line 238
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 243
    .line 244
    .line 245
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->b:Landroid/widget/FrameLayout;

    .line 246
    .line 247
    const/high16 v0, 0x42000000    # 32.0f

    .line 248
    .line 249
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    invoke-static {p1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 254
    .line 255
    .line 256
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->h:Landroid/widget/FrameLayout;

    .line 257
    .line 258
    const/high16 p1, 0x42280000    # 42.0f

    .line 259
    .line 260
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 265
    .line 266
    .line 267
    :cond_1
    return-void
.end method

.method public final synthetic t(ILjava/util/List;Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r:I

    .line 2
    .line 3
    if-ltz p3, :cond_2

    .line 4
    .line 5
    if-ge p3, p1, :cond_2

    .line 6
    .line 7
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 21
    .line 22
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    check-cast p2, Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->n:Ll/jl70;

    .line 32
    .line 33
    iget-object p3, p3, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 34
    .line 35
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p3, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->f:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->o(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r:I

    .line 47
    .line 48
    add-int/lit8 p1, p1, 0x1

    .line 49
    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->r:I

    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->C()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic u(Ll/jl70;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->E(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "e_switchphoto_tab"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic v(Ll/jl70;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 10
    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->E(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "e_timephoto_tab"

    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic w(Ll/jl70;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_4

    .line 12
    .line 13
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview_del:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_0
    iget-object p0, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->A0()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 38
    .line 39
    iget-boolean v0, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->g:Z

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->p0()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    const-string p2, "reply"

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const-string p2, "switch"

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const-string p2, "time"

    .line 56
    .line 57
    :goto_0
    const-string v0, "new_photo_type"

    .line 58
    .line 59
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    iget-object p1, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->random_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    const-string p1, "random"

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    const-string p1, "camera"

    .line 79
    .line 80
    :goto_1
    const-string v0, "new_photo_channel"

    .line 81
    .line 82
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-string p2, "e_newphoto_send"

    .line 91
    .line 92
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_4
    :goto_2
    const/4 p2, 0x0

    .line 97
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->E(Z)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string p1, "e_camera_on"

    .line 107
    .line 108
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic x(Ll/jl70;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 5
    .line 6
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 9
    .line 10
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-nez p2, :cond_2

    .line 15
    .line 16
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->random_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview_del:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 44
    .line 45
    iput-object v0, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->l:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->p()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->G()V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "e_newphoto_delete"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void

    .line 67
    :cond_2
    :goto_0
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 68
    .line 69
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_3

    .line 76
    .line 77
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 80
    .line 81
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-eqz p2, :cond_3

    .line 86
    .line 87
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 88
    .line 89
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 90
    .line 91
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_3

    .line 96
    .line 97
    const-string p0, "\u6682\u65e0\u7167\u7247"

    .line 98
    .line 99
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    iget-object p2, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 104
    .line 105
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->j:Ljava/util/List;

    .line 106
    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 110
    .line 111
    if-nez v0, :cond_4

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->random_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 115
    .line 116
    iput-object v0, p2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 119
    .line 120
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-eqz p2, :cond_5

    .line 125
    .line 126
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 127
    .line 128
    invoke-interface {p2}, Ljava/util/Map;->clear()V

    .line 129
    .line 130
    .line 131
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 132
    .line 133
    iget-object v0, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 134
    .line 135
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 136
    .line 137
    invoke-interface {p2, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_5
    new-instance p2, Ljava/util/HashMap;

    .line 142
    .line 143
    iget-object v0, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 144
    .line 145
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->h:Ljava/util/Map;

    .line 146
    .line 147
    invoke-direct {p2, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 148
    .line 149
    .line 150
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->t:Ljava/util/Map;

    .line 151
    .line 152
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->D()V

    .line 153
    .line 154
    .line 155
    iget-object p0, p1, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->m0()V

    .line 158
    .line 159
    .line 160
    iget-object p0, p1, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;->pageId()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    const-string p1, "e_picture_random"

    .line 167
    .line 168
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_6
    :goto_2
    const-string p0, "\u76f8\u518c\u51c6\u5907\u4e2d..."

    .line 173
    .line 174
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
