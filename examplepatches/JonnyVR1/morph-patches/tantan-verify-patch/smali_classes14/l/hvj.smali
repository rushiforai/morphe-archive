.class public final synthetic Ll/hvj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jjs;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;


# direct methods
.method public synthetic constructor <init>(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hvj;->a:Ll/jjs;

    iput-object p2, p0, Ll/hvj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hvj;->a:Ll/jjs;

    iget-object p0, p0, Ll/hvj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    check-cast p1, Ll/jjs;

    invoke-static {v0, p0, p1}, Ll/mvj;->s(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/jjs;)V

    return-void
.end method
