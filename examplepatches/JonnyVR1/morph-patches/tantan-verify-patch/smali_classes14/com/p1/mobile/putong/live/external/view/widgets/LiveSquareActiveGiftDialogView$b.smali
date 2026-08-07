.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;
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
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

.field public final synthetic c:Ll/jl80;

.field public final synthetic d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;Ll/jl80;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->c:Ll/jl80;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getGotoSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1, v0}, Ll/ujt;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getPopupType()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "live_popup_type"

    .line 28
    .line 29
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->b:Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveSquareActiveGiftBean;->getUserType()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "live_user_type"

    .line 39
    .line 40
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    const-string v0, "e_live_popup_confirm"

    .line 44
    .line 45
    const-string v1, "p_live_popup"

    .line 46
    .line 47
    invoke-static {v0, v1, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->d:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView$b;->c:Ll/jl80;

    .line 55
    .line 56
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;->P(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareActiveGiftDialogView;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
