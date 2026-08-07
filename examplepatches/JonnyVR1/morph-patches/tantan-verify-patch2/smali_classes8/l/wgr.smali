.class public final synthetic Ll/wgr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ahr;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/LikedUser;


# direct methods
.method public synthetic constructor <init>(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wgr;->a:Ll/ahr;

    iput-object p2, p0, Ll/wgr;->b:Lcom/p1/mobile/putong/core/data/LikedUser;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wgr;->a:Ll/ahr;

    iget-object p0, p0, Ll/wgr;->b:Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-static {v0, p0}, Ll/ahr;->G(Ll/ahr;Lcom/p1/mobile/putong/core/data/LikedUser;)V

    return-void
.end method
