.class public final synthetic Ll/g0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    iput-object p2, p0, Ll/g0a;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    iget-object p0, p0, Ll/g0a;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->G(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)V

    return-void
.end method
