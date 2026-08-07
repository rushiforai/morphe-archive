.class public final synthetic Ll/dpu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/spu;


# direct methods
.method public synthetic constructor <init>(Ll/spu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dpu;->a:Ll/spu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dpu;->a:Ll/spu;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    invoke-static {p0, p1}, Ll/spu;->h3(Ll/spu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method
