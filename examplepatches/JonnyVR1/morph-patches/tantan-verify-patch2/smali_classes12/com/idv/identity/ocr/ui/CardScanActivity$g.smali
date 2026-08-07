.class Lcom/idv/identity/ocr/ui/CardScanActivity$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->init()V
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
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$g;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$g;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->k1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$g;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->R0(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$g;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Y0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$g;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->a1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z

    .line 24
    .line 25
    .line 26
    new-instance v0, Lcom/idv/identity/ocr/ui/CardScanActivity$g$a;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$g$a;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity$g;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method
