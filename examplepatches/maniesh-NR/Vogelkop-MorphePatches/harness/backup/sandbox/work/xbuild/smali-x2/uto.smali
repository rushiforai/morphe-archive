.class public final Luto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljrp;
.implements Luwn;
.implements Lcpp;
.implements Lph;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x1

    iput-byte v0, p0, Luto;->a:B

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Luto;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Luto;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh61;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lh61;-><init>(Landroid/content/Context;Z)V

    sget-object p1, Lflo;->a:Lavj;

    invoke-static {p1}, Lvlo;->b(Lylo;)Lvlo;

    move-result-object p1

    new-instance v1, Lrgh;

    sget-object v2, Lcjp;->a:Lavj;

    invoke-direct {v1, v0, v2}, Lrgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lmcj;

    invoke-direct {v2, v0, p1, v1}, Lmcj;-><init>(Lh61;Lvlo;Lrgh;)V

    invoke-static {v2}, Lvlo;->b(Lylo;)Lvlo;

    move-result-object p1

    new-instance v0, Lbxk;

    const/16 v1, 0x10

    invoke-direct {v0, p1, v1}, Lbxk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvlo;->b(Lylo;)Lvlo;

    move-result-object p1

    iput-object p1, p0, Luto;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 49
    iput-byte p2, p0, Luto;->a:B

    iput-object p1, p0, Luto;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Landroid/view/View;IILjava/lang/Integer;)Z
    .registers 11

    iget-object p0, p0, Luto;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    const/4 v0, 0x0

    if-eqz p2, :cond_71

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_71

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_71

    :cond_15
    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result p1

    if-eqz p1, :cond_71

    invoke-virtual {p2, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p1

    if-eqz p1, :cond_71

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    int-to-long p0, p0

    mul-long/2addr v1, p0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p0

    int-to-long p0, p0

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p2

    int-to-long v3, p2

    mul-long/2addr p0, v3

    const-wide/16 v3, 0x0

    cmp-long p2, p0, v3

    if-lez p2, :cond_71

    const/4 p2, 0x1

    if-eqz p5, :cond_50

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_50

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long p0, p0

    cmp-long p0, v1, p0

    if-ltz p0, :cond_71

    goto :goto_70

    :cond_50
    const-wide/16 v3, 0x64

    mul-long/2addr v1, v3

    if-lez p4, :cond_6a

    int-to-long p4, p4

    mul-long/2addr p4, p0

    cmp-long p4, v1, p4

    if-gtz p4, :cond_5d

    move p4, p2

    goto :goto_5e

    :cond_5d
    move p4, v0

    :goto_5e
    if-eqz p4, :cond_63

    if-nez p4, :cond_71

    goto :goto_70

    :cond_63
    int-to-long p3, p3

    mul-long/2addr p3, p0

    cmp-long p0, v1, p3

    if-ltz p0, :cond_71

    goto :goto_70

    :cond_6a
    int-to-long p3, p3

    mul-long/2addr p3, p0

    cmp-long p0, v1, p3

    if-ltz p0, :cond_71

    :goto_70
    return p2

    :cond_71
    return v0
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 6

    iget-object p0, p0, Luto;->b:Ljava/lang/Object;

    check-cast p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;

    check-cast p1, Loh;

    iget-object v0, p1, Loh;->b:Landroid/content/Intent;

    const-string v1, "ProxyBillingActivityV2"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzi(Landroid/content/Intent;Ljava/lang/String;)Lmf3;

    move-result-object v2

    iget v2, v2, Lmf3;->a:I

    iget-object v3, p0, Lcom/android/billingclient/api/ProxyBillingActivityV2;->l:Landroid/os/ResultReceiver;

    if-eqz v3, :cond_1f

    if-nez v0, :cond_18

    const/4 v0, 0x0

    goto :goto_1c

    :cond_18
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    :goto_1c
    invoke-virtual {v3, v2, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    :cond_1f
    iget p1, p1, Loh;->a:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_26

    if-eqz v2, :cond_3f

    :cond_26
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Subscription management action finished with resultCode: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " and billing\'s responseCode: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3f
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onPostMessage(Landroid/webkit/WebView;Ljun;Landroid/net/Uri;ZLxmb;)V
    .registers 6

    invoke-virtual {p2}, Ljun;->b()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Luto;->b:Ljava/lang/Object;

    check-cast p0, Lplk;

    const-string p2, "4"

    invoke-virtual {p0, p1, p2}, Lplk;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final zza()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Luto;->a:B

    iget-object p0, p0, Luto;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_48

    :pswitch_7
    check-cast p0, Ln0c;

    iget-object p0, p0, Ln0c;->a:Landroid/content/Context;

    return-object p0

    :pswitch_c
    check-cast p0, Luto;

    iget-object p0, p0, Luto;->b:Ljava/lang/Object;

    check-cast p0, Ln0c;

    iget-object p0, p0, Ln0c;->a:Landroid/content/Context;

    new-instance v0, Lerp;

    invoke-direct {v0, p0}, Lerp;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_1a
    check-cast p0, Lz4k;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lh61;

    iget-object p0, p0, Lh61;->a:Landroid/content/Context;

    const/4 v0, 0x0

    :try_start_23
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_33
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_23 .. :try_end_33} :catch_47

    if-eqz v1, :cond_47

    const-string v2, "local_testing_dir"

    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_47

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-direct {v2, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v0, v2

    :catch_47
    :cond_47
    return-object v0

    :pswitch_data_48
    .packed-switch 0x3
        :pswitch_1a
        :pswitch_7
        :pswitch_c
    .end packed-switch
.end method
