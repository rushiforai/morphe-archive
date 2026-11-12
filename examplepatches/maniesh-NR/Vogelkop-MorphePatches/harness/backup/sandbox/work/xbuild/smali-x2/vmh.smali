.class public final synthetic Lvmh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwmh;


# direct methods
.method public synthetic constructor <init>(Lwmh;B)V
    .registers 3

    iput-byte p2, p0, Lvmh;->a:B

    iput-object p1, p0, Lvmh;->b:Lwmh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lvmh;->a:B

    iget-object p0, p0, Lvmh;->b:Lwmh;

    packed-switch v0, :pswitch_data_52

    iget-object v0, p0, Lwmh;->d:Lc85;

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lwmh;->c:Lgnh;

    iget-object v0, v0, Lc85;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lxw;

    const/16 v2, 0x8

    invoke-direct {v1, v0, p0, v2}, Lxw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, p1}, Lo73;->o(Landroid/view/View;)V

    :cond_1c
    return-void

    :pswitch_1d
    iget-object p1, p0, Lwmh;->d:Lc85;

    if-eqz p1, :cond_36

    iget-object p0, p0, Lwmh;->c:Lgnh;

    iget-object p1, p1, Lc85;->a:Lm4l;

    iget p1, p1, Lm4l;->a:I

    iget-object v0, p0, Lgnh;->h:Ljava/util/LinkedHashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_36

    invoke-virtual {p0}, Lgnh;->e()V

    :cond_36
    return-void

    :pswitch_37
    iget-object p1, p0, Lwmh;->d:Lc85;

    if-eqz p1, :cond_50

    iget-object p0, p0, Lwmh;->c:Lgnh;

    iget-object p1, p1, Lc85;->a:Lm4l;

    iget p1, p1, Lm4l;->a:I

    iget-object v0, p0, Lgnh;->h:Ljava/util/LinkedHashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_50

    invoke-virtual {p0}, Lgnh;->e()V

    :cond_50
    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_37
        :pswitch_1d
    .end packed-switch
.end method
