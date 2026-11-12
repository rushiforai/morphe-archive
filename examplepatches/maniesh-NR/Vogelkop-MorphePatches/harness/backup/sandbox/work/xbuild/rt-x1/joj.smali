.class public final synthetic Ljoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Livg;


# direct methods
.method public synthetic constructor <init>(Livg;B)V
    .registers 3

    iput-byte p2, p0, Ljoj;->a:B

    iput-object p1, p0, Ljoj;->b:Livg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ljoj;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Ljoj;->b:Livg;

    check-cast p1, Lkotlin/Unit;

    packed-switch v0, :pswitch_data_4c

    invoke-virtual {p0}, Livg;->y()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    const-wide/16 v2, 0x0

    if-eqz p0, :cond_23

    array-length p1, p0

    :goto_17
    if-ge v1, p1, :cond_23

    aget-object v0, p0, v1

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    add-long/2addr v2, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_23
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    :pswitch_28
    invoke-virtual {p0}, Livg;->y()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_40

    array-length p1, p0

    :goto_33
    if-ge v1, p1, :cond_3d

    aget-object v0, p0, v1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_33

    :cond_3d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_41

    :cond_40
    const/4 p0, 0x0

    :goto_41
    return-object p0

    :pswitch_42
    invoke-virtual {p0}, Livg;->y()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_42
        :pswitch_28
    .end packed-switch
.end method
