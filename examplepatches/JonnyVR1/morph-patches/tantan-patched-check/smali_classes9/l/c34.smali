.class public final synthetic Ll/c34;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w34;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;


# direct methods
.method public synthetic constructor <init>(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c34;->a:Ll/w34;

    iput-object p2, p0, Ll/c34;->b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c34;->a:Ll/w34;

    iget-object p0, p0, Ll/c34;->b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/w34;->W3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/String;)V

    return-void
.end method
