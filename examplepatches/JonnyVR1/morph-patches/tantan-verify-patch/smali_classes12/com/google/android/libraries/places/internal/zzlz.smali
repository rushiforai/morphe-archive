.class final Lcom/google/android/libraries/places/internal/zzlz;
.super Lcom/google/android/libraries/places/internal/zzlx;
.source "SourceFile"


# static fields
.field static final zza:I

.field static final zzb:Lcom/google/android/libraries/places/internal/zzma;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x1f

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/google/android/libraries/places/internal/zzlz;->zza:I

    .line 8
    .line 9
    new-instance v0, Lcom/google/android/libraries/places/internal/zzlz;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzlz;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/google/android/libraries/places/internal/zzlz;->zzb:Lcom/google/android/libraries/places/internal/zzma;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "CharMatcher.whitespace()"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzlx;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(C)Z
    .locals 1

    .line 1
    const p0, 0x6449bf0a

    .line 2
    .line 3
    .line 4
    mul-int/2addr p0, p1

    .line 5
    sget v0, Lcom/google/android/libraries/places/internal/zzlz;->zza:I

    .line 6
    .line 7
    ushr-int/2addr p0, v0

    .line 8
    const-string v0, "\u2002\u3000\r\u0085\u200a\u2005\u2000\u3000\u2029\u000b\u3000\u2008\u2003\u205f\u3000\u1680\t \u2006\u2001\u202f\u00a0\u000c\u2009\u3000\u2004\u3000\u3000\u2028\n\u2007\u3000"

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/String;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ne p0, p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method
