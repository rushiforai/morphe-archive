.class public final synthetic Ll/swb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/uwb0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/FeedbackQuestion;


# direct methods
.method public synthetic constructor <init>(Ll/uwb0;Lcom/p1/mobile/putong/core/data/FeedbackQuestion;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/swb0;->a:Ll/uwb0;

    iput-object p2, p0, Ll/swb0;->b:Lcom/p1/mobile/putong/core/data/FeedbackQuestion;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/swb0;->a:Ll/uwb0;

    iget-object p0, p0, Ll/swb0;->b:Lcom/p1/mobile/putong/core/data/FeedbackQuestion;

    invoke-static {v0, p0, p1}, Ll/uwb0;->h(Ll/uwb0;Lcom/p1/mobile/putong/core/data/FeedbackQuestion;Landroid/view/View;)V

    return-void
.end method
