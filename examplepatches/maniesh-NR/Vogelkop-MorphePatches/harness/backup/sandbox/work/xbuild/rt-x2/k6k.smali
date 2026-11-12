.class public abstract Lk6k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Le6k;

.field public final b:Lu5k;

.field public final c:Lpde;


# direct methods
.method public constructor <init>(Le6k;Lu5k;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk6k;->a:Le6k;

    iput-object p2, p0, Lk6k;->b:Lu5k;

    new-instance p1, Lpde;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lk6k;->c:Lpde;

    return-void
.end method


# virtual methods
.method public a()Lkv8;
    .registers 1

    sget-object p0, Liv8;->a:Liv8;

    sget-object p0, Liv8;->b:Lkv8;

    return-object p0
.end method

.method public b(Le6k;)Lmv8;
    .registers 2

    if-nez p1, :cond_4

    const/4 p0, -0x1

    goto :goto_c

    :cond_4
    sget-object p0, Lj6k;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    :goto_c
    packed-switch p0, :pswitch_data_1a

    :pswitch_f
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :pswitch_14
    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_17
    sget-object p0, Liv8;->a:Liv8;

    return-object p0

    :pswitch_data_1a
    .packed-switch -0x1
        :pswitch_17
        :pswitch_f
        :pswitch_14
        :pswitch_14
        :pswitch_14
        :pswitch_14
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
    .end packed-switch
.end method

.method public abstract c(Lbz3;)I
.end method

.method public abstract d(Lbz3;)Z
.end method
