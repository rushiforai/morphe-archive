.class Lcom/idv/identity/ocr/ui/CardScanActivity$m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$m;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$m;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/IdentityScanView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$m;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/IdentityScanView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/idv/identity/ocr/IdentityScanView;->f()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
