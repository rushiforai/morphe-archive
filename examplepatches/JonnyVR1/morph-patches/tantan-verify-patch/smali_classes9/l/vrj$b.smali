.class public Ll/vrj$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vrj;->f(Ll/vrj$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vrj$c;

.field public final synthetic b:Ll/vrj;


# direct methods
.method public constructor <init>(Ll/vrj;Ll/vrj$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vrj$b;->b:Ll/vrj;

    .line 2
    .line 3
    iput-object p2, p0, Ll/vrj$b;->a:Ll/vrj$c;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/vrj$b;->b:Ll/vrj;

    .line 2
    .line 3
    invoke-static {p1}, Ll/vrj;->a(Ll/vrj;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->O0()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/vrj$b;->b:Ll/vrj;

    .line 11
    .line 12
    invoke-static {p1}, Ll/vrj;->b(Ll/vrj;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/vrj$b;->a:Ll/vrj$c;

    .line 21
    .line 22
    invoke-interface {p0, v0}, Ll/vrj$c;->a(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/vrj$b;->b:Ll/vrj;

    .line 2
    .line 3
    invoke-static {p1}, Ll/vrj;->b(Ll/vrj;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/vrj$b;->b:Ll/vrj;

    .line 12
    .line 13
    invoke-static {p1}, Ll/vrj;->a(Ll/vrj;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/vrj$b;->a:Ll/vrj$c;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/vrj$c;->b()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
