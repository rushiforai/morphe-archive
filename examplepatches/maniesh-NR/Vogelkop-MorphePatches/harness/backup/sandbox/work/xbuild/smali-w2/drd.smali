.class public final Ldrd;
.super Le1g;
.source "SourceFile"


# instance fields
.field public final e:Z

.field public final f:Ll08;


# direct methods
.method public constructor <init>(Z)V
    .registers 3

    sget-object v0, Ld9j;->a:[Ld9j;

    const v0, 0xcb20

    invoke-direct {p0, v0}, Le1g;-><init>(I)V

    iput-boolean p1, p0, Ldrd;->e:Z

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Ldrd;->f:Ll08;

    return-void
.end method


# virtual methods
.method public final b(Lhx4;)Lix4;
    .registers 3

    iget-boolean v0, p0, Ldrd;->e:Z

    if-nez v0, :cond_8

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_8
    invoke-super {p0, p1}, Le1g;->b(Lhx4;)Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Ldrd;->f:Ll08;

    return-object p0
.end method

.method public final g(I)Lr6j;
    .registers 11

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance p0, Lnf8;

    const/16 v1, 0xe

    invoke-direct {p0, v1}, Lnf8;-><init>(B)V

    const-class v1, Ld8j;

    invoke-direct {v2, v1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Luvc;

    const/4 p0, 0x7

    invoke-direct {v7, p0}, Luvc;-><init>(B)V

    const/16 v8, 0x60

    const v3, 0x7f14100d

    const v4, 0x7f141010

    const v5, 0x7f080585

    const/4 v6, 0x0

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v0
.end method
