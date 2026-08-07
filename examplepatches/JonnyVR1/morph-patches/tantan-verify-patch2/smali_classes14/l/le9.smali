.class public final synthetic Ll/le9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/o;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/le9;->a:Lcom/p1/mobile/putong/core/api/o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/le9;->a:Lcom/p1/mobile/putong/core/api/o;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/o;->f3(Lcom/p1/mobile/putong/core/api/o;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Evaluation;

    move-result-object p0

    return-object p0
.end method
