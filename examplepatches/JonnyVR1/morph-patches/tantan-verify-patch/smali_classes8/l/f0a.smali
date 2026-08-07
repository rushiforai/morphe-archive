.class public final synthetic Ll/f0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    iput-object p2, p0, Ll/f0a;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;

    iget-object p0, p0, Ll/f0a;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;->F(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView$b;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
