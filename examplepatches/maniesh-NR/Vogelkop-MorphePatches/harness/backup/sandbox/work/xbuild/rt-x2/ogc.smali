.class public final Logc;
.super Lu5;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Logc;->a:B

    new-instance v0, Lfr;

    invoke-direct {v0, p1}, Lfr;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Labl;

    invoke-direct {p1, v0}, Labl;-><init>(Lfr;)V

    iput-object p1, p0, Logc;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lks3;B)V
    .registers 3

    .line 19
    iput-byte p2, p0, Logc;->a:B

    iput-object p1, p0, Logc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Logc;->a:B

    packed-switch v0, :pswitch_data_1a

    return-void

    :pswitch_6
    iget-object p0, p0, Logc;->b:Ljava/lang/Object;

    check-cast p0, Labl;

    const/4 v0, 0x0

    iput-boolean v0, p0, Labl;->b:Z

    iput-boolean v0, p0, Labl;->c:Z

    iput v0, p0, Labl;->e:I

    iput-boolean v0, p0, Labl;->d:Z

    iget-object p0, p0, Labl;->f:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final b(Lshf;)V
    .registers 11

    iget-byte v0, p0, Logc;->a:B

    packed-switch v0, :pswitch_data_6c

    return-void

    :pswitch_6
    iget-object p0, p0, Logc;->b:Ljava/lang/Object;

    check-cast p0, Lks3;

    iget-object v0, p1, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lshf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_18
    const/4 v5, 0x0

    const-class v6, Lgw5;

    if-ge v4, v2, :cond_30

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v4, v4, 0x1

    check-cast v7, Lu5;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_18

    goto :goto_31

    :cond_30
    move-object v7, v5

    :goto_31
    if-nez v7, :cond_5f

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_37
    if-ge v3, v1, :cond_4c

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v3, 0x1

    check-cast v2, Lu5;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_37

    move-object v5, v2

    :cond_4c
    if-eqz v5, :cond_53

    invoke-virtual {p1, v5}, Lshf;->n(Lu5;)V

    move-object v7, v5

    goto :goto_5f

    :cond_53
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, ", plugins: "

    const-string v1, "Requested plugin is not added: "

    invoke-static {v1, p0, p1, v0}, Lj9h;->n(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_6b

    :cond_5f
    :goto_5f
    check-cast v7, Lgw5;

    new-instance p1, Lngc;

    invoke-direct {p1, p0}, Lngc;-><init>(Lks3;)V

    iget-object p0, v7, Lgw5;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_6b
    return-void

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final c(Lvzk;)V
    .registers 3

    iget-byte p0, p0, Logc;->a:B

    packed-switch p0, :pswitch_data_16

    return-void

    :pswitch_6
    new-instance p0, Lwgk;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lwgk;-><init>(B)V

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-virtual {p1, p0}, Lvzk;->u(Ljava/lang/Iterable;)V

    return-void

    :pswitch_data_16
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final e(Lrc6;)V
    .registers 5

    iget-byte v0, p0, Logc;->a:B

    const/4 v1, 0x2

    iget-object p0, p0, Logc;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_50

    return-void

    :pswitch_9
    check-cast p0, Labl;

    new-instance v0, Lzal;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lzal;-><init>(Labl;B)V

    const-class v2, Lkal;

    invoke-virtual {p1, v2, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    new-instance v0, Lzal;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Lzal;-><init>(Labl;B)V

    const-class v2, Lmal;

    invoke-virtual {p1, v2, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    new-instance v0, Lzal;

    invoke-direct {v0, p0, v1}, Lzal;-><init>(Labl;B)V

    const-class v1, Lsal;

    invoke-virtual {p1, v1, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    new-instance v0, Lzal;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lzal;-><init>(Labl;B)V

    const-class v1, Lxal;

    invoke-virtual {p1, v1, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    new-instance v0, Lzal;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lzal;-><init>(Labl;B)V

    const-class p0, Loal;

    invoke-virtual {p1, p0, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    return-void

    :pswitch_42
    new-instance v0, Lfw5;

    check-cast p0, Lks3;

    invoke-direct {v0, p0, v1}, Lfw5;-><init>(Ljava/lang/Object;B)V

    const-class p0, Lmfc;

    invoke-virtual {p1, p0, v0}, Lrc6;->a(Ljava/lang/Class;Lxbd;)V

    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_42
        :pswitch_9
    .end packed-switch
.end method
