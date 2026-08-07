.class public final synthetic Ll/sx9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/b;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sx9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iput-object p2, p0, Ll/sx9;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/sx9;->c:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sx9;->a:Lcom/p1/mobile/putong/feed/api/b;

    iget-object v1, p0, Ll/sx9;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/sx9;->c:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/api/b;->W1(Lcom/p1/mobile/putong/feed/api/b;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
