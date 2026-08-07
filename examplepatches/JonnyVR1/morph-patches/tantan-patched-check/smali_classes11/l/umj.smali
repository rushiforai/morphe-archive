.class public final synthetic Ll/umj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/id80$b;


# instance fields
.field public final synthetic a:Lcom/facebook/login/GetTokenLoginMethodHandler;

.field public final synthetic b:Lcom/facebook/login/LoginClient$Request;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/login/GetTokenLoginMethodHandler;Lcom/facebook/login/LoginClient$Request;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/umj;->a:Lcom/facebook/login/GetTokenLoginMethodHandler;

    iput-object p2, p0, Ll/umj;->b:Lcom/facebook/login/LoginClient$Request;

    return-void
.end method


# virtual methods
.method public final a(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/umj;->a:Lcom/facebook/login/GetTokenLoginMethodHandler;

    iget-object p0, p0, Ll/umj;->b:Lcom/facebook/login/LoginClient$Request;

    invoke-static {v0, p0, p1}, Lcom/facebook/login/GetTokenLoginMethodHandler;->q(Lcom/facebook/login/GetTokenLoginMethodHandler;Lcom/facebook/login/LoginClient$Request;Landroid/os/Bundle;)V

    return-void
.end method
