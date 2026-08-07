.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dw5;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;Ll/kwb;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->i(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Ll/bwb;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/bwb;->w(Ll/dw5;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->f()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 42
    .line 43
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->k(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setDrawOverlay(Z)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->invalidate()V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final b()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->i(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Ll/bwb;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/bwb;->q()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$f;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    instance-of p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaDynamicOverlayView;

    .line 18
    .line 19
    if-eq v0, p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
