.class public final synthetic Ll/nj10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

.field public final synthetic b:Ll/yj10;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ll/yj10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nj10;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    iput-object p2, p0, Ll/nj10;->b:Ll/yj10;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nj10;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    iget-object p0, p0, Ll/nj10;->b:Ll/yj10;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/yj10;->z(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ll/yj10;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
