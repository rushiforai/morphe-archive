.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Exception;

    .line 2
    .line 3
    const-string v1, "pic crop error"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->h(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->h(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;->a()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public b(Landroid/net/Uri;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->d(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;->a(Landroid/net/Uri;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->e(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$b;->a:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->e(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;->onError(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
