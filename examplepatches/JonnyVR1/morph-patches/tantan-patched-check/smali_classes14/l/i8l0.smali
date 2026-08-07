.class public final synthetic Ll/i8l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/c$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i8l0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    iput-boolean p2, p0, Ll/i8l0;->b:Z

    return-void
.end method


# virtual methods
.method public final commitText(Ljava/lang/CharSequence;I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i8l0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;

    iget-boolean p0, p0, Ll/i8l0;->b:Z

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;->b(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/VerifyCodeView;ZLjava/lang/CharSequence;I)Z

    move-result p0

    return p0
.end method
