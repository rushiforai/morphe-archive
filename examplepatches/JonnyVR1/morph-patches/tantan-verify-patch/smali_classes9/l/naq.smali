.class public final synthetic Ll/naq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lrx/subjects/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/OptionsSecond;


# direct methods
.method public synthetic constructor <init>(Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/OptionsSecond;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/naq;->a:Lrx/subjects/b;

    iput-object p2, p0, Ll/naq;->b:Lcom/p1/mobile/putong/core/data/OptionsSecond;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/naq;->a:Lrx/subjects/b;

    iget-object p0, p0, Ll/naq;->b:Lcom/p1/mobile/putong/core/data/OptionsSecond;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->K(Lrx/subjects/b;Lcom/p1/mobile/putong/core/data/OptionsSecond;Landroid/view/View;)V

    return-void
.end method
