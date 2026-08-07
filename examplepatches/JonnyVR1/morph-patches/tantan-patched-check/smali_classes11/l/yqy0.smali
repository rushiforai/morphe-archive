.class public final Ll/yqy0;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/google/android/gms/ads/internal/overlay/zzs;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/overlay/zzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yqy0;->a:Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqy0;->a:Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/yqy0;->a:Lcom/google/android/gms/ads/internal/overlay/zzs;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/google/android/gms/ads/internal/overlay/zzs;->a(Lcom/google/android/gms/ads/internal/overlay/zzs;)Landroid/widget/ImageButton;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/yqy0;->a(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/yqy0;->a(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/yqy0;->a(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
