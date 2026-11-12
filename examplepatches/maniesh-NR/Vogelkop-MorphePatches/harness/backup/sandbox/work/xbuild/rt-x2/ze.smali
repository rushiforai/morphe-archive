.class public abstract Lze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lh8f;


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lze;->a:I

    return-void
.end method


# virtual methods
.method public final a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    .registers 7

    if-nez p3, :cond_28

    sget-object p1, Lg8f;->a:Lg8f;

    if-ne p6, p1, :cond_27

    invoke-static {p2}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string p3, "android.intent.action.MAIN"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "android.intent.category.LAUNCHER"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string p3, "ACTION_DEEPLINK_ID"

    iget p0, p0, Lze;->a:I

    invoke-static {p0}, Lv0g;->b(I)B

    move-result p0

    invoke-virtual {p1, p3, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p0, "ACTION_DEEPLINK_ACTION"

    invoke-virtual {p1, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_27
    return-void

    :cond_28
    new-instance p0, Lfva;

    const-string p1, "Illegal source"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
.end method
