.class public final Ld7b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldfe;

.field public final b:Lt0g;

.field public c:J

.field public final d:Lt0g;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ldfe;

    const/16 v1, 0x10

    new-array v1, v1, [Lb7b;

    invoke-direct {v0, v1}, Ldfe;-><init>([Ljava/lang/Object;)V

    iput-object v0, p0, Ld7b;->a:Ldfe;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v0

    iput-object v0, p0, Ld7b;->b:Lt0g;

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Ld7b;->c:J

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v0

    iput-object v0, p0, Ld7b;->d:Lt0g;

    return-void
.end method


# virtual methods
.method public final a(Lih5;I)V
    .registers 9

    check-cast p1, Lvt9;

    const v0, -0x12f4f699

    invoke-virtual {p1, v0}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {p1, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_11

    const/4 v0, 0x4

    goto :goto_12

    :cond_11
    move v0, v1

    :goto_12
    or-int/2addr v0, p2

    and-int/lit8 v2, v0, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v2, v1, :cond_1b

    move v1, v3

    goto :goto_1c

    :cond_1b
    move v1, v4

    :goto_1c
    and-int/2addr v0, v3

    invoke-virtual {p1, v0, v1}, Lvt9;->N(IZ)Z

    move-result v0

    if-eqz v0, :cond_80

    invoke-virtual {p1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v2, Lhh5;->a:Lzpa;

    if-ne v0, v2, :cond_33

    invoke-static {v1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object v0

    invoke-virtual {p1, v0}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_33
    check-cast v0, Lafe;

    iget-object v3, p0, Ld7b;->d:Lt0g;

    invoke-virtual {v3}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_5b

    iget-object v3, p0, Ld7b;->b:Lt0g;

    invoke-virtual {v3}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_5b

    const v0, -0x88cf405

    invoke-virtual {p1, v0}, Lvt9;->W(I)V

    invoke-virtual {p1, v4}, Lvt9;->p(Z)V

    goto :goto_83

    :cond_5b
    const v3, -0x8a21ce8

    invoke-virtual {p1, v3}, Lvt9;->W(I)V

    invoke-virtual {p1, p0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p1}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v5

    if-nez v3, :cond_6d

    if-ne v5, v2, :cond_77

    :cond_6d
    new-instance v5, Ljj4;

    const/16 v2, 0xa

    invoke-direct {v5, v0, p0, v1, v2}, Ljj4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-virtual {p1, v5}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_77
    check-cast v5, Lkotlin/jvm/functions/Function2;

    invoke-static {p1, p0, v5}, Lrm5;->e(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-virtual {p1, v4}, Lvt9;->p(Z)V

    goto :goto_83

    :cond_80
    invoke-virtual {p1}, Lvt9;->Q()V

    :goto_83
    invoke-virtual {p1}, Lvt9;->r()Lznh;

    move-result-object p1

    if-eqz p1, :cond_90

    new-instance v0, La7b;

    invoke-direct {v0, p0, p2, v4}, La7b;-><init>(Ljava/lang/Object;IB)V

    iput-object v0, p1, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_90
    return-void
.end method
