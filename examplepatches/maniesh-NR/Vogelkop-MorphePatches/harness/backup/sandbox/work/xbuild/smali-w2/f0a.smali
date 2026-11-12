.class public final Lf0a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzyk;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lthk;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lthk;-><init>(B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lf0a;->a:Lzyk;

    return-void
.end method

.method public constructor <init>(Lcw3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lal7;

    const/16 v1, 0x10

    invoke-direct {v0, p1, v1}, Lal7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lf0a;->a:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lt12;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_38

    const/4 v0, 0x1

    iget-object p0, p0, Lf0a;->a:Lzyk;

    if-eq p1, v0, :cond_27

    const/4 v0, 0x2

    if-eq p1, v0, :cond_15

    const/4 v0, 0x3

    if-eq p1, v0, :cond_15

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_15
    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lysj;

    new-instance p1, Lrxh;

    const v0, 0x7f140800

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    invoke-static {p0, p1}, Ljoh;->h(Lysj;Lpxh;)V

    return-void

    :cond_27
    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lysj;

    new-instance p1, Lrxh;

    const v0, 0x7f1406c2

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    invoke-static {p0, p1}, Ljoh;->h(Lysj;Lpxh;)V

    :cond_38
    return-void
.end method
