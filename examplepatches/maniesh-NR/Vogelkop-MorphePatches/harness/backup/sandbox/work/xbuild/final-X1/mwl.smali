.class public final synthetic Lmwl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqwl;


# instance fields
.field public final synthetic a:Lle9;

.field public final synthetic b:Ljava/security/PublicKey;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lx1b;

.field public final synthetic g:Lxx1;

.field public final synthetic h:Laxl;


# direct methods
.method public synthetic constructor <init>(Lle9;Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx1b;Lxx1;Laxl;)V
    .registers 10

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmwl;->a:Lle9;

    iput-object p2, p0, Lmwl;->b:Ljava/security/PublicKey;

    iput-object p3, p0, Lmwl;->c:Ljava/lang/String;

    iput-object p4, p0, Lmwl;->d:Ljava/lang/String;

    iput-object p5, p0, Lmwl;->e:Ljava/lang/String;

    iput-object p6, p0, Lmwl;->f:Lx1b;

    iput-object p7, p0, Lmwl;->g:Lxx1;

    iput-object p8, p0, Lmwl;->h:Laxl;

    return-void
.end method


# virtual methods
.method public final run()Lih4;
    .registers 7

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v1, p0, Lmwl;->a:Lle9;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    const-string v3, "name"

    invoke-virtual {v2, v0, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "client_version"

    iget-object v3, p0, Lmwl;->c:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "kind"

    iget-object v3, p0, Lmwl;->d:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "notification_token"

    iget-object v3, p0, Lmwl;->e:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "public_key"

    iget-object v3, p0, Lmwl;->b:Ljava/security/PublicKey;

    invoke-static {v3}, Lp36;->e(Ljava/security/PublicKey;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    iget-object v3, p0, Lmwl;->f:Lx1b;

    invoke-virtual {v3}, Lx1b;->n()Lomm;

    move-result-object v3

    :goto_3c
    move-object v4, v3

    check-cast v4, Lgmb;

    iget-boolean v5, v4, Lgmb;->f:Z

    if-nez v5, :cond_4d

    invoke-virtual {v4}, Lgmb;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_3c

    :cond_4d
    const-string v3, "client_capabilities"

    invoke-virtual {v2, v0, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lai2;

    iget-object v3, p0, Lmwl;->h:Laxl;

    iget-object p0, p0, Lmwl;->g:Lxx1;

    invoke-direct {v0, v1, v3, v2, p0}, Lai2;-><init>(Lle9;Laxl;Lorb;Lxx1;)V

    return-object v0
.end method
