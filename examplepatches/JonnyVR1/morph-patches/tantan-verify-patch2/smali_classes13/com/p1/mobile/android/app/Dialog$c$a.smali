.class public Lcom/p1/mobile/android/app/Dialog$c$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


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
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$c$a;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Dialog$c$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$c$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$c$a;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$c$a;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Ll/abc0;->a:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$c$a;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/u0e;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/u0e;-><init>(Lcom/p1/mobile/android/app/Dialog$c$a;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v1, 0x64

    .line 15
    .line 16
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
