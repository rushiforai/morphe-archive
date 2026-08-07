.class public final synthetic Ll/vaq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;

.field public final synthetic b:Lrx/subjects/b;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Options;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/Options;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vaq;->a:Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;

    iput-object p2, p0, Ll/vaq;->b:Lrx/subjects/b;

    iput-object p3, p0, Ll/vaq;->c:Lcom/p1/mobile/putong/core/data/Options;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vaq;->a:Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;

    iget-object v1, p0, Ll/vaq;->b:Lrx/subjects/b;

    iget-object p0, p0, Ll/vaq;->c:Lcom/p1/mobile/putong/core/data/Options;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->s(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/Options;Landroid/view/View;)V

    return-void
.end method
