.class public final Lgo8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lgo8;


# instance fields
.field public final a:Z

.field public final b:Lgvl;

.field public final c:Lrp3;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lgo8;

    sget-object v1, Lgvl;->e:Lgvl;

    sget-object v2, Lrp3;->d:Lrp3;

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Lgo8;-><init>(ZLgvl;Lrp3;)V

    sput-object v0, Lgo8;->d:Lgo8;

    return-void
.end method

.method public constructor <init>(ZLgvl;Lrp3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lgo8;->a:Z

    iput-object p2, p0, Lgo8;->b:Lgvl;

    iput-object p3, p0, Lgo8;->c:Lrp3;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Lgo8;

    if-eqz v0, :cond_22

    check-cast p1, Lgo8;

    iget-boolean v0, p0, Lgo8;->a:Z

    iget-boolean v1, p1, Lgo8;->a:Z

    if-ne v0, v1, :cond_22

    iget-object v0, p0, Lgo8;->b:Lgvl;

    iget-object v1, p1, Lgo8;->b:Lgvl;

    invoke-virtual {v0, v1}, Lgvl;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p0, p0, Lgo8;->c:Lrp3;

    iget-object p1, p1, Lgo8;->c:Lrp3;

    invoke-virtual {p0, p1}, Lrp3;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-boolean v0, p0, Lgo8;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lgo8;->b:Lgvl;

    invoke-virtual {v1}, Lgvl;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lgo8;->c:Lrp3;

    invoke-virtual {p0}, Lrp3;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
