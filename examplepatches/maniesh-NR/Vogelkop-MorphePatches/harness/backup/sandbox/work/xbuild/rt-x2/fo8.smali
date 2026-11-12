.class public final Lfo8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lfo8;


# instance fields
.field public final a:Lfvl;

.field public final b:Lqp3;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lfo8;

    sget-object v1, Lfvl;->c:Lfvl;

    sget-object v2, Lqp3;->d:Lqp3;

    invoke-direct {v0, v1, v2}, Lfo8;-><init>(Lfvl;Lqp3;)V

    sput-object v0, Lfo8;->c:Lfo8;

    return-void
.end method

.method public constructor <init>(Lfvl;Lqp3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfo8;->a:Lfvl;

    iput-object p2, p0, Lfo8;->b:Lqp3;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lfo8;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lfo8;

    iget-object v1, p0, Lfo8;->a:Lfvl;

    iget-object v3, p1, Lfo8;->a:Lfvl;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lfo8;->b:Lqp3;

    iget-object p1, p1, Lfo8;->b:Lqp3;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lfo8;->a:Lfvl;

    invoke-virtual {v0}, Lfvl;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lfo8;->b:Lqp3;

    invoke-virtual {p0}, Lqp3;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
