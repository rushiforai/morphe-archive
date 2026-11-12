.class public final Lfyl;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lfyl;

.field public static final e:Ljava/lang/String;


# instance fields
.field public final a:I

.field public final b:Lcsh;

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lfyl;

    const/4 v1, 0x0

    new-array v1, v1, [Leyl;

    invoke-direct {v0, v1}, Lfyl;-><init>([Leyl;)V

    sput-object v0, Lfyl;->d:Lfyl;

    sget-object v0, Ltym;->a:Ljava/lang/String;

    const-string v0, "0"

    sput-object v0, Lfyl;->e:Ljava/lang/String;

    return-void
.end method

.method public varargs constructor <init>([Leyl;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lh1b;->t([Ljava/lang/Object;)Lcsh;

    move-result-object v0

    iput-object v0, p0, Lfyl;->b:Lcsh;

    array-length p1, p1

    iput p1, p0, Lfyl;->a:I

    const/4 p0, 0x0

    :goto_d
    iget p1, v0, Lcsh;->d:I

    if-ge p0, p1, :cond_39

    add-int/lit8 p1, p0, 0x1

    move v1, p1

    :goto_14
    iget v2, v0, Lcsh;->d:I

    if-ge v1, v2, :cond_37

    invoke-virtual {v0, p0}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Leyl;

    invoke-virtual {v0, v1}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Leyl;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Multiple identical TrackGroups added to one TrackGroupArray."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    const-string v3, ""

    invoke-static {v3, v2}, Lw7d;->r(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_34
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_37
    move p0, p1

    goto :goto_d

    :cond_39
    return-void
.end method


# virtual methods
.method public final a(I)Leyl;
    .registers 2

    iget-object p0, p0, Lfyl;->b:Lcsh;

    invoke-virtual {p0, p1}, Lcsh;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyl;

    return-object p0
.end method

.method public final b(Leyl;)I
    .registers 2

    iget-object p0, p0, Lfyl;->b:Lcsh;

    invoke-virtual {p0, p1}, Lh1b;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-ltz p0, :cond_9

    return p0

    :cond_9
    const/4 p0, -0x1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    if-eqz p1, :cond_20

    const-class v0, Lfyl;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_20

    check-cast p1, Lfyl;

    iget v0, p0, Lfyl;->a:I

    iget v1, p1, Lfyl;->a:I

    if-ne v0, v1, :cond_20

    iget-object p0, p0, Lfyl;->b:Lcsh;

    iget-object p1, p1, Lfyl;->b:Lcsh;

    invoke-virtual {p0, p1}, Lh1b;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_20

    :cond_1e
    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget v0, p0, Lfyl;->c:I

    if-nez v0, :cond_c

    iget-object v0, p0, Lfyl;->b:Lcsh;

    invoke-virtual {v0}, Lh1b;->hashCode()I

    move-result v0

    iput v0, p0, Lfyl;->c:I

    :cond_c
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lfyl;->b:Lcsh;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
