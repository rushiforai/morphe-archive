.class Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->c2()Ljava/util/Map;
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
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$e;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

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
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity$e;->a:Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;->R1(Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;)Landroid/widget/Button;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
