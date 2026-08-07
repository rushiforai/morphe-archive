.class public final synthetic Ll/j1k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/o1k0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/o1k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j1k0;->a:Ljava/util/List;

    iput-object p2, p0, Ll/j1k0;->b:Ll/o1k0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j1k0;->a:Ljava/util/List;

    iget-object p0, p0, Ll/j1k0;->b:Ll/o1k0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftActInfo;

    invoke-static {v0, p0, p1}, Ll/n1k0;->c(Ljava/util/List;Ll/o1k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftActInfo;)V

    return-void
.end method
