.class public final Lxgf;
.super Lic4;
.source "SourceFile"


# instance fields
.field public final l:Ljava/lang/String;

.field public m:Llqm;

.field public n:Z

.field public o:Z

.field public p:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Llqm;->d:Llqm;

    iput-object v0, p0, Lxgf;->m:Llqm;

    iput-object p1, p0, Lxgf;->l:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final q(Landroid/content/Intent;)V
    .registers 4

    iget-object v0, p0, Lxgf;->l:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v0, "org.opera.browser.new_tab_referrer"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    iget-object v0, p0, Lxgf;->m:Llqm;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const-string v1, "org.opera.browser.new_tab_origin"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v0, "org.opera.browser.new_tab_disposition"

    iget-boolean v1, p0, Lxgf;->n:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v0, "org.opera.browser.new_tab_incognito"

    iget-boolean v1, p0, Lxgf;->o:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v0, "org.opera.browser.in_active_mode"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v0, "org.opera.browser.new_tab_placement"

    const/high16 v1, -0x80000000

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v0, "org.opera.browser.reuse_existing_tab"

    iget-boolean p0, p0, Lxgf;->p:Z

    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    return-void
.end method
