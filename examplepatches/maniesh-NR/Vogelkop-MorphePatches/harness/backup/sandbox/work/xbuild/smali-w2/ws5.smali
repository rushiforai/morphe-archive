.class public final synthetic Lws5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat5;

.field public final synthetic c:Lg1j;


# direct methods
.method public synthetic constructor <init>(Lat5;Lg1j;B)V
    .registers 4

    iput-byte p3, p0, Lws5;->a:B

    iput-object p1, p0, Lws5;->b:Lat5;

    iput-object p2, p0, Lws5;->c:Lg1j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lws5;->a:B

    iget-object v0, p0, Lws5;->c:Lg1j;

    iget-object p0, p0, Lws5;->b:Lat5;

    packed-switch p1, :pswitch_data_3a

    iget-object p0, p0, Lat5;->d:Lqs5;

    iget-object p1, p0, Lqs5;->b:Ljava/lang/String;

    iget-object p0, p0, Lqs5;->c:Ljava/lang/String;

    invoke-interface {v0, p1, p0}, Lg1j;->n(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_13
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->e:Ljava/lang/String;

    invoke-static {p1}, LJ/N;->MSVMeBmV(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "blob:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_35

    iget-object p0, p0, Lat5;->e:Lk73;

    sget-object p1, Lks5;->b:Lks5;

    new-instance v2, Lge5;

    const/4 v3, 0x6

    invoke-direct {v2, v0, v1, v3}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/String;B)V

    const/16 v0, 0x800

    invoke-virtual {p0, v0, p1, v2}, Lk73;->v(ILks5;Lls5;)V

    goto :goto_38

    :cond_35
    invoke-interface {v0, p1, v1}, Lg1j;->n(Ljava/lang/String;Ljava/lang/String;)V

    :goto_38
    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
