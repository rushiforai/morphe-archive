.class public final synthetic Lg12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li12;


# direct methods
.method public synthetic constructor <init>(Li12;B)V
    .registers 3

    iput-byte p2, p0, Lg12;->a:B

    iput-object p1, p0, Lg12;->b:Li12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lg12;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lg12;->b:Li12;

    check-cast p1, Lkotlin/Unit;

    packed-switch v0, :pswitch_data_bc

    iget-object p0, p0, Li12;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_44

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    array-length v0, p0

    move v1, v2

    :goto_20
    if-ge v1, v0, :cond_30

    aget-object v3, p0, v1

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_2d

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    :cond_30
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_34
    if-ge v2, p0, :cond_42

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v2, v2, 0x1

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_34

    :cond_42
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_44
    return-object v1

    :pswitch_45
    iget-object p1, p0, Li12;->c:Lulp;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object p0, p0, Li12;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_ba

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    array-length v0, p0

    move v1, v2

    :goto_63
    if-ge v1, v0, :cond_73

    aget-object v5, p0, v1

    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v6

    if-eqz v6, :cond_70

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_70
    add-int/lit8 v1, v1, 0x1

    goto :goto_63

    :cond_73
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v2

    :cond_7d
    :goto_7d
    if-ge v1, v0, :cond_a6

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v1, v1, 0x1

    move-object v6, v5

    check-cast v6, Ljava/io/File;

    sget-object v7, Lpn7;->b:Lon7;

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    sub-long v6, v3, v6

    sget-object v8, Lun7;->d:Lun7;

    invoke-static {v6, v7, v8}, Lcs5;->y0(JLun7;)J

    move-result-wide v6

    sget-object v8, Lun7;->h:Lun7;

    invoke-static {v6, v7, v8}, Lpn7;->p(JLun7;)J

    move-result-wide v6

    const-wide/16 v8, 0x7

    cmp-long v6, v6, v8

    if-ltz v6, :cond_7d

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7d

    :cond_a6
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_aa
    if-ge v2, p1, :cond_b8

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v2, v2, 0x1

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_aa

    :cond_b8
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_ba
    return-object v1

    nop

    :pswitch_data_bc
    .packed-switch 0x0
        :pswitch_45
    .end packed-switch
.end method
