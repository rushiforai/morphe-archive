.class public final synthetic Lyc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Led;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lyc;->a:B

    iput-object p1, p0, Lyc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-byte v0, p0, Lyc;->a:B

    iget-object p0, p0, Lyc;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8e

    check-cast p0, Lj8k;

    invoke-virtual {p0}, Lj8k;->e0()V

    iget-object v0, p0, Lj8k;->d:Lor2;

    iget-object v1, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    sget-object v2, Lpc;->A:Lpc;

    invoke-virtual {p0, v1, v0, v2}, Lj8k;->c0(Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lpc;)V

    return-void

    :pswitch_1c
    check-cast p0, Lk8k;

    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_22
    check-cast p0, Lu85;

    invoke-virtual {p0}, Lu85;->g()V

    return-void

    :pswitch_28
    check-cast p0, Lqb7;

    iget-object v0, p0, Lqb7;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    sget-object v1, Lpc;->y:Lpc;

    invoke-virtual {p0, v0, v1}, Lqb7;->A(Landroid/widget/ImageView;Lpc;)V

    iget-object v0, p0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    sget-object v1, Lpc;->v:Lpc;

    invoke-virtual {p0, v0, v1}, Lqb7;->A(Landroid/widget/ImageView;Lpc;)V

    return-void

    :pswitch_3d
    check-cast p0, Lhd;

    iget-boolean v0, p0, Lhd;->b:Z

    if-nez v0, :cond_4d

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhd;->b:Z

    iget-object p0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lc4;

    invoke-static {p0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_4d
    return-void

    :pswitch_4e
    check-cast p0, Ldd;

    iget-object v0, p0, Ldd;->l:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5a
    :goto_5a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/MenuItem;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcd;

    iget-object v3, v1, Lcd;->a:Lpc;

    iget-object v4, p0, Ldd;->j:Lfd;

    invoke-virtual {v4, v3}, Lfd;->e(Lpc;)Ljf;

    move-result-object v3

    if-nez v3, :cond_7e

    sget-object v3, Lfd;->e:Ljf;

    :cond_7e
    iget-object v4, v1, Lcd;->b:Ljf;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5a

    iput-object v3, v1, Lcd;->b:Ljf;

    invoke-virtual {p0, v2, v1}, Ldd;->q(Landroid/view/MenuItem;Lcd;)V

    goto :goto_5a

    :cond_8c
    return-void

    nop

    :pswitch_data_8e
    .packed-switch 0x0
        :pswitch_4e
        :pswitch_3d
        :pswitch_28
        :pswitch_22
        :pswitch_1c
    .end packed-switch
.end method
