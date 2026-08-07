.class public final synthetic Ll/a7o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/b7o0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;


# direct methods
.method public synthetic constructor <init>(Ll/b7o0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a7o0;->a:Ll/b7o0;

    iput-object p2, p0, Ll/a7o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a7o0;->a:Ll/b7o0;

    iget-object p0, p0, Ll/a7o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;

    invoke-static {v0, p0, p1}, Ll/b7o0;->c(Ll/b7o0;Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Landroid/view/View;)V

    return-void
.end method
