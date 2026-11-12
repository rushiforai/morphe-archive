.class public final synthetic Lmy1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:Lny1;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lny1;Landroid/content/Context;Lcom/opera/api/Callback;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmy1;->a:Lny1;

    iput-object p2, p0, Lmy1;->b:Landroid/content/Context;

    iput-object p3, p0, Lmy1;->c:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 5

    const/4 v0, -0x1

    if-ne p1, v0, :cond_34

    if-eqz p2, :cond_34

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_34

    iget-object p1, p0, Lmy1;->a:Lny1;

    iget-object p1, p1, Lny1;->b:Lumi;

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    new-instance v0, Lrml;

    invoke-direct {v0, p2, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Liv0;

    const/4 p2, 0x2

    iget-object v1, p0, Lmy1;->b:Landroid/content/Context;

    invoke-direct {p1, v1, p2}, Liv0;-><init>(Landroid/content/Context;B)V

    invoke-virtual {v0, p1}, Lrml;->b(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    new-instance p2, Lz3;

    const/16 v0, 0x1a

    iget-object p0, p0, Lmy1;->c:Lcom/opera/api/Callback;

    invoke-direct {p2, p0, v0}, Lz3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    :cond_34
    return-void
.end method
