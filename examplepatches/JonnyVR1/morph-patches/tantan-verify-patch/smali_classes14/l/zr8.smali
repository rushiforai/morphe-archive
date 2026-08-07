.class public final synthetic Ll/zr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/i;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zr8;->a:Lcom/p1/mobile/putong/core/api/i;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zr8;->a:Lcom/p1/mobile/putong/core/api/i;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreFeedStateEnvelop;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/i;->m3(Lcom/p1/mobile/putong/core/api/i;Lcom/p1/mobile/putong/core/data/CoreFeedStateEnvelop;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
