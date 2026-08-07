.class public Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpAct<",
        "Ll/tcm;",
        "Ll/edm;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic X1()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;->Z1()Ll/tcm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic Y1()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;->a2()Ll/edm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Z1()Ll/tcm;
    .locals 1

    .line 1
    new-instance v0, Ll/tcm;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Ll/tcm;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a2()Ll/edm;
    .locals 1

    .line 1
    new-instance v0, Ll/edm;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/edm;-><init>(Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b2()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public finish()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpAct;->c:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/tcm;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tcm;->n0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_chat_topics_setting"

    .line 2
    .line 3
    return-object p0
.end method
