.class public final synthetic Ll/p3l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p3l0;->a:Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p3l0;->a:Lcom/p1/mobile/putong/core/ui/verification/VerificationExecuteAct;

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    return-void
.end method
