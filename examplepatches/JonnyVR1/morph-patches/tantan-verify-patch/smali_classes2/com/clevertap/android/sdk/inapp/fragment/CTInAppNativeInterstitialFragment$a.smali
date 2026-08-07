.class public final Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;->J4(Landroid/widget/FrameLayout;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V
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
        "com/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a",
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
.field final synthetic a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

.field final synthetic b:Landroid/widget/FrameLayout;

.field final synthetic c:Lcom/clevertap/android/sdk/customviews/CloseImageView;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;Landroid/widget/FrameLayout;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->b:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->c:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;->H4(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;)Landroid/widget/RelativeLayout;

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
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

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
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->v4()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->b:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->c:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 44
    .line 45
    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->A4(Landroid/widget/RelativeLayout;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->v4()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->a:Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->b:Landroid/widget/FrameLayout;

    .line 60
    .line 61
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->c:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 62
    .line 63
    invoke-virtual {v3, v0, v1, v2, v4}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->z4(Landroid/widget/RelativeLayout;Landroid/widget/FrameLayout$LayoutParams;Landroid/widget/FrameLayout;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeInterstitialFragment$a;->c:Lcom/clevertap/android/sdk/customviews/CloseImageView;

    .line 68
    .line 69
    invoke-virtual {v3, v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;->y4(Landroid/widget/RelativeLayout;Landroid/widget/FrameLayout$LayoutParams;Lcom/clevertap/android/sdk/customviews/CloseImageView;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
