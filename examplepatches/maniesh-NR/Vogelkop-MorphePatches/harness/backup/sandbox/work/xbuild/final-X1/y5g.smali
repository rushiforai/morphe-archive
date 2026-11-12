.class public final Ly5g;
.super Ldx4;
.source "SourceFile"


# instance fields
.field public final synthetic g:B

.field public final h:Ljava/util/List;

.field public final i:Lex4;


# direct methods
.method public constructor <init>(Lqte;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ly5g;->g:B

    sget-object v0, Ld9j;->a:[Ld9j;

    const v0, 0xb798

    invoke-direct {p0, v0}, Ldx4;-><init>(I)V

    iput-object p1, p0, Ly5g;->i:Lex4;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Ly5g;->h:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Luj;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Ly5g;->g:B

    .line 20
    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x59d8

    .line 21
    invoke-direct {p0, v0}, Ldx4;-><init>(I)V

    .line 22
    iput-object p1, p0, Ly5g;->i:Lex4;

    .line 23
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 24
    iput-object p1, p0, Ly5g;->h:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final d()Ljava/util/List;
    .registers 2

    iget-byte v0, p0, Ly5g;->g:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Ly5g;->h:Ljava/util/List;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Ly5g;->h:Ljava/util/List;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final h(Lr6j;I)Lr6j;
    .registers 11

    iget-byte v0, p0, Ly5g;->g:B

    packed-switch v0, :pswitch_data_4a

    new-instance v3, Lx6j;

    new-instance v0, Lsul;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lsul;-><init>(B)V

    const-class v1, Lsyl;

    invoke-direct {v3, v1, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Lqfl;

    const/16 v0, 0xb

    invoke-direct {v7, p0, v0}, Lqfl;-><init>(Ljava/lang/Object;B)V

    const v4, 0x7f1410d1

    const v5, 0x7f080619

    const/4 v6, 0x1

    move-object v1, p1

    move v2, p2

    invoke-virtual/range {v1 .. v7}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_27
    move-object v0, p1

    move v1, p2

    new-instance v2, Lx6j;

    new-instance p1, Lnf8;

    const/16 p2, 0x1c

    invoke-direct {p1, p2}, Lnf8;-><init>(B)V

    const-class p2, Ljt2;

    invoke-direct {v2, p2, p1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Lo5f;

    const/16 p1, 0x17

    invoke-direct {v6, p0, p1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    const v3, 0x7f140c73

    const v4, 0x7f0805ac

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
