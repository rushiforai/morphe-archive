.class public Ll/h80;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h80$b;,
        Ll/h80$a;,
        Ll/h80$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DATA:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/h80$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "TDATA;>.b<",
            "Ll/h80<",
            "TDATA;>.a;>;"
        }
    .end annotation
.end field

.field public b:Ll/h80$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "TDATA;>.b<",
            "Ll/h80<",
            "TDATA;>.a;>;"
        }
    .end annotation
.end field

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TDATA;>;"
        }
    .end annotation
.end field

.field public d:Landroid/os/Handler;

.field public e:Z

.field public f:Landroid/view/ViewGroup;

.field public g:[I

.field public h:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/h80;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Ll/h80;->g:[I

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Ll/h80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h80;->b()V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 15

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/h80;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/h80;->a:Ll/h80$b;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move-object v2, v1

    .line 8
    :goto_0
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    iget-object v4, v0, Ll/h80$b;->a:Ll/h80$b;

    .line 12
    .line 13
    iget-object v5, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v5, Ll/h80$a;

    .line 16
    .line 17
    invoke-virtual {p0, v5}, Ll/h80;->e(Ll/h80$a;)Z

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    if-nez v5, :cond_1

    .line 22
    .line 23
    iget-object v5, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 24
    .line 25
    move-object v6, v5

    .line 26
    check-cast v6, Ll/h80$a;

    .line 27
    .line 28
    iget v6, v6, Ll/h80$a;->c:I

    .line 29
    .line 30
    if-ne v6, v3, :cond_1

    .line 31
    .line 32
    check-cast v5, Ll/h80$a;

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    iput v3, v5, Ll/h80$a;->c:I

    .line 36
    .line 37
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 38
    .line 39
    .line 40
    move-result-wide v5

    .line 41
    iget-object v3, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 42
    .line 43
    move-object v7, v3

    .line 44
    check-cast v7, Ll/h80$a;

    .line 45
    .line 46
    iget-wide v7, v7, Ll/h80$a;->b:J

    .line 47
    .line 48
    sub-long v12, v5, v7

    .line 49
    .line 50
    move-object v5, v3

    .line 51
    check-cast v5, Ll/h80$a;

    .line 52
    .line 53
    iget-object v5, v5, Ll/h80$a;->e:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v3, Ll/h80$a;

    .line 56
    .line 57
    iget v3, v3, Ll/h80$a;->d:I

    .line 58
    .line 59
    invoke-virtual {p0, v5, v3, v12, v13}, Ll/h80;->l(Ljava/lang/Object;IJ)V

    .line 60
    .line 61
    .line 62
    iget-object v3, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 63
    .line 64
    move-object v5, v3

    .line 65
    check-cast v5, Ll/h80$a;

    .line 66
    .line 67
    iget-object v10, v5, Ll/h80$a;->e:Ljava/lang/Object;

    .line 68
    .line 69
    move-object v5, v3

    .line 70
    check-cast v5, Ll/h80$a;

    .line 71
    .line 72
    iget v11, v5, Ll/h80$a;->d:I

    .line 73
    .line 74
    move-object v5, v3

    .line 75
    check-cast v5, Ll/h80$a;

    .line 76
    .line 77
    iget-object v5, v5, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 78
    .line 79
    if-nez v5, :cond_0

    .line 80
    .line 81
    move-object v14, v1

    .line 82
    :goto_1
    move-object v9, p0

    .line 83
    goto :goto_2

    .line 84
    :cond_0
    check-cast v3, Ll/h80$a;

    .line 85
    .line 86
    iget-object v3, v3, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 87
    .line 88
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    check-cast v3, Landroid/view/View;

    .line 93
    .line 94
    move-object v14, v3

    .line 95
    goto :goto_1

    .line 96
    :goto_2
    invoke-virtual/range {v9 .. v14}, Ll/h80;->m(Ljava/lang/Object;IJLandroid/view/View;)V

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_1
    move-object v9, p0

    .line 101
    :goto_3
    iget-object p0, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 102
    .line 103
    move-object v3, p0

    .line 104
    check-cast v3, Ll/h80$a;

    .line 105
    .line 106
    iget-object v3, v3, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 107
    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    check-cast p0, Ll/h80$a;

    .line 111
    .line 112
    iget-object p0, p0, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 113
    .line 114
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    if-nez p0, :cond_2

    .line 119
    .line 120
    goto :goto_5

    .line 121
    :cond_2
    move-object v2, v0

    .line 122
    :goto_4
    move-object v0, v4

    .line 123
    move-object p0, v9

    .line 124
    goto :goto_0

    .line 125
    :cond_3
    :goto_5
    if-nez v2, :cond_4

    .line 126
    .line 127
    iput-object v4, v9, Ll/h80;->a:Ll/h80$b;

    .line 128
    .line 129
    goto :goto_6

    .line 130
    :cond_4
    iput-object v4, v2, Ll/h80$b;->a:Ll/h80$b;

    .line 131
    .line 132
    :goto_6
    iput-object v1, v0, Ll/h80$b;->a:Ll/h80$b;

    .line 133
    .line 134
    invoke-virtual {v9, v0}, Ll/h80;->r(Ll/h80$b;)Ll/h80$b;

    .line 135
    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_5
    move-object v9, p0

    .line 139
    iget-object p0, v9, Ll/h80;->a:Ll/h80$b;

    .line 140
    .line 141
    :goto_7
    if-eqz p0, :cond_9

    .line 142
    .line 143
    iget-object v0, p0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 144
    .line 145
    check-cast v0, Ll/h80$a;

    .line 146
    .line 147
    invoke-virtual {v9, v0}, Ll/h80;->e(Ll/h80$a;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_8

    .line 152
    .line 153
    iget-object v0, p0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 154
    .line 155
    move-object v2, v0

    .line 156
    check-cast v2, Ll/h80$a;

    .line 157
    .line 158
    iget-wide v4, v2, Ll/h80$a;->b:J

    .line 159
    .line 160
    const-wide/16 v6, 0x0

    .line 161
    .line 162
    cmp-long v2, v4, v6

    .line 163
    .line 164
    if-gtz v2, :cond_6

    .line 165
    .line 166
    check-cast v0, Ll/h80$a;

    .line 167
    .line 168
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    .line 169
    .line 170
    .line 171
    move-result-wide v4

    .line 172
    iput-wide v4, v0, Ll/h80$a;->b:J

    .line 173
    .line 174
    :cond_6
    iget-object v0, p0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 175
    .line 176
    move-object v2, v0

    .line 177
    check-cast v2, Ll/h80$a;

    .line 178
    .line 179
    iget v2, v2, Ll/h80$a;->c:I

    .line 180
    .line 181
    if-eq v2, v3, :cond_8

    .line 182
    .line 183
    move-object v2, v0

    .line 184
    check-cast v2, Ll/h80$a;

    .line 185
    .line 186
    iput v3, v2, Ll/h80$a;->c:I

    .line 187
    .line 188
    move-object v2, v0

    .line 189
    check-cast v2, Ll/h80$a;

    .line 190
    .line 191
    iget-object v2, v2, Ll/h80$a;->e:Ljava/lang/Object;

    .line 192
    .line 193
    check-cast v0, Ll/h80$a;

    .line 194
    .line 195
    iget v0, v0, Ll/h80$a;->d:I

    .line 196
    .line 197
    invoke-virtual {v9, v2, v0}, Ll/h80;->j(Ljava/lang/Object;I)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 201
    .line 202
    move-object v2, v0

    .line 203
    check-cast v2, Ll/h80$a;

    .line 204
    .line 205
    iget-object v2, v2, Ll/h80$a;->e:Ljava/lang/Object;

    .line 206
    .line 207
    move-object v4, v0

    .line 208
    check-cast v4, Ll/h80$a;

    .line 209
    .line 210
    iget v4, v4, Ll/h80$a;->d:I

    .line 211
    .line 212
    move-object v5, v0

    .line 213
    check-cast v5, Ll/h80$a;

    .line 214
    .line 215
    iget-object v5, v5, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 216
    .line 217
    if-nez v5, :cond_7

    .line 218
    .line 219
    move-object v0, v1

    .line 220
    goto :goto_8

    .line 221
    :cond_7
    check-cast v0, Ll/h80$a;

    .line 222
    .line 223
    iget-object v0, v0, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 224
    .line 225
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    check-cast v0, Landroid/view/View;

    .line 230
    .line 231
    :goto_8
    invoke-virtual {v9, v2, v4, v0}, Ll/h80;->k(Ljava/lang/Object;ILandroid/view/View;)V

    .line 232
    .line 233
    .line 234
    :cond_8
    iget-object p0, p0, Ll/h80$b;->a:Ll/h80$b;

    .line 235
    .line 236
    goto :goto_7

    .line 237
    :cond_9
    return-void
.end method

.method public final c(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    return p0

    .line 9
    :cond_1
    if-eq p1, p2, :cond_3

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_2
    return p0

    .line 19
    :cond_3
    :goto_0
    return v0
.end method

.method public final d(Landroid/view/View;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/h80;->f:Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x1020002

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    iput-object v0, p0, Ll/h80;->f:Landroid/view/ViewGroup;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/view/ViewGroup;

    .line 27
    .line 28
    iget-object v1, p0, Ll/h80;->f:Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {p0, v1, v0}, Ll/h80;->f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/h80;->f:Landroid/view/ViewGroup;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    return v1

    .line 39
    :cond_1
    iget-object v2, p0, Ll/h80;->g:[I

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/h80;->f:Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object v2, p0, Ll/h80;->f:Landroid/view/ViewGroup;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iget-object v3, p0, Ll/h80;->g:[I

    .line 57
    .line 58
    aget v4, v3, v1

    .line 59
    .line 60
    const/4 v5, 0x1

    .line 61
    aget v6, v3, v5

    .line 62
    .line 63
    invoke-virtual {p1, v3}, Landroid/view/View;->getLocationInWindow([I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iget-object p0, p0, Ll/h80;->g:[I

    .line 75
    .line 76
    aget v7, p0, v1

    .line 77
    .line 78
    aget p0, p0, v5

    .line 79
    .line 80
    add-int/2addr v2, v6

    .line 81
    if-ge p0, v2, :cond_2

    .line 82
    .line 83
    add-int/2addr p0, p1

    .line 84
    if-le p0, v6, :cond_2

    .line 85
    .line 86
    add-int/2addr v0, v4

    .line 87
    if-ge v7, v0, :cond_2

    .line 88
    .line 89
    add-int/2addr v7, v3

    .line 90
    if-le v7, v4, :cond_2

    .line 91
    .line 92
    return v5

    .line 93
    :cond_2
    return v1
.end method

.method public final e(Ll/h80$a;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h80<",
            "TDATA;>.a;)Z"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/view/View;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_3

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    iget-object v1, p0, Ll/h80;->h:Landroid/view/View;

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/h80;->d(Landroid/view/View;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0

    .line 38
    :cond_2
    invoke-virtual {p0, v1}, Ll/h80;->d(Landroid/view/View;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/h80;->d(Landroid/view/View;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_3
    :goto_1
    return v0
.end method

.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h(Landroid/view/View;Ljava/lang/Object;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "TDATA;I)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_a

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Ll/h80;->a:Ll/h80$b;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    move-object v2, v1

    .line 11
    :goto_0
    if-eqz v0, :cond_2

    .line 12
    .line 13
    if-nez v2, :cond_2

    .line 14
    .line 15
    iget-object v3, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 16
    .line 17
    move-object v4, v3

    .line 18
    check-cast v4, Ll/h80$a;

    .line 19
    .line 20
    iget-object v4, v4, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    check-cast v3, Ll/h80$a;

    .line 25
    .line 26
    iget-object v3, v3, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-ne v3, p1, :cond_1

    .line 33
    .line 34
    move-object v2, v0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v0, v0, Ll/h80$b;->a:Ll/h80$b;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    iget-object v0, v2, Ll/h80$b;->b:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v0, Ll/h80$a;

    .line 48
    .line 49
    iget-object v0, v0, Ll/h80$a;->e:Ljava/lang/Object;

    .line 50
    .line 51
    invoke-virtual {p0, v0, p2}, Ll/h80;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    goto/16 :goto_3

    .line 58
    .line 59
    :cond_3
    iget-object v0, v2, Ll/h80$b;->b:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v0, Ll/h80$a;

    .line 62
    .line 63
    iput-object v1, v0, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 64
    .line 65
    :cond_4
    iget-object v0, p0, Ll/h80;->a:Ll/h80$b;

    .line 66
    .line 67
    move-object v5, v1

    .line 68
    move-object v1, v0

    .line 69
    move-object v0, v5

    .line 70
    :goto_1
    if-eqz v1, :cond_6

    .line 71
    .line 72
    if-nez v0, :cond_6

    .line 73
    .line 74
    iget-object v2, v1, Ll/h80$b;->b:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v2, Ll/h80$a;

    .line 77
    .line 78
    iget-object v2, v2, Ll/h80$a;->e:Ljava/lang/Object;

    .line 79
    .line 80
    invoke-virtual {p0, v2, p2}, Ll/h80;->c(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_5

    .line 85
    .line 86
    move-object v0, v1

    .line 87
    goto :goto_1

    .line 88
    :cond_5
    iget-object v1, v1, Ll/h80$b;->a:Ll/h80$b;

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_6
    if-nez v0, :cond_7

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/h80;->n()Ll/h80$b;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget-object v1, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast v1, Ll/h80$a;

    .line 100
    .line 101
    new-instance v2, Ljava/lang/ref/WeakReference;

    .line 102
    .line 103
    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    iput-object v2, v1, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 107
    .line 108
    iget-object p1, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 109
    .line 110
    move-object v1, p1

    .line 111
    check-cast v1, Ll/h80$a;

    .line 112
    .line 113
    const/4 v2, 0x0

    .line 114
    iput v2, v1, Ll/h80$a;->c:I

    .line 115
    .line 116
    move-object v1, p1

    .line 117
    check-cast v1, Ll/h80$a;

    .line 118
    .line 119
    iput p3, v1, Ll/h80$a;->d:I

    .line 120
    .line 121
    move-object p3, p1

    .line 122
    check-cast p3, Ll/h80$a;

    .line 123
    .line 124
    iput-object p2, p3, Ll/h80$a;->e:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast p1, Ll/h80$a;

    .line 127
    .line 128
    const-wide/16 p2, 0x0

    .line 129
    .line 130
    iput-wide p2, p1, Ll/h80$a;->b:J

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Ll/h80;->q(Ll/h80$b;)V

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_7
    iget-object p2, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 137
    .line 138
    move-object p3, p2

    .line 139
    check-cast p3, Ll/h80$a;

    .line 140
    .line 141
    iget-object p3, p3, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 142
    .line 143
    if-eqz p3, :cond_8

    .line 144
    .line 145
    check-cast p2, Ll/h80$a;

    .line 146
    .line 147
    iget-object p2, p2, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 148
    .line 149
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    if-eq p2, p1, :cond_9

    .line 154
    .line 155
    :cond_8
    iget-object p2, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 156
    .line 157
    check-cast p2, Ll/h80$a;

    .line 158
    .line 159
    new-instance p3, Ljava/lang/ref/WeakReference;

    .line 160
    .line 161
    invoke-direct {p3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    iput-object p3, p2, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 165
    .line 166
    :cond_9
    :goto_2
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 167
    .line 168
    .line 169
    :cond_a
    :goto_3
    return-void
.end method

.method public i(Landroid/view/View;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(Ljava/lang/Object;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDATA;I)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDATA;I",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public l(Ljava/lang/Object;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDATA;IJ)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public m(Ljava/lang/Object;IJLandroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TDATA;IJ",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final n()Ll/h80$b;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/h80<",
            "TDATA;>.b<",
            "Ll/h80<",
            "TDATA;>.a;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/h80;->b:Ll/h80$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/h80$a;

    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Ll/h80$a;-><init>(Ll/h80;Ll/i80;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/h80$b;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Ll/h80$b;-><init>(Ll/h80;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    iget-object v2, v0, Ll/h80$b;->a:Ll/h80$b;

    .line 18
    .line 19
    iput-object v2, p0, Ll/h80;->b:Ll/h80$b;

    .line 20
    .line 21
    iput-object v1, v0, Ll/h80$b;->a:Ll/h80$b;

    .line 22
    .line 23
    return-object v0
.end method

.method public o()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/h80;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/h80;->e:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/h80;->d:Landroid/os/Handler;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Landroid/os/Handler;

    .line 14
    .line 15
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/h80;->d:Landroid/os/Handler;

    .line 23
    .line 24
    :cond_1
    new-instance v0, Ll/h80$c;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/h80$c;-><init>(Ll/h80;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/h80;->d:Landroid/os/Handler;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public p(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h80;->h:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public final q(Ll/h80$b;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h80<",
            "TDATA;>.b<",
            "Ll/h80<",
            "TDATA;>.a;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/h80;->a:Ll/h80$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, v0, Ll/h80$b;->b:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v2, Ll/h80$a;

    .line 9
    .line 10
    iget v2, v2, Ll/h80$a;->d:I

    .line 11
    .line 12
    iget-object v3, p1, Ll/h80$b;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v3, Ll/h80$a;

    .line 15
    .line 16
    iget v3, v3, Ll/h80$a;->d:I

    .line 17
    .line 18
    if-ge v2, v3, :cond_0

    .line 19
    .line 20
    iget-object v1, v0, Ll/h80$b;->a:Ll/h80$b;

    .line 21
    .line 22
    move-object v4, v1

    .line 23
    move-object v1, v0

    .line 24
    move-object v0, v4

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-nez v1, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/h80;->a:Ll/h80$b;

    .line 29
    .line 30
    iput-object v0, p1, Ll/h80$b;->a:Ll/h80$b;

    .line 31
    .line 32
    iput-object p1, p0, Ll/h80;->a:Ll/h80$b;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object p0, v1, Ll/h80$b;->a:Ll/h80$b;

    .line 36
    .line 37
    iput-object p0, p1, Ll/h80$b;->a:Ll/h80$b;

    .line 38
    .line 39
    iput-object p1, v1, Ll/h80$b;->a:Ll/h80$b;

    .line 40
    .line 41
    return-void
.end method

.method public final r(Ll/h80$b;)Ll/h80$b;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h80<",
            "TDATA;>.b<",
            "Ll/h80<",
            "TDATA;>.a;>;)",
            "Ll/h80<",
            "TDATA;>.b<",
            "Ll/h80<",
            "TDATA;>.a;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/h80$b;->b:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/h80$a;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    iput v2, v1, Ll/h80$a;->c:I

    .line 8
    .line 9
    move-object v1, v0

    .line 10
    check-cast v1, Ll/h80$a;

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    iput-wide v2, v1, Ll/h80$a;->b:J

    .line 15
    .line 16
    move-object v1, v0

    .line 17
    check-cast v1, Ll/h80$a;

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    iput v2, v1, Ll/h80$a;->d:I

    .line 21
    .line 22
    move-object v1, v0

    .line 23
    check-cast v1, Ll/h80$a;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    iput-object v2, v1, Ll/h80$a;->a:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    check-cast v0, Ll/h80$a;

    .line 29
    .line 30
    iput-object v2, v0, Ll/h80$a;->e:Ljava/lang/Object;

    .line 31
    .line 32
    iput-object v2, p1, Ll/h80$b;->a:Ll/h80$b;

    .line 33
    .line 34
    iget-object v0, p0, Ll/h80;->b:Ll/h80$b;

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iput-object p1, p0, Ll/h80;->b:Ll/h80$b;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iput-object v0, p1, Ll/h80$b;->a:Ll/h80$b;

    .line 42
    .line 43
    iput-object p1, p0, Ll/h80;->b:Ll/h80$b;

    .line 44
    .line 45
    :goto_0
    iget-object p0, p0, Ll/h80;->b:Ll/h80$b;

    .line 46
    .line 47
    return-object p0
.end method
