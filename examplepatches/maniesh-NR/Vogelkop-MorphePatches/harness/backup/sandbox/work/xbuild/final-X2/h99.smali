.class public final synthetic Lh99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk99;


# direct methods
.method public synthetic constructor <init>(Lk99;B)V
    .registers 3

    iput-byte p2, p0, Lh99;->a:B

    iput-object p1, p0, Lh99;->b:Lk99;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lh99;->a:B

    iget-object p0, p0, Lh99;->b:Lk99;

    check-cast p1, Landroid/view/View;

    check-cast p2, Lef;

    packed-switch v0, :pswitch_data_52

    new-instance p2, Ldd;

    iget-object p0, p0, Lk99;->b:Lfd;

    invoke-direct {p2, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    iget-object p0, p0, Lk99;->c:Lzu3;

    iget-object p0, p0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    new-instance p2, Lfge;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->x:Lumi;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    invoke-direct {p2, p0, v0, p1}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ln6h;

    new-instance v1, Lwzg;

    const-class v0, Lfge;

    const/4 v2, 0x4

    invoke-direct {v1, p2, v0, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lzhj;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, -0x1

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v7}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v0, p0}, Lzhj;->c(Landroid/content/Context;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
