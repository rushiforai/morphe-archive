.class public final synthetic Ll/vtw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vtw;->a:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;

    iput-object p2, p0, Ll/vtw;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vtw;->a:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;

    iget-object p0, p0, Ll/vtw;->b:Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->f(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView$b;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
