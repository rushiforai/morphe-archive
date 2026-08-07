.class Lcom/idv/identity/ocr/ui/CardScanActivity$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->k2()V
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
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$h;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$h;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I0:Ljava/lang/String;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n3()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->o3()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
