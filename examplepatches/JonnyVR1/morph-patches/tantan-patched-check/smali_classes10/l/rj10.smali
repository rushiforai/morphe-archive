.class public final synthetic Ll/rj10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/yj10;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/yj10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rj10;->a:Ll/yj10;

    iput-object p2, p0, Ll/rj10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    iput-object p3, p0, Ll/rj10;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rj10;->a:Ll/yj10;

    iget-object v1, p0, Ll/rj10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    iget-object p0, p0, Ll/rj10;->c:Ljava/lang/String;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Ll/yj10;->B(Ll/yj10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;Landroid/view/View;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
