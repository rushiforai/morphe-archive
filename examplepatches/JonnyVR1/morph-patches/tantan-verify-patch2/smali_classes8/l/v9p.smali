.class public final synthetic Ll/v9p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w9p;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;


# direct methods
.method public synthetic constructor <init>(Ll/w9p;ILcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v9p;->a:Ll/w9p;

    iput p2, p0, Ll/v9p;->b:I

    iput-object p3, p0, Ll/v9p;->c:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v9p;->a:Ll/w9p;

    iget v1, p0, Ll/v9p;->b:I

    iget-object p0, p0, Ll/v9p;->c:Lcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;

    invoke-static {v0, v1, p0, p1}, Ll/w9p;->F(Ll/w9p;ILcom/p1/mobile/putong/core/data/IntlMarketQuestionOptionItemData;Landroid/view/View;)V

    return-void
.end method
