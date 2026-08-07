.class public final synthetic Ll/qlb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/VerificationPatchInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/VerificationPatchInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qlb;->a:Lcom/p1/mobile/putong/data/VerificationPatchInfo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qlb;->a:Lcom/p1/mobile/putong/data/VerificationPatchInfo;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/d0;->C3(Lcom/p1/mobile/putong/data/VerificationPatchInfo;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
