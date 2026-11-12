.class public final Lykn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ldu3;

.field public final b:Ldu3;


# direct methods
.method public constructor <init>(Ldu3;Ldu3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lykn;->a:Ldu3;

    iput-object p2, p0, Lykn;->b:Ldu3;

    return-void
.end method


# virtual methods
.method public final a(ILp8l;)I
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_f

    const/4 p0, 0x1

    const/4 p1, 0x0

    if-ne p2, p0, :cond_b

    return p1

    :cond_b
    invoke-static {}, Lh9o;->p()V

    return p1

    :cond_f
    iget-object p0, p0, Lykn;->b:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lr22;

    iget-object p0, p0, Lr22;->b:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnp3;

    iget p0, p0, Lnp3;->a:I

    add-int/2addr p0, p1

    return p0
.end method
