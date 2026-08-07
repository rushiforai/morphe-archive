.class public final synthetic Ll/w1q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/NewTags;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;Lcom/p1/mobile/putong/core/data/NewTags;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w1q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;

    iput-object p2, p0, Ll/w1q;->b:Lcom/p1/mobile/putong/core/data/NewTags;

    iput-object p3, p0, Ll/w1q;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w1q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;

    iget-object v1, p0, Ll/w1q;->b:Lcom/p1/mobile/putong/core/data/NewTags;

    iget-object p0, p0, Ll/w1q;->c:Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;->t(Lcom/p1/mobile/putong/core/ui/messages/ItemAddTagsGuide$b;Lcom/p1/mobile/putong/core/data/NewTags;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
