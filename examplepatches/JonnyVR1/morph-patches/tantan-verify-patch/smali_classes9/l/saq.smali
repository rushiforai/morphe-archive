.class public final synthetic Ll/saq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/saq;->a:Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/saq;->a:Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Survey;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;->F(Lcom/p1/mobile/putong/core/ui/messages/view/ItemMessageNewSurvey;Lcom/p1/mobile/putong/core/data/Survey;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
