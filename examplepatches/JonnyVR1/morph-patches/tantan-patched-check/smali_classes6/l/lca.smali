.class public final synthetic Ll/lca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/p1/mobile/putong/data/Followship;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lca;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/lca;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/lca;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/lca;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/lca;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/lca;->f:Lcom/p1/mobile/putong/data/Followship;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/lca;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/lca;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/lca;->c:Lcom/p1/mobile/putong/data/User;

    iget-object v3, p0, Ll/lca;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/lca;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/lca;->f:Lcom/p1/mobile/putong/data/Followship;

    invoke-static/range {v0 .. v5}, Ll/jka;->h3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Followship;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
