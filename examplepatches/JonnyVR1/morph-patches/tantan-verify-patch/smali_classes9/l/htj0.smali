.class public final synthetic Ll/htj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qtj0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Ll/qtj0;Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/htj0;->a:Ll/qtj0;

    iput-object p2, p0, Ll/htj0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    iput-object p3, p0, Ll/htj0;->c:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/htj0;->a:Ll/qtj0;

    iget-object v1, p0, Ll/htj0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    iget-object p0, p0, Ll/htj0;->c:Lkotlin/jvm/functions/Function0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {v0, v1, p0, p1}, Ll/qtj0;->N3(Ll/qtj0;Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;Lkotlin/jvm/functions/Function0;Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
