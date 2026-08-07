.class public final synthetic Ll/zx9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zx9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-object p2, p0, Ll/zx9;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/zx9;->c:Z

    iput-object p4, p0, Ll/zx9;->d:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zx9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-object v1, p0, Ll/zx9;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/zx9;->c:Z

    iget-object p0, p0, Ll/zx9;->d:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/feed/api/b;->I2(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
