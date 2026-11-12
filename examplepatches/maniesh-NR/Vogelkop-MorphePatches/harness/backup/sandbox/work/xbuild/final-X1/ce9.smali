.class public final synthetic Lce9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqwl;


# instance fields
.field public final synthetic a:Lle9;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Lqe9;

.field public final synthetic i:Lj12;


# direct methods
.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqe9;Lj12;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lce9;->a:Lle9;

    iput-object p2, p0, Lce9;->b:Ljava/lang/String;

    iput-object p3, p0, Lce9;->c:Ljava/lang/String;

    iput-object p4, p0, Lce9;->d:Ljava/lang/String;

    iput-object p5, p0, Lce9;->e:Ljava/lang/String;

    iput-object p6, p0, Lce9;->f:Ljava/lang/String;

    iput-object p7, p0, Lce9;->g:Ljava/lang/String;

    iput-object p8, p0, Lce9;->h:Lqe9;

    iput-object p9, p0, Lce9;->i:Lj12;

    return-void
.end method


# virtual methods
.method public final run()Lih4;
    .registers 7

    iget-object v1, p0, Lce9;->a:Lle9;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    const-string v0, "metadata"

    iget-object v2, p0, Lce9;->c:Ljava/lang/String;

    invoke-virtual {v4, v2, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "content"

    iget-object v2, p0, Lce9;->d:Ljava/lang/String;

    invoke-virtual {v4, v2, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lce9;->e:Ljava/lang/String;

    if-eqz v0, :cond_21

    const-string v2, "content_url"

    invoke-virtual {v4, v0, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_21
    iget-object v0, p0, Lce9;->f:Ljava/lang/String;

    iget-object v2, p0, Lce9;->g:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_30

    const-string v3, "iv"

    invoke-virtual {v4, v0, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_30
    const-string v3, "iv_metadata"

    invoke-virtual {v4, v0, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "iv_content"

    invoke-virtual {v4, v2, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lxf1;

    iget-object v2, p0, Lce9;->i:Lj12;

    iget-object v3, p0, Lce9;->b:Ljava/lang/String;

    iget-object v5, p0, Lce9;->h:Lqe9;

    invoke-direct/range {v0 .. v5}, Lxf1;-><init>(Lle9;Lj12;Ljava/lang/String;Lorb;Lqe9;)V

    return-object v0
.end method
