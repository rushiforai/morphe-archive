.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mql;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/mql<",
        "Ll/t7m;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public c:Z

.field public d:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public e:Landroid/content/Context;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;

.field public h:Z

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

.field public k:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/qk4;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/qk4;

.field public m:I

.field public n:I


# direct methods
.method public constructor <init>(ZLandroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->m:I

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->n:I

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->h:Z

    .line 14
    .line 15
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->f:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->e:Landroid/content/Context;

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->i:Ljava/util/List;

    .line 25
    .line 26
    new-instance p1, Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->k:Landroid/util/SparseArray;

    .line 32
    .line 33
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic k(Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic l(Landroid/view/View;Ll/qk4;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic m(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 6
    .line 7
    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic n()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Ll/qk4;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;Ll/qk4;Ll/qk4;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->y(Ll/qk4;Ll/qk4;Z)V

    return-void
.end method

.method public static synthetic q(Landroid/view/View;Ll/qk4;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 11
    .line 12
    const/16 p1, 0x8

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(IZ)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->i:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x1

    .line 13
    sub-int/2addr v1, v2

    .line 14
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->e()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    :cond_0
    if-lez p1, :cond_1

    .line 35
    .line 36
    move p1, v0

    .line 37
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->i()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->d()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v5, p1

    .line 55
    goto :goto_1

    .line 56
    :cond_3
    :goto_0
    move v5, v0

    .line 57
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->i:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    move-object v6, p1

    .line 64
    check-cast v6, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 75
    .line 76
    iget-object v1, p1, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 77
    .line 78
    if-ne v1, v6, :cond_5

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/qk4;->d()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 85
    .line 86
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->b()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_4

    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 97
    .line 98
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->e:Landroid/content/Context;

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->f:Landroid/widget/FrameLayout;

    .line 103
    .line 104
    invoke-virtual {p1, p2, v0, v1, v5}, Ll/qk4;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/content/Context;Landroid/widget/FrameLayout;I)V

    .line 105
    .line 106
    .line 107
    :cond_4
    sget-boolean p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 108
    .line 109
    if-eqz p1, :cond_10

    .line 110
    .line 111
    iget-object p1, v6, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->explain:Ljava/lang/String;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 120
    .line 121
    return-void

    .line 122
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->k:Landroid/util/SparseArray;

    .line 123
    .line 124
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->getFrameId()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Ll/qk4;

    .line 133
    .line 134
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 135
    .line 136
    if-eqz v1, :cond_6

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 145
    .line 146
    :cond_6
    if-nez p1, :cond_7

    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 153
    .line 154
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->e:Landroid/content/Context;

    .line 155
    .line 156
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->f:Landroid/widget/FrameLayout;

    .line 157
    .line 158
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;Landroid/widget/FrameLayout;)Ll/qk4;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->k:Landroid/util/SparseArray;

    .line 163
    .line 164
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->getFrameId()I

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    invoke-virtual {v1, v3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_7
    invoke-virtual {p1}, Ll/qk4;->d()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 177
    .line 178
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->b()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-nez v1, :cond_9

    .line 187
    .line 188
    sget-boolean v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 189
    .line 190
    if-eqz v1, :cond_8

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 199
    .line 200
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 201
    .line 202
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->e:Landroid/content/Context;

    .line 203
    .line 204
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->f:Landroid/widget/FrameLayout;

    .line 205
    .line 206
    invoke-virtual {p1, v1, v3, v4, v5}, Ll/qk4;->e(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/content/Context;Landroid/widget/FrameLayout;I)V

    .line 207
    .line 208
    .line 209
    :cond_9
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 210
    .line 211
    if-eqz v1, :cond_b

    .line 212
    .line 213
    if-eqz p2, :cond_b

    .line 214
    .line 215
    iget-object p2, p1, Ll/qk4;->b:Landroid/view/View;

    .line 216
    .line 217
    const/4 v1, 0x4

    .line 218
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 219
    .line 220
    .line 221
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 222
    .line 223
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->m:I

    .line 224
    .line 225
    if-le v5, v1, :cond_a

    .line 226
    .line 227
    move v0, v2

    .line 228
    :cond_a
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->s(Ll/qk4;Ll/qk4;Z)V

    .line 229
    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_b
    if-eqz v1, :cond_c

    .line 233
    .line 234
    iget-object p2, v1, Ll/qk4;->b:Landroid/view/View;

    .line 235
    .line 236
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 237
    .line 238
    .line 239
    iget-object p2, p1, Ll/qk4;->b:Landroid/view/View;

    .line 240
    .line 241
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 242
    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_c
    iget-object p2, p1, Ll/qk4;->b:Landroid/view/View;

    .line 246
    .line 247
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 248
    .line 249
    .line 250
    :goto_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 251
    .line 252
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result p2

    .line 256
    if-eqz p2, :cond_d

    .line 257
    .line 258
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 259
    .line 260
    if-eq p2, p1, :cond_d

    .line 261
    .line 262
    iget-object p2, p2, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 263
    .line 264
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->INTL_COMPLIMENT_RECEIVED:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 265
    .line 266
    if-ne p2, v0, :cond_d

    .line 267
    .line 268
    const-string p2, "swipe"

    .line 269
    .line 270
    invoke-static {p2}, Ll/gp5;->d(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    :cond_d
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result p2

    .line 277
    if-eqz p2, :cond_e

    .line 278
    .line 279
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->c:Z

    .line 280
    .line 281
    if-eqz p2, :cond_e

    .line 282
    .line 283
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->z(Ll/qk4;)V

    .line 284
    .line 285
    .line 286
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->h:Z

    .line 287
    .line 288
    if-nez p2, :cond_e

    .line 289
    .line 290
    iget-object p2, p1, Ll/qk4;->c:Ll/em2;

    .line 291
    .line 292
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 293
    .line 294
    invoke-virtual {p2, v0, p1, v5}, Ll/em2;->j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V

    .line 295
    .line 296
    .line 297
    :cond_e
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 298
    .line 299
    iput v5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->m:I

    .line 300
    .line 301
    if-nez v5, :cond_f

    .line 302
    .line 303
    iget-object p2, p1, Ll/qk4;->b:Landroid/view/View;

    .line 304
    .line 305
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 306
    .line 307
    .line 308
    move-result p2

    .line 309
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->n:I

    .line 310
    .line 311
    :cond_f
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;

    .line 312
    .line 313
    if-eqz p0, :cond_10

    .line 314
    .line 315
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;->a(Ll/qk4;)V

    .line 316
    .line 317
    .line 318
    :cond_10
    return-void
.end method

.method public b()V
    .locals 5

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->k:Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->k:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->k:Landroid/util/SparseArray;

    .line 18
    .line 19
    if-ge v1, v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/qk4;

    .line 30
    .line 31
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->e:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {v3, v4, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->f(Landroid/content/Context;Ll/qk4;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->f:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    iget-object v4, v2, Ll/qk4;->b:Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    sget-boolean v3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 54
    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    iget-object v2, v2, Ll/qk4;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->explain:Ljava/lang/String;

    .line 60
    .line 61
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 65
    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 69
    .line 70
    sget-boolean p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->g:Z

    .line 71
    .line 72
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic e(Ll/q7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t7m;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->x(Ll/t7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/qk4;->b:Landroid/view/View;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic h(Ll/q7m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t7m;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->r(Ll/t7m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/qk4;->b:Landroid/view/View;

    .line 7
    .line 8
    instance-of v1, p0, Ll/pql;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast p0, Ll/pql;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/pql;->getUserContentLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_0
    return v0
.end method

.method public j(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->a(IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public r(Ll/t7m;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final s(Ll/qk4;Ll/qk4;Z)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/dj4;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, Ll/dj4;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;Ll/qk4;Ll/qk4;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final t(Ll/qk4;Ll/qk4;Z)V
    .locals 11

    .line 1
    iget-object p0, p2, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    sget v0, Ll/adc0;->R0:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 10
    .line 11
    sget v1, Ll/adc0;->R0:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p2, Ll/qk4;->b:Landroid/view/View;

    .line 18
    .line 19
    sget v2, Ll/adc0;->n6:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p1, Ll/qk4;->b:Landroid/view/View;

    .line 26
    .line 27
    sget v3, Ll/adc0;->n6:I

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    goto/16 :goto_1

    .line 42
    .line 43
    :cond_0
    const/high16 v3, -0x40800000    # -1.0f

    .line 44
    .line 45
    const/high16 v4, 0x3f800000    # 1.0f

    .line 46
    .line 47
    if-eqz p3, :cond_1

    .line 48
    .line 49
    move p3, v3

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move p3, v4

    .line 52
    :goto_0
    invoke-virtual {v1, v4}, Landroid/view/View;->setAlpha(F)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    new-instance v6, Ll/ej4;

    .line 60
    .line 61
    invoke-direct {v6}, Ll/ej4;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    mul-float v6, p3, v4

    .line 69
    .line 70
    sget v7, Ll/qa00;->K:I

    .line 71
    .line 72
    int-to-float v8, v7

    .line 73
    mul-float/2addr v6, v8

    .line 74
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    const/4 v6, 0x0

    .line 79
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    const-wide/16 v8, 0x64

    .line 84
    .line 85
    invoke-virtual {v5, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    new-instance v10, Ll/fj4;

    .line 90
    .line 91
    invoke-direct {v10, v1, p2}, Ll/fj4;-><init>(Landroid/view/View;Ll/qk4;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v5, v10}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 99
    .line 100
    .line 101
    mul-float/2addr p3, v3

    .line 102
    int-to-float p2, v7

    .line 103
    mul-float/2addr p3, p2

    .line 104
    invoke-virtual {v2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2, v6}, Landroid/view/View;->setAlpha(F)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    new-instance p3, Ll/gj4;

    .line 115
    .line 116
    invoke-direct {p3, p1}, Ll/gj4;-><init>(Ll/qk4;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, p3}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-virtual {p2, v6}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-virtual {p2, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    new-instance p3, Ll/hj4;

    .line 136
    .line 137
    invoke-direct {p3, v2, p1}, Ll/hj4;-><init>(Landroid/view/View;Ll/qk4;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, p3}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 145
    .line 146
    .line 147
    invoke-static {p0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-static {v0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-static {v0, p1, p2}, Ll/bnl0;->K0(Landroid/view/View;Ll/bnl0$g;Ll/bnl0$g;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    new-instance p2, Ll/ij4;

    .line 170
    .line 171
    invoke-direct {p2, p0, v0}, Ll/ij4;-><init>(Landroid/view/View;Landroid/view/View;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withStartAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p1, v6}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p1, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    new-instance p2, Ll/jj4;

    .line 199
    .line 200
    invoke-direct {p2, v0, v2, p0}, Ll/jj4;-><init>(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_2
    :goto_1
    iget-object p0, p2, Ll/qk4;->b:Landroid/view/View;

    .line 212
    .line 213
    const/4 p2, 0x0

    .line 214
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 218
    .line 219
    const/4 p1, 0x1

    .line 220
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    return-void
.end method

.method public u()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qk4;->a()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public v()Ll/qk4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->l:Ll/qk4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public w()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ll/t7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->c:Z

    .line 6
    .line 7
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->d:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->h()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->h:Z

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->q(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->t(Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 35
    .line 36
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->p(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 40
    .line 41
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->u(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 45
    .line 46
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->s(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->i:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 52
    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const/4 p2, 0x0

    .line 59
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    if-eqz p3, :cond_2

    .line 64
    .line 65
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    check-cast p3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->i()Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;

    .line 72
    .line 73
    .line 74
    move-result-object p4

    .line 75
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/a;->l(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;)Ll/em2;

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    iget-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->e:Landroid/content/Context;

    .line 82
    .line 83
    invoke-interface {p4, p5, p2, p3, v0}, Ll/qql;->a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 84
    .line 85
    .line 86
    move-result p5

    .line 87
    if-eqz p5, :cond_0

    .line 88
    .line 89
    iget-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 90
    .line 91
    iget-object p5, p5, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 92
    .line 93
    iget-object p5, p5, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 94
    .line 95
    if-nez p5, :cond_1

    .line 96
    .line 97
    invoke-virtual {p4}, Ll/em2;->i()Z

    .line 98
    .line 99
    .line 100
    move-result p4

    .line 101
    if-eqz p4, :cond_1

    .line 102
    .line 103
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 104
    .line 105
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 106
    .line 107
    iput-object p3, p4, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 108
    .line 109
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 110
    .line 111
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->i:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p4, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    return-void
.end method

.method public final synthetic y(Ll/qk4;Ll/qk4;Z)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/qk4;->b:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->t(Ll/qk4;Ll/qk4;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final z(Ll/qk4;)V
    .locals 0

    .line 1
    return-void
.end method
