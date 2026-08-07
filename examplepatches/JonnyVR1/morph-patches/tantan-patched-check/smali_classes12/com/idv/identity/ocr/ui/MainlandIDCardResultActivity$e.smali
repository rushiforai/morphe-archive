.class Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$e;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$e;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->P1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/CheckBox;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    xor-int/lit8 v0, p2, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$e;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->R1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/LinearLayout;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$e;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 24
    .line 25
    invoke-static {p0, p2}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->a2(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;Z)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method
