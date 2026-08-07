.class public Ll/yxz$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxz;->b5(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Sticker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/sv4;

.field public final synthetic c:Landroid/view/ViewGroup;

.field public final synthetic d:[Ll/kcg0;

.field public final synthetic e:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;Ll/sv4;Landroid/view/ViewGroup;[Ll/kcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$b;->e:Ll/yxz;

    .line 2
    .line 3
    iput-object p2, p0, Ll/yxz$b;->b:Ll/sv4;

    .line 4
    .line 5
    iput-object p3, p0, Ll/yxz$b;->c:Landroid/view/ViewGroup;

    .line 6
    .line 7
    iput-object p4, p0, Ll/yxz$b;->d:[Ll/kcg0;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Ll/yxz$b;->a:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yxz$b;->e:Ll/yxz;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/yxz;->w3(Ll/yxz;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/yxz$b;->e:Ll/yxz;

    .line 8
    .line 9
    invoke-static {v0}, Ll/yxz;->s3(Ll/yxz;)Lrx/subjects/b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v2, Ll/uxj0;->a:Ll/uxj0;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/yxz$b;->e:Ll/yxz;

    .line 19
    .line 20
    invoke-static {v0}, Ll/yxz;->t3(Ll/yxz;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/yxz$b;->c:Landroid/view/ViewGroup;

    .line 28
    .line 29
    iget-object v2, p0, Ll/yxz$b;->e:Ll/yxz;

    .line 30
    .line 31
    invoke-static {v2}, Ll/yxz;->t3(Ll/yxz;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/yxz$b;->d:[Ll/kcg0;

    .line 39
    .line 40
    aget-object v0, v0, v1

    .line 41
    .line 42
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/yxz$b;->e:Ll/yxz;

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-static {p0, v0}, Ll/yxz;->x3(Ll/yxz;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    return-void
.end method

.method public onStep(I)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Lcom/tantan/library/svga/AnimListener;->onStep(I)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/yxz$b;->a:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/yxz$b;->b:Ll/sv4;

    .line 9
    .line 10
    iget v0, v0, Ll/sv4;->i:I

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    if-lt p1, v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Ll/yxz$b;->a:Z

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 20
    .line 21
    const-string v1, "vibrator"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/os/Vibrator;

    .line 28
    .line 29
    iget-object v1, p0, Ll/yxz$b;->b:Ll/sv4;

    .line 30
    .line 31
    iget-wide v1, v1, Ll/sv4;->j:J

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Ll/yxz$b;->b:Ll/sv4;

    .line 37
    .line 38
    iget-object v0, v0, Ll/sv4;->k:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    :goto_0
    iget-object v1, p0, Ll/yxz$b;->b:Ll/sv4;

    .line 48
    .line 49
    iget-object v1, v1, Ll/sv4;->k:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-ge v0, v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Ll/yxz$b;->b:Ll/sv4;

    .line 58
    .line 59
    iget-object v1, v1, Ll/sv4;->k:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ll/pf60;

    .line 66
    .line 67
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v2, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-le p1, v2, :cond_1

    .line 76
    .line 77
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v2, Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_1

    .line 86
    .line 87
    iget-object p1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast p1, Ljava/lang/Integer;

    .line 90
    .line 91
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 92
    .line 93
    invoke-static {p1, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object v1, p0, Ll/yxz$b;->b:Ll/sv4;

    .line 98
    .line 99
    iget-object v1, v1, Ll/sv4;->k:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Ll/yxz$b;->c:Landroid/view/ViewGroup;

    .line 105
    .line 106
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 107
    .line 108
    const/4 p0, 0x3

    .line 109
    new-array v9, p0, [F

    .line 110
    .line 111
    fill-array-data v9, :array_0

    .line 112
    .line 113
    .line 114
    const-wide/16 v4, 0x0

    .line 115
    .line 116
    const-wide/16 v6, 0x8c

    .line 117
    .line 118
    const/4 v8, 0x0

    .line 119
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_2
    return-void

    .line 131
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f666666    # 0.9f
        0x3f800000    # 1.0f
    .end array-data
.end method
