.class public final synthetic Lb32;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ll32;


# direct methods
.method public synthetic constructor <init>(Ll32;B)V
    .registers 3

    iput-byte p2, p0, Lb32;->a:B

    iput-object p1, p0, Lb32;->b:Ll32;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lb32;->a:B

    const-string v1, ".data"

    const/4 v2, 0x0

    iget-object p0, p0, Lb32;->b:Ll32;

    check-cast p1, Lkotlin/Unit;

    packed-switch v0, :pswitch_data_7a

    :try_start_c
    iget-object p0, p0, Ll32;->d:Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_33

    array-length p1, p0

    move v0, v2

    :goto_1c
    if-ge v0, p1, :cond_30

    aget-object v3, p0, v0

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1, v2}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_2d

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    :cond_30
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_32} :catch_35

    goto :goto_37

    :cond_33
    const/4 p0, 0x0

    goto :goto_37

    :catch_35
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_37
    return-object p0

    :pswitch_38
    iget-object p0, p0, Ll32;->d:Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object p1

    :try_start_44
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_75

    array-length v0, p0

    move v3, v2

    :goto_4c
    if-ge v3, v0, :cond_75

    aget-object v4, p0, v3

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1, v2}, Lkotlin/text/c;->l(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_72

    invoke-virtual {v4}, Ljava/io/File;->canRead()Z

    move-result v5

    if-eqz v5, :cond_72

    new-instance v5, Lh32;

    sget-object v6, Lebb;->c:Lebb;

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-static {v6, v7}, Lj06;->m(J)Lebb;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Lh32;-><init>(Ljava/io/File;Lebb;)V

    invoke-virtual {p1, v5}, Lehc;->add(Ljava/lang/Object;)Z
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_72} :catch_75

    :cond_72
    add-int/lit8 v3, v3, 0x1

    goto :goto_4c

    :catch_75
    :cond_75
    invoke-static {p1}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method
