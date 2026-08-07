.class public final Ll/gon;
.super Ll/fon;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/fon<",
        "Lcom/p1/mobile/putong/core/ui/intl/greet/head/IntlUserGreetHeadView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0011\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tR\"\u0010\u0004\u001a\u00020\u00038\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000fR\"\u0010\u0006\u001a\u00020\u00058\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/gon;",
        "Ll/fon;",
        "Lcom/p1/mobile/putong/core/ui/intl/greet/head/IntlUserGreetHeadView;",
        "Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;",
        "act",
        "Ll/gnn;",
        "presenter",
        "view",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Ll/gnn;Lcom/p1/mobile/putong/core/ui/intl/greet/head/IntlUserGreetHeadView;)V",
        "c",
        "Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;",
        "getAct",
        "()Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;",
        "setAct",
        "(Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;)V",
        "d",
        "Ll/gnn;",
        "getPresenter",
        "()Ll/gnn;",
        "setPresenter",
        "(Ll/gnn;)V",
        "message_intlGmsRelease"
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
.field public c:Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public d:Ll/gnn;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;Ll/gnn;Lcom/p1/mobile/putong/core/ui/intl/greet/head/IntlUserGreetHeadView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/gnn;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/ui/intl/greet/head/IntlUserGreetHeadView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p2, p3}, Ll/fon;-><init>(Ll/don;Ll/rvl;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/gon;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;

    .line 14
    .line 15
    iput-object p2, p0, Ll/gon;->d:Ll/gnn;

    .line 16
    .line 17
    return-void
.end method
