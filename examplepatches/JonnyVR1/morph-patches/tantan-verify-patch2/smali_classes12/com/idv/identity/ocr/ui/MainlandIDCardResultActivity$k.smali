.class Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->r2(ZLjava/lang/String;Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/widget/TextView;

.field final synthetic b:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$k;->b:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$k;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$k;->b:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$k;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->X1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;Landroid/widget/TextView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
