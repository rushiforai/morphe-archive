.class public final synthetic Ll/crj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwb0$b;


# instance fields
.field public final synthetic a:Ll/jrj0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Questionnaire;


# direct methods
.method public synthetic constructor <init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/crj0;->a:Ll/jrj0;

    iput-object p2, p0, Ll/crj0;->b:Lcom/p1/mobile/putong/core/data/Questionnaire;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/crj0;->a:Ll/jrj0;

    iget-object p0, p0, Ll/crj0;->b:Lcom/p1/mobile/putong/core/data/Questionnaire;

    invoke-static {v0, p0, p1, p2, p3}, Ll/jrj0;->R(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V

    return-void
.end method
