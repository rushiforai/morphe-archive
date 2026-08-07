.class public final synthetic Ll/ah9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ah9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-object p2, p0, Ll/ah9;->b:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ah9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object p0, p0, Ll/ah9;->b:Lcom/p1/mobile/putong/data/Links;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->F4(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
