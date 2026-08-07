.class public final synthetic Ll/f79;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/h79;


# direct methods
.method public synthetic constructor <init>(Ll/h79;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f79;->a:Ll/h79;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f79;->a:Ll/h79;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LiveDefaultTabEnvelope;

    invoke-static {p0, p1}, Ll/h79;->b3(Ll/h79;Lcom/p1/mobile/putong/core/data/LiveDefaultTabEnvelope;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
