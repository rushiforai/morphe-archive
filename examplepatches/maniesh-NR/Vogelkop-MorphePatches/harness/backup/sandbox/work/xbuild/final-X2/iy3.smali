.class public final Liy3;
.super Ld1g;
.source "SourceFile"


# instance fields
.field public final f:Lg1c;

.field public final g:Ljava/util/List;


# direct methods
.method public constructor <init>(Lny3;Lg1c;)V
    .registers 4

    iget-object p1, p1, Lny3;->h:Ljava/lang/Object;

    check-cast p1, Lv9j;

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x7d0

    invoke-direct {p0, p1, v0}, Ld1g;-><init>(Lekc;I)V

    iput-object p2, p0, Liy3;->f:Lg1c;

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Liy3;->g:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 5

    check-cast p2, Lky3;

    iget-object v0, p2, Lky3;->a:Lrm5;

    sget-object v1, Lnm6;->m:Lnm6;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    sget-object v0, Lhy3;->a:[Lhy3;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_12
    iget-object v0, p2, Lky3;->f:Luup;

    sget-object v1, Loab;->h:Loab;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    sget-object v0, Lhy3;->a:[Lhy3;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_22
    iget-object v0, p2, Lky3;->d:Liwk;

    sget-object v1, Lhwk;->a:Lhwk;

    invoke-virtual {v0, v1}, Liwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    sget-object v0, Lhy3;->a:[Lhy3;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_32
    iget-object v0, p2, Lky3;->g:Lcgh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    sget-object v0, Lhy3;->a:[Lhy3;

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_40
    invoke-super {p0, p1, p2}, Ld1g;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Liy3;->g:Ljava/util/List;

    return-object p0
.end method

.method public final g(ILjava/lang/Object;)Lr6j;
    .registers 12

    check-cast p2, Lky3;

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance v1, Lq92;

    const/4 v3, 0x5

    invoke-direct {v1, v3}, Lq92;-><init>(B)V

    const-class v3, Ld8j;

    invoke-direct {v2, v3, v1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    iget-object p2, p2, Lky3;->a:Lrm5;

    instance-of p2, p2, Lnm6;

    if-eqz p2, :cond_1c

    const p2, 0x7f140f96

    :goto_1a
    move v4, p2

    goto :goto_20

    :cond_1c
    const p2, 0x7f140f95

    goto :goto_1a

    :goto_20
    new-instance v7, Lbo3;

    const/16 p2, 0xa

    invoke-direct {v7, p0, p2}, Lbo3;-><init>(Ljava/lang/Object;B)V

    const/16 v8, 0x40

    const v3, 0x7f140f97

    const v5, 0x7f0803a1

    const/4 v6, 0x0

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v0
.end method
