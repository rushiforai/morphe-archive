.class public final synthetic Ll/hru;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kru;


# direct methods
.method public synthetic constructor <init>(Ll/kru;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hru;->a:Ll/kru;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hru;->a:Ll/kru;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    invoke-static {p0, p1}, Ll/kru;->W2(Ll/kru;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;)V

    return-void
.end method
