.class public final synthetic Ll/p1d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p1d;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p2, p0, Ll/p1d;->b:Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p1d;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object p0, p0, Ll/p1d;->b:Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->G8(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    return-void
.end method
