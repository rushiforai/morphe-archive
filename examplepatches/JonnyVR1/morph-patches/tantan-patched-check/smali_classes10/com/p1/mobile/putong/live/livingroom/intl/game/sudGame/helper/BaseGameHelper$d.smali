.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->C(Landroid/view/View;Ltech/sud/gip/core/ISudFSMStateHandle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ltech/sud/gip/core/ISudFSMStateHandle;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Landroid/view/View;Ltech/sud/gip/core/ISudFSMStateHandle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->b:Ltech/sud/gip/core/ISudFSMStateHandle;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->a:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->a:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;->b:Ltech/sud/gip/core/ISudFSMStateHandle;

    .line 25
    .line 26
    invoke-static {v2, p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->f(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Ltech/sud/gip/core/ISudFSMStateHandle;II)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
