.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;)Landroid/text/SpannableString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->g:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/MultipleGiftItemView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/view/multiple/LiveMarqueeTextView;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
