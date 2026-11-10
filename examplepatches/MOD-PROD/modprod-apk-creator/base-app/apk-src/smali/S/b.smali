.class public final LS/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Li/Q;


# instance fields
.field public final synthetic a:I

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Li/S;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LS/b;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LS/b;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;I)V
    .locals 0

    iput p5, p0, LS/b;->a:I

    iput-object p1, p0, LS/b;->e:Ljava/lang/Object;

    iput-object p2, p0, LS/b;->b:Ljava/lang/Object;

    iput-object p3, p0, LS/b;->c:Ljava/lang/Object;

    iput-object p4, p0, LS/b;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    iget-object v0, p0, LS/b;->b:Ljava/lang/Object;

    check-cast v0, Le/g;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public b()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, LS/b;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method

.method public c(I)V
    .locals 1

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set horizontal offset for MODE_DIALOG, ignoring"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public d()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public dismiss()V
    .locals 1

    iget-object v0, p0, LS/b;->b:Ljava/lang/Object;

    check-cast v0, Le/g;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Le/g;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, LS/b;->b:Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public e(II)V
    .locals 4

    iget-object v0, p0, LS/b;->c:Ljava/lang/Object;

    check-cast v0, Li/L;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Le/f;

    iget-object v1, p0, LS/b;->e:Ljava/lang/Object;

    check-cast v1, Li/S;

    invoke-virtual {v1}, Li/S;->getPopupContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Le/f;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, LS/b;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/CharSequence;

    iget-object v3, v0, Le/f;->b:Ljava/lang/Object;

    check-cast v3, Le/b;

    if-eqz v2, :cond_1

    iput-object v2, v3, Le/b;->d:Ljava/lang/CharSequence;

    :cond_1
    iget-object v2, p0, LS/b;->c:Ljava/lang/Object;

    check-cast v2, Li/L;

    invoke-virtual {v1}, Landroid/widget/AdapterView;->getSelectedItemPosition()I

    move-result v1

    iput-object v2, v3, Le/b;->g:Ljava/lang/Object;

    iput-object p0, v3, Le/b;->h:Landroid/content/DialogInterface$OnClickListener;

    iput v1, v3, Le/b;->j:I

    const/4 v1, 0x1

    iput-boolean v1, v3, Le/b;->i:Z

    invoke-virtual {v0}, Le/f;->a()Le/g;

    move-result-object v0

    iput-object v0, p0, LS/b;->b:Ljava/lang/Object;

    iget-object v0, v0, Le/g;->f:Le/e;

    iget-object v0, v0, Le/e;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    invoke-virtual {v0, p1}, Landroid/view/View;->setTextDirection(I)V

    invoke-virtual {v0, p2}, Landroid/view/View;->setTextAlignment(I)V

    iget-object p1, p0, LS/b;->b:Ljava/lang/Object;

    check-cast p1, Le/g;

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method public g(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, LS/b;->d:Ljava/lang/Object;

    return-void
.end method

.method public i()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public j(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set popup background for MODE_DIALOG, ignoring"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public k(I)V
    .locals 1

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set vertical offset for MODE_DIALOG, ignoring"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public l()Landroid/graphics/drawable/Drawable;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public m(Landroid/widget/ListAdapter;)V
    .locals 0

    check-cast p1, Li/L;

    iput-object p1, p0, LS/b;->c:Ljava/lang/Object;

    return-void
.end method

.method public n(I)V
    .locals 1

    const-string p1, "AppCompatSpinner"

    const-string v0, "Cannot set horizontal (original) offset for MODE_DIALOG, ignoring"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget p1, p0, LS/b;->a:I

    packed-switch p1, :pswitch_data_0

    iget-object p1, p0, LS/b;->e:Ljava/lang/Object;

    check-cast p1, Li/S;

    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->setSelection(I)V

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, LS/b;->c:Ljava/lang/Object;

    check-cast v0, Li/L;

    invoke-virtual {v0, p2}, Li/L;->getItemId(I)J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-virtual {p1, v2, p2, v0, v1}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    :cond_0
    invoke-virtual {p0}, LS/b;->dismiss()V

    return-void

    :pswitch_0
    new-instance p1, Landroid/app/DownloadManager$Request;

    iget-object p2, p0, LS/b;->b:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "Cookie"

    invoke-virtual {p1, v0, p2}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    const-string p2, "User-Agent"

    iget-object v0, p0, LS/b;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Landroid/app/DownloadManager$Request;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    invoke-virtual {p1}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    iget-object p2, p0, LS/b;->e:Ljava/lang/Object;

    check-cast p2, Lstart/MainActivity;

    const-string v0, "download"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/DownloadManager;

    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    iget-object v1, p0, LS/b;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    invoke-virtual {p2, p1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    return-void

    :pswitch_1
    :try_start_0
    iget-object p1, p0, LS/b;->e:Ljava/lang/Object;

    check-cast p1, LS/d;

    iget-object p2, p0, LS/b;->b:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    iget-object v0, p0, LS/b;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, LS/b;->d:Ljava/lang/Object;

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p2, v0, v1}, LS/d;->a(LS/d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
