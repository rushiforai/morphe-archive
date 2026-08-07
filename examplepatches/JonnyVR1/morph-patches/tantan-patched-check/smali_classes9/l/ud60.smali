.class public final synthetic Ll/ud60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ud60;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iput-object p2, p0, Ll/ud60;->b:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ud60;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    iget-object p0, p0, Ll/ud60;->b:Lkotlin/jvm/functions/Function1;

    invoke-static {v0, p0, p1}, Ll/vd60;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lkotlin/jvm/functions/Function1;Landroid/view/View;)V

    return-void
.end method
