.class public final synthetic Ll/fl7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fl7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/fl7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/fl7;->c:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fl7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/fl7;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/fl7;->c:Ll/qcj;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->r4(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Ll/qcj;Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
