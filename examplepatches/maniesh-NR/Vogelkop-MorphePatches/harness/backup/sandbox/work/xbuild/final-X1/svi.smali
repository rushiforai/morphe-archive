.class public final synthetic Lsvi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly9n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lsvi;->a:B

    iput-object p1, p0, Lsvi;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 6

    iget-byte p3, p0, Lsvi;->a:B

    iget-object p0, p0, Lsvi;->b:Ljava/lang/Object;

    packed-switch p3, :pswitch_data_5a

    check-cast p0, Lcgn;

    if-lez p2, :cond_24

    iget-object p1, p0, Lcgn;->F:Lpfn;

    iget-object p1, p1, Lpfn;->n:Lmfn;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lmfn;->d:Z

    iget-object p1, p0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    if-eqz p1, :cond_24

    iget-object p2, p0, Lltl;->g:Lwjj;

    if-eqz p2, :cond_21

    iget-object p2, p2, Lwjj;->d:Ljava/lang/Object;

    check-cast p2, Lcan;

    invoke-virtual {p2, p1}, Lcan;->a(Landroid/view/View;)V

    :cond_21
    const/4 p1, 0x0

    iput-object p1, p0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    :cond_24
    return-void

    :pswitch_25
    check-cast p0, Luvi;

    iget-object p3, p0, Luvi;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_59

    invoke-virtual {p3, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Pair;

    if-eqz v0, :cond_59

    iget-object v1, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v1, Lgt;

    iget-object v0, v0, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-lt p2, v0, :cond_59

    invoke-interface {p3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p0, Luvi;->b:Lbt;

    invoke-virtual {p2, v1}, Lbt;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Ljri;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p1, p3}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_59
    return-void

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method
