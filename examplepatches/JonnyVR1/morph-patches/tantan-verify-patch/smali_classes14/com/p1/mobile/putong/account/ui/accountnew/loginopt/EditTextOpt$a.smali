.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;->n()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;->j(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/EditTextOpt;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
