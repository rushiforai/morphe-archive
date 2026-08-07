.class Lcom/idv/identity/ocr/ui/CardScanActivity$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/ocr/ui/CardScanActivity$x;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;->s2(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$p;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$p;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$p;->b:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$p;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->y1(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onCancel()V
    .locals 0

    return-void
.end method
