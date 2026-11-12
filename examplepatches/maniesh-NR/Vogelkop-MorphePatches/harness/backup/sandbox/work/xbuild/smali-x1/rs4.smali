.class public final synthetic Lrs4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lui3;

.field public final synthetic c:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lui3;Ljava/util/Set;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lrs4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrs4;->b:Lui3;

    iput-object p2, p0, Lrs4;->c:Ljava/util/Set;

    return-void
.end method

.method public synthetic constructor <init>(Lui3;Ljava/util/Set;Lus4;)V
    .registers 4

    .line 11
    const/4 p3, 0x0

    iput-byte p3, p0, Lrs4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrs4;->b:Lui3;

    iput-object p2, p0, Lrs4;->c:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lrs4;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Lrs4;->c:Ljava/util/Set;

    iget-object p0, p0, Lrs4;->b:Lui3;

    const/4 v3, 0x0

    check-cast p1, Lxj3;

    packed-switch v0, :pswitch_data_ac

    iget-object p1, p1, Lxj3;->b:Ljava/lang/String;

    iget-object p0, p0, Lui3;->d:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwi3;

    if-eqz p0, :cond_1c

    iget-object p0, p0, Lwi3;->a:Lxi3;

    goto :goto_1d

    :cond_1c
    move-object p0, v3

    :goto_1d
    if-eqz p0, :cond_32

    iget p0, p0, Lxi3;->a:I

    if-nez v2, :cond_29

    const/4 v0, 0x4

    and-int/2addr p0, v0

    if-eq p0, v0, :cond_32

    const/4 v1, 0x0

    goto :goto_32

    :cond_29
    const/16 v0, 0xc

    and-int/2addr p0, v0

    if-eq p0, v0, :cond_32

    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    :cond_32
    :goto_32
    if-eqz v1, :cond_35

    move-object v3, p1

    :cond_35
    return-object v3

    :pswitch_36
    iget-object v0, p1, Lxj3;->a:Lwj3;

    iget-object v4, p1, Lxj3;->b:Ljava/lang/String;

    iget-object v0, v0, Lwj3;->a:Lsj3;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_4e

    if-eq v0, v1, :cond_aa

    const/4 v1, 0x2

    if-eq v0, v1, :cond_aa

    const/4 v1, 0x3

    if-eq v0, v1, :cond_4e

    invoke-static {}, Lh9o;->p()V

    goto :goto_aa

    :cond_4e
    iget-object p0, p0, Lui3;->d:Ljava/util/Map;

    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwi3;

    if-eqz p0, :cond_aa

    iget-object p0, p0, Lwi3;->a:Lxi3;

    if-eqz p0, :cond_aa

    iget-object v0, p0, Lxi3;->c:Ljava/lang/String;

    sget-object v1, Llic;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpxh;

    if-eqz v1, :cond_6a

    :goto_68
    move-object v7, v1

    goto :goto_73

    :cond_6a
    if-eqz v0, :cond_72

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_68

    :cond_72
    move-object v7, v3

    :goto_73
    if-eqz v7, :cond_aa

    iget-object v0, p0, Lxi3;->d:Ljava/lang/String;

    sget-object v1, Llic;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpxh;

    if-eqz v1, :cond_83

    :goto_81
    move-object v8, v1

    goto :goto_8c

    :cond_83
    if-eqz v0, :cond_8b

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_81

    :cond_8b
    move-object v8, v3

    :goto_8c
    iget v0, p0, Lxi3;->a:I

    const/16 v1, 0x8

    and-int/2addr v0, v1

    if-eq v0, v1, :cond_aa

    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    iget-object v6, p1, Lxj3;->b:Ljava/lang/String;

    iget-object v9, p0, Lxi3;->b:Lti3;

    iget-object p0, p0, Lxi3;->e:Ljava/lang/String;

    if-eqz p0, :cond_a3

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    :cond_a3
    move-object v10, v3

    new-instance v5, Lnvm;

    invoke-direct/range {v5 .. v11}, Lnvm;-><init>(Ljava/lang/String;Lpxh;Lpxh;Lti3;Landroid/net/Uri;Z)V

    move-object v3, v5

    :cond_aa
    :goto_aa
    return-object v3

    nop

    :pswitch_data_ac
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method
