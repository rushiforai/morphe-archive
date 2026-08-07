.class public final synthetic Ll/a28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a28;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/a28;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/a28;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/a28;->d:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    iput-boolean p5, p0, Ll/a28;->e:Z

    iput-object p6, p0, Ll/a28;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/a28;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/a28;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/a28;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/a28;->d:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    iget-boolean v4, p0, Ll/a28;->e:Z

    iget-object v5, p0, Ll/a28;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/core/data/CipherId;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->xb(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/CipherId;)V

    return-void
.end method
