.class public Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess$a;
    }
.end annotation


# static fields
.field public static final f:Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess$a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Ll/qzz;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess$a;

    .line 2
    .line 3
    const v1, 0x3e19999a    # 0.15f

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess$a;-><init>(F)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess$a;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->e()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->f()V

    return-void
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/d8q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->c:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    div-int/lit8 v1, v1, 0x3

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    mul-int/2addr v1, v2

    .line 11
    int-to-float v1, v1

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->b:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    mul-int/2addr v1, v2

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->c:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    div-int/lit8 v1, v1, 0x3

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->c:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    mul-int/2addr v1, v2

    .line 45
    int-to-float v1, v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 47
    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->b:Lv/VDraweeView;

    .line 50
    .line 51
    sget-object v9, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess$a;

    .line 52
    .line 53
    new-array v10, v2, [F

    .line 54
    .line 55
    fill-array-data v10, :array_0

    .line 56
    .line 57
    .line 58
    sget-object v4, Landroid/view/View;->ROTATION:Landroid/util/Property;

    .line 59
    .line 60
    const-wide/16 v5, 0x0

    .line 61
    .line 62
    const-wide/16 v7, 0x5dc

    .line 63
    .line 64
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->c:Lv/VDraweeView;

    .line 69
    .line 70
    new-array v11, v2, [F

    .line 71
    .line 72
    fill-array-data v11, :array_1

    .line 73
    .line 74
    .line 75
    move-object v10, v9

    .line 76
    move-wide v8, v7

    .line 77
    const-wide/16 v6, 0x0

    .line 78
    .line 79
    move-object v5, v4

    .line 80
    move-object v4, v1

    .line 81
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/b8q;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/b8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->e:Ll/qzz;

    .line 105
    .line 106
    new-instance v0, Ll/c8q;

    .line 107
    .line 108
    invoke-direct {v0}, Ll/c8q;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0, v0}, Ll/qzz;->J1(Ll/x20;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :array_0
    .array-data 4
        -0x3f400000    # -6.0f
        0x0
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :array_1
    .array-data 4
        0x40c00000    # 6.0f
        0x0
    .end array-data
.end method

.method public g(Ll/qzz;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->e:Ll/qzz;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->b:Lv/VDraweeView;

    .line 19
    .line 20
    invoke-static {p2}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {v0, v1, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->b:Lv/VDraweeView;

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-interface {v1}, Ll/r97;->T0()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 51
    .line 52
    .line 53
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-interface {p2, p4}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Wr(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-eqz p2, :cond_2

    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->d:Lv/VText;

    .line 68
    .line 69
    sget p4, Lcom/p1/mobile/putong/core/message/R$string;->B3:I

    .line 70
    .line 71
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(I)V

    .line 72
    .line 73
    .line 74
    :cond_2
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 75
    .line 76
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->c:Lv/VDraweeView;

    .line 77
    .line 78
    invoke-static {p3}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-virtual {p2, p4, p3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Ll/qzz;->L0()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->b:Lv/VDraweeView;

    .line 100
    .line 101
    const/4 p2, 0x0

    .line 102
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->c:Lv/VDraweeView;

    .line 106
    .line 107
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->e:Ll/qzz;

    .line 111
    .line 112
    invoke-virtual {p1}, Ll/qzz;->w0()V

    .line 113
    .line 114
    .line 115
    new-instance p1, Ll/a8q;

    .line 116
    .line 117
    invoke-direct {p1, p0}, Ll/a8q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 121
    .line 122
    .line 123
    :cond_3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemLoveBuzzUnlockSuccess;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
