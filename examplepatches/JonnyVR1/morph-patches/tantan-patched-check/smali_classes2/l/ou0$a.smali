.class public final Ll/ou0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v4d0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ou0;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final a:[I

.field public final b:[I

.field public final c:[I

.field public final d:[I

.field public final e:[I

.field public final f:[I


# direct methods
.method public constructor <init>()V
    .locals 11

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/ccc0;->S:I

    .line 5
    .line 6
    sget v1, Ll/ccc0;->Q:I

    .line 7
    .line 8
    sget v2, Ll/ccc0;->a:I

    .line 9
    .line 10
    filled-new-array {v0, v1, v2}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/ou0$a;->a:[I

    .line 15
    .line 16
    sget v1, Ll/ccc0;->o:I

    .line 17
    .line 18
    sget v2, Ll/ccc0;->B:I

    .line 19
    .line 20
    sget v3, Ll/ccc0;->t:I

    .line 21
    .line 22
    sget v4, Ll/ccc0;->p:I

    .line 23
    .line 24
    sget v5, Ll/ccc0;->q:I

    .line 25
    .line 26
    sget v6, Ll/ccc0;->s:I

    .line 27
    .line 28
    sget v7, Ll/ccc0;->r:I

    .line 29
    .line 30
    filled-new-array/range {v1 .. v7}, [I

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/ou0$a;->b:[I

    .line 35
    .line 36
    sget v1, Ll/ccc0;->P:I

    .line 37
    .line 38
    sget v2, Ll/ccc0;->R:I

    .line 39
    .line 40
    sget v3, Ll/ccc0;->k:I

    .line 41
    .line 42
    sget v4, Ll/ccc0;->I:I

    .line 43
    .line 44
    sget v5, Ll/ccc0;->J:I

    .line 45
    .line 46
    sget v6, Ll/ccc0;->L:I

    .line 47
    .line 48
    sget v7, Ll/ccc0;->N:I

    .line 49
    .line 50
    sget v8, Ll/ccc0;->K:I

    .line 51
    .line 52
    sget v9, Ll/ccc0;->M:I

    .line 53
    .line 54
    sget v10, Ll/ccc0;->O:I

    .line 55
    .line 56
    filled-new-array/range {v1 .. v10}, [I

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ll/ou0$a;->c:[I

    .line 61
    .line 62
    sget v0, Ll/ccc0;->w:I

    .line 63
    .line 64
    sget v1, Ll/ccc0;->i:I

    .line 65
    .line 66
    sget v2, Ll/ccc0;->v:I

    .line 67
    .line 68
    filled-new-array {v0, v1, v2}, [I

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Ll/ou0$a;->d:[I

    .line 73
    .line 74
    sget v0, Ll/ccc0;->H:I

    .line 75
    .line 76
    sget v1, Ll/ccc0;->T:I

    .line 77
    .line 78
    filled-new-array {v0, v1}, [I

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Ll/ou0$a;->e:[I

    .line 83
    .line 84
    sget v0, Ll/ccc0;->c:I

    .line 85
    .line 86
    sget v1, Ll/ccc0;->g:I

    .line 87
    .line 88
    sget v2, Ll/ccc0;->d:I

    .line 89
    .line 90
    sget v3, Ll/ccc0;->h:I

    .line 91
    .line 92
    filled-new-array {v0, v1, v2, v3}, [I

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Ll/ou0$a;->f:[I

    .line 97
    .line 98
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/ccc0;->m:I

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    sget p0, Ll/z9c0;->d:I

    .line 6
    .line 7
    invoke-static {p1, p0}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget v0, Ll/ccc0;->G:I

    .line 13
    .line 14
    if-ne p2, v0, :cond_1

    .line 15
    .line 16
    sget p0, Ll/z9c0;->g:I

    .line 17
    .line 18
    invoke-static {p1, p0}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    sget v0, Ll/ccc0;->F:I

    .line 24
    .line 25
    if-ne p2, v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/ou0$a;->k(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_2
    sget v0, Ll/ccc0;->f:I

    .line 33
    .line 34
    if-ne p2, v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/ou0$a;->j(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_3
    sget v0, Ll/ccc0;->b:I

    .line 42
    .line 43
    if-ne p2, v0, :cond_4

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/ou0$a;->g(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_4
    sget v0, Ll/ccc0;->e:I

    .line 51
    .line 52
    if-ne p2, v0, :cond_5

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/ou0$a;->i(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_5
    sget v0, Ll/ccc0;->D:I

    .line 60
    .line 61
    if-eq p2, v0, :cond_b

    .line 62
    .line 63
    sget v0, Ll/ccc0;->E:I

    .line 64
    .line 65
    if-ne p2, v0, :cond_6

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_6
    iget-object v0, p0, Ll/ou0$a;->b:[I

    .line 69
    .line 70
    invoke-virtual {p0, v0, p2}, Ll/ou0$a;->f([II)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_7

    .line 75
    .line 76
    sget p0, Ll/s8c0;->x:I

    .line 77
    .line 78
    invoke-static {p1, p0}, Ll/ivi0;->d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_7
    iget-object v0, p0, Ll/ou0$a;->e:[I

    .line 84
    .line 85
    invoke-virtual {p0, v0, p2}, Ll/ou0$a;->f([II)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_8

    .line 90
    .line 91
    sget p0, Ll/z9c0;->c:I

    .line 92
    .line 93
    invoke-static {p1, p0}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_8
    iget-object v0, p0, Ll/ou0$a;->f:[I

    .line 99
    .line 100
    invoke-virtual {p0, v0, p2}, Ll/ou0$a;->f([II)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_9

    .line 105
    .line 106
    sget p0, Ll/z9c0;->b:I

    .line 107
    .line 108
    invoke-static {p1, p0}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :cond_9
    sget p0, Ll/ccc0;->A:I

    .line 114
    .line 115
    if-ne p2, p0, :cond_a

    .line 116
    .line 117
    sget p0, Ll/z9c0;->e:I

    .line 118
    .line 119
    invoke-static {p1, p0}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0

    .line 124
    :cond_a
    const/4 p0, 0x0

    .line 125
    return-object p0

    .line 126
    :cond_b
    :goto_0
    sget p0, Ll/z9c0;->f:I

    .line 127
    .line 128
    invoke-static {p1, p0}, Ll/tu0;->a(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0
.end method

.method public b(I)Landroid/graphics/PorterDuff$Mode;
    .locals 0

    .line 1
    sget p0, Ll/ccc0;->F:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public c(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z
    .locals 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/ccc0;->C:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const v2, 0x102000d

    .line 5
    .line 6
    .line 7
    const v3, 0x102000f

    .line 8
    .line 9
    .line 10
    const/high16 v4, 0x1020000

    .line 11
    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    check-cast p3, Landroid/graphics/drawable/LayerDrawable;

    .line 15
    .line 16
    invoke-virtual {p3, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    sget v0, Ll/s8c0;->x:I

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {p0, p2, v0, v4}, Ll/ou0$a;->l(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p3, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget v0, Ll/s8c0;->x:I

    .line 38
    .line 39
    invoke-static {p1, v0}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {p0, p2, v0, v3}, Ll/ou0$a;->l(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p3, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    sget p3, Ll/s8c0;->v:I

    .line 55
    .line 56
    invoke-static {p1, p3}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-virtual {p0, p2, p1, p3}, Ll/ou0$a;->l(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 65
    .line 66
    .line 67
    return v1

    .line 68
    :cond_0
    sget v0, Ll/ccc0;->y:I

    .line 69
    .line 70
    if-eq p2, v0, :cond_2

    .line 71
    .line 72
    sget v0, Ll/ccc0;->x:I

    .line 73
    .line 74
    if-eq p2, v0, :cond_2

    .line 75
    .line 76
    sget v0, Ll/ccc0;->z:I

    .line 77
    .line 78
    if-ne p2, v0, :cond_1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    const/4 p0, 0x0

    .line 82
    return p0

    .line 83
    :cond_2
    :goto_0
    check-cast p3, Landroid/graphics/drawable/LayerDrawable;

    .line 84
    .line 85
    invoke-virtual {p3, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    sget v0, Ll/s8c0;->x:I

    .line 90
    .line 91
    invoke-static {p1, v0}, Ll/ivi0;->a(Landroid/content/Context;I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-virtual {p0, p2, v0, v4}, Ll/ou0$a;->l(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p3, v3}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    sget v0, Ll/s8c0;->v:I

    .line 107
    .line 108
    invoke-static {p1, v0}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {p0, p2, v0, v3}, Ll/ou0$a;->l(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p3, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    sget p3, Ll/s8c0;->v:I

    .line 124
    .line 125
    invoke-static {p1, p3}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 130
    .line 131
    .line 132
    move-result-object p3

    .line 133
    invoke-virtual {p0, p2, p1, p3}, Ll/ou0$a;->l(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 134
    .line 135
    .line 136
    return v1
.end method

.method public d(Ll/v4d0;Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1    # Ll/v4d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget p0, Ll/ccc0;->j:I

    .line 2
    .line 3
    if-ne p3, p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroid/graphics/drawable/LayerDrawable;

    .line 6
    .line 7
    sget p3, Ll/ccc0;->i:I

    .line 8
    .line 9
    invoke-virtual {p1, p2, p3}, Ll/v4d0;->i(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    sget v0, Ll/ccc0;->k:I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v0}, Ll/v4d0;->i(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p3, p1}, [Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-direct {p0, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public e(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z
    .locals 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/ou0$a;->a:[I

    .line 6
    .line 7
    invoke-virtual {p0, v1, p2}, Ll/ou0$a;->f([II)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, -0x1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget p0, Ll/s8c0;->x:I

    .line 17
    .line 18
    :goto_0
    move v1, v2

    .line 19
    :goto_1
    move p2, v4

    .line 20
    goto :goto_3

    .line 21
    :cond_0
    iget-object v1, p0, Ll/ou0$a;->c:[I

    .line 22
    .line 23
    invoke-virtual {p0, v1, p2}, Ll/ou0$a;->f([II)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    sget p0, Ll/s8c0;->v:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v1, p0, Ll/ou0$a;->d:[I

    .line 33
    .line 34
    invoke-virtual {p0, v1, p2}, Ll/ou0$a;->f([II)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const v1, 0x1010031

    .line 39
    .line 40
    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 44
    .line 45
    :goto_2
    move p0, v1

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    sget p0, Ll/ccc0;->u:I

    .line 48
    .line 49
    if-ne p2, p0, :cond_3

    .line 50
    .line 51
    const p0, 0x42233333    # 40.8f

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    const p2, 0x1010030

    .line 59
    .line 60
    .line 61
    move v1, p2

    .line 62
    move p2, p0

    .line 63
    move p0, v1

    .line 64
    move v1, v2

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    sget p0, Ll/ccc0;->l:I

    .line 67
    .line 68
    if-ne p2, p0, :cond_4

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_4
    move p0, v3

    .line 72
    move v1, p0

    .line 73
    goto :goto_1

    .line 74
    :goto_3
    if-eqz v1, :cond_7

    .line 75
    .line 76
    invoke-static {p3}, Ll/gde;->a(Landroid/graphics/drawable/Drawable;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    :cond_5
    invoke-static {p1, p0}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-static {p0, v0}, Ll/ou0;->e(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p3, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 95
    .line 96
    .line 97
    if-eq p2, v4, :cond_6

    .line 98
    .line 99
    invoke-virtual {p3, p2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 100
    .line 101
    .line 102
    :cond_6
    return v2

    .line 103
    :cond_7
    return v3
.end method

.method public final f([II)Z
    .locals 3

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, v0

    .line 4
    :goto_0
    if-ge v1, p0, :cond_1

    .line 5
    .line 6
    aget v2, p1, v1

    .line 7
    .line 8
    if-ne v2, p2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    return v0
.end method

.method public final g(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/ou0$a;->h(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final h(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x4

    .line 2
    new-array v0, p0, [[I

    .line 3
    .line 4
    new-array p0, p0, [I

    .line 5
    .line 6
    sget v1, Ll/s8c0;->w:I

    .line 7
    .line 8
    invoke-static {p1, v1}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sget v2, Ll/s8c0;->u:I

    .line 13
    .line 14
    invoke-static {p1, v2}, Ll/ivi0;->a(Landroid/content/Context;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    sget-object v2, Ll/ivi0;->b:[I

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    aput-object v2, v0, v3

    .line 22
    .line 23
    aput p1, p0, v3

    .line 24
    .line 25
    sget-object p1, Ll/ivi0;->e:[I

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    aput-object p1, v0, v2

    .line 29
    .line 30
    invoke-static {v1, p2}, Ll/gf5;->j(II)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    aput p1, p0, v2

    .line 35
    .line 36
    sget-object p1, Ll/ivi0;->c:[I

    .line 37
    .line 38
    const/4 v2, 0x2

    .line 39
    aput-object p1, v0, v2

    .line 40
    .line 41
    invoke-static {v1, p2}, Ll/gf5;->j(II)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    aput p1, p0, v2

    .line 46
    .line 47
    sget-object p1, Ll/ivi0;->i:[I

    .line 48
    .line 49
    const/4 v1, 0x3

    .line 50
    aput-object p1, v0, v1

    .line 51
    .line 52
    aput p2, p0, v1

    .line 53
    .line 54
    new-instance p1, Landroid/content/res/ColorStateList;

    .line 55
    .line 56
    invoke-direct {p1, v0, p0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 57
    .line 58
    .line 59
    return-object p1
.end method

.method public final i(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/s8c0;->t:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Ll/ou0$a;->h(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final j(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/s8c0;->u:I

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Ll/ou0$a;->h(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final k(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .locals 6

    .line 1
    const/4 p0, 0x3

    .line 2
    new-array v0, p0, [[I

    .line 3
    .line 4
    new-array p0, p0, [I

    .line 5
    .line 6
    sget v1, Ll/s8c0;->z:I

    .line 7
    .line 8
    invoke-static {p1, v1}, Ll/ivi0;->d(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x1

    .line 14
    const/4 v4, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->isStateful()Z

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    if-eqz v5, :cond_0

    .line 22
    .line 23
    sget-object v5, Ll/ivi0;->b:[I

    .line 24
    .line 25
    aput-object v5, v0, v4

    .line 26
    .line 27
    invoke-virtual {v1, v5, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    aput v5, p0, v4

    .line 32
    .line 33
    sget-object v4, Ll/ivi0;->f:[I

    .line 34
    .line 35
    aput-object v4, v0, v3

    .line 36
    .line 37
    sget v4, Ll/s8c0;->v:I

    .line 38
    .line 39
    invoke-static {p1, v4}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    aput p1, p0, v3

    .line 44
    .line 45
    sget-object p1, Ll/ivi0;->i:[I

    .line 46
    .line 47
    aput-object p1, v0, v2

    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    aput p1, p0, v2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    sget-object v1, Ll/ivi0;->b:[I

    .line 57
    .line 58
    aput-object v1, v0, v4

    .line 59
    .line 60
    sget v1, Ll/s8c0;->z:I

    .line 61
    .line 62
    invoke-static {p1, v1}, Ll/ivi0;->a(Landroid/content/Context;I)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    aput v1, p0, v4

    .line 67
    .line 68
    sget-object v1, Ll/ivi0;->f:[I

    .line 69
    .line 70
    aput-object v1, v0, v3

    .line 71
    .line 72
    sget v1, Ll/s8c0;->v:I

    .line 73
    .line 74
    invoke-static {p1, v1}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    aput v1, p0, v3

    .line 79
    .line 80
    sget-object v1, Ll/ivi0;->i:[I

    .line 81
    .line 82
    aput-object v1, v0, v2

    .line 83
    .line 84
    sget v1, Ll/s8c0;->z:I

    .line 85
    .line 86
    invoke-static {p1, v1}, Ll/ivi0;->b(Landroid/content/Context;I)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    aput p1, p0, v2

    .line 91
    .line 92
    :goto_0
    new-instance p1, Landroid/content/res/ColorStateList;

    .line 93
    .line 94
    invoke-direct {p1, v0, p0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 95
    .line 96
    .line 97
    return-object p1
.end method

.method public final l(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/gde;->a(Landroid/graphics/drawable/Drawable;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    if-nez p3, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/ou0;->a()Landroid/graphics/PorterDuff$Mode;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    :cond_1
    invoke-static {p2, p3}, Ll/ou0;->e(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
