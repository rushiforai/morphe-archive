.class final Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->t(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlin/Unit;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0001H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "it"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.putong.core.ui.superlikeopt.upgrade.SuperLikeComboAnimView$scaleFlow$3"
    f = "SuperLikeComboAnimView.kt"
    l = {}
    m = "invokeSuspend"
    v = 0x1
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;-><init>(Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, Lkotlin/Unit;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->invoke(Lkotlin/Unit;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lkotlin/Unit;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/Unit;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->label:I

    .line 7
    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getScaleX()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Landroid/view/View;->getScaleY()F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-float v4, v4

    .line 50
    invoke-virtual {v3, v4}, Landroid/view/View;->setPivotY(F)V

    .line 51
    .line 52
    .line 53
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 60
    .line 61
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    int-to-float v4, v4

    .line 70
    const/high16 v5, 0x40000000    # 2.0f

    .line 71
    .line 72
    div-float/2addr v4, v5

    .line 73
    invoke-virtual {v3, v4}, Landroid/view/View;->setPivotX(F)V

    .line 74
    .line 75
    .line 76
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 77
    .line 78
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_superlike_layout()Landroid/widget/FrameLayout;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    const/4 v4, 0x0

    .line 83
    invoke-virtual {v3, v4}, Landroid/view/View;->setPivotY(F)V

    .line 84
    .line 85
    .line 86
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 87
    .line 88
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_superlike_layout()Landroid/widget/FrameLayout;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 93
    .line 94
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_superlike_layout()Landroid/widget/FrameLayout;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    int-to-float v4, v4

    .line 103
    div-float/2addr v4, v5

    .line 104
    invoke-virtual {v3, v4}, Landroid/view/View;->setPivotX(F)V

    .line 105
    .line 106
    .line 107
    sget-object v3, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a;->Companion:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;

    .line 108
    .line 109
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 110
    .line 111
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->getSuperLikeCount()I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;->l(I)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 120
    .line 121
    const/4 v5, 0x2

    .line 122
    const/4 v6, 0x1

    .line 123
    const/4 v7, 0x0

    .line 124
    const/4 v8, 0x3

    .line 125
    if-eqz v3, :cond_0

    .line 126
    .line 127
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 128
    .line 129
    .line 130
    move-result-object v9

    .line 131
    sget-object v10, Landroid/widget/FrameLayout;->SCALE_X:Landroid/util/Property;

    .line 132
    .line 133
    new-array v3, v8, [F

    .line 134
    .line 135
    aput v1, v3, v7

    .line 136
    .line 137
    const v1, 0x3fb9999a    # 1.45f

    .line 138
    .line 139
    .line 140
    aput v1, v3, v6

    .line 141
    .line 142
    const v4, 0x3f7ae148    # 0.98f

    .line 143
    .line 144
    .line 145
    aput v4, v3, v5

    .line 146
    .line 147
    const-wide/16 v11, 0x0

    .line 148
    .line 149
    const-wide/16 v13, 0x12c

    .line 150
    .line 151
    const/4 v15, 0x0

    .line 152
    move-object/from16 v16, v3

    .line 153
    .line 154
    invoke-static/range {v9 .. v16}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 159
    .line 160
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 161
    .line 162
    .line 163
    move-result-object v10

    .line 164
    sget-object v11, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    .line 165
    .line 166
    new-array v9, v8, [F

    .line 167
    .line 168
    aput v2, v9, v7

    .line 169
    .line 170
    aput v1, v9, v6

    .line 171
    .line 172
    aput v4, v9, v5

    .line 173
    .line 174
    const-wide/16 v12, 0x0

    .line 175
    .line 176
    const-wide/16 v14, 0x12c

    .line 177
    .line 178
    const/16 v16, 0x0

    .line 179
    .line 180
    move-object/from16 v17, v9

    .line 181
    .line 182
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    filled-new-array {v3, v1}, [Landroid/animation/Animator;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 195
    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_0
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 199
    .line 200
    .line 201
    move-result-object v9

    .line 202
    sget-object v10, Landroid/widget/FrameLayout;->SCALE_X:Landroid/util/Property;

    .line 203
    .line 204
    new-array v3, v8, [F

    .line 205
    .line 206
    aput v1, v3, v7

    .line 207
    .line 208
    const v1, 0x3f90a3d7    # 1.13f

    .line 209
    .line 210
    .line 211
    aput v1, v3, v6

    .line 212
    .line 213
    const/high16 v4, 0x3f800000    # 1.0f

    .line 214
    .line 215
    aput v4, v3, v5

    .line 216
    .line 217
    const-wide/16 v11, 0x0

    .line 218
    .line 219
    const-wide/16 v13, 0x12c

    .line 220
    .line 221
    const/4 v15, 0x0

    .line 222
    move-object/from16 v16, v3

    .line 223
    .line 224
    invoke-static/range {v9 .. v16}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 229
    .line 230
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_star_layout()Landroid/widget/LinearLayout;

    .line 231
    .line 232
    .line 233
    move-result-object v10

    .line 234
    sget-object v11, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    .line 235
    .line 236
    new-array v9, v8, [F

    .line 237
    .line 238
    aput v2, v9, v7

    .line 239
    .line 240
    aput v1, v9, v6

    .line 241
    .line 242
    aput v4, v9, v5

    .line 243
    .line 244
    const-wide/16 v12, 0x0

    .line 245
    .line 246
    const-wide/16 v14, 0x12c

    .line 247
    .line 248
    const/16 v16, 0x0

    .line 249
    .line 250
    move-object/from16 v17, v9

    .line 251
    .line 252
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    filled-new-array {v3, v1}, [Landroid/animation/Animator;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 265
    .line 266
    .line 267
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 268
    .line 269
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_superlike_layout()Landroid/widget/FrameLayout;

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    sget-object v10, Landroid/widget/FrameLayout;->SCALE_X:Landroid/util/Property;

    .line 274
    .line 275
    new-array v2, v8, [F

    .line 276
    .line 277
    fill-array-data v2, :array_0

    .line 278
    .line 279
    .line 280
    const-wide/16 v11, 0x0

    .line 281
    .line 282
    const-wide/16 v13, 0x12c

    .line 283
    .line 284
    const/4 v15, 0x0

    .line 285
    move-object/from16 v16, v2

    .line 286
    .line 287
    invoke-static/range {v9 .. v16}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$scaleFlow$3;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 292
    .line 293
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->get_superlike_layout()Landroid/widget/FrameLayout;

    .line 294
    .line 295
    .line 296
    move-result-object v9

    .line 297
    sget-object v10, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    .line 298
    .line 299
    new-array v0, v8, [F

    .line 300
    .line 301
    fill-array-data v0, :array_1

    .line 302
    .line 303
    .line 304
    move-object/from16 v16, v0

    .line 305
    .line 306
    invoke-static/range {v9 .. v16}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    filled-new-array {v1, v2, v0}, [Landroid/animation/Animator;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 319
    .line 320
    .line 321
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 322
    .line 323
    return-object v0

    .line 324
    :cond_1
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 325
    .line 326
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    const/4 v0, 0x0

    .line 330
    return-object v0

    .line 331
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f90a3d7    # 1.13f
        0x3f800000    # 1.0f
    .end array-data

    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f90a3d7    # 1.13f
        0x3f800000    # 1.0f
    .end array-data
.end method
