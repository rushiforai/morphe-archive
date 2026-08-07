.class public final synthetic Ll/r56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s56;


# direct methods
.method public synthetic constructor <init>(Ll/s56;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r56;->a:Ll/s56;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r56;->a:Ll/s56;

    check-cast p1, Lcom/p1/mobile/putong/data/ConversationCounter;

    invoke-static {p0, p1}, Ll/s56;->e0(Ll/s56;Lcom/p1/mobile/putong/data/ConversationCounter;)V

    return-void
.end method
