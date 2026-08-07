.class public final synthetic Ll/zy8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/GreetingResult;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/GreetingResult;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zy8;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/zy8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/zy8;->c:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p4, p0, Ll/zy8;->d:Lcom/p1/mobile/putong/core/data/GreetingResult;

    iput-object p5, p0, Ll/zy8;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zy8;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v1, p0, Ll/zy8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/zy8;->c:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v3, p0, Ll/zy8;->d:Lcom/p1/mobile/putong/core/data/GreetingResult;

    iget-object p0, p0, Ll/zy8;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/j;->v4(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/GreetingResult;Ljava/lang/String;)V

    return-void
.end method
