.class public final synthetic Ll/m18;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/x20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m18;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/m18;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/m18;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/m18;->d:Ll/x20;

    iput-boolean p5, p0, Ll/m18;->e:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/m18;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/m18;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/m18;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v3, p0, Ll/m18;->d:Ll/x20;

    iget-boolean p0, p0, Ll/m18;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/g;->Vd(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/x20;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
