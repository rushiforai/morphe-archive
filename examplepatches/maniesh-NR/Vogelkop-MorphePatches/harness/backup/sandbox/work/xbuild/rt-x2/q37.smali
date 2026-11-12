.class public abstract Lq37;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh8f;


# instance fields
.field public final a:I

.field public final b:[I


# direct methods
.method public varargs constructor <init>(I[I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lq37;->a:I

    iput-object p2, p0, Lq37;->b:[I

    return-void
.end method


# virtual methods
.method public a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 7

    sget-object p1, Lg8f;->a:Lg8f;

    if-ne p6, p1, :cond_5b

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    invoke-interface {p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_11
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_2d

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/Map$Entry;

    invoke-interface {p4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    invoke-interface {p4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p1, p5, p4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_11

    :cond_2d
    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p3

    const-string p4, "android.intent.action.MAIN"

    invoke-virtual {p3, p4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p4, "android.intent.category.LAUNCHER"

    invoke-virtual {p3, p4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p3, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object p1, p0, Lq37;->b:[I

    array-length p4, p1

    if-lez p4, :cond_48

    const-string p4, "VIEWS_TO_HIGHLIGHT"

    invoke-virtual {p3, p4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    :cond_48
    const-string p1, "DESTINATION_VIEW_ID"

    iget p0, p0, Lq37;->a:I

    invoke-static {p0}, Lj7c;->f(I)B

    move-result p0

    invoke-virtual {p3, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "ACTION_DESTINATION_VIEW"

    invoke-virtual {p3, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_5b
    return-void
.end method
