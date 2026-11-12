.class public final Lo9g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lo9g;

.field public static final f:Ljava/util/regex/Pattern;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lo9g;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Lo9g;-><init>(IIII)V

    sput-object v0, Lo9g;->e:Lo9g;

    const-string v0, "P(?:([0-9]+)Y)?(?:([0-9]+)M)?(?:([0-9]+)W)?(?:([0-9]+)D)?"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lo9g;->f:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lo9g;->a:I

    iput p2, p0, Lo9g;->b:I

    iput p3, p0, Lo9g;->c:I

    iput p4, p0, Lo9g;->d:I

    return-void
.end method

.method public static b(Ljava/lang/String;)Lo9g;
    .registers 5

    sget-object v0, Lo9g;->f:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_4d

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {p0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    if-nez v0, :cond_28

    if-nez v1, :cond_28

    if-nez p0, :cond_28

    if-eqz v2, :cond_4d

    :cond_28
    const/4 v3, 0x0

    if-nez v0, :cond_2d

    move v0, v3

    goto :goto_31

    :cond_2d
    :try_start_2d
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    :goto_31
    if-nez v1, :cond_35

    move v1, v3

    goto :goto_39

    :cond_35
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    :goto_39
    if-nez v2, :cond_3d

    move v2, v3

    goto :goto_41

    :cond_3d
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    :goto_41
    if-eqz p0, :cond_47

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :cond_47
    new-instance p0, Lo9g;

    invoke-direct {p0, v0, v1, v2, v3}, Lo9g;-><init>(IIII)V
    :try_end_4c
    .catch Ljava/lang/NumberFormatException; {:try_start_2d .. :try_end_4c} :catch_4d

    return-object p0

    :catch_4d
    :cond_4d
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final a()I
    .registers 6

    iget v0, p0, Lo9g;->d:I

    iget v1, p0, Lo9g;->c:I

    iget v2, p0, Lo9g;->b:I

    iget p0, p0, Lo9g;->a:I

    const/4 v3, 0x1

    if-ne p0, v3, :cond_13

    if-nez v2, :cond_13

    if-nez v1, :cond_13

    if-nez v0, :cond_13

    const/4 p0, 0x0

    return p0

    :cond_13
    if-nez p0, :cond_1d

    const/4 v4, 0x6

    if-ne v2, v4, :cond_1d

    if-nez v1, :cond_1d

    if-nez v0, :cond_1d

    return v3

    :cond_1d
    const/4 v4, 0x3

    if-nez p0, :cond_28

    if-ne v2, v4, :cond_28

    if-nez v1, :cond_28

    if-nez v0, :cond_28

    const/4 p0, 0x2

    return p0

    :cond_28
    if-nez p0, :cond_31

    if-ne v2, v3, :cond_31

    if-nez v1, :cond_31

    if-nez v0, :cond_31

    return v4

    :cond_31
    const/4 p0, -0x1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lo9g;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lo9g;

    iget v1, p0, Lo9g;->a:I

    iget v3, p1, Lo9g;->a:I

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget v1, p0, Lo9g;->b:I

    iget v3, p1, Lo9g;->b:I

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Lo9g;->c:I

    iget v3, p1, Lo9g;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget p0, p0, Lo9g;->d:I

    iget p1, p1, Lo9g;->d:I

    if-ne p0, p1, :cond_28

    return v0

    :cond_28
    return v2
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Lo9g;->a:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lo9g;->b:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lo9g;->c:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lo9g;->d:I

    add-int/2addr v0, p0

    return v0
.end method
