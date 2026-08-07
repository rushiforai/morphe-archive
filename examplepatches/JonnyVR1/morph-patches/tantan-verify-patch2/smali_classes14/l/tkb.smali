.class public final synthetic Ll/tkb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/AgeVerificationPatchInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/AgeVerificationPatchInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tkb;->a:Lcom/p1/mobile/putong/data/AgeVerificationPatchInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tkb;->a:Lcom/p1/mobile/putong/data/AgeVerificationPatchInfo;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->l3(Lcom/p1/mobile/putong/data/AgeVerificationPatchInfo;Ljava/util/List;)Lcom/p1/mobile/putong/data/VerificationPatchInfo;

    move-result-object p0

    return-object p0
.end method
