.class public final synthetic Lyw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Livn;
.implements Ldkj;


# instance fields
.field public final synthetic a:Ldx3;


# direct methods
.method public synthetic constructor <init>(Ldx3;)V
    .registers 2

    iput-object p1, p0, Lyw3;->a:Ldx3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lyw3;->a:Ldx3;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lolh;->d(Ldx3;Z)V

    return-void
.end method

.method public final d(ILjava/lang/String;)V
    .registers 5

    iget-object p0, p0, Lyw3;->a:Ldx3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.opera.android.INTERNAL_WEB_SEARCH"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "query"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "com.opera.android.EXTRA_SEARCH_IN_NEW_TAB"

    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p2, "com.opera.android.EXTRA_SEARCH_INCOGNITO_MODE"

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "com.opera.android.EXTRA_SEARCH_URL_ORIGIN"

    const/16 p2, 0x8

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
