.class public final Lqvl;
.super Ld63;
.source "SourceFile"

# interfaces
.implements Labf;


# instance fields
.field public final a:Lebf;

.field public b:Lrzg;


# direct methods
.method public constructor <init>(Lebf;)V
    .registers 2

    invoke-direct {p0}, Ld63;-><init>()V

    iput-object p1, p0, Lqvl;->a:Lebf;

    return-void
.end method


# virtual methods
.method public final createDialog(Landroid/content/Context;Lb2l;)Lrim;
    .registers 5

    new-instance v0, Lrzg;

    iget-object v1, p0, Lqvl;->a:Lebf;

    invoke-interface {v1, p1}, Lebf;->p(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p0, p1, p2}, Lrzg;-><init>(Lqvl;Landroid/content/Context;Lb2l;)V

    iput-object v0, p0, Lqvl;->b:Lrzg;

    new-instance p1, Lk93;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lk93;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    new-instance p1, Lmx3;

    iget-object p0, p0, Lqvl;->b:Lrzg;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lmx3;-><init>(Lzp1;Lab;)V

    return-object p1
.end method

.method public final dismiss()V
    .registers 1

    iget-object p0, p0, Lqvl;->b:Lrzg;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lrzg;->dismiss()V

    :cond_7
    return-void
.end method
