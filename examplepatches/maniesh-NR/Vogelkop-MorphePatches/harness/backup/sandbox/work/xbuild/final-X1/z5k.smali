.class public abstract Lz5k;
.super Lv5k;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Lk6k;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lijc;Le6k;IB)V
    .registers 6

    iput-byte p5, p0, Lz5k;->d:B

    packed-switch p5, :pswitch_data_1e

    invoke-direct {p0, p1, p2, p3, p4}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    new-instance p1, Lo4b;

    const/4 p2, 0x7

    invoke-direct {p1, p3, p0, p2}, Lo4b;-><init>(Le6k;Lv5k;B)V

    iput-object p1, p0, Lz5k;->e:Lk6k;

    return-void

    :pswitch_11
    invoke-direct {p0, p1, p2, p3, p4}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    new-instance p1, Lo4b;

    const/16 p2, 0x8

    invoke-direct {p1, p3, p0, p2}, Lo4b;-><init>(Le6k;Lv5k;B)V

    iput-object p1, p0, Lz5k;->e:Lk6k;

    return-void

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_11
    .end packed-switch
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-byte p1, p0, Lz5k;->d:B

    packed-switch p1, :pswitch_data_18

    invoke-virtual {p0}, Lz5k;->C()Lagm;

    move-result-object p0

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0

    :pswitch_e
    invoke-virtual {p0}, Lz5k;->C()Lagm;

    move-result-object p0

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public abstract C()Lagm;
.end method

.method public final u()Lk6k;
    .registers 2

    iget-byte v0, p0, Lz5k;->d:B

    packed-switch v0, :pswitch_data_10

    iget-object p0, p0, Lz5k;->e:Lk6k;

    check-cast p0, Lo4b;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lz5k;->e:Lk6k;

    check-cast p0, Lo4b;

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
