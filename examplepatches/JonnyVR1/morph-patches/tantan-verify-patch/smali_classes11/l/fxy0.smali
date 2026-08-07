.class public final synthetic Ll/fxy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nxy0;


# static fields
.field public static final synthetic a:Ll/fxy0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/fxy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fxy0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fxy0;->a:Ll/fxy0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)I
    .locals 2

    .line 1
    check-cast p1, Ll/hwy0;

    .line 2
    .line 3
    sget-object p0, Ll/oxy0;->a:Ljava/util/regex/Pattern;

    .line 4
    .line 5
    iget-object p0, p1, Ll/hwy0;->a:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "OMX.google"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x1

    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    const-string p1, "c2.android"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    sget p1, Ll/mpw0;->a:I

    .line 26
    .line 27
    const/16 v0, 0x1a

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    if-ge p1, v0, :cond_1

    .line 31
    .line 32
    const-string p1, "OMX.MTK.AUDIO.DECODER.RAW"

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/4 p0, -0x1

    .line 41
    return p0

    .line 42
    :cond_1
    return v1

    .line 43
    :cond_2
    return v0
.end method
