.class public final synthetic Ll/zw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DbLinks;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/data/DbLinks;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zw8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/zw8;->b:Lcom/p1/mobile/putong/data/DbLinks;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zw8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object p0, p0, Ll/zw8;->b:Lcom/p1/mobile/putong/data/DbLinks;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/j;->R3(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/data/DbLinks;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
