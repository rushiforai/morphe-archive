.class public final synthetic Ll/f2l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f2l0;->a:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

    iput-object p2, p0, Ll/f2l0;->b:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f2l0;->a:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

    iget-object p0, p0, Ll/f2l0;->b:Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;->c2(Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;Lcom/p1/mobile/putong/core/util/verificationoptimization/VerificationAct;)V

    return-void
.end method
