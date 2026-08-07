.class Lcom/idv/identity/ocr/ui/HKIDCardResultActivity$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;->p1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;

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
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;->L:Ll/qfm;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/qfm;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/qfm;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p1, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;->L:Ll/qfm;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity$c;->a:Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;->L:Ll/qfm;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
