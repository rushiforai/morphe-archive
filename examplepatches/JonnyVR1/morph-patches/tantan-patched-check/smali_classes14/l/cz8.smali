.class public final synthetic Ll/cz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cz8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/cz8;->b:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p3, p0, Ll/cz8;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/cz8;->d:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cz8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/cz8;->b:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v2, p0, Ll/cz8;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/cz8;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/j;->e4(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Z)V

    return-void
.end method
