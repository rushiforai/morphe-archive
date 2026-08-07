.class public Lcom/p1/mobile/putong/core/api/CoreSuggested$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/api/CoreSuggested;->V8()Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lcom/p1/mobile/putong/data/Envelope;",
        "Lcom/p1/mobile/putong/data/Envelope;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-object p1
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$b;->a(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
