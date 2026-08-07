.class public final synthetic Ll/af;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/api/a;

.field public final synthetic b:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/af;->a:Lcom/p1/mobile/putong/account/api/a;

    iput-object p2, p0, Ll/af;->b:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/af;->a:Lcom/p1/mobile/putong/account/api/a;

    iget-object p0, p0, Ll/af;->b:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/account/api/a;->B(Lcom/p1/mobile/putong/account/api/a;Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
