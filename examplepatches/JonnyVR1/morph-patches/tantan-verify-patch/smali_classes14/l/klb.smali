.class public final synthetic Ll/klb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/d0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/VerificationCenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/d0;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/klb;->a:Lcom/p1/mobile/putong/core/api/d0;

    iput-object p2, p0, Ll/klb;->b:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/klb;->a:Lcom/p1/mobile/putong/core/api/d0;

    iget-object p0, p0, Ll/klb;->b:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/d0;->y3(Lcom/p1/mobile/putong/core/api/d0;Lcom/p1/mobile/putong/core/data/VerificationCenter;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
