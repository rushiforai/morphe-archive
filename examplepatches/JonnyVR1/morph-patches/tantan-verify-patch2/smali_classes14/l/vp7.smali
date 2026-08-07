.class public final synthetic Ll/vp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vp7;->a:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp7;->a:Lrx/subjects/a;

    check-cast p1, Lcom/p1/mobile/putong/data/ContractEnvelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreCommonServiceImpl;->F(Lrx/subjects/a;Lcom/p1/mobile/putong/data/ContractEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
