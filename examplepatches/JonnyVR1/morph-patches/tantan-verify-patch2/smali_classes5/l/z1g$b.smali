.class public Ll/z1g$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z1g;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/z1g;


# direct methods
.method public constructor <init>(Ll/z1g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/z1g$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z1g$b;->j()V

    return-void
.end method

.method public static synthetic b(Ll/z1g$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z1g$b;->i()V

    return-void
.end method

.method public static synthetic c(Ll/z1g$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/z1g$b;->f()V

    return-void
.end method

.method public static synthetic d(Ll/z1g$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z1g$b;->l()V

    return-void
.end method

.method public static synthetic e(Ll/z1g$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z1g$b;->k()V

    return-void
.end method

.method private synthetic f()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/z1g;->z(Ll/z1g;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/z1g;->z(Ll/z1g;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 2
    .line 3
    iget-object v0, v0, Ll/z1g;->j:Lv/VRecyclerView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/z1g;->B(Ll/z1g;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/z1g;->C(Ll/z1g;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 2
    .line 3
    invoke-static {v0}, Ll/z1g;->p(Ll/z1g;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/e2g;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/e2g;-><init>(Ll/z1g$b;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 3
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq p2, v1, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    if-ne p2, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v1, v0

    .line 15
    :cond_1
    :goto_0
    invoke-static {p1, v1}, Ll/z1g;->y(Ll/z1g;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 19
    .line 20
    invoke-static {p1}, Ll/z1g;->w(Ll/z1g;)Ll/m1g;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/m1g;->P0()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/z1g;->B(Ll/z1g;Z)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/z1g;->C(Ll/z1g;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 2
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/rs9;->h()Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget-object v0, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    invoke-static {v0}, Ll/z1g;->u(Ll/z1g;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const/high16 p3, 0x44160000    # 600.0f

    .line 24
    .line 25
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-le p2, p3, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 32
    .line 33
    invoke-static {p1, v1}, Ll/z1g;->A(Ll/z1g;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 37
    .line 38
    invoke-static {p1, v1}, Ll/z1g;->z(Ll/z1g;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 42
    .line 43
    invoke-static {p1}, Ll/z1g;->w(Ll/z1g;)Ll/m1g;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Ll/a2g;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Ll/a2g;-><init>(Ll/z1g$b;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, p2}, Ll/m1g;->I0(Ll/x20;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-static {p1}, Ll/zrc0;->a(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_2

    .line 61
    .line 62
    invoke-static {p1}, Ll/zrc0;->b(Landroidx/recyclerview/widget/RecyclerView;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 69
    .line 70
    invoke-static {p1}, Ll/z1g;->s(Ll/z1g;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 77
    .line 78
    invoke-static {p1}, Ll/z1g;->w(Ll/z1g;)Ll/m1g;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance p2, Ll/b2g;

    .line 83
    .line 84
    invoke-direct {p2, p0}, Ll/b2g;-><init>(Ll/z1g$b;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p2}, Ll/m1g;->I0(Ll/x20;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    invoke-static {v0}, Ll/z1g;->q(Ll/z1g;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 98
    .line 99
    invoke-static {p1}, Ll/z1g;->v(Ll/z1g;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-nez p1, :cond_2

    .line 104
    .line 105
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 106
    .line 107
    invoke-static {p1}, Ll/z1g;->x(Ll/z1g;)I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    add-int/2addr p2, p3

    .line 112
    invoke-static {p1, p2}, Ll/z1g;->C(Ll/z1g;I)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 116
    .line 117
    invoke-static {p1}, Ll/z1g;->w(Ll/z1g;)Ll/m1g;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Ll/m1g;->P0()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_2

    .line 126
    .line 127
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 128
    .line 129
    invoke-static {p1}, Ll/z1g;->x(Ll/z1g;)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    const/high16 p2, 0x42c80000    # 100.0f

    .line 134
    .line 135
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-le p1, p2, :cond_2

    .line 140
    .line 141
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 142
    .line 143
    invoke-static {p1, v1}, Ll/z1g;->B(Ll/z1g;Z)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 147
    .line 148
    invoke-static {p1}, Ll/z1g;->p(Ll/z1g;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    new-instance p2, Ll/c2g;

    .line 153
    .line 154
    invoke-direct {p2, p0}, Ll/c2g;-><init>(Ll/z1g$b;)V

    .line 155
    .line 156
    .line 157
    invoke-static {p1, p2}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Ll/z1g$b;->a:Ll/z1g;

    .line 161
    .line 162
    invoke-static {p1}, Ll/z1g;->w(Ll/z1g;)Ll/m1g;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    new-instance p2, Ll/d2g;

    .line 167
    .line 168
    invoke-direct {p2, p0}, Ll/d2g;-><init>(Ll/z1g$b;)V

    .line 169
    .line 170
    .line 171
    const-string p0, "p_intl_plm,swipe"

    .line 172
    .line 173
    invoke-virtual {p1, p0, p2}, Ll/m1g;->N0(Ljava/lang/String;Ll/x20;)V

    .line 174
    .line 175
    .line 176
    :cond_2
    return-void
.end method
