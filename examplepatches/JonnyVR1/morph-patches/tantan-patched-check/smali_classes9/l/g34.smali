.class public final synthetic Ll/g34;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/w34;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;


# direct methods
.method public synthetic constructor <init>(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g34;->a:Ll/w34;

    iput-object p2, p0, Ll/g34;->b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g34;->a:Ll/w34;

    iget-object p0, p0, Ll/g34;->b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    invoke-static {v0, p0}, Ll/w34;->f4(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    return-void
.end method
