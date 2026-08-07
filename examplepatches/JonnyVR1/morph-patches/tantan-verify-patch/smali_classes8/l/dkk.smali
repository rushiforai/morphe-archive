.class public final synthetic Ll/dkk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ikk;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public synthetic constructor <init>(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dkk;->a:Ll/ikk;

    iput-object p2, p0, Ll/dkk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dkk;->a:Ll/ikk;

    iget-object p0, p0, Ll/dkk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {v0, p0}, Ll/ikk;->p0(Ll/ikk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
