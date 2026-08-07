.class public final synthetic Ll/px9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/px9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-object p2, p0, Ll/px9;->b:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/px9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-object p0, p0, Ll/px9;->b:Lcom/p1/mobile/putong/data/Envelope;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->h2(Lcom/p1/mobile/putong/feed/api/b;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
