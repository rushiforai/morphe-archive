.class public final synthetic Ll/j7l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j7l0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    iput-object p2, p0, Ll/j7l0;->b:Lcom/p1/mobile/putong/data/VerifyData;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j7l0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    iget-object p0, p0, Ll/j7l0;->b:Lcom/p1/mobile/putong/data/VerifyData;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->j(Lcom/p1/mobile/putong/account/ui/accountnew/a;Lcom/p1/mobile/putong/data/VerifyData;)V

    return-void
.end method
