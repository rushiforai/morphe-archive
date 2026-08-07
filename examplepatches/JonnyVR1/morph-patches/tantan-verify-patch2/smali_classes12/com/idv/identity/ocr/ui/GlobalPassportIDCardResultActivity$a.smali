.class Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->f1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->P1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->R1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/Button;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 17
    .line 18
    sget v1, Ll/rcc0;->p:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Landroid/widget/ScrollView;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    new-instance v1, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a$a;-><init>(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$a;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
