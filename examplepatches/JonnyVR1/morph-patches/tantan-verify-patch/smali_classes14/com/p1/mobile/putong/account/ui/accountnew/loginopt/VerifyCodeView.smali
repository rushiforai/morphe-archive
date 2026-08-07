.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:Landroid/graphics/Paint;

.field public final i:Landroid/graphics/Paint;

.field public final j:Landroid/graphics/Paint;

.field public k:Landroid/graphics/drawable/Drawable;

.field public l:Landroid/view/Choreographer;

.field public m:Landroid/view/Choreographer$FrameCallback;

.field public n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

.field public o:J

.field public p:Ljava/lang/StringBuilder;

.field public q:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;

.field public r:Ll/g8l0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/qa00;->F:I

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->a:I

    .line 7
    .line 8
    sget p1, Ll/qa00;->K:I

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->b:I

    .line 11
    .line 12
    sget p1, Ll/qa00;->i:I

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->c:I

    .line 15
    .line 16
    sget p1, Ll/qa00;->t:I

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->d:I

    .line 19
    .line 20
    sget p1, Ll/qa00;->d:I

    .line 21
    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->e:I

    .line 23
    .line 24
    sget p1, Ll/qa00;->v:I

    .line 25
    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->f:I

    .line 27
    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->g:I

    .line 29
    .line 30
    new-instance p1, Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h:Landroid/graphics/Paint;

    .line 36
    .line 37
    new-instance p1, Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->i:Landroid/graphics/Paint;

    .line 43
    .line 44
    new-instance p1, Landroid/graphics/Paint;

    .line 45
    .line 46
    const/4 p2, 0x1

    .line 47
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->l:Landroid/view/Choreographer;

    .line 57
    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->e()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->g(J)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;ZLjava/lang/CharSequence;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->f(ZLjava/lang/CharSequence;I)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget v3, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->b:I

    .line 16
    .line 17
    div-int/lit8 v3, v3, 0x2

    .line 18
    .line 19
    iget v4, v2, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 20
    .line 21
    div-int/lit8 v4, v4, 0x2

    .line 22
    .line 23
    sub-int/2addr v3, v4

    .line 24
    iget v2, v2, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 25
    .line 26
    div-int/lit8 v2, v2, 0x2

    .line 27
    .line 28
    sub-int/2addr v3, v2

    .line 29
    const/4 v2, 0x0

    .line 30
    move v6, v2

    .line 31
    :goto_0
    const/4 v2, 0x4

    .line 32
    if-ge v6, v2, :cond_2

    .line 33
    .line 34
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->a:I

    .line 35
    .line 36
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->c:I

    .line 37
    .line 38
    add-int v5, v2, v4

    .line 39
    .line 40
    mul-int/2addr v5, v6

    .line 41
    div-int/lit8 v7, v2, 0x2

    .line 42
    .line 43
    add-int/2addr v5, v7

    .line 44
    if-ge v6, v1, :cond_0

    .line 45
    .line 46
    int-to-float v8, v5

    .line 47
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->d:I

    .line 48
    .line 49
    int-to-float v9, v2

    .line 50
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->b:I

    .line 51
    .line 52
    sub-int/2addr v4, v2

    .line 53
    int-to-float v11, v4

    .line 54
    iget-object v12, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h:Landroid/graphics/Paint;

    .line 55
    .line 56
    move v10, v8

    .line 57
    move-object/from16 v7, p1

    .line 58
    .line 59
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    add-int/lit8 v7, v6, 0x1

    .line 69
    .line 70
    sget v2, Ll/qa00;->c:I

    .line 71
    .line 72
    sub-int v2, v3, v2

    .line 73
    .line 74
    int-to-float v9, v2

    .line 75
    iget-object v10, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 76
    .line 77
    move-object/from16 v4, p1

    .line 78
    .line 79
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_0
    add-int v7, v2, v4

    .line 84
    .line 85
    mul-int/2addr v7, v6

    .line 86
    int-to-float v14, v7

    .line 87
    add-int/2addr v4, v2

    .line 88
    mul-int/2addr v4, v6

    .line 89
    add-int/2addr v4, v2

    .line 90
    int-to-float v2, v4

    .line 91
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->b:I

    .line 92
    .line 93
    int-to-float v4, v4

    .line 94
    iget v7, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->d:I

    .line 95
    .line 96
    int-to-float v8, v7

    .line 97
    int-to-float v7, v7

    .line 98
    iget-object v9, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->i:Landroid/graphics/Paint;

    .line 99
    .line 100
    const/4 v15, 0x0

    .line 101
    move-object/from16 v13, p1

    .line 102
    .line 103
    move/from16 v16, v2

    .line 104
    .line 105
    move/from16 v17, v4

    .line 106
    .line 107
    move/from16 v19, v7

    .line 108
    .line 109
    move/from16 v18, v8

    .line 110
    .line 111
    move-object/from16 v20, v9

    .line 112
    .line 113
    invoke-virtual/range {v13 .. v20}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 114
    .line 115
    .line 116
    if-ne v6, v1, :cond_1

    .line 117
    .line 118
    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-eqz v2, :cond_1

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_1

    .line 129
    .line 130
    iget v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->b:I

    .line 131
    .line 132
    div-int/lit8 v2, v2, 0x2

    .line 133
    .line 134
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->k:Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    iget v7, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->e:I

    .line 137
    .line 138
    div-int/lit8 v8, v7, 0x2

    .line 139
    .line 140
    sub-int v8, v5, v8

    .line 141
    .line 142
    iget v9, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->f:I

    .line 143
    .line 144
    div-int/lit8 v10, v9, 0x2

    .line 145
    .line 146
    sub-int v10, v2, v10

    .line 147
    .line 148
    div-int/lit8 v7, v7, 0x2

    .line 149
    .line 150
    add-int/2addr v5, v7

    .line 151
    div-int/lit8 v9, v9, 0x2

    .line 152
    .line 153
    add-int/2addr v2, v9

    .line 154
    invoke-virtual {v4, v8, v10, v5, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 155
    .line 156
    .line 157
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->k:Landroid/graphics/drawable/Drawable;

    .line 158
    .line 159
    move-object/from16 v4, p1

    .line 160
    .line 161
    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_1
    move-object/from16 v4, p1

    .line 166
    .line 167
    :goto_1
    add-int/lit8 v6, v6, 0x1

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_2
    return-void
.end method

.method public final d(Landroid/view/inputmethod/EditorInfo;Z)Landroid/view/inputmethod/InputConnection;
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->q:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->q:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;-><init>(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->q:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;

    .line 19
    .line 20
    new-instance v0, Ll/i8l0;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Ll/i8l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;->a(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c$a;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->q:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c;

    .line 29
    .line 30
    return-object p0
.end method

.method public final e()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Ll/a9c0;->j:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h:Landroid/graphics/Paint;

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->a:I

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h:Landroid/graphics/Paint;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->h:Landroid/graphics/Paint;

    .line 36
    .line 37
    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->i:Landroid/graphics/Paint;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sget v3, Ll/a9c0;->i:I

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->i:Landroid/graphics/Paint;

    .line 58
    .line 59
    sget v2, Ll/qa00;->d:I

    .line 60
    .line 61
    int-to-float v2, v2

    .line 62
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->i:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->i:Landroid/graphics/Paint;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->i:Landroid/graphics/Paint;

    .line 76
    .line 77
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sget v3, Ll/a9c0;->l:I

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 108
    .line 109
    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 115
    .line 116
    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 117
    .line 118
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->j:Landroid/graphics/Paint;

    .line 122
    .line 123
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->g:I

    .line 124
    .line 125
    int-to-float v2, v2

    .line 126
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    sget v2, Ll/bbc0;->v1:I

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->k:Landroid/graphics/drawable/Drawable;

    .line 140
    .line 141
    new-instance v0, Ll/h8l0;

    .line 142
    .line 143
    invoke-direct {v0, p0}, Ll/h8l0;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;)V

    .line 144
    .line 145
    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->m:Landroid/view/Choreographer$FrameCallback;

    .line 147
    .line 148
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public final synthetic f(ZLjava/lang/CharSequence;I)Z
    .locals 1

    .line 1
    const-string p3, "[0-9]"

    .line 2
    .line 3
    invoke-static {p3, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const-string v0, "[0-9][0-9][0-9][0-9]"

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_5

    .line 16
    .line 17
    :cond_0
    if-eqz p1, :cond_3

    .line 18
    .line 19
    invoke-static {v0, p2}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->r:Ll/g8l0;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/g8l0;->o1()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const-string p3, "verification_code_scene"

    .line 32
    .line 33
    const-string v0, "e_verification_code_auto_fill"

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const-string p1, "phone"

    .line 38
    .line 39
    invoke-static {p3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    filled-new-array {p1}, [Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p3, "p_login_verification_code"

    .line 48
    .line 49
    invoke-static {v0, p3, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->r:Ll/g8l0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/g8l0;->p1()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    const-string p1, "password_new_device"

    .line 62
    .line 63
    invoke-static {p3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {p1}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string p3, "p_new_device_passwordlogin_verify_view"

    .line 72
    .line 73
    invoke-static {v0, p3, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    const-string p1, "other"

    .line 78
    .line 79
    invoke-static {p3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    filled-new-array {p1}, [Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string p3, ""

    .line 88
    .line 89
    invoke-static {v0, p3, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 98
    .line 99
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 106
    .line 107
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 115
    .line 116
    .line 117
    :cond_5
    const/4 p0, 0x1

    .line 118
    return p0
.end method

.method public final synthetic g(J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->l:Landroid/view/Choreographer;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->m:Landroid/view/Choreographer$FrameCallback;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getPresenter()Ll/g8l0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->r:Ll/g8l0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final h()Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->o:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x3e8

    .line 9
    .line 10
    rem-long/2addr v0, v2

    .line 11
    const-wide/16 v2, 0x1f4

    .line 12
    .line 13
    cmp-long p0, v0, v2

    .line 14
    .line 15
    if-gez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->l:Landroid/view/Choreographer;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->m:Landroid/view/Choreographer$FrameCallback;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p1, Landroid/view/inputmethod/EditorInfo;->actionLabel:Ljava/lang/CharSequence;

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p1, Landroid/view/inputmethod/EditorInfo;->inputType:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->d(Landroid/view/inputmethod/EditorInfo;Z)Landroid/view/inputmethod/InputConnection;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->l:Landroid/view/Choreographer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->m:Landroid/view/Choreographer$FrameCallback;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->c(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/View;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide p2

    .line 8
    iput-wide p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->o:J

    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->l:Landroid/view/Choreographer;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->m:Landroid/view/Choreographer$FrameCallback;

    .line 15
    .line 16
    invoke-virtual {p2, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->m:Landroid/view/Choreographer$FrameCallback;

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4

    .line 1
    const/16 v0, 0x43

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    sub-int/2addr v3, v2

    .line 22
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v0, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v0, 0x7

    .line 46
    if-lt p1, v0, :cond_1

    .line 47
    .line 48
    const/16 v0, 0x10

    .line 49
    .line 50
    if-gt p1, v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-ge v0, v1, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 61
    .line 62
    add-int/lit8 v3, p1, -0x7

    .line 63
    .line 64
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-interface {v0, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    :goto_0
    if-ne p1, v1, :cond_2

    .line 87
    .line 88
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    return p0

    .line 93
    :cond_2
    return v2
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "input_method"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p1, p0, v0}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public setPresenter(Ll/g8l0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->r:Ll/g8l0;

    .line 2
    .line 3
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->p:Ljava/lang/StringBuilder;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setTextChangeListener(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->n:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView$a;

    .line 2
    .line 3
    return-void
.end method
