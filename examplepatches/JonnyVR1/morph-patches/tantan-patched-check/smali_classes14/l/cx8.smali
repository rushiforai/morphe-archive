.class public final synthetic Ll/cx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic e:Ll/x20;

.field public final synthetic f:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/x20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cx8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/cx8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/cx8;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/cx8;->d:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p5, p0, Ll/cx8;->e:Ll/x20;

    iput-object p6, p0, Ll/cx8;->f:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cx8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/cx8;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/cx8;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/cx8;->d:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v4, p0, Ll/cx8;->e:Ll/x20;

    iget-object v5, p0, Ll/cx8;->f:Ll/y20;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->S4(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ll/x20;Ll/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
