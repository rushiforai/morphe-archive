.class public final Lztj;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/io/File;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Lbuj;


# direct methods
.method public constructor <init>(Lbuj;Ljava/io/File;Ljava/lang/String;Z)V
    .registers 5

    iput-object p2, p0, Lztj;->a:Ljava/io/File;

    iput-object p3, p0, Lztj;->b:Ljava/lang/String;

    iput-boolean p4, p0, Lztj;->c:Z

    iput-object p1, p0, Lztj;->d:Lbuj;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, [Landroid/graphics/Bitmap;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x64

    iget-object p0, p0, Lztj;->a:Ljava/io/File;

    invoke-static {p1, p0, v0, v1}, Lz5i;->l0(Landroid/graphics/Bitmap;Ljava/io/File;Landroid/graphics/Bitmap$CompressFormat;I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 8

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lztj;->d:Lbuj;

    if-nez p1, :cond_11

    const p0, 0x7f14114e

    invoke-virtual {v0, p0}, Lbuj;->a(I)V

    return-void

    :cond_11
    iget-object p1, p0, Lztj;->a:Ljava/io/File;

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    iget-object v1, p0, Lztj;->b:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ltn;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v1, v2, Ltn;->b:Ljava/lang/Object;

    iput-object p1, v2, Ltn;->c:Ljava/lang/Object;

    iget-boolean p0, p0, Lztj;->c:Z

    iput-boolean p0, v2, Ltn;->a:Z

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, v2, Ltn;->d:Ljava/lang/Object;

    iget-object p0, v0, Lbuj;->a:Lcom/opera/android/BrowserActivity;

    if-nez p1, :cond_4e

    const-string v1, "snapshot-output"

    :try_start_38
    const-string v3, ".png"

    invoke-static {p0, v1, v3}, Ln1h;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_3e} :catch_3f

    goto :goto_40

    :catch_3f
    const/4 v1, 0x0

    :goto_40
    if-nez v1, :cond_49

    const p0, 0x7f14114c

    invoke-virtual {v0, p0}, Lbuj;->a(I)V

    return-void

    :cond_49
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_4f

    :cond_4e
    move-object v1, p1

    :goto_4f
    sget v3, Lcom/opera/android/snapshot/OfaImageEditorActivity;->e:I

    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/opera/android/snapshot/OfaImageEditorActivity;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v4, p0, Lhjf;->a:Ldll;

    iget v4, v4, Ldll;->a:I

    const-string v5, "theme_id"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v4, "follow_system_font"

    invoke-static {p0}, Lozk;->b(Landroid/content/Context;)Z

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v4, "input-uri"

    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "output"

    invoke-virtual {v3, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string p1, "output-watermark-strategy"

    sget-object v4, Lqnn;->b:Lqnn;

    invoke-virtual {v3, p1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    sget-object v4, Lnsl;->e:Lnsl;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v4, Lnsl;->f:Lnsl;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v4, Lnsl;->h:Lnsl;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v4, Lnsl;->i:Lnsl;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v4, Lnsl;->j:Lnsl;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v4, "tools"

    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    new-instance p1, Lg2b;

    invoke-direct {p1, v0, v2, v1}, Lg2b;-><init>(Lbuj;Ltn;Landroid/net/Uri;)V

    invoke-virtual {p0, v3, p1}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    const p1, 0x7f010052

    const v0, 0x7f010053

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void
.end method
