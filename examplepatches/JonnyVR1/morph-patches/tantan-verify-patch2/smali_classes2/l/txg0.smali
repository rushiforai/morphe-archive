.class public final Ll/txg0;
.super Landroid/os/Handler;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 11

    .line 1
    iget p0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-eq p0, v0, :cond_b

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq p0, v0, :cond_5

    .line 11
    .line 12
    const/16 v0, 0xd

    .line 13
    .line 14
    if-ne p0, v0, :cond_4

    .line 15
    .line 16
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p0, Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    move v0, v1

    .line 25
    :goto_0
    if-ge v0, p1, :cond_a

    .line 26
    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ll/wqg0;

    .line 32
    .line 33
    iget-object v4, v3, Ll/wqg0;->a:Ll/feg0;

    .line 34
    .line 35
    iget v5, v3, Ll/wqg0;->d:I

    .line 36
    .line 37
    and-int/2addr v5, v2

    .line 38
    const/4 v6, 0x0

    .line 39
    if-nez v5, :cond_1

    .line 40
    .line 41
    iget-object v5, v3, Ll/wqg0;->e:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v7, v4, Ll/feg0;->d:Ll/cng0;

    .line 44
    .line 45
    invoke-virtual {v7, v5}, Ll/cng0;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object v7, v4, Ll/feg0;->e:Ll/zyg0;

    .line 50
    .line 51
    if-eqz v5, :cond_0

    .line 52
    .line 53
    iget-object v7, v7, Ll/zyg0;->b:Ll/mxg0;

    .line 54
    .line 55
    invoke-virtual {v7, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    iget-object v7, v7, Ll/zyg0;->b:Ll/mxg0;

    .line 60
    .line 61
    invoke-virtual {v7, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    move-object v5, v6

    .line 66
    :goto_1
    if-eqz v5, :cond_2

    .line 67
    .line 68
    invoke-virtual {v4, v5, v2, v3, v6}, Ll/feg0;->a(Landroid/graphics/Bitmap;ILl/wqg0;Ljava/lang/Exception;)V

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    invoke-virtual {v3}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    if-eqz v5, :cond_3

    .line 77
    .line 78
    iget-object v6, v4, Ll/feg0;->f:Ljava/util/WeakHashMap;

    .line 79
    .line 80
    invoke-virtual {v6, v5}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    if-eq v6, v3, :cond_3

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Ll/feg0;->b(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    iget-object v6, v4, Ll/feg0;->f:Ljava/util/WeakHashMap;

    .line 90
    .line 91
    invoke-virtual {v6, v5, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    :cond_3
    iget-object v4, v4, Ll/feg0;->c:Ll/jeg0;

    .line 95
    .line 96
    iget-object v4, v4, Ll/jeg0;->h:Ll/nvg0;

    .line 97
    .line 98
    invoke-virtual {v4, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v4, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 103
    .line 104
    .line 105
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_4
    new-instance p0, Ljava/lang/AssertionError;

    .line 109
    .line 110
    iget p1, p1, Landroid/os/Message;->what:I

    .line 111
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v1, "Unknown handler message received: "

    .line 115
    .line 116
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    throw p0

    .line 130
    :cond_5
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast p0, Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    move v0, v1

    .line 139
    :goto_3
    if-ge v0, p1, :cond_a

    .line 140
    .line 141
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    check-cast v3, Ll/teg0;

    .line 146
    .line 147
    iget-object v4, v3, Ll/teg0;->b:Ll/feg0;

    .line 148
    .line 149
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    .line 151
    .line 152
    iget-object v5, v3, Ll/teg0;->k:Ll/wqg0;

    .line 153
    .line 154
    iget-object v6, v3, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 155
    .line 156
    if-eqz v6, :cond_6

    .line 157
    .line 158
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    if-nez v7, :cond_6

    .line 163
    .line 164
    move v7, v2

    .line 165
    goto :goto_4

    .line 166
    :cond_6
    move v7, v1

    .line 167
    :goto_4
    if-nez v5, :cond_7

    .line 168
    .line 169
    if-eqz v7, :cond_9

    .line 170
    .line 171
    :cond_7
    iget-object v8, v3, Ll/teg0;->g:Ll/lxg0;

    .line 172
    .line 173
    iget-object v8, v8, Ll/lxg0;->a:Landroid/net/Uri;

    .line 174
    .line 175
    iget-object v8, v3, Ll/teg0;->p:Ljava/lang/Exception;

    .line 176
    .line 177
    iget-object v9, v3, Ll/teg0;->m:Landroid/graphics/Bitmap;

    .line 178
    .line 179
    iget v3, v3, Ll/teg0;->o:I

    .line 180
    .line 181
    if-eqz v5, :cond_8

    .line 182
    .line 183
    invoke-virtual {v4, v9, v3, v5, v8}, Ll/feg0;->a(Landroid/graphics/Bitmap;ILl/wqg0;Ljava/lang/Exception;)V

    .line 184
    .line 185
    .line 186
    :cond_8
    if-eqz v7, :cond_9

    .line 187
    .line 188
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    move v7, v1

    .line 193
    :goto_5
    if-ge v7, v5, :cond_9

    .line 194
    .line 195
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    check-cast v10, Ll/wqg0;

    .line 200
    .line 201
    invoke-virtual {v4, v9, v3, v10, v8}, Ll/feg0;->a(Landroid/graphics/Bitmap;ILl/wqg0;Ljava/lang/Exception;)V

    .line 202
    .line 203
    .line 204
    add-int/lit8 v7, v7, 0x1

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_9
    add-int/lit8 v0, v0, 0x1

    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_a
    return-void

    .line 211
    :cond_b
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 212
    .line 213
    check-cast p0, Ll/wqg0;

    .line 214
    .line 215
    iget-object p1, p0, Ll/wqg0;->a:Ll/feg0;

    .line 216
    .line 217
    invoke-virtual {p0}, Ll/wqg0;->b()Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-virtual {p1, p0}, Ll/feg0;->b(Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    return-void
.end method
