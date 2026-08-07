.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->S(Lcom/p1/mobile/android/app/Act;Ll/jl80;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/jl80;

.field public final synthetic d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->a:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->b:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->c:Ll/jl80;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->a:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getPopupType()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "live_popup_type"

    .line 13
    .line 14
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->a:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getUserType()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "live_user_type"

    .line 24
    .line 25
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string v0, "e_live_active_gift_popup_close"

    .line 29
    .line 30
    const-string v1, "p_live_popup"

    .line 31
    .line 32
    invoke-static {v0, v1, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->b:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$c;->c:Ll/jl80;

    .line 40
    .line 41
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->P(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
