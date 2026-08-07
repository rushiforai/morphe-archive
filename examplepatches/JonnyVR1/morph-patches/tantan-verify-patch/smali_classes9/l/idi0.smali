.class public Ll/idi0;
.super Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;
.source "SourceFile"


# instance fields
.field public v:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/idi0;->v:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public A()Z
    .locals 11

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRenderContentHeight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRealWidth()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 18
    .line 19
    iget-object v3, v3, Ll/qrc0;->p:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 20
    .line 21
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_5

    .line 26
    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 28
    .line 29
    iget v3, v3, Ll/qrc0;->k:I

    .line 30
    .line 31
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 32
    .line 33
    invoke-virtual {v4}, Ll/dxi0;->m()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const/4 v5, 0x1

    .line 38
    sub-int/2addr v4, v5

    .line 39
    if-ge v3, v4, :cond_5

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_5

    .line 48
    .line 49
    new-instance v3, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 55
    .line 56
    invoke-virtual {v4}, Ll/dxi0;->m()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    sub-int/2addr v4, v5

    .line 61
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    sub-int/2addr v7, v5

    .line 68
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    check-cast v6, Ll/orc0;

    .line 73
    .line 74
    iget v7, v6, Ll/orc0;->a:I

    .line 75
    .line 76
    iget v8, v6, Ll/orc0;->c:I

    .line 77
    .line 78
    add-int/2addr v7, v8

    .line 79
    const/4 v8, 0x0

    .line 80
    move v9, v8

    .line 81
    :goto_0
    if-ge v9, v1, :cond_0

    .line 82
    .line 83
    iget-object v10, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 84
    .line 85
    iget v10, v10, Ll/qrc0;->k:I

    .line 86
    .line 87
    if-le v4, v10, :cond_0

    .line 88
    .line 89
    iget v10, v6, Ll/orc0;->f:I

    .line 90
    .line 91
    if-le v4, v10, :cond_0

    .line 92
    .line 93
    invoke-virtual {p0, v4, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->D(III)Ll/orc0;

    .line 94
    .line 95
    .line 96
    move-result-object v10

    .line 97
    iput v4, v10, Ll/orc0;->f:I

    .line 98
    .line 99
    invoke-interface {v3, v8, v10}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget v10, v10, Ll/orc0;->c:I

    .line 103
    .line 104
    add-int/2addr v9, v10

    .line 105
    add-int/lit8 v4, v4, -0x1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_4

    .line 113
    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v1, "\u989d\u5916\u8865\u5145\u6570\u636e"

    .line 117
    .line 118
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v1, "TantanListView"

    .line 133
    .line 134
    invoke-static {v1, v0}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    move v0, v8

    .line 138
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-ge v0, v1, :cond_3

    .line 143
    .line 144
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Ll/orc0;

    .line 149
    .line 150
    iput v8, v1, Ll/orc0;->b:I

    .line 151
    .line 152
    iput v7, v1, Ll/orc0;->a:I

    .line 153
    .line 154
    iget v2, v1, Ll/orc0;->c:I

    .line 155
    .line 156
    add-int/2addr v7, v2

    .line 157
    iget v2, v1, Ll/orc0;->h:I

    .line 158
    .line 159
    if-ne v2, v5, :cond_1

    .line 160
    .line 161
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 162
    .line 163
    iget-object v4, v1, Ll/orc0;->g:Ll/ns2;

    .line 164
    .line 165
    iget-object v4, v4, Ll/ns2;->a:Landroid/view/View;

    .line 166
    .line 167
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->addView(Landroid/view/View;)V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_1
    const/4 v4, 0x2

    .line 172
    if-ne v2, v4, :cond_2

    .line 173
    .line 174
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 175
    .line 176
    iget-object v4, v1, Ll/orc0;->g:Ll/ns2;

    .line 177
    .line 178
    iget-object v4, v4, Ll/ns2;->a:Landroid/view/View;

    .line 179
    .line 180
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    iget-object v9, v1, Ll/orc0;->g:Ll/ns2;

    .line 185
    .line 186
    iget-object v9, v9, Ll/ns2;->a:Landroid/view/View;

    .line 187
    .line 188
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    invoke-virtual {v2, v4, v6, v9}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 193
    .line 194
    .line 195
    :cond_2
    :goto_2
    const/4 v2, 0x3

    .line 196
    iput v2, v1, Ll/orc0;->h:I

    .line 197
    .line 198
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 199
    .line 200
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    add-int/lit8 v0, v0, 0x1

    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_3
    return v5

    .line 207
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->l:Ll/qrc0;

    .line 208
    .line 209
    iget v1, v1, Ll/qrc0;->k:I

    .line 210
    .line 211
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 212
    .line 213
    invoke-virtual {p0}, Ll/dxi0;->m()I

    .line 214
    .line 215
    .line 216
    :cond_5
    return v0
.end method

.method public E0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->h:Ll/dxi0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "TantanListView"

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->f:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->m(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "onMeasure \u6e05\u7a7anotify size = "

    .line 18
    .line 19
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->l()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {v0, p1}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    const-string v0, "onMeasure"

    .line 38
    .line 39
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->R(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v1, "onMeasure \u53d8\u5316\u4f4d\u7f6e = "

    .line 46
    .line 47
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->l()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {v0, p1}, Ll/yor;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->P()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public F0()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->i:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/lit8 v1, v1, -0x1

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/orc0;

    .line 24
    .line 25
    iget v1, v0, Ll/orc0;->a:I

    .line 26
    .line 27
    iget v0, v0, Ll/orc0;->c:I

    .line 28
    .line 29
    add-int/2addr v1, v0

    .line 30
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q:I

    .line 31
    .line 32
    add-int/2addr v1, v0

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRealHeight()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-lt v1, v0, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->getRealHeight()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_0
    return v1

    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public U()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->k:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/d;->g()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->j(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
