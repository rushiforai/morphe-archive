.class public final Ll/zu80$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zu80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Ll/zu80$a;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;",
        "view",
        "Ll/zu80;",
        "a",
        "(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)Ll/zu80;",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zu80$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)Ll/zu80;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/zu80;

    .line 5
    .line 6
    invoke-direct {p0}, Ll/zu80;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/myo;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/myo;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/zu80;->b(Ll/v4;)Ll/zu80;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/xey;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/xey;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/zu80;->b(Ll/v4;)Ll/zu80;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
