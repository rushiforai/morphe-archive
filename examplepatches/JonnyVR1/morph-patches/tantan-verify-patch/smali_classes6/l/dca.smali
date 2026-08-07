.class public final synthetic Ll/dca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dca;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p2, p0, Ll/dca;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dca;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object p0, p0, Ll/dca;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/jka;->l3(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    move-result-object p0

    return-object p0
.end method
