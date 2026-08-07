.class public final synthetic Ll/uz9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uz9;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    iput p2, p0, Ll/uz9;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uz9;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;

    iget p0, p0, Ll/uz9;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;->a(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiNewView;ILandroid/view/View;)V

    return-void
.end method
