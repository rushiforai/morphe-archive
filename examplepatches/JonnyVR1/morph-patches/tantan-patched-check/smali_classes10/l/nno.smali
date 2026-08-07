.class public final synthetic Ll/nno;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nno;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;

    iput-object p2, p0, Ll/nno;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    iput p3, p0, Ll/nno;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nno;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;

    iget-object v1, p0, Ll/nno;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    iget p0, p0, Ll/nno;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;->h0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V

    return-void
.end method
