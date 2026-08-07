.class public Ll/jch0;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public j:Lcom/tantan/library/svga/SVGAnimationView;

.field public k:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public l:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public m:Lv/VText;

.field public n:Lv/VImage;

.field public final o:Lcom/p1/mobile/android/app/Act;

.field public p:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->r:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p1, p0, Ll/jch0;->o:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic E(Ll/jch0;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jch0;->o:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic F(Ll/jch0;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jch0;->p:Ll/x20;

    return-object p0
.end method


# virtual methods
.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kch0;->b(Ll/jch0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jch0;->p:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/jch0;->o:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/jch0;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/jch0;->n:Lv/VImage;

    .line 19
    .line 20
    new-instance v0, Ll/jch0$a;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/jch0$a;-><init>(Ll/jch0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object p0, p0, Ll/jch0;->k:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 31
    .line 32
    const-string v0, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ijc3TUxURkdBMkVBMldYQUxSUENMNVhPQlhDUVpHVjE0IiwidyI6MTI5NywiaCI6MTMzNiwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjUwODY0MTg0MDI2NzY2MDgxNH0.png"

    .line 33
    .line 34
    invoke-virtual {p1, p0, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public show()V
    .locals 13

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jch0;->o:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v1, Ll/jch0$b;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/jch0$b;-><init>(Ll/jch0;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v2, 0x12c

    .line 15
    .line 16
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    iget-object v4, p0, Ll/jch0;->l:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 20
    .line 21
    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 22
    .line 23
    new-instance v10, Landroid/view/animation/LinearInterpolator;

    .line 24
    .line 25
    invoke-direct {v10}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    new-array v11, v0, [F

    .line 30
    .line 31
    fill-array-data v11, :array_0

    .line 32
    .line 33
    .line 34
    move-object v5, v6

    .line 35
    const-wide/16 v6, 0x190

    .line 36
    .line 37
    const-wide/16 v8, 0xc8

    .line 38
    .line 39
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 44
    .line 45
    .line 46
    move-object v6, v5

    .line 47
    iget-object v5, p0, Ll/jch0;->m:Lv/VText;

    .line 48
    .line 49
    new-instance v11, Landroid/view/animation/LinearInterpolator;

    .line 50
    .line 51
    invoke-direct {v11}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 52
    .line 53
    .line 54
    new-array v12, v0, [F

    .line 55
    .line 56
    fill-array-data v12, :array_1

    .line 57
    .line 58
    .line 59
    const-wide/16 v7, 0x190

    .line 60
    .line 61
    const-wide/16 v9, 0xc8

    .line 62
    .line 63
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    move-object v5, v6

    .line 68
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/jch0;->k:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 72
    .line 73
    new-instance v11, Landroid/view/animation/LinearInterpolator;

    .line 74
    .line 75
    invoke-direct {v11}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 76
    .line 77
    .line 78
    new-array v12, v0, [F

    .line 79
    .line 80
    fill-array-data v12, :array_2

    .line 81
    .line 82
    .line 83
    const-wide/16 v9, 0x1c2

    .line 84
    .line 85
    move-object v5, p0

    .line 86
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    nop

    .line 95
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
