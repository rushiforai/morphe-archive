.class public Ll/f4x$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f4x;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lcom/p1/mobile/putong/data/ConversationCounter;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/f4x;


# direct methods
.method public constructor <init>(Ll/f4x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f4x$c;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/ConversationCounter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ConversationCounter;->messages:Lcom/p1/mobile/putong/data/CounterMessages;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterMessages;->unReadOnlyMarriage:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/ConversationCounter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f4x$c;->a(Lcom/p1/mobile/putong/data/ConversationCounter;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
