.class public final synthetic Ll/tzc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ContractInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/ContractInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {p0, p1}, Ll/xzc0;->c(Lcom/p1/mobile/putong/core/data/ContractInfo;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
