.class public final synthetic Ll/gh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-boolean p2, p0, Ll/gh7;->b:Z

    iput-object p3, p0, Ll/gh7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-boolean v1, p0, Ll/gh7;->b:Z

    iget-object p0, p0, Ll/gh7;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->n5(Lcom/p1/mobile/putong/core/api/e;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
