.class Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->m1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    sget-object v0, Ll/ffm;->g:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-boolean v0, Ll/hfm;->e:Z

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$g;->b:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->t:Landroid/widget/RelativeLayout;

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method
