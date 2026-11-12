.class public final synthetic Ltyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Lcom/opera/android/settings/SettingsManager;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltyk;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Ltyk;->b:Ljava/lang/String;

    iput-object p3, p0, Ltyk;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0b28

    iget-object v2, p0, Ltyk;->b:Ljava/lang/String;

    const/4 v3, 0x1

    if-ne v0, v1, :cond_31

    iget-object p0, p0, Ltyk;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object p0

    sget-object p1, Lq7j;->c:Lq7j;

    const/4 v0, 0x0

    if-ne p0, p1, :cond_19

    move p0, v3

    goto :goto_1a

    :cond_19
    move p0, v0

    :goto_1a
    sget-object p1, Llqm;->h:Llqm;

    invoke-static {v2, p1, v0}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p1, v3}, Lvx3;->c(Z)V

    iput v3, p1, Lvx3;->c:I

    invoke-virtual {p1, p0}, Lvx3;->a(Z)V

    invoke-virtual {p1, v3}, Lvx3;->d(Z)V

    iput-boolean v0, p1, Lvx3;->f:Z

    invoke-static {p1}, Lam2;->v(Lvx3;)V

    return v3

    :cond_31
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0b26

    if-ne p1, v0, :cond_4d

    const-string p1, "clipboard"

    iget-object p0, p0, Ltyk;->c:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/ClipboardManager;

    if-eqz p0, :cond_4d

    invoke-static {v2, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    :cond_4d
    return v3
.end method
