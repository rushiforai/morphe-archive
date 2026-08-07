.class public final synthetic Ll/j9p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/intloperation/quiz/a;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/intloperation/quiz/a;Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9p;->a:Lcom/p1/mobile/putong/core/ui/intloperation/quiz/a;

    iput-object p2, p0, Ll/j9p;->b:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j9p;->a:Lcom/p1/mobile/putong/core/ui/intloperation/quiz/a;

    iget-object p0, p0, Ll/j9p;->b:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/intloperation/quiz/a;->e(Lcom/p1/mobile/putong/core/ui/intloperation/quiz/a;Lcom/p1/mobile/putong/core/data/IntlMarketQuestionData;Landroid/view/View;)V

    return-void
.end method
