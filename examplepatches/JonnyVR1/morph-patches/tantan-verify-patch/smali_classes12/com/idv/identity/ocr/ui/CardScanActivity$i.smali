.class Lcom/idv/identity/ocr/ui/CardScanActivity$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iql;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->r2(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$i;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$i;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;Z)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$i;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p2, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->m1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$i;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$i;->a:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p2, p1, p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->r1(Lcom/idv/identity/ocr/ui/CardScanActivity;Landroid/graphics/Bitmap;ZLcom/idv/identity/base/algorithm/doc/Attr;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
