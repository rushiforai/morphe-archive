.class public Ll/uih0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile p:Ll/uih0;

.field public static q:Z


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/byd0;

.field public final c:Ll/jxd0;

.field public final d:Ll/jxd0;

.field public final e:Ll/jxd0;

.field public final f:Ll/vxd0;

.field public final g:Ll/vxd0;

.field public final h:Ll/vxd0;

.field public final i:Ll/vxd0;

.field public final j:Ll/jxd0;

.field public k:J

.field public l:Z

.field public final m:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final n:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/uih0;->a:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance v0, Ll/byd0;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "new_swipe_guide_swipe_"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-wide/16 v2, 0x0

    .line 31
    .line 32
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-direct {v0, v1, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/uih0;->b:Ll/byd0;

    .line 40
    .line 41
    new-instance v0, Ll/jxd0;

    .line 42
    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v4, "swipe_guide_right_guide_show_"

    .line 46
    .line 47
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-direct {v0, v1, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Ll/uih0;->c:Ll/jxd0;

    .line 67
    .line 68
    new-instance v0, Ll/jxd0;

    .line 69
    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string v5, "swipe_guide_left_guide_show_"

    .line 73
    .line 74
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-direct {v0, v1, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 92
    .line 93
    new-instance v0, Ll/jxd0;

    .line 94
    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v5, "swipe_guide_setting_guide_show_"

    .line 98
    .line 99
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-direct {v0, v1, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 114
    .line 115
    .line 116
    iput-object v0, p0, Ll/uih0;->e:Ll/jxd0;

    .line 117
    .line 118
    new-instance v0, Ll/vxd0;

    .line 119
    .line 120
    new-instance v1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v5, "swipe_guide_total_swipe_count_"

    .line 123
    .line 124
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    const/4 v5, 0x0

    .line 139
    invoke-direct {v0, v1, v5}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 140
    .line 141
    .line 142
    iput-object v0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 143
    .line 144
    new-instance v0, Ll/vxd0;

    .line 145
    .line 146
    new-instance v1, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    const-string v6, "swipe_guide_total_swipe_left_count_"

    .line 149
    .line 150
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-direct {v0, v1, v5}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 165
    .line 166
    .line 167
    iput-object v0, p0, Ll/uih0;->g:Ll/vxd0;

    .line 168
    .line 169
    new-instance v0, Ll/vxd0;

    .line 170
    .line 171
    new-instance v1, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string v6, "swipe_guide_group_swipe_count_left_show_"

    .line 174
    .line 175
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    const/4 v6, -0x1

    .line 190
    invoke-direct {v0, v1, v6}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 191
    .line 192
    .line 193
    iput-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 194
    .line 195
    new-instance v0, Ll/vxd0;

    .line 196
    .line 197
    new-instance v1, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    const-string v7, "swipe_guide_group_swipe_count_right_show_"

    .line 200
    .line 201
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v7

    .line 208
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-direct {v0, v1, v6}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 216
    .line 217
    .line 218
    iput-object v0, p0, Ll/uih0;->i:Ll/vxd0;

    .line 219
    .line 220
    new-instance v0, Ll/jxd0;

    .line 221
    .line 222
    new-instance v1, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    const-string v6, "guide_to_swipe_has_shown_first_like"

    .line 225
    .line 226
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Ll/uih0;->t1()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v6

    .line 233
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-direct {v0, v1, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 241
    .line 242
    .line 243
    iput-object v0, p0, Ll/uih0;->j:Ll/jxd0;

    .line 244
    .line 245
    iput-wide v2, p0, Ll/uih0;->k:J

    .line 246
    .line 247
    iput-boolean v5, p0, Ll/uih0;->l:Z

    .line 248
    .line 249
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iput-object v0, p0, Ll/uih0;->m:Lrx/subjects/a;

    .line 254
    .line 255
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    iput-object v0, p0, Ll/uih0;->n:Lrx/subjects/b;

    .line 260
    .line 261
    iput-boolean v5, p0, Ll/uih0;->o:Z

    .line 262
    .line 263
    return-void
.end method

.method public static synthetic A()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

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
    return-void
.end method

.method public static synthetic C(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uih0;->R0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method

.method public static synthetic D(JLl/uxj0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p0

    .line 6
    const-wide/16 p0, 0x320

    .line 7
    .line 8
    cmp-long p0, v0, p0

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic E(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uih0;->P0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 6

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v4, Ll/rgh0;

    .line 5
    .line 6
    invoke-direct {v4, p2}, Ll/rgh0;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    new-instance v5, Ll/lhh0;

    .line 10
    .line 11
    invoke-direct {v5, p2}, Ll/lhh0;-><init>(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    move-object v0, p0

    .line 15
    move-object v1, p1

    .line 16
    move-object v2, p2

    .line 17
    move-object v3, p3

    .line 18
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic G(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 6

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v4, Ll/rgh0;

    .line 5
    .line 6
    invoke-direct {v4, p2}, Ll/rgh0;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    new-instance v5, Ll/ohh0;

    .line 10
    .line 11
    invoke-direct {v5, p2}, Ll/ohh0;-><init>(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    move-object v0, p0

    .line 15
    move-object v1, p1

    .line 16
    move-object v2, p2

    .line 17
    move-object v3, p3

    .line 18
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;)V
    .locals 1

    .line 1
    sget v0, Ll/dbc0;->Gq:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J(Ll/uih0;Ll/x20;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/kcg0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uih0;->K0(Ll/x20;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/kcg0;Z)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p1, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, Landroid/graphics/Bitmap;

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/end0;->a(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Ll/dnd0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget p1, Ll/qa00;->o:I

    .line 39
    .line 40
    int-to-float p1, p1

    .line 41
    invoke-virtual {p0, p1}, Ll/dnd0;->e(F)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic L(Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/widget/FrameLayout;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic M(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F0:Ll/kcg0;

    .line 23
    .line 24
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->Gq:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic P(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uih0;->Q0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 10
    .line 11
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    new-instance v4, Ll/tgh0;

    .line 15
    .line 16
    invoke-direct {v4, v2}, Ll/tgh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V

    .line 17
    .line 18
    .line 19
    new-instance v5, Ll/nhh0;

    .line 20
    .line 21
    invoke-direct {v5, p1}, Ll/nhh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 22
    .line 23
    .line 24
    move-object v3, p2

    .line 25
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 v0, 0x0

    .line 9
    cmpl-float p1, p1, v0

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v0, v0, [F

    .line 17
    .line 18
    fill-array-data v0, :array_0

    .line 19
    .line 20
    .line 21
    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-wide/16 v0, 0x12c

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic S(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uih0;->B0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;FF)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic U(Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance p2, Ll/bri0;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object p0
.end method

.method public static U0(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/b;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    instance-of v1, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Z5()Lcom/p1/mobile/putong/core/newui/main/a;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    return-object v0

    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->Z5()Lcom/p1/mobile/putong/core/newui/main/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/main/a;->t6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lcom/p1/mobile/android/app/Frag;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    instance-of v1, p0, Ll/cvl;

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    check-cast p0, Ll/cvl;

    .line 33
    .line 34
    invoke-interface {p0}, Ll/cvl;->Y()Lcom/p1/mobile/android/app/Frag;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :cond_2
    instance-of v1, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 39
    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_3
    :goto_0
    return-object v0
.end method

.method public static synthetic V(Landroid/view/View;Landroid/util/Pair;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/high16 v2, 0x7d000000

    .line 14
    .line 15
    invoke-static {v0, v1, p0, v2}, Ll/bsj0;->p(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p1, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static synthetic W(Ll/uih0;Ll/x20;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uih0;->F0(Ll/x20;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/kcg0;)V

    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->Gq:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static X0()V
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "-145"

    .line 2
    .line 3
    invoke-static {v0}, Ll/uih0;->r0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/fsb0;->x0(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    :catch_0
    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic Y(Ll/uih0;Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Lcom/p1/mobile/putong/core/newui/home/b;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uih0;->M0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Lcom/p1/mobile/putong/core/newui/home/b;Ll/kcg0;)V

    return-void
.end method

.method public static synthetic Z(Ll/uih0;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uih0;->C0(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 6
    .line 7
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    new-instance v4, Ll/tgh0;

    .line 11
    .line 12
    invoke-direct {v4, v2}, Ll/tgh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V

    .line 13
    .line 14
    .line 15
    new-instance v5, Ll/mhh0;

    .line 16
    .line 17
    invoke-direct {v5, p1}, Ll/mhh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    .line 18
    .line 19
    .line 20
    move-object v1, p1

    .line 21
    move-object v3, p2

    .line 22
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a0(Ll/uih0;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uih0;->H0(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->M1:Ll/kcg0;

    .line 23
    .line 24
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic b0(JLl/uxj0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p0

    .line 6
    const-wide/16 p0, 0x320

    .line 7
    .line 8
    cmp-long p0, v0, p0

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic c(Landroid/view/View;IILandroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    check-cast p4, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    cmpl-float v1, p4, v0

    .line 14
    .line 15
    if-lez v1, :cond_0

    .line 16
    .line 17
    sub-float/2addr p4, v0

    .line 18
    int-to-float p1, p1

    .line 19
    mul-float/2addr p1, p4

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 21
    .line 22
    .line 23
    int-to-float p1, p2

    .line 24
    mul-float/2addr p4, p1

    .line 25
    invoke-virtual {p0, p4}, Landroid/view/View;->setRotation(F)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/view/View;->setRotation(F)V

    .line 34
    .line 35
    .line 36
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    float-to-double p1, p1

    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    float-to-double v0, p0

    .line 46
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    .line 47
    .line 48
    .line 49
    move-result-wide p0

    .line 50
    double-to-float p0, p0

    .line 51
    invoke-static {p3, p0}, Ll/uih0;->j0(Landroid/view/View;F)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic c0(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uih0;->D0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/uxj0;)V

    return-void
.end method

.method public static c1()V
    .locals 2

    .line 1
    sget-object v0, Ll/uih0;->p:Ll/uih0;

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
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/uih0;->n:Lrx/subjects/b;

    .line 12
    .line 13
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 19
    .line 20
    iget-object v0, v0, Ll/uih0;->m:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 26
    .line 27
    iget-object v0, v0, Ll/uih0;->a:Lrx/subjects/b;

    .line 28
    .line 29
    invoke-virtual {v0}, Lrx/subjects/b;->onCompleted()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    sput-object v0, Ll/uih0;->p:Ll/uih0;

    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/uih0;ZLl/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uih0;->J0(ZLl/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d0(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/bri0;

    .line 5
    .line 6
    invoke-direct {p2, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->Gq:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/x20;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/kcg0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 5
    .line 6
    const/4 p3, 0x0

    .line 7
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F0:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic f(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uih0;->I0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/uih0;Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uih0;->L0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/dbc0;->Gq:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic g0(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/uih0;->j0(Landroid/view/View;F)V

    return-void
.end method

.method public static g1(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Ll/uih0;->r0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic h(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/dbc0;->Gq:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Ll/uih0;->r0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->Gq:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic j()V
    .locals 0

    .line 1
    return-void
.end method

.method public static j0(Landroid/view/View;F)V
    .locals 1
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    :goto_0
    if-eqz p0, :cond_2

    .line 9
    .line 10
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/opt/BifrostLayout;->z(F)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    :goto_1
    return-void
.end method

.method public static synthetic k(Ll/uih0;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uih0;->E0(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/core/ui/PictureView;",
            "Ll/y20<",
            "Landroid/graphics/drawable/Drawable;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/uih0;->l0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v4, Ll/rgh0;

    .line 9
    .line 10
    invoke-direct {v4, p2}, Ll/rgh0;-><init>(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    new-instance v5, Ll/sgh0;

    .line 14
    .line 15
    invoke-direct {v5, p2}, Ll/sgh0;-><init>(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    move-object v1, p1

    .line 19
    move-object v2, p2

    .line 20
    move-object v3, p3

    .line 21
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static l0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/view/View;",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/core/ui/PictureView;",
            "Ll/y20<",
            "Landroid/graphics/drawable/Drawable;",
            ">;",
            "Ll/x20;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    if-nez p6, :cond_0

    .line 8
    .line 9
    move-object v4, p0

    .line 10
    new-instance p0, Ll/cih0;

    .line 11
    .line 12
    move-object p6, p5

    .line 13
    move-object p5, p4

    .line 14
    move-object p4, p3

    .line 15
    move-object p3, p2

    .line 16
    move-object p2, p1

    .line 17
    move-object p1, v4

    .line 18
    invoke-direct/range {p0 .. p6}, Ll/cih0;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    move-object v4, p0

    .line 26
    move-object p6, p5

    .line 27
    move-object p5, p4

    .line 28
    move-object p4, p3

    .line 29
    move-object p3, p2

    .line 30
    move-object p2, p1

    .line 31
    new-instance v0, Ll/dih0;

    .line 32
    .line 33
    move-object v1, p2

    .line 34
    move-object v2, p3

    .line 35
    move-object v3, p4

    .line 36
    move-object v5, p5

    .line 37
    move-object v6, p6

    .line 38
    invoke-direct/range {v0 .. v6}, Ll/dih0;-><init>(Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance p1, Ll/fih0;

    .line 62
    .line 63
    invoke-direct {p1, v4, p6}, Ll/fih0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance p1, Ll/gih0;

    .line 71
    .line 72
    invoke-direct {p1, p2}, Ll/gih0;-><init>(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {}, Ll/psd0;->y()Lrx/c$d;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v4, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    new-instance p1, Ll/hih0;

    .line 92
    .line 93
    invoke-direct {p1, p4, v4, p5}, Ll/hih0;-><init>(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 94
    .line 95
    .line 96
    new-instance p2, Ll/iih0;

    .line 97
    .line 98
    invoke-direct {p2}, Ll/iih0;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 6

    .line 1
    iget-object v2, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v4, Ll/tgh0;

    .line 7
    .line 8
    invoke-direct {v4, v2}, Ll/tgh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V

    .line 9
    .line 10
    .line 11
    new-instance v5, Ll/phh0;

    .line 12
    .line 13
    invoke-direct {v5, p2}, Ll/phh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 14
    .line 15
    .line 16
    move-object v0, p0

    .line 17
    move-object v1, p1

    .line 18
    move-object v3, p3

    .line 19
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static m0()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/d09;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-boolean v0, Ll/uih0;->q:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    return v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return v0
.end method

.method public static m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/b;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/b;->e:Lv/VLinear;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-gtz p0, :cond_4

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-lez p0, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Ll/uih0$a;

    .line 53
    .line 54
    invoke-direct {v2, v0, v1, p1, p2}, Ll/uih0$a;-><init>(Landroid/widget/FrameLayout;Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/qhh0;

    .line 61
    .line 62
    invoke-direct {p0, v1, v0, v2, p2}, Ll/qhh0;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Landroid/widget/FrameLayout;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Ljava/lang/Runnable;)V

    .line 63
    .line 64
    .line 65
    const-wide/16 v0, 0x190

    .line 66
    .line 67
    invoke-virtual {p1, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_4
    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_5
    :goto_1
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic o(Ll/uih0;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uih0;->N0(Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 6

    .line 1
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v4, Ll/tgh0;

    .line 7
    .line 8
    invoke-direct {v4, v2}, Ll/tgh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V

    .line 9
    .line 10
    .line 11
    new-instance v5, Ll/ugh0;

    .line 12
    .line 13
    invoke-direct {v5, p1}, Ll/ugh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    .line 14
    .line 15
    .line 16
    move-object v0, p0

    .line 17
    move-object v1, p1

    .line 18
    move-object v3, p2

    .line 19
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic q(ZLl/x20;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/kcg0;Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p4, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    sget-object p0, Ll/y9;->Companion:Ll/y9$a;

    .line 5
    .line 6
    invoke-virtual {p0, p4}, Ll/y9$a;->o(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 13
    .line 14
    invoke-static {p0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->M1:Ll/kcg0;

    .line 18
    .line 19
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic r(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static r0(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->new_()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, "image/jpeg"

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 16
    .line 17
    const/16 v2, 0x258

    .line 18
    .line 19
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 20
    .line 21
    const/16 v2, 0x320

    .line 22
    .line 23
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 46
    .line 47
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const-string v3, "female"

    .line 52
    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v4, "male"

    .line 60
    .line 61
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_0

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const-string v2, "both"

    .line 72
    .line 73
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_1

    .line 78
    .line 79
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 88
    .line 89
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_1

    .line 94
    .line 95
    :cond_0
    invoke-static {v4}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 100
    .line 101
    const-string v1, "\u4f1a\u98de\u7684\u9c7c"

    .line 102
    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 106
    .line 107
    const-string v2, "aquarius"

    .line 108
    .line 109
    invoke-static {v2}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 114
    .line 115
    const/16 v1, 0x17

    .line 116
    .line 117
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 122
    .line 123
    const-string v1, "https://auto.tancdn.com/v1/raw/7d782cb5-c7be-4b16-badc-8ed85093b37b07.jpg"

    .line 124
    .line 125
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 126
    .line 127
    return-object v0

    .line 128
    :cond_1
    invoke-static {v3}, Lcom/p1/mobile/putong/data/Gender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Gender;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 133
    .line 134
    const-string v1, "\u5706\u5706\u7684\u6770\u59ae"

    .line 135
    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 139
    .line 140
    const-string v2, "leo"

    .line 141
    .line 142
    invoke-static {v2}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 147
    .line 148
    const/16 v1, 0x19

    .line 149
    .line 150
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 155
    .line 156
    const-string v1, "https://auto.tancdn.com/v1/raw/5b106d80-616a-4d70-9c42-f3348090e0de07.jpg"

    .line 157
    .line 158
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 159
    .line 160
    return-object v0
.end method

.method public static synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/dbc0;->Gq:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static s0()Ll/uih0;
    .locals 2

    .line 1
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/uih0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/uih0;->p:Ll/uih0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/uih0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/uih0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/uih0;->p:Ll/uih0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static synthetic t(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-ne p6, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    move-object v1, p2

    .line 11
    move-object p2, p0

    .line 12
    move-object p0, p1

    .line 13
    move-object p1, v1

    .line 14
    invoke-static/range {p0 .. p5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic u(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uih0;->O0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V
    .locals 7

    .line 1
    const/4 v6, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/uih0;->l0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static v0(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/kih0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/kih0;-><init>(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic w(Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;)Landroid/util/Pair;
    .locals 11

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    invoke-static {v0, v3, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v7
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    new-instance v0, Landroid/graphics/Canvas;

    .line 16
    .line 17
    invoke-direct {v0, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v3, p2, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 31
    .line 32
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    move-object v8, v3

    .line 37
    check-cast v8, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/4 v9, 0x1

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    invoke-static {p1, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    if-nez v3, :cond_2

    .line 57
    .line 58
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 59
    .line 60
    new-instance v3, Ll/lih0;

    .line 61
    .line 62
    invoke-direct {v3}, Ll/lih0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0, v9}, Lrx/c;->take(I)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    new-instance v0, Ll/mih0;

    .line 78
    .line 79
    move-object v3, p0

    .line 80
    move-object v1, p1

    .line 81
    move-object v4, p2

    .line 82
    move-object v2, p3

    .line 83
    move-object v5, p4

    .line 84
    move-object/from16 v6, p5

    .line 85
    .line 86
    invoke-direct/range {v0 .. v6}, Ll/mih0;-><init>(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v10, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    iget-object v0, p2, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 97
    .line 98
    invoke-virtual {v0, v9}, Lrx/c;->skip(I)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/nih0;

    .line 103
    .line 104
    invoke-direct {v1}, Ll/nih0;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0, v9}, Lrx/c;->take(I)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Ll/oih0;

    .line 120
    .line 121
    invoke-direct {v1, p3, v6}, Ll/oih0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    :cond_2
    invoke-static {v7, v8}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    return-object v0

    .line 136
    :catch_0
    move-exception v0

    .line 137
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    const/4 v0, 0x0

    .line 141
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 142
    .line 143
    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    return-object v0
.end method

.method public static w0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/uih0;->s0()Ll/uih0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/uih0;->j:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 28
    .line 29
    iget-object v0, v0, Ll/uih0;->d:Ll/jxd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 44
    .line 45
    iget-object v0, v0, Ll/uih0;->e:Ll/jxd0;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    sget-object v0, Ll/uih0;->p:Ll/uih0;

    .line 60
    .line 61
    iget-object v0, v0, Ll/uih0;->h:Ll/vxd0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    sget-object v1, Ll/uih0;->p:Ll/uih0;

    .line 74
    .line 75
    iget-object v1, v1, Ll/uih0;->f:Ll/vxd0;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Ljava/lang/Integer;

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eq v0, v1, :cond_0

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    const/4 v0, 0x0

    .line 91
    sput-boolean v0, Ll/uih0;->q:Z

    .line 92
    .line 93
    invoke-static {}, Ll/uih0;->X0()V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 98
    sput-boolean v0, Ll/uih0;->q:Z

    .line 99
    .line 100
    const/4 v0, 0x0

    .line 101
    sput-object v0, Ll/uih0;->p:Ll/uih0;

    .line 102
    .line 103
    return-void
.end method

.method public static synthetic x(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uih0;->G0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;FF)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->Gq:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static y0(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "-145"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->Gq:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uih0;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic B0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;FF)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/Animator;->isRunning()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setRotation(F)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p2}, Landroid/view/View;->setPivotX(F)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p3}, Landroid/view/View;->setPivotY(F)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic C0(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uih0;->b:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    cmp-long p0, p0, v0

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/uxj0;)V
    .locals 3

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "-145"

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-boolean p2, p0, Ll/uih0;->l:Z

    .line 20
    .line 21
    if-nez p2, :cond_1

    .line 22
    .line 23
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/animation/Animator;->isRunning()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    const/4 v0, 0x1

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p2, v1}, Landroid/view/View;->setPivotX(F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    int-to-float v1, v1

    .line 56
    const/high16 v2, 0x3fc00000    # 1.5f

    .line 57
    .line 58
    mul-float/2addr v1, v2

    .line 59
    invoke-virtual {p2, v1}, Landroid/view/View;->setPivotY(F)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 65
    .line 66
    .line 67
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public final synthetic E0(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uih0;->o1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic F0(Ll/x20;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/kcg0;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F0:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/uih0;->b:Ll/byd0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide p1

    .line 24
    const-wide/16 v0, 0x0

    .line 25
    .line 26
    cmp-long p1, p1, v0

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Ll/uih0;->b:Ll/byd0;

    .line 31
    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide p2

    .line 36
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p1, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/uih0;->o0()V

    .line 44
    .line 45
    .line 46
    const-string p0, "e_new_user_guide_to_swipe_right"

    .line 47
    .line 48
    const-string p1, "p_suggest_users_home_view"

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;FF)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/Animator;->isRunning()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotation(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setTranslationX(F)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->setPivotX(F)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p3}, Landroid/view/View;->setPivotY(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic H0(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uih0;->b:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    cmp-long p0, p0, v0

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/uxj0;)V
    .locals 2

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->r6()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "-145"

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-boolean p2, p0, Ll/uih0;->l:Z

    .line 20
    .line 21
    if-nez p2, :cond_1

    .line 22
    .line 23
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/animation/Animator;->isRunning()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    const/4 v0, 0x1

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/4 p2, 0x0

    .line 36
    invoke-virtual {p1, p2}, Landroid/view/View;->setPivotX(F)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    int-to-float p2, p2

    .line 44
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 45
    .line 46
    mul-float/2addr p2, v1

    .line 47
    invoke-virtual {p1, p2}, Landroid/view/View;->setPivotY(F)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 53
    .line 54
    .line 55
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-boolean p2, p0, Ll/uih0;->l:Z

    .line 59
    .line 60
    if-eqz p2, :cond_2

    .line 61
    .line 62
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/animation/Animator;->isRunning()Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_2

    .line 69
    .line 70
    const/4 p2, 0x0

    .line 71
    iput-boolean p2, p0, Ll/uih0;->l:Z

    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public final synthetic J0(ZLl/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uih0;->o1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic K0(Ll/x20;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/kcg0;Z)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->M1:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    if-eqz p4, :cond_0

    .line 13
    .line 14
    sget-object p0, Ll/y9;->Companion:Ll/y9$a;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Ll/y9$a;->o(Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Ll/uih0;->b:Ll/byd0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ljava/lang/Long;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 30
    .line 31
    .line 32
    move-result-wide p1

    .line 33
    const-wide/16 p3, 0x0

    .line 34
    .line 35
    cmp-long p1, p1, p3

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ll/uih0;->b:Ll/byd0;

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide p2

    .line 45
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p1, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/uih0;->o0()V

    .line 53
    .line 54
    .line 55
    const-string p0, "e_new_user_guide_to_swipe_right"

    .line 56
    .line 57
    const-string p1, "p_suggest_users_home_view"

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uih0;->n1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Ll/uih0;->v0(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic M0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Lcom/p1/mobile/putong/core/newui/home/b;Ll/kcg0;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/uih0;->v0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/uih0;->n0()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->e6()V

    .line 14
    .line 15
    .line 16
    invoke-static {p3}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "e_new_user_guide_to_swipe_left"

    .line 20
    .line 21
    const-string p1, "p_suggest_users_home_view"

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic N0(Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 7

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->b3()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    move-object v0, p1

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->u1()V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    const-string v0, "e_new_user_guide_to_swipe_left"

    .line 23
    .line 24
    const-string v1, "p_suggest_users_home_view"

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/view/ViewStub;->getInflatedId()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    move-object v2, p2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;

    .line 39
    .line 40
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object v0, p0, Ll/uih0;->a:Lrx/subjects/b;

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    const/4 v6, 0x1

    .line 51
    invoke-virtual {p2, v6}, Lrx/c;->take(I)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    new-instance v0, Ll/vgh0;

    .line 56
    .line 57
    invoke-direct {v0, p0, v2}, Ll/vgh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    new-instance v0, Ll/wgh0;

    .line 69
    .line 70
    invoke-direct {v0, p0, v2, p3, p2}, Ll/wgh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Lcom/p1/mobile/putong/core/newui/home/b;Ll/kcg0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->setViewTouchListener(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;)V

    .line 74
    .line 75
    .line 76
    const/4 p2, 0x0

    .line 77
    invoke-virtual {v2, p2}, Landroid/view/View;->setAlpha(F)V

    .line 78
    .line 79
    .line 80
    new-instance v4, Ll/ygh0;

    .line 81
    .line 82
    invoke-direct {v4, v2}, Ll/ygh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v5, Ll/zgh0;

    .line 90
    .line 91
    invoke-direct {v5, v2}, Ll/zgh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;)V

    .line 92
    .line 93
    .line 94
    move-object v1, p1

    .line 95
    move-object v3, p4

    .line 96
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 97
    .line 98
    .line 99
    iput-boolean v6, p0, Ll/uih0;->o:Z

    .line 100
    .line 101
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l2:Lrx/subjects/b;

    .line 106
    .line 107
    const-string p1, "left guide"

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final synthetic O0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->b3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p1, p3, p4}, Ll/uih0;->q0(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->b3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p1, p3, p4}, Ll/uih0;->q0(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->u1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p1, p3}, Ll/uih0;->p0(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->u1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p1, p3}, Ll/uih0;->p0(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uih0;->b:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public T0()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/uih0;->p1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/uih0;->b:Ll/byd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Long;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long p0, v0, v2

    .line 22
    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public V0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uih0;->a:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/uih0;->g:Ll/vxd0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    add-int/lit8 p1, p1, 0x1

    .line 37
    .line 38
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public Y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Z0(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 7

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p3}, Landroid/view/ViewStub;->getInflatedId()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    instance-of p0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    move-object p0, p2

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move-object p0, p2

    .line 40
    :goto_0
    new-instance p3, Ll/rih0;

    .line 41
    .line 42
    invoke-direct {p3, p1, p2, v0, p4}, Ll/rih0;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, p0, p3}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    sget v0, Ll/kec0;->zc:I

    .line 50
    .line 51
    invoke-virtual {p3, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    instance-of v0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    move-object v0, p2

    .line 63
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    goto :goto_1

    .line 70
    :cond_3
    move-object v0, p2

    .line 71
    :goto_1
    new-instance v1, Ll/sih0;

    .line 72
    .line 73
    move-object v2, p0

    .line 74
    move-object v5, p1

    .line 75
    move-object v3, p2

    .line 76
    move-object v4, p3

    .line 77
    move-object v6, p4

    .line 78
    invoke-direct/range {v1 .. v6}, Ll/sih0;-><init>(Ll/uih0;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v5, v0, v1}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public a1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/uih0;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_4

    .line 6
    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p1}, Ll/uih0;->U0(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/b;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 35
    .line 36
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    new-instance v1, Ll/mgh0;

    .line 43
    .line 44
    invoke-direct {v1, p1, p2, v0, p0}, Ll/mgh0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p0, p2, v1}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->v1:Landroid/view/ViewStub;

    .line 51
    .line 52
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_4

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/view/ViewStub;->getInflatedId()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    const/4 v3, -0x1

    .line 63
    if-eq v2, v3, :cond_4

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/view/ViewStub;->getInflatedId()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_4

    .line 84
    .line 85
    new-instance v2, Ll/xgh0;

    .line 86
    .line 87
    invoke-direct {v2, p1, p2, v1, v0}, Ll/xgh0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p0, p2, v2}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 91
    .line 92
    .line 93
    :cond_4
    :goto_0
    return-void
.end method

.method public b1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/uih0;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_4

    .line 6
    .line 7
    if-eqz p1, :cond_4

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-static {p1}, Ll/uih0;->U0(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/b;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    if-nez v5, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-nez v4, :cond_2

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_2
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 39
    .line 40
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_3

    .line 45
    .line 46
    new-instance v0, Ll/tih0;

    .line 47
    .line 48
    move-object v1, p1

    .line 49
    move-object v3, p2

    .line 50
    invoke-direct/range {v0 .. v5}, Ll/tih0;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v5, v2, v0}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    move-object v1, p1

    .line 58
    move-object v3, p2

    .line 59
    :goto_0
    iget-object p0, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->S:Landroid/view/ViewStub;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/ViewStub;->getInflatedId()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    const/4 p2, -0x1

    .line 72
    if-eq p1, p2, :cond_4

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/ViewStub;->getInflatedId()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-virtual {v3, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_4

    .line 93
    .line 94
    new-instance p1, Ll/ngh0;

    .line 95
    .line 96
    invoke-direct {p1, v1, v3, p0, v4}, Ll/ngh0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v5, v2, p1}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    :cond_4
    :goto_1
    return-void
.end method

.method public d1(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ge p0, v0, :cond_1

    .line 13
    .line 14
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "-145"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {p1, p0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-void
.end method

.method public e1(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uih0;->b:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ge v0, v1, :cond_2

    .line 26
    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v2, "-145"

    .line 36
    .line 37
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/uih0;->c:Ll/jxd0;

    .line 47
    .line 48
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/uih0;->b:Ll/byd0;

    .line 54
    .line 55
    invoke-static {}, Ll/pzi0;->o()J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/uih0;->V0()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    :goto_1
    return-void
.end method

.method public f1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 3
    .line 4
    return-void
.end method

.method public h0(Lcom/p1/mobile/putong/core/newui/home/b;Ll/t7m;)V
    .locals 3

    .line 1
    sget-object v0, Ll/y9;->Companion:Ll/y9$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/y9$a;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    invoke-interface {p2}, Ll/lql;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-interface {p2}, Ll/lql;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Ll/uih0;->c:Ll/jxd0;

    .line 35
    .line 36
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/uih0;->i:Ll/vxd0;

    .line 42
    .line 43
    const/4 p2, 0x0

    .line 44
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/uih0;->s1()V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ll/spl0;->a0()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-boolean v1, p0, Ll/p6d0;->g:Z

    .line 65
    .line 66
    :cond_1
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iput-boolean v1, p0, Ll/p6d0;->h:Z

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/match/a;->b:Z

    .line 77
    .line 78
    return-void

    .line 79
    :cond_2
    invoke-virtual {p0}, Ll/uih0;->V0()V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ljava/lang/Boolean;

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Ljava/lang/Integer;

    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-ltz v0, :cond_3

    .line 109
    .line 110
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ljava/lang/Integer;

    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iget-object v2, p0, Ll/uih0;->f:Ll/vxd0;

    .line 123
    .line 124
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-ne v0, v2, :cond_3

    .line 135
    .line 136
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-boolean v1, v0, Ll/p6d0;->h:Z

    .line 141
    .line 142
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/match/a;->b:Z

    .line 147
    .line 148
    invoke-interface {p2}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-interface {p2}, Ll/q7m;->t()Landroid/view/ViewStub;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-interface {p2}, Ll/q7m;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    invoke-virtual {p0, p1, v0, v1, p2}, Ll/uih0;->Z0(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    iget-object v0, p0, Ll/uih0;->g:Ll/vxd0;

    .line 165
    .line 166
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    check-cast v0, Ljava/lang/Integer;

    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-lez v0, :cond_4

    .line 177
    .line 178
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 179
    .line 180
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Ljava/lang/Boolean;

    .line 185
    .line 186
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-nez v0, :cond_4

    .line 191
    .line 192
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iput-boolean v1, v0, Ll/p6d0;->h:Z

    .line 197
    .line 198
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/match/a;->b:Z

    .line 203
    .line 204
    invoke-interface {p2}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-interface {p2}, Ll/q7m;->t()Landroid/view/ViewStub;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-interface {p2}, Ll/q7m;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    invoke-virtual {p0, p1, v0, v1, p2}, Ll/uih0;->Z0(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Ll/uih0;->d:Ll/jxd0;

    .line 220
    .line 221
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 222
    .line 223
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    iget-object p1, p0, Ll/uih0;->h:Ll/vxd0;

    .line 227
    .line 228
    iget-object p0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 229
    .line 230
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    check-cast p0, Ljava/lang/Integer;

    .line 235
    .line 236
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :cond_4
    iget-object p2, p0, Ll/uih0;->f:Ll/vxd0;

    .line 241
    .line 242
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    check-cast p2, Ljava/lang/Integer;

    .line 247
    .line 248
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 249
    .line 250
    .line 251
    move-result p2

    .line 252
    const/4 v0, 0x3

    .line 253
    if-ne p2, v0, :cond_5

    .line 254
    .line 255
    iget-object p2, p0, Ll/uih0;->g:Ll/vxd0;

    .line 256
    .line 257
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    check-cast p2, Ljava/lang/Integer;

    .line 262
    .line 263
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 264
    .line 265
    .line 266
    move-result p2

    .line 267
    if-ne p2, v0, :cond_5

    .line 268
    .line 269
    iget-object p2, p0, Ll/uih0;->e:Ll/jxd0;

    .line 270
    .line 271
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object p2

    .line 275
    check-cast p2, Ljava/lang/Boolean;

    .line 276
    .line 277
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 278
    .line 279
    .line 280
    move-result p2

    .line 281
    if-eqz p2, :cond_6

    .line 282
    .line 283
    :cond_5
    iget-object p2, p0, Ll/uih0;->f:Ll/vxd0;

    .line 284
    .line 285
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object p2

    .line 289
    check-cast p2, Ljava/lang/Integer;

    .line 290
    .line 291
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 292
    .line 293
    .line 294
    move-result p2

    .line 295
    const/16 v0, 0xf

    .line 296
    .line 297
    if-lt p2, v0, :cond_7

    .line 298
    .line 299
    iget-object p2, p0, Ll/uih0;->e:Ll/jxd0;

    .line 300
    .line 301
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    move-result-object p2

    .line 305
    check-cast p2, Ljava/lang/Boolean;

    .line 306
    .line 307
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 308
    .line 309
    .line 310
    move-result p2

    .line 311
    if-nez p2, :cond_7

    .line 312
    .line 313
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    new-instance p2, Ll/qih0;

    .line 318
    .line 319
    invoke-direct {p2}, Ll/qih0;-><init>()V

    .line 320
    .line 321
    .line 322
    const-wide/16 v0, 0x320

    .line 323
    .line 324
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 325
    .line 326
    .line 327
    iget-object p0, p0, Ll/uih0;->e:Ll/jxd0;

    .line 328
    .line 329
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 330
    .line 331
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    :cond_7
    :goto_0
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/core/newui/home/b;Ll/u7m;)V
    .locals 3

    .line 1
    invoke-interface {p2}, Ll/lql;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {p2}, Ll/lql;->getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Ll/uih0;->y0(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ll/uih0;->c:Ll/jxd0;

    .line 25
    .line 26
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/uih0;->i:Ll/vxd0;

    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p1, p2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/uih0;->s1()V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iput-boolean v1, p0, Ll/p6d0;->h:Z

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/match/a;->b:Z

    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-virtual {p0}, Ll/uih0;->V0()V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Ljava/lang/Integer;

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-ltz v0, :cond_1

    .line 87
    .line 88
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Ljava/lang/Integer;

    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iget-object v2, p0, Ll/uih0;->f:Ll/vxd0;

    .line 101
    .line 102
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-ne v0, v2, :cond_1

    .line 113
    .line 114
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-boolean v1, v0, Ll/p6d0;->h:Z

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/match/a;->b:Z

    .line 125
    .line 126
    move-object v0, p2

    .line 127
    check-cast v0, Landroid/view/View;

    .line 128
    .line 129
    new-instance v1, Ll/uih0$d;

    .line 130
    .line 131
    invoke-direct {v1, p0, p1, p2}, Ll/uih0$d;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/b;Ll/u7m;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_1
    iget-object v0, p0, Ll/uih0;->g:Ll/vxd0;

    .line 139
    .line 140
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Ljava/lang/Integer;

    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-lez v0, :cond_3

    .line 151
    .line 152
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 153
    .line 154
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ljava/lang/Boolean;

    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_3

    .line 165
    .line 166
    invoke-static {}, Ll/spl0;->a0()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_2

    .line 171
    .line 172
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-boolean v1, v0, Ll/p6d0;->g:Z

    .line 177
    .line 178
    :cond_2
    invoke-static {}, Ll/p6d0;->d0()Ll/p6d0;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iput-boolean v1, v0, Ll/p6d0;->h:Z

    .line 183
    .line 184
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/match/a;->b:Z

    .line 189
    .line 190
    move-object v0, p2

    .line 191
    check-cast v0, Landroid/view/View;

    .line 192
    .line 193
    new-instance v1, Ll/uih0$e;

    .line 194
    .line 195
    invoke-direct {v1, p0, p1, p2}, Ll/uih0$e;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/b;Ll/u7m;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Ll/uih0;->d:Ll/jxd0;

    .line 202
    .line 203
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 204
    .line 205
    invoke-virtual {p1, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/uih0;->h:Ll/vxd0;

    .line 209
    .line 210
    iget-object p0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 211
    .line 212
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    check-cast p0, Ljava/lang/Integer;

    .line 217
    .line 218
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_3
    iget-object p2, p0, Ll/uih0;->f:Ll/vxd0;

    .line 223
    .line 224
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    check-cast p2, Ljava/lang/Integer;

    .line 229
    .line 230
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 231
    .line 232
    .line 233
    move-result p2

    .line 234
    const/4 v0, 0x3

    .line 235
    if-ne p2, v0, :cond_4

    .line 236
    .line 237
    iget-object p2, p0, Ll/uih0;->g:Ll/vxd0;

    .line 238
    .line 239
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    check-cast p2, Ljava/lang/Integer;

    .line 244
    .line 245
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    if-ne p2, v0, :cond_4

    .line 250
    .line 251
    iget-object p2, p0, Ll/uih0;->e:Ll/jxd0;

    .line 252
    .line 253
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object p2

    .line 257
    check-cast p2, Ljava/lang/Boolean;

    .line 258
    .line 259
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 260
    .line 261
    .line 262
    move-result p2

    .line 263
    if-eqz p2, :cond_5

    .line 264
    .line 265
    :cond_4
    iget-object p2, p0, Ll/uih0;->f:Ll/vxd0;

    .line 266
    .line 267
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object p2

    .line 271
    check-cast p2, Ljava/lang/Integer;

    .line 272
    .line 273
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 274
    .line 275
    .line 276
    move-result p2

    .line 277
    const/16 v0, 0xf

    .line 278
    .line 279
    if-lt p2, v0, :cond_6

    .line 280
    .line 281
    iget-object p2, p0, Ll/uih0;->e:Ll/jxd0;

    .line 282
    .line 283
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object p2

    .line 287
    check-cast p2, Ljava/lang/Boolean;

    .line 288
    .line 289
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 290
    .line 291
    .line 292
    move-result p2

    .line 293
    if-nez p2, :cond_6

    .line 294
    .line 295
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    new-instance p2, Ll/ihh0;

    .line 300
    .line 301
    invoke-direct {p2}, Ll/ihh0;-><init>()V

    .line 302
    .line 303
    .line 304
    const-wide/16 v0, 0x320

    .line 305
    .line 306
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 307
    .line 308
    .line 309
    iget-object p0, p0, Ll/uih0;->e:Ll/jxd0;

    .line 310
    .line 311
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 312
    .line 313
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    :cond_6
    return-void
.end method

.method public i1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 6

    .line 1
    invoke-static {p2, p3, p4}, Ll/uih0;->g1(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 2
    .line 3
    .line 4
    if-eqz p4, :cond_1

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/uih0;->l:Z

    .line 8
    .line 9
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/animation/Animator;->isRunning()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    invoke-virtual {p2, p0}, Landroid/view/View;->setRotation(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setTranslationX(F)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    iget-object v3, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->u1:Landroid/view/ViewStub;

    .line 39
    .line 40
    iget-object v4, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->T:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 41
    .line 42
    const/4 v5, 0x0

    .line 43
    move-object v0, p0

    .line 44
    move-object v1, p1

    .line 45
    move-object v2, p2

    .line 46
    invoke-virtual/range {v0 .. v5}, Ll/uih0;->q1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public j1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 0

    .line 1
    invoke-static {p2, p3, p4}, Ll/uih0;->h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 2
    .line 3
    .line 4
    if-eqz p4, :cond_1

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/uih0;->l:Z

    .line 8
    .line 9
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/animation/Animator;->isRunning()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setRotation(F)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void

    .line 46
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    if-eqz p3, :cond_2

    .line 51
    .line 52
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->R:Landroid/view/ViewStub;

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->Y()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 55
    .line 56
    .line 57
    move-result-object p4

    .line 58
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uih0;->r1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    new-instance p3, Ll/uih0$c;

    .line 63
    .line 64
    invoke-direct {p3, p0, p1, p2}, Ll/uih0$c;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 65
    .line 66
    .line 67
    const-wide/16 p0, 0x32

    .line 68
    .line 69
    invoke-virtual {p2, p3, p0, p1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public k1()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/uih0;->k:J

    .line 7
    .line 8
    return-void
.end method

.method public l1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uih0;->b:Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/uih0;->c:Ll/jxd0;

    .line 13
    .line 14
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/uih0;->e:Ll/jxd0;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/uih0;->g:Ll/vxd0;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 45
    .line 46
    const/4 v2, -0x1

    .line 47
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/uih0;->i:Ll/vxd0;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/uih0;->j:Ll/jxd0;

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public n0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-ltz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object p0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eq v0, p0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public o0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uih0;->i:Ll/vxd0;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/uih0;->i:Ll/vxd0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-ltz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 47
    return p0
.end method

.method public final p0(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 10

    .line 1
    const-string v0, "e_new_user_guide_to_swipe_right"

    .line 2
    .line 3
    const-string v1, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0, p2}, Ll/uih0;->u0(Landroid/view/View;Landroid/view/View;)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->E0:Landroid/animation/Animator;

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getPivotX()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getPivotY()F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    new-instance v2, Ll/rhh0;

    .line 39
    .line 40
    invoke-direct {v2, p0, p2, v0, v1}, Ll/rhh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;FF)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F0:Ll/kcg0;

    .line 44
    .line 45
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v1, p0, Ll/uih0;->m:Lrx/subjects/a;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/uhh0;

    .line 59
    .line 60
    invoke-direct {v1, p2}, Ll/uhh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/vhh0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/vhh0;-><init>(Ll/uih0;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/whh0;

    .line 77
    .line 78
    invoke-direct {v1, p0, p2}, Ll/whh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->F0:Ll/kcg0;

    .line 90
    .line 91
    iget-object v0, p0, Ll/uih0;->n:Lrx/subjects/b;

    .line 92
    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v3, Ll/xhh0;

    .line 99
    .line 100
    invoke-direct {v3, p2}, Ll/xhh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {}, Ll/pzi0;->o()J

    .line 112
    .line 113
    .line 114
    move-result-wide v3

    .line 115
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    iget-object v6, p0, Ll/uih0;->a:Lrx/subjects/b;

    .line 120
    .line 121
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    new-instance v6, Ll/yhh0;

    .line 126
    .line 127
    invoke-direct {v6, v3, v4}, Ll/yhh0;-><init>(J)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v5, v6}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    new-instance v4, Ll/zhh0;

    .line 135
    .line 136
    invoke-direct {v4, p0}, Ll/zhh0;-><init>(Ll/uih0;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {v3, v1}, Lrx/c;->take(I)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    new-instance v3, Ll/aih0;

    .line 148
    .line 149
    invoke-direct {v3, v2, p2, v0}, Ll/aih0;-><init>(Ll/x20;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/kcg0;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 160
    .line 161
    new-instance v3, Ll/bih0;

    .line 162
    .line 163
    invoke-direct {v3, p0, v2, p2, v0}, Ll/bih0;-><init>(Ll/uih0;Ll/x20;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Ll/kcg0;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;->setViewTouchListener(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$b;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    iget-object v6, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 178
    .line 179
    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    new-instance v8, Ll/tgh0;

    .line 183
    .line 184
    invoke-direct {v8, v6}, Ll/tgh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V

    .line 185
    .line 186
    .line 187
    new-instance v9, Ll/shh0;

    .line 188
    .line 189
    invoke-direct {v9, p2}, Ll/shh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;)V

    .line 190
    .line 191
    .line 192
    move-object v7, p3

    .line 193
    invoke-static/range {v4 .. v9}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public p1()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uih0;->c:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/uih0;->i:Ll/vxd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    return v1

    .line 45
    :cond_0
    iget-object v0, p0, Ll/uih0;->f:Ll/vxd0;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Ll/uih0;->g:Ll/vxd0;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/Integer;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_1

    .line 72
    .line 73
    iget-object p0, p0, Ll/uih0;->c:Ll/jxd0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_1

    .line 86
    .line 87
    return v1

    .line 88
    :cond_1
    const/4 p0, 0x0

    .line 89
    return p0
.end method

.method public final q0(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 10

    .line 1
    const-string v0, "e_new_user_guide_to_swipe_right"

    .line 2
    .line 3
    const-string v2, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {v0, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ll/uih0;->t0(Landroid/view/View;)Landroid/animation/Animator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->L1:Landroid/animation/Animator;

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getPivotX()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getPivotY()F

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    new-instance v4, Ll/ahh0;

    .line 27
    .line 28
    invoke-direct {v4, p0, p2, v0, v2}, Ll/ahh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;FF)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->M1:Ll/kcg0;

    .line 32
    .line 33
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v2, p0, Ll/uih0;->m:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v2, Ll/chh0;

    .line 47
    .line 48
    invoke-direct {v2, p2}, Ll/chh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v2}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v2, Ll/dhh0;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/dhh0;-><init>(Ll/uih0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v2, Ll/ehh0;

    .line 65
    .line 66
    invoke-direct {v2, p0, p2}, Ll/ehh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->M1:Ll/kcg0;

    .line 78
    .line 79
    iget-object v0, p0, Ll/uih0;->n:Lrx/subjects/b;

    .line 80
    .line 81
    const/4 v2, 0x1

    .line 82
    invoke-virtual {v0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v6, Ll/fhh0;

    .line 87
    .line 88
    invoke-direct {v6, p2}, Ll/fhh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v6}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    invoke-virtual {v0, v6}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {}, Ll/pzi0;->o()J

    .line 100
    .line 101
    .line 102
    move-result-wide v6

    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    iget-object v9, p0, Ll/uih0;->a:Lrx/subjects/b;

    .line 108
    .line 109
    invoke-virtual {v8, v9}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    new-instance v9, Ll/ghh0;

    .line 114
    .line 115
    invoke-direct {v9, v6, v7}, Ll/ghh0;-><init>(J)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v8, v9}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    new-instance v7, Ll/hhh0;

    .line 123
    .line 124
    invoke-direct {v7, p0, p4}, Ll/hhh0;-><init>(Ll/uih0;Z)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v6, v7}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    invoke-virtual {v6, v2}, Lrx/c;->take(I)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    new-instance v6, Ll/jhh0;

    .line 136
    .line 137
    invoke-direct {v6, p4, v4, p2, v0}, Ll/jhh0;-><init>(ZLl/x20;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/kcg0;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v6}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    invoke-virtual {v2, v6}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
    iget-object v6, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 148
    .line 149
    move-object v2, v4

    .line 150
    move-object v4, v0

    .line 151
    new-instance v0, Ll/khh0;

    .line 152
    .line 153
    move-object v1, p0

    .line 154
    move-object v3, p2

    .line 155
    move v5, p4

    .line 156
    invoke-direct/range {v0 .. v5}, Ll/khh0;-><init>(Ll/uih0;Ll/x20;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Ll/kcg0;Z)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v6, v0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;->setViewTouchListener(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$b;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iget-object v2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 167
    .line 168
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    new-instance v4, Ll/tgh0;

    .line 172
    .line 173
    invoke-direct {v4, v2}, Ll/tgh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V

    .line 174
    .line 175
    .line 176
    new-instance v5, Ll/bhh0;

    .line 177
    .line 178
    invoke-direct {v5, p2}, Ll/bhh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    .line 179
    .line 180
    .line 181
    move-object v1, p2

    .line 182
    move-object v3, p3

    .line 183
    invoke-static/range {v0 .. v5}, Ll/uih0;->k0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/core/ui/PictureView;Ll/y20;Ll/x20;)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public q1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/uih0;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-wide v2, p0, Ll/uih0;->k:J

    .line 12
    .line 13
    sub-long/2addr v0, v2

    .line 14
    const-wide/16 v2, 0x1f4

    .line 15
    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-gez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/uih0;->k:J

    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 36
    .line 37
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    new-instance p0, Ll/ogh0;

    .line 44
    .line 45
    invoke-direct {p0, p1, p2, p4}, Ll/ogh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p2, p0}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 67
    .line 68
    invoke-virtual {p3, p5}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;->k0(Z)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 72
    .line 73
    .line 74
    new-instance v0, Ll/pgh0;

    .line 75
    .line 76
    move-object v1, p0

    .line 77
    move-object v3, p1

    .line 78
    move-object v2, p2

    .line 79
    move-object v4, p4

    .line 80
    move v5, p5

    .line 81
    invoke-direct/range {v0 .. v5}, Ll/pgh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    .line 82
    .line 83
    .line 84
    invoke-static {v3, p2, v0}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    move-object v3, p1

    .line 89
    move-object p1, p0

    .line 90
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_4

    .line 95
    .line 96
    sget p0, Ll/kec0;->Ac:I

    .line 97
    .line 98
    invoke-virtual {p3, p0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p3}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    check-cast p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 106
    .line 107
    iput-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->K1:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 108
    .line 109
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;->k0(Z)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 113
    .line 114
    .line 115
    new-instance p0, Ll/qgh0;

    .line 116
    .line 117
    move-object p3, v3

    .line 118
    invoke-direct/range {p0 .. p5}, Ll/qgh0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;Z)V

    .line 119
    .line 120
    .line 121
    invoke-static {v3, p2, p0}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    :goto_0
    return-void
.end method

.method public r1(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Landroid/view/ViewStub;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/uih0;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Ll/uih0;->k:J

    .line 11
    .line 12
    sub-long/2addr v0, v2

    .line 13
    const-wide/16 v2, 0x1f4

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-gez v0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Ll/uih0;->k:J

    .line 25
    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->getRootView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 39
    .line 40
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    new-instance p0, Ll/thh0;

    .line 47
    .line 48
    invoke-direct {p0, p1, p2, p4}, Ll/thh0;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v0, p0}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 70
    .line 71
    .line 72
    new-instance p3, Ll/eih0;

    .line 73
    .line 74
    invoke-direct {p3, p0, p2, p1, p4}, Ll/eih0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, v0, p3}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_4

    .line 86
    .line 87
    sget v1, Ll/kec0;->Ac:I

    .line 88
    .line 89
    invoke-virtual {p3, v1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p3

    .line 96
    check-cast p3, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 97
    .line 98
    iput-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;->p0:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->P2()V

    .line 101
    .line 102
    .line 103
    new-instance p3, Ll/pih0;

    .line 104
    .line 105
    invoke-direct {p3, p0, p2, p1, p4}, Ll/pih0;-><init>(Ll/uih0;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, v0, p3}, Ll/uih0;->m1(Lcom/p1/mobile/putong/core/newui/home/b;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    :cond_4
    :goto_0
    return-void
.end method

.method public s1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uih0;->m:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final t0(Landroid/view/View;)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p1}, Ll/uih0;->u0(Landroid/view/View;Landroid/view/View;)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final t1()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final u0(Landroid/view/View;Landroid/view/View;)Landroid/animation/Animator;
    .locals 6

    .line 1
    sget v0, Ll/qa00;->y:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v2, v1, [F

    .line 5
    .line 6
    fill-array-data v2, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-wide/16 v3, 0x320

    .line 14
    .line 15
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    const v3, 0x3dcccccd    # 0.1f

    .line 19
    .line 20
    .line 21
    const/high16 v4, 0x3f800000    # 1.0f

    .line 22
    .line 23
    const/high16 v5, 0x3e800000    # 0.25f

    .line 24
    .line 25
    invoke-static {v5, v3, v5, v4}, Ll/zi60;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    const/4 v3, -0x1

    .line 33
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Ll/jih0;

    .line 40
    .line 41
    invoke-direct {v3, p1, v0, v1, p2}, Ll/jih0;-><init>(Landroid/view/View;IILandroid/view/View;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ll/uih0$b;

    .line 48
    .line 49
    invoke-direct {p1, p0, p2}, Ll/uih0$b;-><init>(Ll/uih0;Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    return-object v2

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x40000000    # 2.0f
    .end array-data
.end method

.method public x0(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "-145"

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_2

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v3, 0x1

    .line 23
    if-le v1, v3, :cond_0

    .line 24
    .line 25
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iput-boolean v0, p0, Ll/uih0;->l:Z

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/uih0;->V0()V

    .line 43
    .line 44
    .line 45
    new-instance p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    invoke-interface {p1, v3, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-interface {p1, v0, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_0
    return-void
.end method

.method public z0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-ltz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/uih0;->h:Ll/vxd0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v2, p0, Ll/uih0;->f:Ll/vxd0;

    .line 43
    .line 44
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-ne v0, v2, :cond_0

    .line 55
    .line 56
    return v1

    .line 57
    :cond_0
    iget-object v0, p0, Ll/uih0;->g:Ll/vxd0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-lez v0, :cond_1

    .line 70
    .line 71
    iget-object p0, p0, Ll/uih0;->d:Ll/jxd0;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Ljava/lang/Boolean;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-nez p0, :cond_1

    .line 84
    .line 85
    return v1

    .line 86
    :cond_1
    const/4 p0, 0x0

    .line 87
    return p0
.end method
