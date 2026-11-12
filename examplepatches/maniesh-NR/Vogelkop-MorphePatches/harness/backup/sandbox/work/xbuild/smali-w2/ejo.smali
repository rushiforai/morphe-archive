.class public abstract Lejo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmjo;
.implements Licp;
.implements Ljma;


# instance fields
.field public a:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lw9p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lejo;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 11
    iput-object p1, p0, Lejo;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static e(Landroid/widget/ImageView;Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lsmo;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lsmo;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p1, v1}, Lfip;->b(Landroid/content/Context;Ljava/lang/String;Lzhp;)V

    return-void
.end method


# virtual methods
.method public final a()Lkro;
    .registers 1

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lkro;

    return-object p0
.end method

.method public abstract b()V
.end method

.method public abstract c(Lcie;)V
.end method

.method public abstract f()V
.end method

.method public abstract g()V
.end method

.method public onDismissed(Landroid/os/Bundle;)V
    .registers 2

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lads_mobile_sdk/o01;

    invoke-virtual {p0, p1}, Lads_mobile_sdk/o01;->onDismissed(Landroid/os/Bundle;)V

    return-void
.end method

.method public onError(Landroid/os/Bundle;)V
    .registers 2

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lads_mobile_sdk/o01;

    invoke-virtual {p0, p1}, Lads_mobile_sdk/o01;->onError(Landroid/os/Bundle;)V

    return-void
.end method

.method public onShown(Landroid/os/Bundle;)V
    .registers 2

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lads_mobile_sdk/o01;

    invoke-virtual {p0, p1}, Lads_mobile_sdk/o01;->onShown(Landroid/os/Bundle;)V

    return-void
.end method

.method public final s(Lpzh;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast p0, Lcdp;

    invoke-interface {p0, p1}, Lcdp;->s(Lpzh;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
