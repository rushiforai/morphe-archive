.class public final synthetic Ll/cce0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ece0;


# direct methods
.method public synthetic constructor <init>(Ll/ece0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cce0;->a:Ll/ece0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cce0;->a:Ll/ece0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;

    invoke-static {p0, p1}, Ll/ece0;->L(Ll/ece0;Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
