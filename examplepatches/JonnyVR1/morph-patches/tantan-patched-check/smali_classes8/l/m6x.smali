.class public final synthetic Ll/m6x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m6x;->a:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    iput-object p2, p0, Ll/m6x;->b:Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m6x;->a:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    iget-object p0, p0, Ll/m6x;->b:Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e2(Lcom/p1/mobile/putong/core/ui/match/MatchAct;Lcom/p1/mobile/putong/core/data/MatchSuccessAnimTime;)V

    return-void
.end method
