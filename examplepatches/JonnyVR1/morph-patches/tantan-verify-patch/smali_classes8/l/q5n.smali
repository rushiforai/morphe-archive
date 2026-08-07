.class public final synthetic Ll/q5n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/r5n;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;


# direct methods
.method public synthetic constructor <init>(Ll/r5n;ILcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q5n;->a:Ll/r5n;

    iput p2, p0, Ll/q5n;->b:I

    iput-object p3, p0, Ll/q5n;->c:Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q5n;->a:Ll/r5n;

    iget v1, p0, Ll/q5n;->b:I

    iget-object p0, p0, Ll/q5n;->c:Lcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;

    invoke-static {v0, v1, p0, p1}, Ll/r5n;->E(Ll/r5n;ILcom/p1/mobile/putong/core/data/IntlCampingQuestionOptionsData;Landroid/view/View;)V

    return-void
.end method
