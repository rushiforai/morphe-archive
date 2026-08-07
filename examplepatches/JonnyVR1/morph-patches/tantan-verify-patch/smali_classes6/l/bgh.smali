.class public final synthetic Ll/bgh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ogh;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/ogh;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bgh;->a:Ll/ogh;

    iput-object p2, p0, Ll/bgh;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p3, p0, Ll/bgh;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bgh;->a:Ll/ogh;

    iget-object v1, p0, Ll/bgh;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object p0, p0, Ll/bgh;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/ogh;->n(Ll/ogh;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/x20;)V

    return-void
.end method
