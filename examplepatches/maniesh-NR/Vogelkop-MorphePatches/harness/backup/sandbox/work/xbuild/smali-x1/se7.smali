.class public final synthetic Lse7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr1o;


# instance fields
.field public final synthetic a:Ldx3;

.field public final synthetic b:Lre7;

.field public final synthetic c:Ljava/lang/Runnable;

.field public final synthetic d:Lue7;


# direct methods
.method public synthetic constructor <init>(Ldx3;Lre7;Ljava/lang/Runnable;Lue7;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lse7;->a:Ldx3;

    iput-object p2, p0, Lse7;->b:Lre7;

    iput-object p3, p0, Lse7;->c:Ljava/lang/Runnable;

    iput-object p4, p0, Lse7;->d:Lue7;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 6

    const/4 v0, -0x1

    if-ne p1, v0, :cond_52

    if-eqz p2, :cond_52

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_52

    invoke-virtual {p2}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/4 v1, 0x3

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_49

    iget-object v0, p0, Lse7;->a:Ldx3;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    invoke-static {v0, p1}, Ldd7;->e(Landroid/content/Context;Landroid/net/Uri;)Lrlj;

    move-result-object v0

    invoke-virtual {v0}, Lrlj;->g()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lse7;->b:Lre7;

    invoke-virtual {v1}, Lre7;->f()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, v1, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {p2, p1}, Lcom/opera/android/downloads/DownloadItem;->d(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, v1, Lre7;->e:Landroid/net/Uri;

    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Lre7;->z(Z)V

    iget-object p0, p0, Lse7;->c:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_49
    invoke-virtual {p2}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object p2

    iget-object p0, p0, Lse7;->d:Lue7;

    invoke-interface {p0, p1, p2}, Lue7;->a(Landroid/net/Uri;Ljava/lang/String;)V

    :cond_52
    return-void
.end method
