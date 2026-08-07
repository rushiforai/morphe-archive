.class public Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$b;
.super Landroid/view/inputmethod/BaseInputConnection;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;Landroid/view/View;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$b;->b:Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$b;->a:Landroid/view/View;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public deleteSurroundingText(II)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/VerifyCodeView$b;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Landroid/view/KeyEvent;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    const/16 v3, 0x43

    .line 7
    .line 8
    invoke-direct {v1, v2, v3}, Landroid/view/KeyEvent;-><init>(II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v3, v1}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 12
    .line 13
    .line 14
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->deleteSurroundingText(II)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method
