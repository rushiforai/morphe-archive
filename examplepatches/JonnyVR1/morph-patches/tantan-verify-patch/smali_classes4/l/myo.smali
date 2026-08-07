.class public Ll/myo;
.super Ll/v4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/v4<",
        "Ll/rpl;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0016\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0014\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/myo;",
        "Ll/v4;",
        "Ll/rpl;",
        "Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;",
        "view",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V",
        "Ll/jcp;",
        "f",
        "()Ll/jcp;",
        "",
        "b",
        "()Z",
        "Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/v4;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/myo;->b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic c()Ll/rpl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/myo;->f()Ll/jcp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f()Ll/jcp;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/jcp;

    .line 2
    .line 3
    iget-object p0, p0, Ll/myo;->b:Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/jcp;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
