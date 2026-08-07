.class public final synthetic Ll/m4n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/o4n;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;


# direct methods
.method public synthetic constructor <init>(Ll/o4n;Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m4n;->a:Ll/o4n;

    iput-object p2, p0, Ll/m4n;->b:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m4n;->a:Ll/o4n;

    iget-object p0, p0, Ll/m4n;->b:Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    invoke-static {v0, p0}, Ll/o4n;->S2(Ll/o4n;Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
