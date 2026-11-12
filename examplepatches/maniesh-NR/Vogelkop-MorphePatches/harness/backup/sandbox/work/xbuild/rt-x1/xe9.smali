.class public final synthetic Lxe9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lswl;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;

.field public final synthetic g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lbf9;Lk5o;Lpc9;Ljava/lang/String;Ljava/lang/String;Lie9;Landroid/net/Uri;Landroid/net/Uri;)V
    .registers 9

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxe9;->c:Ljava/lang/Object;

    iput-object p2, p0, Lxe9;->d:Ljava/lang/Object;

    iput-object p4, p0, Lxe9;->a:Ljava/lang/String;

    iput-object p5, p0, Lxe9;->b:Ljava/lang/String;

    iput-object p6, p0, Lxe9;->e:Ljava/lang/Object;

    iput-object p7, p0, Lxe9;->f:Ljava/lang/Object;

    iput-object p8, p0, Lxe9;->g:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx1b;Lxx1;Laxl;)V
    .registers 9

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxe9;->c:Ljava/lang/Object;

    iput-object p2, p0, Lxe9;->a:Ljava/lang/String;

    iput-object p3, p0, Lxe9;->b:Ljava/lang/String;

    iput-object p4, p0, Lxe9;->d:Ljava/lang/Object;

    iput-object p5, p0, Lxe9;->e:Ljava/lang/Object;

    iput-object p6, p0, Lxe9;->f:Ljava/lang/Object;

    iput-object p7, p0, Lxe9;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()Lqwl;
    .registers 11

    iget-object v0, p0, Lxe9;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lle9;

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iget-object v0, p0, Lxe9;->d:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    iget-object v0, p0, Lxe9;->e:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lx1b;

    iget-object v0, p0, Lxe9;->f:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lxx1;

    iget-object v0, p0, Lxe9;->g:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Laxl;

    iget-object v0, v2, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->A()Ljava/security/PublicKey;

    move-result-object v3

    if-nez v3, :cond_25

    const/4 p0, 0x0

    return-object p0

    :cond_25
    new-instance v1, Lmwl;

    iget-object v4, p0, Lxe9;->a:Ljava/lang/String;

    iget-object v5, p0, Lxe9;->b:Ljava/lang/String;

    invoke-direct/range {v1 .. v9}, Lmwl;-><init>(Lle9;Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx1b;Lxx1;Laxl;)V

    return-object v1
.end method
