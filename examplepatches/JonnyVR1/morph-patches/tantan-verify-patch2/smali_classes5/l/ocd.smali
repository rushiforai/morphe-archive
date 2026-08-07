.class public final synthetic Ll/ocd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/VerificationNetworkData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/VerificationNetworkData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ocd;->a:Lcom/p1/mobile/putong/data/VerificationNetworkData;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ocd;->a:Lcom/p1/mobile/putong/data/VerificationNetworkData;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->W4(Lcom/p1/mobile/putong/data/VerificationNetworkData;)V

    return-void
.end method
