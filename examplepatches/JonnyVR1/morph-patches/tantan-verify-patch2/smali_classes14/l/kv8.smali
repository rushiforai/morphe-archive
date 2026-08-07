.class public final synthetic Ll/kv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ll/y20;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/y20;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/kv8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kv8;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/kv8;->d:Ll/x20;

    iput-object p5, p0, Ll/kv8;->e:Ll/y20;

    iput-boolean p6, p0, Ll/kv8;->f:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/kv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/kv8;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/kv8;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/kv8;->d:Ll/x20;

    iget-object v4, p0, Ll/kv8;->e:Ll/y20;

    iget-boolean v5, p0, Ll/kv8;->f:Z

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/j;->N4(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/y20;ZLcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
