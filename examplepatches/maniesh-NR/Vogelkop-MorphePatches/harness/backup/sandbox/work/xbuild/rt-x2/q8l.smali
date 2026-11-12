.class public final Lq8l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lq8l;


# instance fields
.field public final a:Lp8l;

.field public final b:Luyg;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lq8l;

    sget-object v1, Lp8l;->a:Lp8l;

    sget-object v2, Ln8l;->a:Ln8l;

    invoke-direct {v0, v1, v2}, Lq8l;-><init>(Lp8l;Luyg;)V

    sput-object v0, Lq8l;->c:Lq8l;

    return-void
.end method

.method public constructor <init>(Lp8l;Luyg;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq8l;->a:Lp8l;

    iput-object p2, p0, Lq8l;->b:Luyg;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lq8l;

    if-eqz v0, :cond_18

    check-cast p1, Lq8l;

    iget-object v0, p0, Lq8l;->a:Lp8l;

    iget-object v1, p1, Lq8l;->a:Lp8l;

    if-ne v0, v1, :cond_18

    iget-object p0, p0, Lq8l;->b:Luyg;

    iget-object p1, p1, Lq8l;->b:Luyg;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lq8l;->a:Lp8l;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lq8l;->b:Luyg;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
