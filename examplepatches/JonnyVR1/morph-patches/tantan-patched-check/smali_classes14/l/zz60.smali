.class public final synthetic Ll/zz60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e070;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyData;


# direct methods
.method public synthetic constructor <init>(Ll/e070;Lcom/p1/mobile/putong/data/VerifyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zz60;->a:Ll/e070;

    iput-object p2, p0, Ll/zz60;->b:Lcom/p1/mobile/putong/data/VerifyData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zz60;->a:Ll/e070;

    iget-object p0, p0, Ll/zz60;->b:Lcom/p1/mobile/putong/data/VerifyData;

    check-cast p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;

    invoke-static {v0, p0, p1}, Ll/e070;->W0(Ll/e070;Lcom/p1/mobile/putong/data/VerifyData;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V

    return-void
.end method
