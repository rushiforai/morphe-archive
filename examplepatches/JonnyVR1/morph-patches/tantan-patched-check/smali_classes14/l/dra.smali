.class public final synthetic Ll/dra;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GPContractQueryParams;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GPContractQueryParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dra;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/dra;->b:Lcom/p1/mobile/putong/core/data/GPContractQueryParams;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dra;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/dra;->b:Lcom/p1/mobile/putong/core/data/GPContractQueryParams;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->i3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GPContractQueryParams;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
