.class public final synthetic Lxii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:Liji;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Z

.field public final synthetic d:Lfji;

.field public final synthetic e:Lfji;

.field public final synthetic f:Landroid/net/Uri;

.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Liji;Ljava/io/File;ZLfji;Lfji;Landroid/net/Uri;Ljava/lang/String;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxii;->a:Liji;

    iput-object p2, p0, Lxii;->b:Ljava/io/File;

    iput-boolean p3, p0, Lxii;->c:Z

    iput-object p4, p0, Lxii;->d:Lfji;

    iput-object p5, p0, Lxii;->e:Lfji;

    iput-object p6, p0, Lxii;->f:Landroid/net/Uri;

    iput-object p7, p0, Lxii;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-object p1, p0, Lxii;->b:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    iget-object v1, p0, Lxii;->g:Ljava/lang/String;

    if-eqz v0, :cond_31

    iget-boolean v0, p0, Lxii;->c:Z

    if-nez v0, :cond_10

    const/4 p0, 0x0

    return-object p0

    :cond_10
    iget-object v0, p0, Lxii;->d:Lfji;

    if-eqz v0, :cond_1c

    iget-object v2, p0, Lxii;->e:Lfji;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    :cond_1c
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_31

    iget-object p1, p0, Lxii;->a:Liji;

    iget-object p1, p1, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lxii;->f:Landroid/net/Uri;

    invoke-static {p1, p0, v1}, Llg7;->d(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_31
    return-object v1
.end method
