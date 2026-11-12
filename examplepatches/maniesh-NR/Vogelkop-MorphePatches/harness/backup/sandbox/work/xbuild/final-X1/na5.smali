.class public final enum Lna5;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final a:Lqs7;

.field public static final enum b:Lna5;

.field public static final enum c:Lna5;

.field public static final enum d:Lna5;

.field public static final enum e:Lna5;

.field public static final synthetic f:[Lna5;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lna5;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lna5;->b:Lna5;

    new-instance v1, Lna5;

    const-string v2, "DISABLE_ON_DISABLE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lna5;->c:Lna5;

    new-instance v2, Lna5;

    const-string v3, "DISABLE_ON_SURFACE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lna5;->d:Lna5;

    new-instance v3, Lna5;

    const-string v4, "AI_ASSISTANT"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lna5;->e:Lna5;

    filled-new-array {v0, v1, v2, v3}, [Lna5;

    move-result-object v0

    sput-object v0, Lna5;->f:[Lna5;

    new-instance v0, Lh58;

    new-instance v0, Lqs7;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, Lqs7;-><init>(B)V

    sput-object v0, Lna5;->a:Lqs7;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lna5;
    .registers 2

    const-class v0, Lna5;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lna5;

    return-object p0
.end method

.method public static values()[Lna5;
    .registers 1

    sget-object v0, Lna5;->f:[Lna5;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lna5;

    return-object v0
.end method


# virtual methods
.method public final d(Landroid/content/Context;)Loa5;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const v0, 0x7f06063b

    if-eqz p0, :cond_48

    const/4 v1, 0x1

    if-eq p0, v1, :cond_34

    const/4 v1, 0x2

    if-eq p0, v1, :cond_20

    const/4 p1, 0x3

    if-ne p0, p1, :cond_1b

    new-instance p0, Loa5;

    const/high16 p1, -0x1000000

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Loa5;-><init>(II)V

    return-object p0

    :cond_1b
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_20
    new-instance p0, Loa5;

    const v1, 0x7f0402c8

    invoke-static {v1, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    const v2, 0x7f0402ed

    invoke-static {v2, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-direct {p0, v1, p1}, Loa5;-><init>(II)V

    return-object p0

    :cond_34
    new-instance p0, Loa5;

    const v1, 0x7f0402af

    invoke-static {v1, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    const v2, 0x7f04021b

    invoke-static {v2, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-direct {p0, v1, p1}, Loa5;-><init>(II)V

    return-object p0

    :cond_48
    new-instance p0, Loa5;

    const v1, 0x7f0402b9

    invoke-static {v1, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    const v2, 0x7f0402d7

    invoke-static {v2, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-direct {p0, v1, p1}, Loa5;-><init>(II)V

    return-object p0
.end method

.method public final g(Landroid/content/Context;Ljava/lang/String;)Loa5;
    .registers 5

    sget-object v0, Lma5;->a:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5c

    sget-object p0, Lna5;->a:Lqs7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_22

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-eqz p0, :cond_22

    move v1, p1

    :cond_22
    if-nez v1, :cond_29

    invoke-static {p2}, Lcom/opera/android/siteicons/URLColorTable;->a(Ljava/lang/String;)Loa5;

    move-result-object p0

    return-object p0

    :cond_29
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const v0, 0x20297de

    invoke-static {p2, p1, p0, v0}, Lcom/google/android/gms/common/util/MurmurHash3;->murmurhash3_x86_32([BIII)I

    move-result p0

    rem-int/lit8 p0, p0, 0xa

    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result p0

    invoke-static {p0}, LJ/N;->M1PTv6E7(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/siteicons/URLFallbackColors$NativeColorResult;

    new-instance p1, Loa5;

    iget p2, p0, Lcom/opera/android/siteicons/URLFallbackColors$NativeColorResult;->b:I

    iget p0, p0, Lcom/opera/android/siteicons/URLFallbackColors$NativeColorResult;->a:I

    invoke-direct {p1, p2, p0}, Loa5;-><init>(II)V

    return-object p1

    :cond_5c
    invoke-virtual {p0, p1}, Lna5;->d(Landroid/content/Context;)Loa5;

    move-result-object p0

    return-object p0
.end method
