.class public final Lz2b;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lnz0;-><init>(ZZ)V

    iput-boolean p1, p0, Lz2b;->a:Z

    return-void
.end method


# virtual methods
.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-boolean p0, p0, Lz2b;->a:Z

    if-eqz p0, :cond_c

    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_c
    const p0, 0x7f140812

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget-boolean p0, p0, Lz2b;->a:Z

    if-eqz p0, :cond_c

    const p0, 0x7f1412e1

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_c
    const/4 p0, 0x0

    return-object p0
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 8

    sget p0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->b0:I

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v3, Lqxh;

    const-string p0, "Google Takeout"

    invoke-direct {v3, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    sget-object v5, Llqm;->d:Llqm;

    const/4 v4, 0x1

    const-class v1, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;

    const-string v2, "https://takeout.google.com"

    invoke-static/range {v0 .. v5}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
