.class public final synthetic Ll/n0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/oze$a;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Landroid/view/View;Ll/oze$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;

    iput-object p2, p0, Ll/n0a;->b:Landroid/view/View;

    iput-object p3, p0, Ll/n0a;->c:Ll/oze$a;

    iput-object p4, p0, Ll/n0a;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n0a;->a:Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;

    iget-object v1, p0, Ll/n0a;->b:Landroid/view/View;

    iget-object v2, p0, Ll/n0a;->c:Ll/oze$a;

    iget-object p0, p0, Ll/n0a;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;->p(Lcom/p1/mobile/putong/core/ui/emoji/CoreMomentEmojiView$c;Landroid/view/View;Ll/oze$a;Ljava/lang/String;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
