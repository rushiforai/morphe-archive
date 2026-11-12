.class public final synthetic Lou;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/fragment/app/i;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/i;B)V
    .registers 3

    iput-byte p2, p0, Lou;->a:B

    iput-object p1, p0, Lou;->b:Landroidx/fragment/app/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6

    iget-byte p2, p0, Lou;->a:B

    iget-object p0, p0, Lou;->b:Landroidx/fragment/app/i;

    packed-switch p2, :pswitch_data_6c

    check-cast p0, Lpmd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcod;

    if-eqz p1, :cond_3a

    iget-boolean p2, p1, Lcod;->g:Z

    if-eqz p2, :cond_3a

    invoke-static {p1}, Lgrd;->a(Lcod;)Lgrd;

    move-result-object p1

    iget-object p2, p0, Lpmd;->e:Lqmd;

    iget-object p3, p2, Lk73;->e:Ljava/lang/Object;

    check-cast p3, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;

    iget-object p2, p2, Lk73;->b:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    iget-object p4, p3, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    if-eqz p4, :cond_34

    const/4 p4, 0x0

    iput-object p4, p3, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    iget-wide p3, p3, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a:J

    iget-object p1, p1, Lgrd;->a:Ljava/lang/String;

    invoke-static {p3, p4, p2, p1}, LJ/N;->MUhSLnzh(JLjava/lang/Object;Ljava/lang/Object;)V

    :cond_34
    const/4 p1, 0x1

    iput-boolean p1, p0, Lpmd;->f:Z

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    :cond_3a
    return-void

    :pswitch_3b
    check-cast p0, Lru;

    invoke-virtual {p0}, Lru;->H0()Ltab;

    move-result-object p1

    iget-object p2, p1, Ltab;->e:Ljava/util/List;

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lzt1;

    invoke-virtual {p0}, Lru;->J0()Lxu;

    move-result-object p0

    invoke-virtual {p1, p2}, Ltab;->a(Lzt1;)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    iget-object p0, p0, Lxu;->e:Lode;

    new-instance p4, Lwu;

    invoke-direct {p4, p2, p3}, Lwu;-><init>(Lzt1;Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0, p4}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    invoke-interface {p2}, Lzt1;->getName()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Ltab;->f:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsab;

    invoke-virtual {p1, p0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_3b
    .end packed-switch
.end method
