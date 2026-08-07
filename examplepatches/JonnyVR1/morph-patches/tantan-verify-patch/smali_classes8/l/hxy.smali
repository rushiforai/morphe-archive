.class public Ll/hxy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hxy$c;
    }
.end annotation


# static fields
.field public static final i:I

.field public static final j:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public b:Landroid/widget/LinearLayout;

.field public c:Ll/wwy;

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:I

.field public f:I

.field public g:I

.field public h:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42880000    # 68.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    div-int/lit8 v0, v0, 0x4

    .line 13
    .line 14
    sput v0, Ll/hxy;->i:I

    .line 15
    .line 16
    invoke-static {}, Ll/bnl0;->y0()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/high16 v1, 0x42b60000    # 91.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sub-int/2addr v0, v1

    .line 27
    div-int/lit8 v0, v0, 0x4

    .line 28
    .line 29
    sput v0, Ll/hxy;->j:I

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/hxy;->e:I

    .line 6
    .line 7
    iput v0, p0, Ll/hxy;->f:I

    .line 8
    .line 9
    iput v0, p0, Ll/hxy;->g:I

    .line 10
    .line 11
    iput-object p1, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    iput-object p1, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/hxy;Ljava/util/List;ILandroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hxy;->u(Ljava/util/List;ILandroid/util/Pair;)V

    return-void
.end method

.method public static synthetic b(Ll/hxy;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hxy;->w(Landroid/util/Pair;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/hxy;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hxy;->t(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/Sticker;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "prologue"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;Ljava/util/List;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Ll/hxy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hxy;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/hxy;ILandroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hxy;->x(ILandroid/util/Pair;)V

    return-void
.end method

.method public static l(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    const-string p0, "association"

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    if-eq p0, v0, :cond_6

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    if-eq p0, v0, :cond_6

    .line 12
    .line 13
    const/4 v0, 0x7

    .line 14
    if-ne p0, v0, :cond_1

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_1
    const/4 v0, 0x4

    .line 18
    if-eq p0, v0, :cond_5

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    if-ne p0, v0, :cond_2

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_2
    const/4 v0, 0x5

    .line 26
    if-eq p0, v0, :cond_4

    .line 27
    .line 28
    const/16 v0, 0x9

    .line 29
    .line 30
    if-ne p0, v0, :cond_3

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    const-string p0, ""

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    :goto_0
    const-string p0, "contact_again"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_5
    :goto_1
    const-string p0, "reply_breakice"

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_6
    :goto_2
    const-string p0, "breakice"

    .line 43
    .line 44
    return-object p0
.end method

.method public static r(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    if-eq p0, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x5

    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x7

    .line 14
    if-eq p0, v0, :cond_1

    .line 15
    .line 16
    const/16 v0, 0x8

    .line 17
    .line 18
    if-eq p0, v0, :cond_1

    .line 19
    .line 20
    const/16 v0, 0xa

    .line 21
    .line 22
    if-eq p0, v0, :cond_1

    .line 23
    .line 24
    const/16 v0, 0xb

    .line 25
    .line 26
    if-eq p0, v0, :cond_1

    .line 27
    .line 28
    const/16 v0, 0xc

    .line 29
    .line 30
    if-eq p0, v0, :cond_1

    .line 31
    .line 32
    const/16 v0, 0xe

    .line 33
    .line 34
    if-eq p0, v0, :cond_1

    .line 35
    .line 36
    const/16 v0, 0xd

    .line 37
    .line 38
    if-eq p0, v0, :cond_1

    .line 39
    .line 40
    const/16 v0, 0x9

    .line 41
    .line 42
    if-ne p0, v0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0

    .line 47
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 48
    return p0
.end method


# virtual methods
.method public A(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hxy;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public B(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/hxy;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public final C(Ljava/util/List;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/hxy;->c:Ll/wwy;

    .line 7
    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/hxy;->o()V

    .line 11
    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0, v0}, Ll/hxy;->E(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/hxy;->s()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/16 v2, 0xa

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    if-eq p2, v2, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v2, Ll/qec0;->W4:I

    .line 37
    .line 38
    iget-object v3, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {v0, v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    sget v1, Ll/edc0;->I3:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 56
    .line 57
    iput-object v1, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 58
    .line 59
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    sget v1, Ll/edc0;->L4:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Lv/VImage;

    .line 80
    .line 81
    sget v2, Ll/edc0;->O:I

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lv/VImage;

    .line 88
    .line 89
    sget v3, Ll/edc0;->A:I

    .line 90
    .line 91
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 96
    .line 97
    sget v4, Ll/ibc0;->o7:I

    .line 98
    .line 99
    invoke-static {v1, v4}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 100
    .line 101
    .line 102
    sget v1, Ll/ibc0;->n7:I

    .line 103
    .line 104
    invoke-static {v2, v1}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 105
    .line 106
    .line 107
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 108
    .line 109
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    sget v2, Ll/g9c0;->i:I

    .line 114
    .line 115
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 120
    .line 121
    .line 122
    :cond_1
    sget v1, Ll/edc0;->O:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v1, Ll/dxy;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/dxy;-><init>(Ll/hxy;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_2
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 138
    .line 139
    iget-object v1, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 140
    .line 141
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 145
    .line 146
    iget-object v1, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 149
    .line 150
    .line 151
    if-ne p2, v2, :cond_3

    .line 152
    .line 153
    iget-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 154
    .line 155
    sget v1, Ll/qa00;->h:I

    .line 156
    .line 157
    invoke-static {v0, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    sget v1, Ll/g9c0;->a0:I

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 165
    .line 166
    .line 167
    :cond_3
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    invoke-virtual {p0, v0}, Ll/hxy;->p(I)V

    .line 172
    .line 173
    .line 174
    new-instance v0, Ll/wwy;

    .line 175
    .line 176
    iget-object v1, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 177
    .line 178
    invoke-direct {v0, v1}, Ll/wwy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 179
    .line 180
    .line 181
    iput-object v0, p0, Ll/hxy;->c:Ll/wwy;

    .line 182
    .line 183
    iget-object v1, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 184
    .line 185
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 186
    .line 187
    .line 188
    const/4 v1, 0x1

    .line 189
    :cond_4
    iget-object v0, p0, Ll/hxy;->c:Ll/wwy;

    .line 190
    .line 191
    invoke-virtual {v0, p1, p2}, Ll/wwy;->c0(Ljava/util/List;I)V

    .line 192
    .line 193
    .line 194
    if-eqz v1, :cond_5

    .line 195
    .line 196
    iget-object p1, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 197
    .line 198
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iget p0, p0, Ll/hxy;->e:I

    .line 203
    .line 204
    new-instance p2, Ll/exy;

    .line 205
    .line 206
    invoke-direct {p2}, Ll/exy;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, p0, p2}, Ll/qzz;->f2(ILjava/lang/Runnable;)V

    .line 210
    .line 211
    .line 212
    :cond_5
    return-void
.end method

.method public D(Ljava/lang/String;IZ)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p2, v1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/qzz;->l0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    iget-object v2, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    iget v2, p0, Ll/hxy;->e:I

    .line 27
    .line 28
    if-ne v2, p2, :cond_2

    .line 29
    .line 30
    :cond_1
    iget-object v2, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-lez v2, :cond_2

    .line 37
    .line 38
    return v0

    .line 39
    :cond_2
    iput p2, p0, Ll/hxy;->e:I

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/hxy;->q()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    iput-object v2, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 49
    .line 50
    :cond_3
    const/16 v2, 0xa

    .line 51
    .line 52
    if-ne p2, v2, :cond_7

    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/hxy;->n()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_6

    .line 68
    .line 69
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_5

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-nez v3, :cond_4

    .line 92
    .line 93
    const-string v3, ","

    .line 94
    .line 95
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    :cond_4
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_5
    iget-object v0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-string v2, "show_tag"

    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    filled-new-array {p1}, [Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string v2, "e_shortcut"

    .line 123
    .line 124
    invoke-static {v2, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p3, p2}, Ll/hxy;->F(Ljava/util/List;I)V

    .line 128
    .line 129
    .line 130
    return v1

    .line 131
    :cond_6
    return v0

    .line 132
    :cond_7
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-nez v2, :cond_8

    .line 137
    .line 138
    return v0

    .line 139
    :cond_8
    iget-object v0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 140
    .line 141
    invoke-virtual {p0, p1, p2, p3}, Ll/hxy;->z(Ljava/lang/String;IZ)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance p3, Ll/ywy;

    .line 146
    .line 147
    invoke-direct {p3, p0}, Ll/ywy;-><init>(Ll/hxy;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p1, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    new-instance p3, Ll/zwy;

    .line 159
    .line 160
    invoke-direct {p3, p0, p2}, Ll/zwy;-><init>(Ll/hxy;I)V

    .line 161
    .line 162
    .line 163
    new-instance p0, Ll/axy;

    .line 164
    .line 165
    invoke-direct {p0}, Ll/axy;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-static {p3, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 173
    .line 174
    .line 175
    return v1
.end method

.method public final E(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/hxy;->q()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ll/h39;->G()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    sget v1, Ll/qa00;->m:I

    .line 39
    .line 40
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    if-le p1, v1, :cond_0

    .line 44
    .line 45
    const/high16 p1, 0x43300000    # 176.0f

    .line 46
    .line 47
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/4 p1, -0x2

    .line 55
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 56
    .line 57
    :goto_0
    iget p1, p0, Ll/hxy;->g:I

    .line 58
    .line 59
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 60
    .line 61
    const/16 p1, 0x55

    .line 62
    .line 63
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 64
    .line 65
    iget-object p0, p0, Ll/hxy;->b:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-void
.end method

.method public final F(Ljava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->aEmojiIceBreakingNoReplyTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/g;->N0:Ll/vxd0;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->M0:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v2, v1}, Ll/hxy;->H(Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;Ll/vxd0;Ll/byd0;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x5

    .line 22
    if-ne p2, v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->aEmojiIceBreakingMessageTimeLimitTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 29
    .line 30
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/g;->P0:Ll/vxd0;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->O0:Ll/byd0;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v2, v1}, Ll/hxy;->H(Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;Ll/vxd0;Ll/byd0;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/16 v0, 0x9

    .line 39
    .line 40
    if-ne p2, v0, :cond_2

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->iceBreakLastMessageShowCountLimit:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 43
    .line 44
    iget-object v1, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 47
    .line 48
    iget-object v1, v1, Ll/clz;->c:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->get(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iget-object v2, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 57
    .line 58
    iget-object v2, v2, Ll/clz;->c:Ljava/lang/String;

    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/hxy;->C(Ljava/util/List;I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hxy;->n()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/hxy;->c:Ll/wwy;

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Ll/wwy;->c0(Ljava/util/List;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;Ll/vxd0;Ll/byd0;)V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x3e8

    .line 14
    .line 15
    div-long/2addr v0, v2

    .line 16
    long-to-int v0, v0

    .line 17
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->set(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ljava/lang/Long;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    invoke-static {}, Ll/pzi0;->o()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const/4 v0, 0x1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    add-int/2addr v0, p0

    .line 52
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p2, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p3, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final k(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    packed-switch p1, :pswitch_data_0

    .line 3
    .line 4
    .line 5
    :pswitch_0
    move-object p1, p0

    .line 6
    goto :goto_0

    .line 7
    :pswitch_1
    sget-object p1, Ll/tye;->i:Ljava/util/List;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :pswitch_2
    sget-object p1, Ll/tye;->h:Ljava/util/List;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :pswitch_3
    sget-object p1, Ll/tye;->g:Ljava/util/List;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :pswitch_4
    sget-object p1, Ll/tye;->e:Ljava/util/List;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :pswitch_5
    sget-object p1, Ll/tye;->f:Ljava/util/List;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :pswitch_6
    sget-object p1, Ll/tye;->d:Ljava/util/List;

    .line 23
    .line 24
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x4

    .line 31
    invoke-static {p1, p0}, Ll/g96;->b(Ljava/util/List;I)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :cond_0
    return-object p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/hxy;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final n()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/h39;->l()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_4

    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    iget-object v3, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 23
    .line 24
    iget-object v3, v3, Ll/clz;->c:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 35
    .line 36
    iget v3, v3, Lcom/p1/mobile/putong/core/data/MessageIntegration;->limit:I

    .line 37
    .line 38
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    const/4 v4, 0x0

    .line 47
    move v5, v4

    .line 48
    :goto_0
    if-ge v5, v3, :cond_3

    .line 49
    .line 50
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    check-cast v6, Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;

    .line 55
    .line 56
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;->text:Ljava/util/List;

    .line 57
    .line 58
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-nez v6, :cond_2

    .line 63
    .line 64
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    check-cast v6, Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;

    .line 69
    .line 70
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    if-eqz v7, :cond_0

    .line 75
    .line 76
    iget-boolean v7, v2, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 77
    .line 78
    if-eqz v7, :cond_0

    .line 79
    .line 80
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;->type:Ljava/lang/String;

    .line 81
    .line 82
    const-string v8, "prologue"

    .line 83
    .line 84
    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    if-eqz v7, :cond_0

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_0
    invoke-static {}, Ll/h39;->R()Z

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    if-nez v7, :cond_1

    .line 96
    .line 97
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;->type:Ljava/lang/String;

    .line 98
    .line 99
    const-string v8, "exchange"

    .line 100
    .line 101
    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    if-eqz v7, :cond_1

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Sticker;->new_()Lcom/p1/mobile/putong/core/data/Sticker;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    iget-object v8, v6, Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;->type:Ljava/lang/String;

    .line 113
    .line 114
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;->text:Ljava/util/List;

    .line 117
    .line 118
    const/4 v8, 0x1

    .line 119
    invoke-static {v6, v8}, Ll/g96;->b(Ljava/util/List;I)Ljava/util/List;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    check-cast v6, Ljava/lang/String;

    .line 128
    .line 129
    iput-object v6, v7, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 130
    .line 131
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    :cond_2
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_3
    invoke-static {}, Ll/h39;->J()Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_4

    .line 142
    .line 143
    new-instance v0, Ll/xwy;

    .line 144
    .line 145
    invoke-direct {v0}, Ll/xwy;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {v1, v0}, Ll/jyb;->e0(Ljava/util/List;Ll/qcj;)Z

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 154
    .line 155
    instance-of v0, p0, Ll/tvz;

    .line 156
    .line 157
    if-eqz v0, :cond_4

    .line 158
    .line 159
    check-cast p0, Ll/tvz;

    .line 160
    .line 161
    const-class v0, Ll/o6c0;

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Ll/tvz;->uc(Ljava/lang/Class;)Ll/cbm;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Ll/o6c0;

    .line 168
    .line 169
    if-eqz v0, :cond_4

    .line 170
    .line 171
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    check-cast p0, Ll/yxz;

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/yxz;->b4()Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    if-nez p0, :cond_4

    .line 182
    .line 183
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_4

    .line 188
    .line 189
    iget p0, v2, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 190
    .line 191
    if-nez p0, :cond_4

    .line 192
    .line 193
    invoke-virtual {v0}, Ll/o6c0;->d()Ljava/util/List;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 198
    .line 199
    .line 200
    move-result p0

    .line 201
    if-nez p0, :cond_4

    .line 202
    .line 203
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Sticker;->new_()Lcom/p1/mobile/putong/core/data/Sticker;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    const-string v0, "chatPrologue"

    .line 208
    .line 209
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 210
    .line 211
    const-string v0, "\u5f00\u573a\u767d"

    .line 212
    .line 213
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->status:Ljava/lang/String;

    .line 214
    .line 215
    invoke-interface {v1, v4, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    :cond_4
    return-object v1
.end method

.method public o()V
    .locals 2

    .line 1
    iget v0, p0, Ll/hxy;->e:I

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    sget v0, Ll/qa00;->w:I

    .line 8
    .line 9
    sget v1, Ll/qa00;->h:I

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    iput v0, p0, Ll/hxy;->g:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/hxy;->s()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    sget v0, Ll/hxy;->j:I

    .line 22
    .line 23
    iput v0, p0, Ll/hxy;->g:I

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Ll/hxy;->q()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    sget v0, Ll/hxy;->i:I

    .line 33
    .line 34
    sget v1, Ll/qa00;->k:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    iput v0, p0, Ll/hxy;->g:I

    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    invoke-static {}, Ll/h39;->G()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    sget v0, Ll/qa00;->G:I

    .line 47
    .line 48
    sget v1, Ll/qa00;->i:I

    .line 49
    .line 50
    mul-int/lit8 v1, v1, 0x2

    .line 51
    .line 52
    add-int/2addr v0, v1

    .line 53
    const/high16 v1, 0x40e00000    # 7.0f

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    add-int/2addr v0, v1

    .line 60
    iput v0, p0, Ll/hxy;->g:I

    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    sget v0, Ll/qa00;->J:I

    .line 64
    .line 65
    sget v1, Ll/qa00;->k:I

    .line 66
    .line 67
    add-int/2addr v0, v1

    .line 68
    iput v0, p0, Ll/hxy;->g:I

    .line 69
    .line 70
    return-void
.end method

.method public final p(I)V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    iget v1, p0, Ll/hxy;->g:I

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Ll/hxy;->e:I

    .line 31
    .line 32
    const/16 v1, 0xa

    .line 33
    .line 34
    if-ne v0, v1, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 37
    .line 38
    new-instance v1, Ll/hxy$a;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1}, Ll/hxy$a;-><init>(Ll/hxy;I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    sget p1, Ll/g9c0;->Y:I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-virtual {p0}, Ll/hxy;->s()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iget-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    new-instance p1, Ll/hxy$b;

    .line 63
    .line 64
    invoke-direct {p1, p0}, Ll/hxy$b;-><init>(Ll/hxy;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    .line 72
    sget p1, Ll/g9c0;->Y:I

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    new-instance p1, Ll/hxy$c;

    .line 79
    .line 80
    invoke-direct {p1, p0}, Ll/hxy$c;-><init>(Ll/hxy;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/hxy;->q()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    invoke-static {}, Ll/h39;->G()Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_2

    .line 97
    .line 98
    iget-object p0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 99
    .line 100
    sget p1, Ll/ibc0;->y5:I

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    iget-object p0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 107
    .line 108
    sget p1, Ll/g9c0;->a0:I

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/hxy;->e:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/hxy;->r(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hxy;->q()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic t(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/hxy;->e:I

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic u(Ljava/util/List;ILandroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p3, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    iget-object p3, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 14
    .line 15
    invoke-virtual {p3}, Ll/clz;->r3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    const-string v0, ","

    .line 20
    .line 21
    invoke-static {v0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "other_user_id"

    .line 32
    .line 33
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    const-string v0, "search_content"

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v0, "chat_source"

    .line 44
    .line 45
    invoke-static {p2}, Ll/hxy;->l(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    filled-new-array {p3, p1, p2}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string p2, "e_chat_icebreak_gif"

    .line 58
    .line 59
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/hxy;->h:Ljava/lang/Runnable;

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
    iget-object p0, p0, Ll/hxy;->h:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic w(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/CharSequence;

    .line 4
    .line 5
    iget-object p0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/qzz;->l0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic x(ILandroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ll/cxy;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/cxy;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-virtual {p0, p2, p1}, Ll/qzz;->Q1(ZLjava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p2, Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1}, Ll/hxy;->F(Ljava/util/List;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public y(ZLjava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget v0, p0, Ll/hxy;->e:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/hxy;->q()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p1, 0x0

    .line 27
    :goto_0
    new-instance v1, Ll/bxy;

    .line 28
    .line 29
    invoke-direct {v1, p0, p2}, Ll/bxy;-><init>(Ll/hxy;Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1, v1}, Ll/qzz;->R1(ZLjava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_1
    return-void
.end method

.method public final z(Ljava/lang/String;IZ)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IZ)",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const-string v2, ""

    .line 4
    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "chat_text_associate"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p2}, Ll/hxy;->r(I)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ll/hxy;->k(I)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "chat_ice_break"

    .line 31
    .line 32
    :cond_1
    :goto_0
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    new-instance p0, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_2
    iget-object v0, p0, Ll/hxy;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 53
    .line 54
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 57
    .line 58
    invoke-virtual {v3, v1, p3, v2}, Lcom/p1/mobile/putong/core/api/z;->o3(Ljava/util/List;ZLjava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {v0, p3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p3

    .line 66
    new-instance v0, Ll/fxy;

    .line 67
    .line 68
    invoke-direct {v0, p1}, Ll/fxy;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p3, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p3, Ll/gxy;

    .line 76
    .line 77
    invoke-direct {p3, p0, v1, p2}, Ll/gxy;-><init>(Ll/hxy;Ljava/util/List;I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, p3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method
