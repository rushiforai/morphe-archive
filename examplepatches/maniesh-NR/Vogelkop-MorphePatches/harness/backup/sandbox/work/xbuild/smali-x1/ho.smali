.class public final Lho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljhb;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lho;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/BrowserActivity;Lyz;)Z
    .registers 5

    iget-byte p0, p0, Lho;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_32

    instance-of p0, p2, Lalf;

    if-eqz p0, :cond_e

    check-cast p2, Lalf;

    goto :goto_f

    :cond_e
    const/4 p2, 0x0

    :goto_f
    if-eqz p2, :cond_1c

    iget-object p0, p2, Lalf;->u:Ldhb;

    new-instance v0, Lblf;

    invoke-direct {v0, p2}, Lblf;-><init>(Lalf;)V

    invoke-virtual {p0, p1, v0}, Lk8;->K(Landroid/content/Context;Lvm;)V

    move v0, v1

    :cond_1c
    return v0

    :pswitch_1d
    instance-of p0, p2, Lgo;

    if-eqz p0, :cond_31

    check-cast p2, Lgo;

    iget-object p0, p2, Lgo;->w:Lads_mobile_sdk/ai1;

    iget-object p0, p0, Lads_mobile_sdk/ai1;->b:Lrzo;

    iput-boolean v0, p0, Lads_mobile_sdk/xo;->n:Z

    iput-boolean v1, p0, Lads_mobile_sdk/xo;->o:Z

    iget-object p0, p0, Lads_mobile_sdk/xo;->m:Loap;

    invoke-interface {p0, p1, v0, v1}, Loap;->a(Landroid/content/Context;ZZ)V

    move v0, v1

    :cond_31
    return v0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
