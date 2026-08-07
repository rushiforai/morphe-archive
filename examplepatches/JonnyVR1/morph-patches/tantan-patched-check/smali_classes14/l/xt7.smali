.class public final synthetic Ll/xt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;ZZZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/xt7;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/xt7;->c:Z

    iput-boolean p4, p0, Ll/xt7;->d:Z

    iput-boolean p5, p0, Ll/xt7;->e:Z

    iput-object p6, p0, Ll/xt7;->f:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/xt7;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/xt7;->c:Z

    iget-boolean v3, p0, Ll/xt7;->d:Z

    iget-boolean v4, p0, Ll/xt7;->e:Z

    iget-object v5, p0, Ll/xt7;->f:Ll/y20;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->tb(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;ZZZLl/y20;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
