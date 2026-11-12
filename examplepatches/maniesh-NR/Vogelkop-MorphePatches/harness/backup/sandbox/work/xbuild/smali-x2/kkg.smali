.class public final synthetic Lkkg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lod3;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lokg;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lokg;Ljava/util/ArrayList;B)V
    .registers 4

    iput-byte p3, p0, Lkkg;->a:B

    iput-object p1, p0, Lkkg;->b:Lokg;

    iput-object p2, p0, Lkkg;->c:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/Integer;Lqjd;)V
    .registers 11

    iget-byte p1, p0, Lkkg;->a:B

    iget-object v0, p0, Lkkg;->c:Ljava/util/ArrayList;

    iget-object p0, p0, Lkkg;->b:Lokg;

    packed-switch p1, :pswitch_data_6c

    invoke-virtual {p0, p2}, Lokg;->c(Lqjd;)Legd;

    move-result-object p0

    if-eqz p0, :cond_4a

    iget-object p1, p2, Lqjd;->e:Lvjd;

    iget-object p1, p1, Lvjd;->I:Landroid/os/Bundle;

    const/4 p2, 0x0

    if-eqz p1, :cond_23

    const-string v1, "com.opera.android.media.NOT_PERSISTENT_IN_QUEUE"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_23

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4a

    :cond_23
    iget p1, p0, Legd;->e:I

    const/high16 v1, -0x80000000

    if-ne p1, v1, :cond_47

    new-instance v2, Ldgd;

    iget-object p1, p0, Legd;->a:Lre7;

    if-eqz p1, :cond_33

    iget-wide v3, p1, Lre7;->o:J

    :goto_31
    move-wide v6, v3

    goto :goto_36

    :cond_33
    const-wide/16 v3, 0x0

    goto :goto_31

    :goto_36
    iget-object p1, p0, Legd;->b:Landroid/net/Uri;

    if-eqz p1, :cond_3e

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_3e
    move-object v3, p2

    iget-object v5, p0, Legd;->c:Ljava/lang/String;

    iget v4, p0, Legd;->d:I

    invoke-direct/range {v2 .. v7}, Ldgd;-><init>(Ljava/lang/String;ILjava/lang/String;J)V

    move-object p2, v2

    :cond_47
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4a
    :goto_4a
    return-void

    :pswitch_4b
    invoke-virtual {p0, p2}, Lokg;->c(Lqjd;)Legd;

    move-result-object p1

    iget-object v1, p2, Lqjd;->a:Ljava/lang/String;

    if-eqz p1, :cond_6b

    new-instance v2, Lmkg;

    iget-object v3, p0, Lokg;->c:Llkg;

    iget-object p2, p2, Lqjd;->e:Lvjd;

    invoke-interface {v3, p2, p1}, Llkg;->a(Lvjd;Legd;)Lvjd;

    move-result-object p2

    iget-object p0, p0, Lokg;->d:Ljava/util/HashMap;

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;

    invoke-direct {v2, p2, p1, p0, v1}, Lmkg;-><init>(Lvjd;Legd;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6b
    return-void

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_4b
    .end packed-switch
.end method
