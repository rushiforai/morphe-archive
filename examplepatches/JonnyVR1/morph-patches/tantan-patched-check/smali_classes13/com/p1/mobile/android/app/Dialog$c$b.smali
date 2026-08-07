.class public Lcom/p1/mobile/android/app/Dialog$c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Dialog$c;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog$c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$c$b;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$c$b;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/app/Dialog;->h0(Landroid/view/ViewGroup;F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
