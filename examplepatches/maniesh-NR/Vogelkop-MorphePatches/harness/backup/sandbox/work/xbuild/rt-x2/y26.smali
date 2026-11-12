.class public final Ly26;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ly26;

.field public static final d:Ly26;

.field public static final e:Ly26;

.field public static final f:Ly26;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:[B


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ly26;

    const/16 v1, 0x17

    const-string v2, "cssk_m"

    invoke-direct {v0, v2, v1}, Ly26;-><init>(Ljava/lang/String;B)V

    sput-object v0, Ly26;->c:Ly26;

    new-instance v0, Ly26;

    const/4 v1, 0x1

    new-array v1, v1, [B

    const/4 v3, 0x0

    const/16 v4, 0x57

    aput-byte v4, v1, v3

    invoke-direct {v0, v2, v1}, Ly26;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Ly26;->d:Ly26;

    new-instance v0, Ly26;

    const-string v1, "cssk_jbmr2"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Ly26;-><init>(Ljava/lang/String;B)V

    sput-object v0, Ly26;->e:Ly26;

    new-instance v0, Ly26;

    const-string v1, "cnssk"

    invoke-direct {v0, v1, v3}, Ly26;-><init>(Ljava/lang/String;B)V

    sput-object v0, Ly26;->f:Ly26;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;B)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly26;->a:Ljava/lang/String;

    const/4 p1, 0x1

    new-array p1, p1, [B

    const/4 v0, 0x0

    aput-byte p2, p1, v0

    iput-object p1, p0, Ly26;->b:[B

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .registers 3

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Ly26;->a:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Ly26;->b:[B

    return-void
.end method

.method public static a([BB)Z
    .registers 5

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lt v0, v2, :cond_c

    aget-byte p0, p0, v1

    and-int/lit8 p0, p0, 0x3f

    if-ne p0, p1, :cond_c

    return v2

    :cond_c
    return v1
.end method

.method public static b([B)Ly26;
    .registers 8

    const/16 v0, 0x17

    invoke-static {p0, v0}, Ly26;->a([BB)Z

    move-result v0

    if-nez v0, :cond_1b

    const/16 v0, 0x29

    invoke-static {p0, v0}, Ly26;->a([BB)Z

    move-result v0

    if-nez v0, :cond_1b

    const/16 v0, 0x12

    invoke-static {p0, v0}, Ly26;->a([BB)Z

    move-result p0

    if-eqz p0, :cond_2b

    sget-object p0, Ly26;->e:Ly26;

    return-object p0

    :cond_1b
    array-length v0, p0

    const/4 v1, 0x0

    if-lez v0, :cond_56

    aget-byte v0, p0, v1

    const/16 v2, 0x80

    and-int/2addr v0, v2

    if-ne v0, v2, :cond_56

    array-length v0, p0

    const/16 v1, 0x9

    if-ge v0, v1, :cond_2d

    :cond_2b
    const/4 p0, 0x0

    return-object p0

    :cond_2d
    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "cssk_m"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    :goto_3b
    if-ge v2, v1, :cond_49

    const/16 v5, 0x8

    shl-long/2addr v3, v5

    aget-byte v5, p0, v2

    and-int/lit16 v5, v5, 0xff

    int-to-long v5, v5

    or-long/2addr v3, v5

    add-int/lit8 v2, v2, 0x1

    goto :goto_3b

    :cond_49
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ly26;

    invoke-direct {v1, v0, p0}, Ly26;-><init>(Ljava/lang/String;[B)V

    return-object v1

    :cond_56
    array-length v0, p0

    if-lez v0, :cond_63

    aget-byte p0, p0, v1

    const/16 v0, 0x40

    and-int/2addr p0, v0

    if-ne p0, v0, :cond_63

    sget-object p0, Ly26;->d:Ly26;

    return-object p0

    :cond_63
    sget-object p0, Ly26;->c:Ly26;

    return-object p0
.end method
