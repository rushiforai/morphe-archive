.class public final synthetic Ll/lxn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lxn;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;

    iput-object p2, p0, Ll/lxn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lxn;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;

    iget-object p0, p0, Ll/lxn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;->W2(Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V

    return-void
.end method
