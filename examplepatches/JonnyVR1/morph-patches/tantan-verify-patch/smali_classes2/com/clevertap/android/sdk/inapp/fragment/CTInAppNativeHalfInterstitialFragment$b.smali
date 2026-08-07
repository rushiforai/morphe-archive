.class public final Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b",
        "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;",
        "",
        "onGlobalLayout",
        "()V",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

.field final synthetic b:Lcom/clevertap/android/sdk/customviews/CloseImageView;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->b:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static a(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v1, v0

    .line 15
    int-to-float v1, v1

    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setX(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sub-int/2addr p1, v0

    .line 24
    int-to-float p1, p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setY(F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static b(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v1, v0

    .line 15
    int-to-float v1, v1

    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setX(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sub-int/2addr p1, v0

    .line 24
    int-to-float p1, p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setY(F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static c(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v1, v0

    .line 15
    int-to-float v1, v1

    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->setX(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sub-int/2addr p1, v0

    .line 24
    int-to-float p1, p1

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setY(F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;->H4(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;)Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->T()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/16 v3, 0x11

    .line 30
    .line 31
    const v4, 0x3fa66666    # 1.3f

    .line 32
    .line 33
    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->v4()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    int-to-float v2, v2

    .line 50
    mul-float/2addr v2, v4

    .line 51
    float-to-int v2, v2

    .line 52
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 53
    .line 54
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->b:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 60
    .line 61
    new-instance v2, Ll/nv3;

    .line 62
    .line 63
    invoke-direct {v2, v1, v0}, Ll/nv3;-><init>(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->v4()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_3

    .line 77
    .line 78
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 79
    .line 80
    const/16 v5, 0x8c

    .line 81
    .line 82
    invoke-virtual {v2, v5}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->i4(I)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    iget-object v6, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 87
    .line 88
    const/16 v7, 0x64

    .line 89
    .line 90
    invoke-virtual {v6, v7}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->i4(I)I

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    iget-object v8, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 95
    .line 96
    invoke-virtual {v8, v5}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->i4(I)I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    iget-object v8, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 101
    .line 102
    invoke-virtual {v8, v7}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->i4(I)I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    invoke-virtual {v1, v2, v6, v5, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    iget-object v5, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment;

    .line 114
    .line 115
    const/16 v6, 0x82

    .line 116
    .line 117
    invoke-virtual {v5, v6}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->i4(I)I

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    sub-int/2addr v2, v5

    .line 122
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 123
    .line 124
    int-to-float v2, v2

    .line 125
    mul-float/2addr v2, v4

    .line 126
    float-to-int v2, v2

    .line 127
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 128
    .line 129
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    .line 133
    .line 134
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->b:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 135
    .line 136
    new-instance v2, Ll/lv3;

    .line 137
    .line 138
    invoke-direct {v2, v1, v0}, Ll/lv3;-><init>(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    int-to-float v2, v2

    .line 150
    mul-float/2addr v2, v4

    .line 151
    float-to-int v2, v2

    .line 152
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 153
    .line 154
    const/4 v2, 0x1

    .line 155
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHalfInterstitialFragment$b;->b:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 161
    .line 162
    new-instance v2, Ll/mv3;

    .line 163
    .line 164
    invoke-direct {v2, v1, v0}, Ll/mv3;-><init>(Lcom/clevertap/android/sdk/customviews/CloseImageView;Landroid/widget/RelativeLayout;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 168
    .line 169
    .line 170
    :goto_1
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method
