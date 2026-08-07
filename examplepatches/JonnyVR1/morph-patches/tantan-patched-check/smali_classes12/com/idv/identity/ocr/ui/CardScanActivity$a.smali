.class Lcom/idv/identity/ocr/ui/CardScanActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/w50<",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->b(Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Landroid/net/Uri;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Selected URI: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "PhotoPicker"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$a;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 23
    .line 24
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity$a$a;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity$a;Landroid/net/Uri;)V

    .line 27
    .line 28
    .line 29
    const-wide/16 p0, 0xc8

    .line 30
    .line 31
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method
