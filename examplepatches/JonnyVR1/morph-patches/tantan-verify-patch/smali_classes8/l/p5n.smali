.class public final synthetic Ll/p5n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:Ll/r5n;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;


# direct methods
.method public synthetic constructor <init>(Ll/r5n;ILcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p5n;->a:Ll/r5n;

    iput p2, p0, Ll/p5n;->b:I

    iput-object p3, p0, Ll/p5n;->c:Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p5n;->a:Ll/r5n;

    iget v1, p0, Ll/p5n;->b:I

    iget-object p0, p0, Ll/p5n;->c:Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/intloperation/common/SelectorView;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {v0, v1, p0, p1, p2}, Ll/r5n;->F(Ll/r5n;ILcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;Lcom/p1/mobile/putong/core/ui/intloperation/common/SelectorView;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
