.class public final synthetic Ll/u9p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Ll/w9p;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;


# direct methods
.method public synthetic constructor <init>(Ll/w9p;ILcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u9p;->a:Ll/w9p;

    iput p2, p0, Ll/u9p;->b:I

    iput-object p3, p0, Ll/u9p;->c:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u9p;->a:Ll/w9p;

    iget v1, p0, Ll/u9p;->b:I

    iget-object p0, p0, Ll/u9p;->c:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/intloperation/common/SelectorView;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {v0, v1, p0, p1, p2}, Ll/w9p;->E(Ll/w9p;ILcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;Lcom/p1/mobile/putong/core/ui/intloperation/common/SelectorView;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
