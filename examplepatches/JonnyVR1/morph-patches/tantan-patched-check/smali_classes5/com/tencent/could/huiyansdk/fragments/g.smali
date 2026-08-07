.class public Lcom/tencent/could/huiyansdk/fragments/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private a()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    iget v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k:I

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto/16 :goto_0

    .line 9
    .line 10
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isAutoScreenBrightness()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 23
    .line 24
    const/16 v2, 0xff

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isOpenLightReflectAnim()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->b()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 50
    .line 51
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 52
    .line 53
    if-eqz v2, :cond_6

    .line 54
    .line 55
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-nez v1, :cond_3

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    invoke-static {v2, v3}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Z)Z

    .line 66
    .line 67
    .line 68
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->c:Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;

    .line 69
    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/AuthUiConfig;->isHideFrontCircleViewOnReflect()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 81
    .line 82
    const/16 v0, 0x8

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 91
    .line 92
    const/4 v2, 0x0

    .line 93
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->i:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    .line 99
    .line 100
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    sget v1, Lcom/tencent/could/huiyansdk/R$color;->txy_animation_mid_color:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget v1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->g:I

    .line 111
    .line 112
    if-ne v0, v1, :cond_5

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->j:Landroid/graphics/Paint;

    .line 116
    .line 117
    if-eqz v1, :cond_6

    .line 118
    .line 119
    iput v0, p0, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->g:I

    .line 120
    .line 121
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 125
    .line 126
    .line 127
    :cond_6
    :goto_0
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/fragments/g;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/fragments/g;->a()V

    return-void
.end method


# virtual methods
.method public onGetAppBrightness()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    iget p0, p0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->k:I

    .line 4
    .line 5
    int-to-float p0, p0

    .line 6
    return p0
.end method

.method public onReflectEvent(Landroid/graphics/ColorMatrixColorFilter;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->b(Landroid/graphics/ColorMatrixColorFilter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onReflectStart(J)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/tencent/could/huiyansdk/fragments/g;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 2
    .line 3
    new-instance p2, Ll/q2r0;

    .line 4
    .line 5
    invoke-direct {p2, p0}, Ll/q2r0;-><init>(Lcom/tencent/could/huiyansdk/fragments/g;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Lcom/tencent/could/huiyansdk/fragments/BaseFragment;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
