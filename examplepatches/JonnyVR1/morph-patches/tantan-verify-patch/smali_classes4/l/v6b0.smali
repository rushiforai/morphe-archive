.class public abstract Ll/v6b0;
.super Ll/n6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/n6<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/n6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/v6b0;->e:Ll/kcg0;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public b(Ll/ner;Ll/dq1;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/dq1;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/n6;->b(Ll/ner;Ll/dq1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
