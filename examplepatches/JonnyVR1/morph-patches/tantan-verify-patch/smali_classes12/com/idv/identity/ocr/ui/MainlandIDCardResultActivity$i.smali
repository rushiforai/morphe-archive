.class Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->p1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$i;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

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
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$i;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->U1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$i;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->U1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1, v0, p0}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->r2(ZLjava/lang/String;Landroid/widget/TextView;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
