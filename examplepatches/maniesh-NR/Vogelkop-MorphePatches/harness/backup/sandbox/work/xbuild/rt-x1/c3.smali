.class public final synthetic Lc3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llch;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lc3;->a:B

    iput-object p1, p0, Lc3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final m(Z)V
    .registers 9

    iget-byte v0, p0, Lc3;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lc3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_60

    check-cast p0, Lmj3;

    iget-object p1, p0, Lmj3;->a:Lpi3;

    iget-object v0, p1, Lpi3;->c:Lwnm;

    invoke-static {v0}, Lxf8;->W(Lekc;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_2c

    sget-object v2, Lpn7;->b:Lon7;

    iget-object v2, p1, Lpi3;->b:Lu55;

    check-cast v2, Lulp;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object v4, Lun7;->d:Lun7;

    invoke-static {v2, v3, v4}, Lcs5;->y0(JLun7;)J

    move-result-wide v2

    invoke-virtual {p1, v1, v2, v3, v0}, Lpi3;->a(ZJLjava/util/Set;)V

    :cond_2c
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmj3;->c:Z

    return-void

    :pswitch_30
    check-cast p0, Ld3;

    iget-object v0, p0, Ld3;->g:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb3;

    sget-object v3, Ld3;->i:Ljava/text/SimpleDateFormat;

    iget-object v3, p0, Ld3;->b:Lcom/opera/android/PushedContentHandler;

    invoke-static {v3}, Lx1p;->R(Lcom/opera/android/PushedContentHandler;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, v2, Lb3;->a:Ljava/lang/String;

    iget-object v5, v2, Lb3;->b:Ljava/lang/String;

    iget-object v2, v2, Lb3;->d:Ljava/lang/String;

    new-instance v6, Lb3;

    invoke-direct {v6, v4, v5, v3, v2}, Lb3;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v6}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    if-eqz p1, :cond_5e

    iget-object p0, p0, Ld3;->c:Lmdh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Liqi;->e:Liqi;

    const/4 v0, 0x4

    invoke-static {p0, v1, p1, v2, v0}, Lmdh;->b(Lmdh;ZLiqi;Lkotlin/jvm/functions/Function1;I)V

    :cond_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_30
    .end packed-switch
.end method
