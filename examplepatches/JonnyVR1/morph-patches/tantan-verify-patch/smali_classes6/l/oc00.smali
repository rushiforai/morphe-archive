.class public final Ll/oc00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\'\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000eH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/oc00;",
        "",
        "Lcom/p1/mobile/putong/live/base/vap/mix/a;",
        "mixAnimPlugin",
        "<init>",
        "(Lcom/p1/mobile/putong/live/base/vap/mix/a;)V",
        "Landroid/view/MotionEvent;",
        "ev",
        "Lcom/p1/mobile/putong/live/base/vap/mix/c;",
        "b",
        "(Landroid/view/MotionEvent;)Lcom/p1/mobile/putong/live/base/vap/mix/c;",
        "",
        "x",
        "y",
        "Ll/mi80;",
        "frame",
        "",
        "a",
        "(IILl/mi80;)Z",
        "Lcom/p1/mobile/putong/live/base/vap/mix/a;",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/vap/mix/a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/vap/mix/a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/vap/mix/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/oc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(IILl/mi80;)Z
    .locals 1

    .line 1
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lt p1, p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p3}, Ll/mi80;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p3}, Ll/mi80;->b()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    if-gt p1, p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-lt p2, p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p3}, Ll/mi80;->d()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p3}, Ll/mi80;->a()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-int/2addr p0, p1

    .line 33
    if-gt p2, p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public final b(Landroid/view/MotionEvent;)Lcom/p1/mobile/putong/live/base/vap/mix/c;
    .locals 8
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/oc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->u()Ll/ap0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/ap0;->d()Ll/xol;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ll/xol;->getRealSize()Lkotlin/Pair;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ljava/lang/Number;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/Number;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v2, p0, Ll/oc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->u()Ll/ap0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ll/ap0;->e()Ll/ko0;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Ll/ko0;->b()Ll/jo0;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const/4 v3, 0x0

    .line 53
    if-eqz v2, :cond_4

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/jo0;->j()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iget-object v4, p0, Ll/oc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 60
    .line 61
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->u()Ll/ap0;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4}, Ll/ap0;->e()Ll/ko0;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v4}, Ll/ko0;->b()Ll/jo0;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    if-eqz v4, :cond_4

    .line 74
    .line 75
    invoke-virtual {v4}, Ll/jo0;->d()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    if-nez v0, :cond_0

    .line 82
    .line 83
    goto/16 :goto_2

    .line 84
    .line 85
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    const/4 v6, 0x1

    .line 90
    if-ne v5, v6, :cond_4

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    int-to-float v2, v2

    .line 97
    mul-float/2addr v5, v2

    .line 98
    int-to-float v1, v1

    .line 99
    div-float/2addr v5, v1

    .line 100
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    int-to-float v1, v4

    .line 105
    mul-float/2addr p1, v1

    .line 106
    int-to-float v0, v0

    .line 107
    div-float/2addr p1, v0

    .line 108
    iget-object v0, p0, Ll/oc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->s()Ll/i6j;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    invoke-virtual {v0}, Ll/i6j;->a()Landroid/util/SparseArray;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    if-eqz v0, :cond_1

    .line 121
    .line 122
    iget-object v1, p0, Ll/oc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->r()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Ll/v7j;

    .line 133
    .line 134
    if-eqz v0, :cond_1

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/v7j;->b()Ljava/util/ArrayList;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    goto :goto_0

    .line 141
    :cond_1
    move-object v0, v3

    .line 142
    :goto_0
    if-eqz v0, :cond_4

    .line 143
    .line 144
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_4

    .line 153
    .line 154
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    check-cast v1, Ll/e6j;

    .line 159
    .line 160
    iget-object v2, p0, Ll/oc00;->a:Lcom/p1/mobile/putong/live/base/vap/mix/a;

    .line 161
    .line 162
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/vap/mix/a;->v()Lcom/p1/mobile/putong/live/base/vap/mix/d;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    if-eqz v2, :cond_2

    .line 167
    .line 168
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/vap/mix/d;->a()Ljava/util/HashMap;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    if-eqz v2, :cond_2

    .line 173
    .line 174
    invoke-virtual {v1}, Ll/e6j;->d()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    check-cast v2, Lcom/p1/mobile/putong/live/base/vap/mix/Src;

    .line 183
    .line 184
    if-nez v2, :cond_3

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_3
    float-to-int v4, v5

    .line 188
    float-to-int v6, p1

    .line 189
    invoke-virtual {v1}, Ll/e6j;->a()Ll/mi80;

    .line 190
    .line 191
    .line 192
    move-result-object v7

    .line 193
    invoke-virtual {p0, v4, v6, v7}, Ll/oc00;->a(IILl/mi80;)Z

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    if-eqz v4, :cond_2

    .line 198
    .line 199
    new-instance p0, Lcom/p1/mobile/putong/live/base/vap/mix/c;

    .line 200
    .line 201
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/live/base/vap/mix/c;-><init>(Lcom/p1/mobile/putong/live/base/vap/mix/Src;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1}, Ll/e6j;->a()Ll/mi80;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/vap/mix/c;->b(Ll/mi80;)V

    .line 209
    .line 210
    .line 211
    return-object p0

    .line 212
    :cond_4
    :goto_2
    return-object v3
.end method
