.class public final Lqi5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwkn;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Lode;


# direct methods
.method public constructor <init>(Lru9;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lqi5;->a:B

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqi5;->b:Ljava/lang/Object;

    .line 48
    new-instance v0, Lsul;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lsul;-><init>(B)V

    .line 49
    new-instance v1, Ltu9;

    sget-object v2, Lru9;->j:Lpu9;

    invoke-direct {v1, v2, v0, p1}, Ltu9;-><init>(Lou9;Lkotlin/jvm/functions/Function2;Lru9;)V

    .line 50
    iput-object v1, p0, Lqi5;->c:Lode;

    return-void
.end method

.method public constructor <init>([Lwkn;)V
    .registers 9

    const/4 v0, 0x0

    iput-byte v0, p0, Lqi5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqi5;->b:Ljava/lang/Object;

    new-instance v1, Lh42;

    invoke-direct {v1}, Lh42;-><init>()V

    iput-object v1, p0, Lqi5;->c:Lode;

    array-length v1, p1

    :goto_10
    if-ge v0, v1, :cond_2e

    aget-object v2, p1, v0

    iget-object v3, p0, Lqi5;->c:Lode;

    check-cast v3, Lh42;

    invoke-interface {v2}, Lwkn;->a()Lekc;

    move-result-object v2

    new-instance v4, Lwg5;

    const/4 v5, 0x2

    invoke-direct {v4, p0, v5}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lcl4;

    const/4 v6, 0x4

    invoke-direct {v5, v4, v6}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v2, v5}, Lh42;->s(Lekc;Lf7f;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    :cond_2e
    return-void
.end method


# virtual methods
.method public final a()Lekc;
    .registers 2

    iget-byte v0, p0, Lqi5;->a:B

    iget-object p0, p0, Lqi5;->c:Lode;

    packed-switch v0, :pswitch_data_e

    check-cast p0, Ltu9;

    return-object p0

    :pswitch_a
    check-cast p0, Lh42;

    return-object p0

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
