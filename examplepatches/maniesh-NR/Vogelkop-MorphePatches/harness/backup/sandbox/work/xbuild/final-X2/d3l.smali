.class public final synthetic Ld3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj1c;


# direct methods
.method public synthetic constructor <init>(Lj1c;B)V
    .registers 3

    iput-byte p2, p0, Ld3l;->a:B

    iput-object p1, p0, Ld3l;->b:Lj1c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Ld3l;->a:B

    const/4 v0, 0x0

    sget-object v1, Lph0;->o:Lph0;

    iget-object p0, p0, Ld3l;->b:Lj1c;

    packed-switch p1, :pswitch_data_3c

    iget-object p1, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v1}, Lx5f;->f0(Lph0;)V

    iget-object p1, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast p1, Lyu3;

    iget-object p0, p0, Lj1c;->j:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lp6l;

    invoke-virtual {p1, p0, v0}, Lyu3;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    return-void

    :pswitch_23
    iget-object p1, p0, Lj1c;->a:Ljava/lang/Object;

    check-cast p1, Lx5f;

    invoke-virtual {p1, v1}, Lx5f;->f0(Lph0;)V

    iget-object p1, p0, Lj1c;->g:Ljava/lang/Object;

    check-cast p1, Lyu3;

    iget-object p0, p0, Lj1c;->j:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lp6l;

    invoke-virtual {p1, p0, v0}, Lyu3;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
