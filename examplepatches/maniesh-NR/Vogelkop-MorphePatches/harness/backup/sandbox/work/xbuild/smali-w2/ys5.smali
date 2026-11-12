.class public final synthetic Lys5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lat5;

.field public final synthetic b:Z

.field public final synthetic c:Z

.field public final synthetic d:Leri;


# direct methods
.method public synthetic constructor <init>(Lat5;ZZLeri;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lys5;->a:Lat5;

    iput-boolean p2, p0, Lys5;->b:Z

    iput-boolean p3, p0, Lys5;->c:Z

    iput-object p4, p0, Lys5;->d:Leri;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-object p1, p0, Lys5;->a:Lat5;

    iget-object v0, p1, Lat5;->j:Lx5f;

    const/16 v1, 0x1d

    invoke-virtual {v0, v1}, Lx5f;->S(I)V

    iget-boolean v0, p0, Lys5;->b:Z

    if-eqz v0, :cond_24

    iget-boolean v0, p0, Lys5;->c:Z

    if-nez v0, :cond_24

    iget-object v0, p1, Lat5;->k:Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "browser.context_menu.used_google_lens"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    :cond_24
    iget-object v0, p1, Lat5;->e:Lk73;

    iget-object p0, p0, Lys5;->d:Leri;

    invoke-interface {p0}, Leri;->m()I

    move-result v1

    sget-object v2, Lks5;->c:Lks5;

    new-instance v3, Lge5;

    const/4 v4, 0x7

    invoke-direct {v3, p1, p0, v4}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2, v3}, Lk73;->v(ILks5;Lls5;)V

    return-void
.end method
