.class public final synthetic Ll/ukb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/d0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ukb;->a:Lcom/p1/mobile/putong/core/api/d0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ukb;->a:Lcom/p1/mobile/putong/core/api/d0;

    check-cast p1, Lcom/p1/mobile/putong/data/VerificationPatchInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->N3(Lcom/p1/mobile/putong/core/api/d0;Lcom/p1/mobile/putong/data/VerificationPatchInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
