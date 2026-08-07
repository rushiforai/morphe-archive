.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;Ll/uj1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$d;

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->a(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$d;

    .line 17
    .line 18
    .line 19
    throw p1
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a$b;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;->b(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
