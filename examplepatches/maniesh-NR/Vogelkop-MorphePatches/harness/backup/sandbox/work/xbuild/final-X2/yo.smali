.class public final enum Lyo;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lyo;

.field public static final enum c:Lyo;

.field public static final enum d:Lyo;

.field public static final enum e:Lyo;

.field public static final enum f:Lyo;

.field public static final enum g:Lyo;

.field public static final h:Ljava/util/Set;

.field public static final synthetic i:[Lyo;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lyo;

    const/4 v1, 0x0

    const-string v2, "admob"

    const-string v3, "ADMOB"

    invoke-direct {v0, v3, v1, v2}, Lyo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lyo;->b:Lyo;

    new-instance v1, Lyo;

    const/4 v2, 0x1

    const-string v3, "adx"

    const-string v4, "ADX"

    invoke-direct {v1, v4, v2, v3}, Lyo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lyo;->c:Lyo;

    new-instance v2, Lyo;

    const/4 v3, 0x2

    const-string v4, "sdkGb"

    const-string v5, "GB_ONLINE"

    invoke-direct {v2, v5, v3, v4}, Lyo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lyo;->d:Lyo;

    new-instance v3, Lyo;

    const/4 v4, 0x3

    const-string v5, "pangle"

    const-string v6, "PANGLE"

    invoke-direct {v3, v6, v4, v5}, Lyo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lyo;->e:Lyo;

    new-instance v4, Lyo;

    const/4 v5, 0x4

    const-string v6, "bigo"

    const-string v7, "BIGO"

    invoke-direct {v4, v7, v5, v6}, Lyo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v5, Lyo;

    const/4 v6, 0x5

    const-string v7, "neosdk"

    const-string v8, "OPERA"

    invoke-direct {v5, v8, v6, v7}, Lyo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lyo;->f:Lyo;

    new-instance v6, Lyo;

    const/4 v7, 0x6

    const-string v8, "fake_ad"

    const-string v9, "FAKE_AD"

    invoke-direct {v6, v9, v7, v8}, Lyo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lyo;->g:Lyo;

    filled-new-array/range {v0 .. v6}, [Lyo;

    move-result-object v0

    sput-object v0, Lyo;->i:[Lyo;

    const-class v0, Lyo;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lyo;->h:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lyo;->a:Ljava/lang/String;

    return-void
.end method

.method public static d(Ljava/lang/String;)Lyo;
    .registers 6

    invoke-static {}, Lyo;->values()[Lyo;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_16

    aget-object v3, v0, v2

    iget-object v4, v3, Lyo;->a:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    return-object v3

    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_16
    const-string v0, "unknown ad provider sdk source: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static g(Lyo;Lrm;)I
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_18

    const/4 p1, 0x2

    if-eq p0, p1, :cond_15

    const/4 p1, 0x3

    if-eq p0, p1, :cond_1f

    const/4 p1, 0x4

    if-eq p0, p1, :cond_1f

    const/4 p1, 0x5

    if-eq p0, p1, :cond_1f

    const/16 p0, 0x1e

    return p0

    :cond_15
    const/16 p0, 0xf

    return p0

    :cond_18
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 p1, 0x6

    if-eq p0, p1, :cond_22

    :cond_1f
    const/16 p0, 0x3c

    return p0

    :cond_22
    const/16 p0, 0x2d0

    return p0
.end method

.method public static h(Lyo;)Lu50;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_26

    const-string p0, "Not reached"

    invoke-static {p0}, Lh9o;->r(Ljava/lang/String;)V

    return-object v0

    :pswitch_e
    const-string p0, "State should not be possible"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v0

    :pswitch_14
    sget-object p0, Lu50;->s:Lu50;

    return-object p0

    :pswitch_17
    sget-object p0, Lu50;->p:Lu50;

    return-object p0

    :pswitch_1a
    sget-object p0, Lu50;->o:Lu50;

    return-object p0

    :pswitch_1d
    sget-object p0, Lu50;->l:Lu50;

    return-object p0

    :pswitch_20
    sget-object p0, Lu50;->m:Lu50;

    return-object p0

    :pswitch_23
    sget-object p0, Lu50;->b:Lu50;

    return-object p0

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lyo;
    .registers 2

    const-class v0, Lyo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lyo;

    return-object p0
.end method

.method public static values()[Lyo;
    .registers 1

    sget-object v0, Lyo;->i:[Lyo;

    invoke-virtual {v0}, [Lyo;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lyo;

    return-object v0
.end method
