.class public final Lyw;
.super Ldt1;
.source "SourceFile"


# instance fields
.field public final e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lole;)V
    .registers 5

    .line 86
    invoke-direct {p0}, Ldt1;-><init>()V

    .line 87
    iput-object p1, p0, Lyw;->e:Ljava/lang/Object;

    .line 88
    new-instance p1, Lva2;

    const/16 v0, 0x1d

    invoke-direct {p1, p0, v0}, Lva2;-><init>(Ljava/lang/Object;B)V

    .line 89
    new-instance v0, Lt14;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lt14;-><init>(B)V

    .line 90
    new-instance v1, La3j;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, La3j;-><init>(B)V

    .line 91
    const-class v2, Lcom/opera/android/autofill/CreditCard;

    invoke-virtual {p0, v2, p1, v0, v1}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    return-void
.end method

.method public constructor <init>(Lwth;Z)V
    .registers 5

    .line 80
    invoke-direct {p0}, Ldt1;-><init>()V

    .line 81
    iput-object p1, p0, Lyw;->e:Ljava/lang/Object;

    .line 82
    new-instance p1, Lvw;

    const/4 v0, 0x0

    invoke-direct {p1, v0, p0, p2}, Lvw;-><init>(BLjava/lang/Object;Z)V

    .line 83
    new-instance p2, Lmc8;

    const/16 v0, 0x1d

    invoke-direct {p2, v0}, Lmc8;-><init>(B)V

    .line 84
    new-instance v0, La3j;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    .line 85
    const-class v1, Lcom/opera/android/autofill/Address;

    invoke-virtual {p0, v1, p1, p2, v0}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    return-void
.end method

.method public constructor <init>(Lz4k;Lesk;)V
    .registers 7

    invoke-direct {p0}, Ldt1;-><init>()V

    iput-object p1, p0, Lyw;->e:Ljava/lang/Object;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance v0, Lsjn;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lsjn;-><init>(B)V

    new-instance v1, Lnqn;

    invoke-direct {v1, p0, p1}, Lnqn;-><init>(Lyw;B)V

    new-instance p1, La3j;

    const/4 v2, 0x4

    invoke-direct {p1, v2}, La3j;-><init>(B)V

    const-class v3, Lsqn;

    invoke-virtual {p0, v3, v0, v1, p1}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance p1, Lroj;

    const/16 v0, 0x11

    invoke-direct {p1, p0, p2, v0}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p2, Lsjn;

    const/16 v0, 0xc

    invoke-direct {p2, v0}, Lsjn;-><init>(B)V

    new-instance v0, La3j;

    invoke-direct {v0, v2}, La3j;-><init>(B)V

    const-class v1, Lrqn;

    invoke-virtual {p0, v1, p1, p2, v0}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance p1, Lsjn;

    const/16 p2, 0xd

    invoke-direct {p1, p2}, Lsjn;-><init>(B)V

    new-instance p2, Lnqn;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lnqn;-><init>(Lyw;B)V

    new-instance v0, La3j;

    invoke-direct {v0, v2}, La3j;-><init>(B)V

    const-class v1, Lqqn;

    invoke-virtual {p0, v1, p1, p2, v0}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    return-void
.end method
