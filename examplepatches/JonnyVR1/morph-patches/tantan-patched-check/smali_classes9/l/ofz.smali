.class public final synthetic Ll/ofz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;

.field public final synthetic b:Ll/n100;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;Ll/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ofz;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;

    iput-object p2, p0, Ll/ofz;->b:Ll/n100;

    iput-object p3, p0, Ll/ofz;->c:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    iput-object p4, p0, Ll/ofz;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ofz;->a:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;

    iget-object v1, p0, Ll/ofz;->b:Ll/n100;

    iget-object v2, p0, Ll/ofz;->c:Lcom/p1/mobile/putong/core/data/LoveLetterContent;

    iget-object p0, p0, Ll/ofz;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;->a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageLoveLetterGuideView;Ll/n100;Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
