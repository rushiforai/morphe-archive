.class public final synthetic Ll/pno;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pno;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    iput-object p2, p0, Ll/pno;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    iput p3, p0, Ll/pno;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pno;->a:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    iget-object v1, p0, Ll/pno;->b:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    iget p0, p0, Ll/pno;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->b(Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;ILandroid/view/View;)V

    return-void
.end method
