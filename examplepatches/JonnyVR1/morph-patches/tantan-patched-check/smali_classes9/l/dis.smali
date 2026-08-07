.class public final synthetic Ll/dis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bjs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveType;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dis;->a:Ll/bjs;

    iput-object p2, p0, Ll/dis;->b:Lcom/p1/mobile/putong/live/base/data/BLiveType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dis;->a:Ll/bjs;

    iget-object p0, p0, Ll/dis;->b:Lcom/p1/mobile/putong/live/base/data/BLiveType;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/bjs;->W3(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveType;Landroid/util/Pair;)V

    return-void
.end method
