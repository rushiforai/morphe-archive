.class public final synthetic Ll/k7l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/VerifyReason;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/a;ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k7l0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    iput p2, p0, Ll/k7l0;->b:I

    iput-object p3, p0, Ll/k7l0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/k7l0;->d:Lcom/p1/mobile/putong/data/VerifyReason;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k7l0;->a:Lcom/p1/mobile/putong/account/ui/accountnew/a;

    iget v1, p0, Ll/k7l0;->b:I

    iget-object v2, p0, Ll/k7l0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/k7l0;->d:Lcom/p1/mobile/putong/data/VerifyReason;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/a;->m(Lcom/p1/mobile/putong/account/ui/accountnew/a;ILjava/lang/String;Lcom/p1/mobile/putong/data/VerifyReason;)V

    return-void
.end method
