.class public final synthetic Ll/wdg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;

.field public final synthetic b:Ll/tk2;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;Ll/tk2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wdg;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;

    iput-object p2, p0, Ll/wdg;->b:Ll/tk2;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wdg;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;

    iget-object p0, p0, Ll/wdg;->b:Ll/tk2;

    invoke-static {v0, p0, p1}, Ll/xdg;->g0(Lcom/p1/mobile/putong/live/base/data/BLiveAdvanceTask;Ll/tk2;Landroid/view/View;)V

    return-void
.end method
