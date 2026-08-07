.class public final synthetic Ll/dy7;
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

    iput-object p1, p0, Ll/dy7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/dy7;->b:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dy7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object p0, p0, Ll/dy7;->b:Lcom/p1/mobile/putong/data/Links;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->bd(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/Links;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
