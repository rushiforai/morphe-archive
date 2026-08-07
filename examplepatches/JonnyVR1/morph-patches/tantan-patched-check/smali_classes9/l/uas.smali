.class public final synthetic Ll/uas;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/was;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

.field public final synthetic c:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uas;->a:Ll/was;

    iput-object p2, p0, Ll/uas;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    iput-object p3, p0, Ll/uas;->c:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uas;->a:Ll/was;

    iget-object v1, p0, Ll/uas;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    iget-object p0, p0, Ll/uas;->c:Landroid/util/Pair;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    invoke-static {v0, v1, p0, p1}, Ll/was;->f(Ll/was;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Landroid/util/Pair;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method
