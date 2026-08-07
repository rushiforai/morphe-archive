.class public final synthetic Ll/zo7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Lcom/p1/mobile/putong/core/data/Sticker;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zo7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    iput-object p2, p0, Ll/zo7;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iput p3, p0, Ll/zo7;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zo7;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;

    iget-object v1, p0, Ll/zo7;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iget p0, p0, Ll/zo7;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;->G(Lcom/p1/mobile/putong/core/ui/emoji/CoreCommendHintEmojiView$a;Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V

    return-void
.end method
