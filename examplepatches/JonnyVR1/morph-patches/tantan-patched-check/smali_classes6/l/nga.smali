.class public final synthetic Ll/nga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nga;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p2, p0, Ll/nga;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nga;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object p0, p0, Ll/nga;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, p0}, Ll/jka;->o6(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
