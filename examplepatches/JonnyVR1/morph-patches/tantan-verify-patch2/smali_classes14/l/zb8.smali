.class public final synthetic Ll/zb8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/zb8;->b:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Ll/zb8;->b:Lcom/p1/mobile/putong/data/Links;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->n4(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
