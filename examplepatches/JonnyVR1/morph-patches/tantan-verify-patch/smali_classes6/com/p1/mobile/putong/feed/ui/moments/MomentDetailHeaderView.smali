.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/pk00;


# instance fields
.field public A:Lv/VDraweeView;

.field public B:Lv/VImage;

.field public C:Landroid/widget/FrameLayout;

.field public D:Lv/VText;

.field public E:Landroid/view/View;

.field public F:Landroid/widget/FrameLayout;

.field public G:Lv/VText;

.field public H:Lv/VProgressBar;

.field public I:Lcom/p1/mobile/putong/feed/data/Moment;

.field public J:Ljava/lang/String;

.field public K:Ljava/lang/String;

.field public L:Z

.field public M:Z

.field public N:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public O:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/VImage;",
            ">;"
        }
    .end annotation
.end field

.field public P:[Lv/VDraweeView;

.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lv/VImage;

.field public h:Lv/VText_Expandable;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Landroid/widget/FrameLayout;

.field public l:Landroid/widget/ImageView;

.field public m:Landroid/widget/FrameLayout;

.field public n:Landroid/view/View;

.field public o:Landroid/widget/FrameLayout;

.field public p:Landroid/widget/ImageView;

.field public q:Lv/VDraweeView;

.field public r:Lv/VImage;

.field public s:Lv/VDraweeView;

.field public t:Lv/VImage;

.field public u:Lv/VDraweeView;

.field public v:Lv/VImage;

.field public w:Lv/VDraweeView;

.field public x:Lv/VImage;

.field public y:Lv/VDraweeView;

.field public z:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    new-array p1, p1, [Lv/VDraweeView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x4

    .line 11
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x4

    .line 13
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->w(Landroid/widget/TextView;Z)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->v(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->B(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->x(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->C(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->u(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->t(Landroid/view/View;)V

    return-void
.end method

.method private r()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private synthetic t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic u(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;->X1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/wl00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic B(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "from_MomentDetailAct"

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "from_MomentDetailAct"

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 9

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x5

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    move v0, v1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v3, 0x4

    .line 38
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v0, v2

    .line 44
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 47
    .line 48
    .line 49
    const/4 v3, 0x3

    .line 50
    const/4 v4, 0x2

    .line 51
    const/4 v5, 0x1

    .line 52
    if-eq v0, v5, :cond_5

    .line 53
    .line 54
    if-eq v0, v4, :cond_4

    .line 55
    .line 56
    if-eq v0, v3, :cond_3

    .line 57
    .line 58
    if-eq v0, v1, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->s()Landroid/view/LayoutInflater;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    sget v7, Ll/tec0;->K4:I

    .line 65
    .line 66
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 67
    .line 68
    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->s()Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    sget v7, Ll/tec0;->R4:I

    .line 77
    .line 78
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->s()Landroid/view/LayoutInflater;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    sget v7, Ll/tec0;->N4:I

    .line 89
    .line 90
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 91
    .line 92
    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->s()Landroid/view/LayoutInflater;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    sget v7, Ll/tec0;->O4:I

    .line 101
    .line 102
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->s()Landroid/view/LayoutInflater;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    sget v7, Ll/tec0;->M4:I

    .line 113
    .line 114
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 115
    .line 116
    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    :goto_1
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    .line 120
    .line 121
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 122
    .line 123
    sget v8, Ll/hdc0;->o0:I

    .line 124
    .line 125
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v7

    .line 129
    check-cast v7, Lv/VDraweeView;

    .line 130
    .line 131
    aput-object v7, v6, v2

    .line 132
    .line 133
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    .line 134
    .line 135
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 136
    .line 137
    sget v8, Ll/hdc0;->q0:I

    .line 138
    .line 139
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    check-cast v7, Lv/VDraweeView;

    .line 144
    .line 145
    aput-object v7, v6, v5

    .line 146
    .line 147
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    .line 148
    .line 149
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 150
    .line 151
    sget v8, Ll/hdc0;->p0:I

    .line 152
    .line 153
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    check-cast v7, Lv/VDraweeView;

    .line 158
    .line 159
    aput-object v7, v6, v4

    .line 160
    .line 161
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    .line 162
    .line 163
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 164
    .line 165
    sget v7, Ll/hdc0;->n0:I

    .line 166
    .line 167
    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v6

    .line 171
    check-cast v6, Lv/VDraweeView;

    .line 172
    .line 173
    aput-object v6, v4, v3

    .line 174
    .line 175
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 176
    .line 177
    sget v4, Ll/hdc0;->q1:I

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    if-ne v0, v1, :cond_6

    .line 183
    .line 184
    move v0, v5

    .line 185
    :cond_6
    :goto_2
    if-ge v2, v0, :cond_a

    .line 186
    .line 187
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 194
    .line 195
    instance-of v3, v1, Lcom/p1/mobile/putong/data/Video;

    .line 196
    .line 197
    if-eqz v3, :cond_7

    .line 198
    .line 199
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 200
    .line 201
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 202
    .line 203
    goto :goto_3

    .line 204
    :cond_7
    instance-of v3, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 205
    .line 206
    if-eqz v3, :cond_8

    .line 207
    .line 208
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 209
    .line 210
    goto :goto_3

    .line 211
    :cond_8
    const/4 v1, 0x0

    .line 212
    :goto_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    if-eqz v3, :cond_9

    .line 217
    .line 218
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 219
    .line 220
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    .line 221
    .line 222
    aget-object v4, v4, v2

    .line 223
    .line 224
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-virtual {v3, v4, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 229
    .line 230
    .line 231
    goto :goto_4

    .line 232
    :cond_9
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 233
    .line 234
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->P:[Lv/VDraweeView;

    .line 235
    .line 236
    aget-object v3, v3, v2

    .line 237
    .line 238
    invoke-virtual {v1, v3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 239
    .line 240
    .line 241
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_a
    return-void
.end method

.method public a(Lcom/p1/mobile/putong/data/User;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->N:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->O:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lv/VImage;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-static {v0, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const/4 v2, 0x1

    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2, v0, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 51
    .line 52
    .line 53
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 54
    .line 55
    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-interface {v2, v3, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->J:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_1

    .line 71
    .line 72
    new-instance v1, Ll/tl00;

    .line 73
    .line 74
    invoke-direct {v1, p0, p1}, Ll/tl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/data/User;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/ul00;

    .line 81
    .line 82
    invoke-direct {v0, p0, p1}, Ll/ul00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/data/User;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->J:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->K:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/api/b;->Z2(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->G:Lv/VText;

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->H:Lv/VProgressBar;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->F:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->I:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->D:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->n:Landroid/view/View;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    move v4, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v4, v2

    .line 25
    :goto_0
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->o:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    move v4, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v4, v2

    .line 35
    :goto_1
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->C:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    sget v4, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->T0:I

    .line 41
    .line 42
    if-le v0, v4, :cond_2

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move v3, v2

    .line 46
    :goto_2
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->N:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/16 v1, 0x8

    .line 56
    .line 57
    if-ge v4, v0, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->N:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->O:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lv/VImage;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v4, v4, 0x1

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->h:Lv/VText_Expandable;

    .line 85
    .line 86
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 87
    .line 88
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->L:Z

    .line 89
    .line 90
    invoke-virtual {v0, v3, v4}, Lv/VText_Expandable;->o(Ljava/lang/CharSequence;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->j:Lv/VText;

    .line 94
    .line 95
    iget-wide v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 96
    .line 97
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->l:Landroid/widget/ImageView;

    .line 105
    .line 106
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 107
    .line 108
    if-eqz v3, :cond_4

    .line 109
    .line 110
    sget v3, Ll/lbc0;->d2:I

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_4
    sget v3, Ll/lbc0;->o6:I

    .line 114
    .line 115
    :goto_4
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->k:Landroid/widget/FrameLayout;

    .line 119
    .line 120
    new-instance v3, Ll/rl00;

    .line 121
    .line 122
    invoke-direct {v3, p0, p1}, Ll/rl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 129
    .line 130
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_5

    .line 135
    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 137
    .line 138
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_5

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->D(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 148
    .line 149
    new-instance v0, Ll/sl00;

    .line 150
    .line 151
    invoke-direct {v0, p0}, Ll/sl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 158
    .line 159
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->m:Landroid/widget/FrameLayout;

    .line 164
    .line 165
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->b:Landroid/widget/LinearLayout;

    .line 169
    .line 170
    const/high16 p1, 0x42500000    # 52.0f

    .line 171
    .line 172
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    invoke-static {p0, p1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public d(Ll/vg60;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->H:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->E:Landroid/view/View;

    .line 8
    .line 9
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v3

    .line 22
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/vg60;->c()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->J:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->F:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->G:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->F:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    invoke-virtual {p0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->F:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    const/16 p1, 0x8

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->J:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->K:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->L:Z

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->M:Z

    .line 8
    .line 9
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->q(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->q:Lv/VDraweeView;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->s:Lv/VDraweeView;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->u:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->w:Lv/VDraweeView;

    .line 19
    .line 20
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->y:Lv/VDraweeView;

    .line 21
    .line 22
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->A:Lv/VDraweeView;

    .line 23
    .line 24
    filled-new-array/range {v0 .. v5}, [Lv/VDraweeView;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-static {p3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->N:Ljava/util/ArrayList;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r:Lv/VImage;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->t:Lv/VImage;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->v:Lv/VImage;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->x:Lv/VImage;

    .line 41
    .line 42
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->z:Lv/VImage;

    .line 43
    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->B:Lv/VImage;

    .line 45
    .line 46
    filled-new-array/range {v0 .. v5}, [Lv/VImage;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-static {p3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->O:Ljava/util/ArrayList;

    .line 55
    .line 56
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->F:Landroid/widget/FrameLayout;

    .line 57
    .line 58
    new-instance p4, Ll/xl00;

    .line 59
    .line 60
    invoke-direct {p4, p0}, Ll/xl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p3

    .line 70
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->C:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    if-nez p3, :cond_0

    .line 73
    .line 74
    new-instance p3, Ll/yl00;

    .line 75
    .line 76
    invoke-direct {p3, p0, p2, p1}, Ll/yl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p4, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    const/4 p1, 0x0

    .line 84
    invoke-virtual {p4, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->h:Lv/VText_Expandable;

    .line 88
    .line 89
    new-instance p2, Ll/zl00;

    .line 90
    .line 91
    invoke-direct {p2, p0}, Ll/zl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->h:Lv/VText_Expandable;

    .line 98
    .line 99
    new-instance p2, Ll/am00;

    .line 100
    .line 101
    invoke-direct {p2, p0}, Ll/am00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, p2}, Lv/VText_Expandable;->setOnExpandStateChangeListener(Lv/VText_Expandable$c;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->c:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->M:Z

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->c:Lv/VDraweeView;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->e:Lv/VText;

    .line 25
    .line 26
    const/4 v4, 0x2

    .line 27
    new-array v4, v4, [Landroid/view/View;

    .line 28
    .line 29
    aput-object v0, v4, v2

    .line 30
    .line 31
    aput-object v3, v4, v1

    .line 32
    .line 33
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v3, Ll/vl00;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Ll/vl00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->e:Lv/VText;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {v0, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getGPMemo(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-nez v3, :cond_1

    .line 67
    .line 68
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->e:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_2

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVip()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->e:Lv/VText;

    .line 92
    .line 93
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    sget v4, Ll/k9c0;->k0:I

    .line 98
    .line 99
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->e:Lv/VText;

    .line 108
    .line 109
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    sget v4, Ll/k9c0;->l0:I

    .line 114
    .line 115
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 120
    .line 121
    .line 122
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->g:Lv/VImage;

    .line 127
    .line 128
    invoke-static {v0, p1, v3, v1, v2}, Ll/orb0;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->i:Lv/VText;

    .line 132
    .line 133
    const/16 v3, 0x8

    .line 134
    .line 135
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 136
    .line 137
    .line 138
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 139
    .line 140
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 141
    .line 142
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->d:Lv/VImage;

    .line 147
    .line 148
    invoke-interface {v0, v3, p1, v4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 154
    .line 155
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 156
    .line 157
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 158
    .line 159
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->f:Lv/VDraweeView;

    .line 164
    .line 165
    if-nez v0, :cond_3

    .line 166
    .line 167
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->f:Lv/VDraweeView;

    .line 173
    .line 174
    new-instance v1, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .line 178
    .line 179
    sget-object v3, Ll/uqb0;->X:Ll/hj5;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 182
    .line 183
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 184
    .line 185
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 186
    .line 187
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    check-cast p1, Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {v3, p1}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    const-string p1, ".png"

    .line 203
    .line 204
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_3
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bm00;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic v(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->I:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Ll/w1e;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final synthetic w(Landroid/widget/TextView;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->L:Z

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->l:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->K:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->Y1(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->r()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->J:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "from_MomentDetailAct"

    .line 12
    .line 13
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
