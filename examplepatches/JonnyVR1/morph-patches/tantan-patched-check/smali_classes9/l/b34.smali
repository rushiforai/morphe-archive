.class public final synthetic Ll/b34;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/w34;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;


# direct methods
.method public synthetic constructor <init>(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b34;->a:Ll/w34;

    iput-object p2, p0, Ll/b34;->b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b34;->a:Ll/w34;

    iget-object p0, p0, Ll/b34;->b:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/w34;->V3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;Ljava/lang/Long;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
