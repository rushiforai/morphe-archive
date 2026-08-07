.class public final synthetic Ll/r7q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire$c;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Questionnaire;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;

    iput-object p2, p0, Ll/r7q;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/r7q;->c:Lcom/p1/mobile/putong/core/data/Questionnaire;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/r7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;

    iget-object v1, p0, Ll/r7q;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/r7q;->c:Lcom/p1/mobile/putong/core/data/Questionnaire;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemLocalUXQuestionnaire;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V

    return-void
.end method
