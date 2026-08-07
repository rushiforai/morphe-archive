.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tvb$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/net/Uri;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setImage(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Ll/tvb$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1, p2}, Ll/tvb$a;->a(Landroid/net/Uri;Landroid/graphics/Bitmap;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "CropIwa Image loading from ["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "] failed"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0, p1}, Ll/xvb;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->setDrawOverlay(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$a;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->f(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Ll/tvb$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0, p1}, Ll/tvb$a;->b(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
