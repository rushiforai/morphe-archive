.class public Ll/jax$d;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jax;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/BreakIce;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Ll/jax;


# direct methods
.method public constructor <init>(Ll/jax;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jax$d;->d:Ll/jax;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/jax$d;->c:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/jax;Ll/max;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/jax$d;-><init>(Ll/jax;)V

    return-void
.end method

.method public static synthetic E(Ll/jax$d;Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jax$d;->H(Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jax$d;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/BreakIce;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jax$d;->c:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jax$d;->d:Ll/jax;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jax;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/kec0;->k7:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/data/BreakIce;II)V
    .locals 2

    .line 1
    sget p3, Ll/adc0;->gb:I

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lv/VText;

    .line 8
    .line 9
    sget p4, Ll/adc0;->P3:I

    .line 10
    .line 11
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lv/VText;

    .line 16
    .line 17
    const/high16 p4, 0x41800000    # 16.0f

    .line 18
    .line 19
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 20
    .line 21
    .line 22
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    sget-object p4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 28
    .line 29
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 30
    .line 31
    .line 32
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/BreakIce;->kind:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "exclusive"

    .line 35
    .line 36
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p4

    .line 40
    if-eqz p4, :cond_0

    .line 41
    .line 42
    const/4 p4, 0x1

    .line 43
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    const/high16 p1, 0x41400000    # 12.0f

    .line 47
    .line 48
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    invoke-static {p3, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/jax$d;->d:Ll/jax;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/jax;->C0()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget p4, Ll/c9c0;->Q0:I

    .line 62
    .line 63
    invoke-static {p1, p4}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const/4 p4, 0x0

    .line 72
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-static {p3, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/jax$d;->d:Ll/jax;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/jax;->C0()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    sget p4, Ll/c9c0;->L0:I

    .line 90
    .line 91
    invoke-static {p1, p4}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 96
    .line 97
    .line 98
    :goto_0
    new-instance p1, Ll/lax;

    .line 99
    .line 100
    invoke-direct {p1, p0, p2}, Ll/lax;-><init>(Ll/jax$d;Lcom/p1/mobile/putong/core/data/BreakIce;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/jax$d;->d:Ll/jax;

    .line 107
    .line 108
    invoke-static {p1}, Ll/jax;->q(Ll/jax;)Ll/h220;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    new-instance p3, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string p4, "e_matched_select_question"

    .line 115
    .line 116
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    invoke-virtual {p1, p3}, Ll/h220;->a(Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_1

    .line 133
    .line 134
    iget-object p1, p0, Ll/jax$d;->d:Ll/jax;

    .line 135
    .line 136
    invoke-virtual {p1}, Ll/jax;->V()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    const-string p3, "truth_question"

    .line 145
    .line 146
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {p3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/BreakIce;->kind:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    const-string v1, "self_edit_question"

    .line 159
    .line 160
    invoke-static {v1, v0}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    filled-new-array {p3, v0}, [Ll/sfj0$a;

    .line 165
    .line 166
    .line 167
    move-result-object p3

    .line 168
    invoke-static {p4, p1, p3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 169
    .line 170
    .line 171
    iget-object p0, p0, Ll/jax$d;->d:Ll/jax;

    .line 172
    .line 173
    invoke-static {p0}, Ll/jax;->q(Ll/jax;)Ll/h220;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    new-instance p1, Ljava/lang/StringBuilder;

    .line 178
    .line 179
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p0, p1}, Ll/h220;->b(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_1
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/core/data/BreakIce;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jax$d;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/core/data/BreakIce;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/jax$d;->d:Ll/jax;

    .line 2
    .line 3
    invoke-static {p2}, Ll/jax;->s(Ll/jax;)Ll/v9x;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p2, v0, v1}, Ll/v9x;->i1(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/jax$d;->d:Ll/jax;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jax;->V()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p2, "truth_question"

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BreakIce;->kind:Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "exclusive"

    .line 34
    .line 35
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    const-string v0, "self_edit_question"

    .line 40
    .line 41
    invoke-static {v0, p1}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p2, p1}, [Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string p2, "e_matched_select_question"

    .line 50
    .line 51
    invoke-static {p2, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public I(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/jax$d;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/jax$d;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x3

    .line 19
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-interface {p1, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Ll/jax$d;->d:Ll/jax;

    .line 35
    .line 36
    invoke-static {p0}, Ll/jax;->T(Ll/jax;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jax$d;->G(I)Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
