.class public final synthetic Ll/ova;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/z1d0;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/z1d0;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ova;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/ova;->b:Ll/z1d0;

    iput-object p3, p0, Ll/ova;->c:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ova;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/ova;->b:Ll/z1d0;

    iget-object p0, p0, Ll/ova;->c:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/x;->q3(Ljava/lang/String;Ll/z1d0;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
