.class public final synthetic Ll/e76;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

.field public final synthetic b:Lcom/tantan/library/svga/SVGAnimationView;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iput-object p2, p0, Ll/e76;->b:Lcom/tantan/library/svga/SVGAnimationView;

    iput-object p3, p0, Ll/e76;->c:Landroid/view/View;

    iput-object p4, p0, Ll/e76;->d:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;

    iput p5, p0, Ll/e76;->e:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/e76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iget-object v1, p0, Ll/e76;->b:Lcom/tantan/library/svga/SVGAnimationView;

    iget-object v2, p0, Ll/e76;->c:Landroid/view/View;

    iget-object v3, p0, Ll/e76;->d:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;

    iget p0, p0, Ll/e76;->e:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->r(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;I)V

    return-void
.end method
