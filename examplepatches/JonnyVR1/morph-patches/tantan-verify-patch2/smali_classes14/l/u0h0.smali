.class public final synthetic Ll/u0h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;Ll/jl80;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u0h0;->a:Ljava/util/HashMap;

    iput-object p2, p0, Ll/u0h0;->b:Ll/jl80;

    iput-object p3, p0, Ll/u0h0;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/u0h0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u0h0;->a:Ljava/util/HashMap;

    iget-object v1, p0, Ll/u0h0;->b:Ll/jl80;

    iget-object v2, p0, Ll/u0h0;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/u0h0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;

    invoke-static {v0, v1, v2, p0}, Ll/x0h0;->T2(Ljava/util/HashMap;Ll/jl80;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
