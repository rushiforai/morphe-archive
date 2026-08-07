.class public Lorg/apache/commons/codec/language/DoubleMetaphone;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/codec/StringEncoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;
    }
.end annotation


# static fields
.field private static final ES_EP_EB_EL_EY_IB_IL_IN_IE_EI_ER:[Ljava/lang/String;

.field private static final L_R_N_M_B_H_F_V_W_SPACE:[Ljava/lang/String;

.field private static final L_T_K_S_N_M_B_Z:[Ljava/lang/String;

.field private static final SILENT_START:[Ljava/lang/String;

.field private static final VOWELS:Ljava/lang/String; = "AEIOUY"


# instance fields
.field private maxCodeLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v0, "WR"

    .line 2
    .line 3
    const-string v1, "PS"

    .line 4
    .line 5
    const-string v2, "GN"

    .line 6
    .line 7
    const-string v3, "KN"

    .line 8
    .line 9
    const-string v4, "PN"

    .line 10
    .line 11
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/apache/commons/codec/language/DoubleMetaphone;->SILENT_START:[Ljava/lang/String;

    .line 16
    .line 17
    const-string v9, "W"

    .line 18
    .line 19
    const-string v10, " "

    .line 20
    .line 21
    const-string v1, "L"

    .line 22
    .line 23
    const-string v2, "R"

    .line 24
    .line 25
    const-string v3, "N"

    .line 26
    .line 27
    const-string v4, "M"

    .line 28
    .line 29
    const-string v5, "B"

    .line 30
    .line 31
    const-string v6, "H"

    .line 32
    .line 33
    const-string v7, "F"

    .line 34
    .line 35
    const-string v8, "V"

    .line 36
    .line 37
    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lorg/apache/commons/codec/language/DoubleMetaphone;->L_R_N_M_B_H_F_V_W_SPACE:[Ljava/lang/String;

    .line 42
    .line 43
    const-string v10, "EI"

    .line 44
    .line 45
    const-string v11, "ER"

    .line 46
    .line 47
    const-string v1, "ES"

    .line 48
    .line 49
    const-string v2, "EP"

    .line 50
    .line 51
    const-string v3, "EB"

    .line 52
    .line 53
    const-string v4, "EL"

    .line 54
    .line 55
    const-string v5, "EY"

    .line 56
    .line 57
    const-string v6, "IB"

    .line 58
    .line 59
    const-string v7, "IL"

    .line 60
    .line 61
    const-string v8, "IN"

    .line 62
    .line 63
    const-string v9, "IE"

    .line 64
    .line 65
    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sput-object v0, Lorg/apache/commons/codec/language/DoubleMetaphone;->ES_EP_EB_EL_EY_IB_IL_IN_IE_EI_ER:[Ljava/lang/String;

    .line 70
    .line 71
    const-string v7, "B"

    .line 72
    .line 73
    const-string v8, "Z"

    .line 74
    .line 75
    const-string v1, "L"

    .line 76
    .line 77
    const-string v2, "T"

    .line 78
    .line 79
    const-string v3, "K"

    .line 80
    .line 81
    const-string v4, "S"

    .line 82
    .line 83
    const-string v5, "N"

    .line 84
    .line 85
    const-string v6, "M"

    .line 86
    .line 87
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sput-object v0, Lorg/apache/commons/codec/language/DoubleMetaphone;->L_T_K_S_N_M_B_Z:[Ljava/lang/String;

    .line 92
    .line 93
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Lorg/apache/commons/codec/language/DoubleMetaphone;->maxCodeLen:I

    .line 6
    .line 7
    return-void
.end method

.method private cleanInput(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    sget-object p0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private conditionC0(Ljava/lang/String;I)Z
    .locals 6

    .line 1
    const/4 v0, 0x4

    .line 2
    const-string v1, "CHIA"

    .line 3
    .line 4
    invoke-static {p1, p2, v0, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    if-gt p2, v1, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    add-int/lit8 v2, p2, -0x2

    .line 17
    .line 18
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-direct {p0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_2

    .line 27
    .line 28
    return v0

    .line 29
    :cond_2
    add-int/lit8 v3, p2, -0x1

    .line 30
    .line 31
    const/4 v4, 0x3

    .line 32
    const-string v5, "ACH"

    .line 33
    .line 34
    invoke-static {p1, v3, v4, v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_3

    .line 39
    .line 40
    return v0

    .line 41
    :cond_3
    add-int/lit8 p2, p2, 0x2

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    const/16 p2, 0x49

    .line 48
    .line 49
    if-eq p0, p2, :cond_4

    .line 50
    .line 51
    const/16 p2, 0x45

    .line 52
    .line 53
    if-ne p0, p2, :cond_5

    .line 54
    .line 55
    :cond_4
    const-string p0, "BACHER"

    .line 56
    .line 57
    const-string p2, "MACHER"

    .line 58
    .line 59
    const/4 v3, 0x6

    .line 60
    invoke-static {p1, v2, v3, p0, p2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_6

    .line 65
    .line 66
    :cond_5
    return v1

    .line 67
    :cond_6
    return v0
.end method

.method private conditionCH0(Ljava/lang/String;I)Z
    .locals 9

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const/4 v0, 0x1

    .line 6
    add-int/lit8 v2, p2, 0x1

    .line 7
    .line 8
    const-string p2, "HARAC"

    .line 9
    .line 10
    const-string v1, "HARIS"

    .line 11
    .line 12
    const/4 v8, 0x5

    .line 13
    invoke-static {p1, v2, v8, p2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    const-string v6, "HIA"

    .line 20
    .line 21
    const-string v7, "HEM"

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    const-string v4, "HOR"

    .line 25
    .line 26
    const-string v5, "HYM"

    .line 27
    .line 28
    move-object v1, p1

    .line 29
    invoke-static/range {v1 .. v7}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    return p0

    .line 36
    :cond_1
    move-object v1, p1

    .line 37
    :cond_2
    const-string p1, "CHORE"

    .line 38
    .line 39
    invoke-static {v1, p0, v8, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_3

    .line 44
    .line 45
    return p0

    .line 46
    :cond_3
    return v0
.end method

.method private conditionCH1(Ljava/lang/String;I)Z
    .locals 9

    .line 1
    const-string p0, "VAN "

    .line 2
    .line 3
    const-string v0, "VON "

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x4

    .line 7
    invoke-static {p1, v1, v2, p0, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x1

    .line 12
    if-nez p0, :cond_2

    .line 13
    .line 14
    const/4 p0, 0x3

    .line 15
    const-string v2, "SCH"

    .line 16
    .line 17
    invoke-static {p1, v1, p0, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    add-int/lit8 v3, p2, -0x2

    .line 24
    .line 25
    const-string v6, "ARCHIT"

    .line 26
    .line 27
    const-string v7, "ORCHID"

    .line 28
    .line 29
    const/4 v4, 0x6

    .line 30
    const-string v5, "ORCHES"

    .line 31
    .line 32
    move-object v2, p1

    .line 33
    invoke-static/range {v2 .. v7}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    add-int/lit8 p0, p2, 0x2

    .line 40
    .line 41
    const-string p1, "T"

    .line 42
    .line 43
    const-string v3, "S"

    .line 44
    .line 45
    invoke-static {v2, p0, v0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    add-int/lit8 v3, p2, -0x1

    .line 52
    .line 53
    const-string v7, "U"

    .line 54
    .line 55
    const-string v8, "E"

    .line 56
    .line 57
    const/4 v4, 0x1

    .line 58
    const-string v5, "A"

    .line 59
    .line 60
    const-string v6, "O"

    .line 61
    .line 62
    invoke-static/range {v2 .. v8}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_0

    .line 67
    .line 68
    if-nez p2, :cond_1

    .line 69
    .line 70
    :cond_0
    sget-object p1, Lorg/apache/commons/codec/language/DoubleMetaphone;->L_R_N_M_B_H_F_V_W_SPACE:[Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v2, p0, v0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_2

    .line 77
    .line 78
    add-int/2addr p2, v0

    .line 79
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    sub-int/2addr p0, v0

    .line 84
    if-ne p2, p0, :cond_1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    return v1

    .line 88
    :cond_2
    :goto_0
    return v0
.end method

.method private conditionL0(Ljava/lang/String;I)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, -0x3

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p2, p0, :cond_0

    .line 9
    .line 10
    add-int/lit8 v2, p2, -0x1

    .line 11
    .line 12
    const-string v5, "ILLA"

    .line 13
    .line 14
    const-string v6, "ALLE"

    .line 15
    .line 16
    const/4 v3, 0x4

    .line 17
    const-string v4, "ILLO"

    .line 18
    .line 19
    move-object v1, p1

    .line 20
    invoke-static/range {v1 .. v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    move-object v1, p1

    .line 28
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const/4 p1, 0x2

    .line 33
    sub-int/2addr p0, p1

    .line 34
    const-string v2, "AS"

    .line 35
    .line 36
    const-string v3, "OS"

    .line 37
    .line 38
    invoke-static {v1, p0, p1, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    sub-int/2addr p0, v0

    .line 49
    const-string p1, "A"

    .line 50
    .line 51
    const-string v2, "O"

    .line 52
    .line 53
    invoke-static {v1, p0, v0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    :cond_2
    sub-int/2addr p2, v0

    .line 60
    const/4 p0, 0x4

    .line 61
    const-string p1, "ALLE"

    .line 62
    .line 63
    invoke-static {v1, p2, p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_3

    .line 68
    .line 69
    return v0

    .line 70
    :cond_3
    const/4 p0, 0x0

    .line 71
    return p0
.end method

.method private conditionM0(Ljava/lang/String;I)Z
    .locals 4

    .line 1
    add-int/lit8 v0, p2, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v1, 0x4d

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne p0, v1, :cond_0

    .line 11
    .line 12
    return v2

    .line 13
    :cond_0
    add-int/lit8 p0, p2, -0x1

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    const-string v3, "UMB"

    .line 17
    .line 18
    invoke-static {p1, p0, v1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    sub-int/2addr p0, v2

    .line 29
    if-eq v0, p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x2

    .line 32
    add-int/2addr p2, p0

    .line 33
    const-string v0, "ER"

    .line 34
    .line 35
    invoke-static {p1, p2, p0, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    :cond_1
    return v2

    .line 42
    :cond_2
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method private static contains(Ljava/lang/String;IILjava/lang/String;)Z
    .locals 0

    .line 38
    filled-new-array {p3}, [Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 33
    filled-new-array {p3, p4}, [Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 34
    filled-new-array {p3, p4, p5}, [Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 35
    filled-new-array {p3, p4, p5, p6}, [Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 36
    filled-new-array {p3, p4, p5, p6, p7}, [Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 37
    filled-new-array/range {p3 .. p8}, [Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static contains(Ljava/lang/String;II[Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_1

    .line 3
    .line 4
    add-int/2addr p2, p1

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-gt p2, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    array-length p1, p3

    .line 16
    move p2, v0

    .line 17
    :goto_0
    if-ge p2, p1, :cond_1

    .line 18
    .line 19
    aget-object v1, p3, p2

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return v0
.end method

.method private handleAEIOUY(Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const/16 p0, 0x41

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 6
    .line 7
    .line 8
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 9
    .line 10
    return p2
.end method

.method private handleC(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 12

    .line 1
    move v2, p3

    .line 2
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->conditionC0(Ljava/lang/String;I)Z

    .line 3
    .line 4
    .line 5
    move-result v3

    .line 6
    const/16 v6, 0x4b

    .line 7
    .line 8
    const/4 v7, 0x2

    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v0, v2, 0x2

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    const/16 v8, 0x53

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    const/4 v3, 0x6

    .line 22
    const-string v4, "CAESAR"

    .line 23
    .line 24
    invoke-static {p1, p3, v3, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {p2, v8}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 31
    .line 32
    .line 33
    add-int/lit8 v0, v2, 0x2

    .line 34
    .line 35
    return v0

    .line 36
    :cond_1
    const-string v3, "CH"

    .line 37
    .line 38
    invoke-static {p1, p3, v7, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_2

    .line 43
    .line 44
    invoke-direct/range {p0 .. p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleCH(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    return v0

    .line 49
    :cond_2
    const-string v3, "CZ"

    .line 50
    .line 51
    invoke-static {p1, p3, v7, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    const/16 v9, 0x58

    .line 56
    .line 57
    if-eqz v3, :cond_3

    .line 58
    .line 59
    add-int/lit8 v3, v2, -0x2

    .line 60
    .line 61
    const/4 v4, 0x4

    .line 62
    const-string v5, "WICZ"

    .line 63
    .line 64
    invoke-static {p1, v3, v4, v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-nez v3, :cond_3

    .line 69
    .line 70
    invoke-virtual {p2, v8, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 71
    .line 72
    .line 73
    add-int/lit8 v0, v2, 0x2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_3
    add-int/lit8 v10, v2, 0x1

    .line 77
    .line 78
    const-string v3, "CIA"

    .line 79
    .line 80
    const/4 v11, 0x3

    .line 81
    invoke-static {p1, v10, v11, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    invoke-virtual {p2, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 88
    .line 89
    .line 90
    add-int/lit8 v0, v2, 0x3

    .line 91
    .line 92
    return v0

    .line 93
    :cond_4
    const-string v3, "CC"

    .line 94
    .line 95
    invoke-static {p1, p3, v7, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_6

    .line 100
    .line 101
    const/4 v3, 0x1

    .line 102
    if-ne v2, v3, :cond_5

    .line 103
    .line 104
    const/4 v3, 0x0

    .line 105
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    const/16 v4, 0x4d

    .line 110
    .line 111
    if-eq v3, v4, :cond_6

    .line 112
    .line 113
    :cond_5
    invoke-direct/range {p0 .. p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleCC(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    return v0

    .line 118
    :cond_6
    const-string v4, "CG"

    .line 119
    .line 120
    const-string v5, "CQ"

    .line 121
    .line 122
    const/4 v2, 0x2

    .line 123
    const-string v3, "CK"

    .line 124
    .line 125
    move-object v0, p1

    .line 126
    move v1, p3

    .line 127
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    if-eqz v2, :cond_7

    .line 132
    .line 133
    invoke-virtual {p2, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 134
    .line 135
    .line 136
    add-int/lit8 v0, p3, 0x2

    .line 137
    .line 138
    return v0

    .line 139
    :cond_7
    const-string v4, "CE"

    .line 140
    .line 141
    const-string v5, "CY"

    .line 142
    .line 143
    const/4 v2, 0x2

    .line 144
    const-string v3, "CI"

    .line 145
    .line 146
    move-object v0, p1

    .line 147
    move v1, p3

    .line 148
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_9

    .line 153
    .line 154
    const-string v4, "CIE"

    .line 155
    .line 156
    const-string v5, "CIA"

    .line 157
    .line 158
    const/4 v2, 0x3

    .line 159
    const-string v3, "CIO"

    .line 160
    .line 161
    move-object v0, p1

    .line 162
    move v1, p3

    .line 163
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_8

    .line 168
    .line 169
    invoke-virtual {p2, v8, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 170
    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_8
    invoke-virtual {p2, v8}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 174
    .line 175
    .line 176
    :goto_0
    add-int/lit8 v0, p3, 0x2

    .line 177
    .line 178
    return v0

    .line 179
    :cond_9
    invoke-virtual {p2, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 180
    .line 181
    .line 182
    const-string v4, " Q"

    .line 183
    .line 184
    const-string v5, " G"

    .line 185
    .line 186
    const/4 v2, 0x2

    .line 187
    const-string v3, " C"

    .line 188
    .line 189
    move-object v0, p1

    .line 190
    move v1, v10

    .line 191
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    if-eqz v2, :cond_a

    .line 196
    .line 197
    add-int/lit8 v0, p3, 0x3

    .line 198
    .line 199
    return v0

    .line 200
    :cond_a
    const-string v4, "K"

    .line 201
    .line 202
    const-string v5, "Q"

    .line 203
    .line 204
    const/4 v2, 0x1

    .line 205
    const-string v3, "C"

    .line 206
    .line 207
    move-object v0, p1

    .line 208
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-eqz v2, :cond_b

    .line 213
    .line 214
    const-string v2, "CE"

    .line 215
    .line 216
    const-string v3, "CI"

    .line 217
    .line 218
    invoke-static {p1, v1, v7, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_b

    .line 223
    .line 224
    add-int/lit8 v0, p3, 0x2

    .line 225
    .line 226
    return v0

    .line 227
    :cond_b
    return v1
.end method

.method private handleCC(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 6

    .line 1
    add-int/lit8 v1, p3, 0x2

    .line 2
    .line 3
    const-string v4, "E"

    .line 4
    .line 5
    const-string v5, "H"

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const-string v3, "I"

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    const-string p1, "HU"

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-static {v0, v1, v2, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_3

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    if-ne p3, p1, :cond_0

    .line 28
    .line 29
    add-int/lit8 p1, p3, -0x1

    .line 30
    .line 31
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 p1, 0x41

    .line 36
    .line 37
    if-eq p0, p1, :cond_1

    .line 38
    .line 39
    :cond_0
    add-int/lit8 p0, p3, -0x1

    .line 40
    .line 41
    const-string p1, "UCCEE"

    .line 42
    .line 43
    const-string v1, "UCCES"

    .line 44
    .line 45
    const/4 v2, 0x5

    .line 46
    invoke-static {v0, p0, v2, p1, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    :cond_1
    const-string p0, "KS"

    .line 53
    .line 54
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/16 p0, 0x58

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 61
    .line 62
    .line 63
    :goto_0
    add-int/lit8 p3, p3, 0x3

    .line 64
    .line 65
    return p3

    .line 66
    :cond_3
    const/16 p0, 0x4b

    .line 67
    .line 68
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 69
    .line 70
    .line 71
    return v1
.end method

.method private handleCH(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 5

    .line 1
    const/16 v0, 0x58

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/16 v2, 0x4b

    .line 5
    .line 6
    if-lez p3, :cond_0

    .line 7
    .line 8
    const/4 v3, 0x4

    .line 9
    const-string v4, "CHAE"

    .line 10
    .line 11
    invoke-static {p1, p3, v3, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2, v2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 18
    .line 19
    .line 20
    :goto_0
    add-int/2addr p3, v1

    .line 21
    return p3

    .line 22
    :cond_0
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->conditionCH0(Ljava/lang/String;I)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    invoke-virtual {p2, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->conditionCH1(Ljava/lang/String;I)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p2, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    if-lez p3, :cond_4

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    const-string v3, "MC"

    .line 46
    .line 47
    invoke-static {p1, p0, v1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    invoke-virtual {p2, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_3
    invoke-virtual {p2, v0, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_4
    invoke-virtual {p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 62
    .line 63
    .line 64
    :goto_1
    add-int/2addr p3, v1

    .line 65
    return p3
.end method

.method private handleD(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 7

    .line 1
    const-string p0, "DG"

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-static {p1, p3, v0, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    add-int/lit8 v2, p3, 0x2

    .line 11
    .line 12
    const-string v5, "E"

    .line 13
    .line 14
    const-string v6, "Y"

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    const-string v4, "I"

    .line 18
    .line 19
    move-object v1, p1

    .line 20
    invoke-static/range {v1 .. v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/16 p0, 0x4a

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 p3, p3, 0x3

    .line 32
    .line 33
    return p3

    .line 34
    :cond_0
    const-string p0, "TK"

    .line 35
    .line 36
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return v2

    .line 40
    :cond_1
    move-object v1, p1

    .line 41
    const-string p0, "DT"

    .line 42
    .line 43
    const-string p1, "DD"

    .line 44
    .line 45
    invoke-static {v1, p3, v0, p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/16 p1, 0x54

    .line 50
    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p2, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 54
    .line 55
    .line 56
    add-int/2addr p3, v0

    .line 57
    return p3

    .line 58
    :cond_2
    invoke-virtual {p2, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 p3, p3, 0x1

    .line 62
    .line 63
    return p3
.end method

.method private handleG(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v7, p2

    .line 6
    .line 7
    move/from16 v8, p3

    .line 8
    .line 9
    add-int/lit8 v9, v8, 0x1

    .line 10
    .line 11
    invoke-virtual {v0, v1, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/16 v3, 0x48

    .line 16
    .line 17
    if-ne v2, v3, :cond_0

    .line 18
    .line 19
    invoke-direct/range {p0 .. p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleGH(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    return v0

    .line 24
    :cond_0
    invoke-virtual {v0, v1, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/16 v3, 0x4e

    .line 29
    .line 30
    const/16 v4, 0x59

    .line 31
    .line 32
    const/4 v10, 0x0

    .line 33
    const/4 v11, 0x2

    .line 34
    const/4 v12, 0x1

    .line 35
    if-ne v2, v3, :cond_3

    .line 36
    .line 37
    const-string v2, "N"

    .line 38
    .line 39
    const-string v3, "KN"

    .line 40
    .line 41
    if-ne v8, v12, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0, v1, v10}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    invoke-direct {v0, v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_1

    .line 52
    .line 53
    if-nez p4, :cond_1

    .line 54
    .line 55
    invoke-virtual {v7, v3, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    add-int/lit8 v5, v8, 0x2

    .line 60
    .line 61
    const-string v6, "EY"

    .line 62
    .line 63
    invoke-static {v1, v5, v11, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    if-nez v5, :cond_2

    .line 68
    .line 69
    invoke-virtual {v0, v1, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eq v0, v4, :cond_2

    .line 74
    .line 75
    if-nez p4, :cond_2

    .line 76
    .line 77
    invoke-virtual {v7, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    invoke-virtual {v7, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :goto_0
    add-int/lit8 v0, v8, 0x2

    .line 85
    .line 86
    return v0

    .line 87
    :cond_3
    const-string v2, "LI"

    .line 88
    .line 89
    invoke-static {v1, v9, v11, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_4

    .line 94
    .line 95
    if-nez p4, :cond_4

    .line 96
    .line 97
    const-string v0, "KL"

    .line 98
    .line 99
    const-string v1, "L"

    .line 100
    .line 101
    invoke-virtual {v7, v0, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    add-int/lit8 v0, v8, 0x2

    .line 105
    .line 106
    return v0

    .line 107
    :cond_4
    const/16 v13, 0x4a

    .line 108
    .line 109
    const/16 v14, 0x4b

    .line 110
    .line 111
    if-nez v8, :cond_6

    .line 112
    .line 113
    invoke-virtual {v0, v1, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eq v2, v4, :cond_5

    .line 118
    .line 119
    sget-object v2, Lorg/apache/commons/codec/language/DoubleMetaphone;->ES_EP_EB_EL_EY_IB_IL_IN_IE_EI_ER:[Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v1, v9, v11, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-eqz v2, :cond_6

    .line 126
    .line 127
    :cond_5
    invoke-virtual {v7, v14, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 128
    .line 129
    .line 130
    add-int/lit8 v0, v8, 0x2

    .line 131
    .line 132
    return v0

    .line 133
    :cond_6
    const-string v2, "ER"

    .line 134
    .line 135
    invoke-static {v1, v9, v11, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    const/4 v15, 0x3

    .line 140
    if-nez v2, :cond_7

    .line 141
    .line 142
    invoke-virtual {v0, v1, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-ne v2, v4, :cond_8

    .line 147
    .line 148
    :cond_7
    const-string v5, "RANGER"

    .line 149
    .line 150
    const-string v6, "MANGER"

    .line 151
    .line 152
    const/4 v2, 0x0

    .line 153
    const/4 v3, 0x6

    .line 154
    const-string v4, "DANGER"

    .line 155
    .line 156
    invoke-static/range {v1 .. v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-nez v2, :cond_8

    .line 161
    .line 162
    add-int/lit8 v2, v8, -0x1

    .line 163
    .line 164
    const-string v3, "E"

    .line 165
    .line 166
    const-string v4, "I"

    .line 167
    .line 168
    invoke-static {v1, v2, v12, v3, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    if-nez v3, :cond_8

    .line 173
    .line 174
    const-string v3, "RGY"

    .line 175
    .line 176
    const-string v4, "OGY"

    .line 177
    .line 178
    invoke-static {v1, v2, v15, v3, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-nez v2, :cond_8

    .line 183
    .line 184
    invoke-virtual {v7, v14, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 185
    .line 186
    .line 187
    add-int/lit8 v0, v8, 0x2

    .line 188
    .line 189
    return v0

    .line 190
    :cond_8
    const-string v5, "I"

    .line 191
    .line 192
    const-string v6, "Y"

    .line 193
    .line 194
    const/4 v3, 0x1

    .line 195
    const-string v4, "E"

    .line 196
    .line 197
    move v2, v9

    .line 198
    invoke-static/range {v1 .. v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    const/4 v4, 0x4

    .line 203
    if-nez v3, :cond_b

    .line 204
    .line 205
    add-int/lit8 v3, v8, -0x1

    .line 206
    .line 207
    const-string v5, "AGGI"

    .line 208
    .line 209
    const-string v6, "OGGI"

    .line 210
    .line 211
    invoke-static {v1, v3, v4, v5, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-eqz v3, :cond_9

    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_9
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    const/16 v1, 0x47

    .line 223
    .line 224
    if-ne v0, v1, :cond_a

    .line 225
    .line 226
    add-int/lit8 v0, v8, 0x2

    .line 227
    .line 228
    invoke-virtual {v7, v14}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 229
    .line 230
    .line 231
    return v0

    .line 232
    :cond_a
    invoke-virtual {v7, v14}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 233
    .line 234
    .line 235
    return v2

    .line 236
    :cond_b
    :goto_1
    const-string v0, "VAN "

    .line 237
    .line 238
    const-string v3, "VON "

    .line 239
    .line 240
    invoke-static {v1, v10, v4, v0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-nez v0, :cond_e

    .line 245
    .line 246
    const-string v0, "SCH"

    .line 247
    .line 248
    invoke-static {v1, v10, v15, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    if-nez v0, :cond_e

    .line 253
    .line 254
    const-string v0, "ET"

    .line 255
    .line 256
    invoke-static {v1, v2, v11, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-eqz v0, :cond_c

    .line 261
    .line 262
    goto :goto_2

    .line 263
    :cond_c
    const-string v0, "IER"

    .line 264
    .line 265
    invoke-static {v1, v2, v15, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    if-eqz v0, :cond_d

    .line 270
    .line 271
    invoke-virtual {v7, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 272
    .line 273
    .line 274
    goto :goto_3

    .line 275
    :cond_d
    invoke-virtual {v7, v13, v14}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 276
    .line 277
    .line 278
    goto :goto_3

    .line 279
    :cond_e
    :goto_2
    invoke-virtual {v7, v14}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 280
    .line 281
    .line 282
    :goto_3
    add-int/lit8 v0, v8, 0x2

    .line 283
    .line 284
    return v0
.end method

.method private handleGH(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 12

    .line 1
    const/16 v0, 0x4b

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-lez p3, :cond_0

    .line 5
    .line 6
    add-int/lit8 v2, p3, -0x1

    .line 7
    .line 8
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-direct {p0, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 19
    .line 20
    .line 21
    add-int/2addr p3, v1

    .line 22
    return p3

    .line 23
    :cond_0
    const/16 v2, 0x49

    .line 24
    .line 25
    if-nez p3, :cond_2

    .line 26
    .line 27
    add-int/2addr p3, v1

    .line 28
    invoke-virtual {p0, p1, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-ne p0, v2, :cond_1

    .line 33
    .line 34
    const/16 p0, 0x4a

    .line 35
    .line 36
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 41
    .line 42
    .line 43
    :goto_0
    return p3

    .line 44
    :cond_2
    const/4 v3, 0x1

    .line 45
    if-le p3, v3, :cond_3

    .line 46
    .line 47
    add-int/lit8 v5, p3, -0x2

    .line 48
    .line 49
    const-string v8, "H"

    .line 50
    .line 51
    const-string v9, "D"

    .line 52
    .line 53
    const/4 v6, 0x1

    .line 54
    const-string v7, "B"

    .line 55
    .line 56
    move-object v4, p1

    .line 57
    invoke-static/range {v4 .. v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_5

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    move-object v4, p1

    .line 65
    :goto_1
    if-le p3, v1, :cond_4

    .line 66
    .line 67
    add-int/lit8 v5, p3, -0x3

    .line 68
    .line 69
    const-string v8, "H"

    .line 70
    .line 71
    const-string v9, "D"

    .line 72
    .line 73
    const/4 v6, 0x1

    .line 74
    const-string v7, "B"

    .line 75
    .line 76
    invoke-static/range {v4 .. v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_5

    .line 81
    .line 82
    :cond_4
    const/4 p1, 0x3

    .line 83
    if-le p3, p1, :cond_6

    .line 84
    .line 85
    add-int/lit8 p1, p3, -0x4

    .line 86
    .line 87
    const-string v5, "B"

    .line 88
    .line 89
    const-string v6, "H"

    .line 90
    .line 91
    invoke-static {v4, p1, v3, v5, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_6

    .line 96
    .line 97
    :cond_5
    add-int/2addr p3, v1

    .line 98
    return p3

    .line 99
    :cond_6
    if-le p3, v1, :cond_7

    .line 100
    .line 101
    add-int/lit8 p1, p3, -0x1

    .line 102
    .line 103
    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    const/16 v3, 0x55

    .line 108
    .line 109
    if-ne p1, v3, :cond_7

    .line 110
    .line 111
    add-int/lit8 v5, p3, -0x3

    .line 112
    .line 113
    const-string v10, "R"

    .line 114
    .line 115
    const-string v11, "T"

    .line 116
    .line 117
    const/4 v6, 0x1

    .line 118
    const-string v7, "C"

    .line 119
    .line 120
    const-string v8, "G"

    .line 121
    .line 122
    const-string v9, "L"

    .line 123
    .line 124
    invoke-static/range {v4 .. v11}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_7

    .line 129
    .line 130
    const/16 p0, 0x46

    .line 131
    .line 132
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_7
    if-lez p3, :cond_8

    .line 137
    .line 138
    add-int/lit8 p1, p3, -0x1

    .line 139
    .line 140
    invoke-virtual {p0, v4, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eq p0, v2, :cond_8

    .line 145
    .line 146
    invoke-virtual {p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 147
    .line 148
    .line 149
    :cond_8
    :goto_2
    add-int/2addr p3, v1

    .line 150
    return p3
.end method

.method private handleH(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    add-int/lit8 v0, p3, -0x1

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-direct {p0, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    :cond_0
    add-int/lit8 v0, p3, 0x1

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-direct {p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    const/16 p0, 0x48

    .line 28
    .line 29
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 p3, p3, 0x2

    .line 33
    .line 34
    return p3

    .line 35
    :cond_1
    add-int/lit8 p3, p3, 0x1

    .line 36
    .line 37
    return p3
.end method

.method private handleJ(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I
    .locals 12

    .line 1
    move v7, p3

    .line 2
    const/4 v2, 0x4

    .line 3
    const-string v3, "JOSE"

    .line 4
    .line 5
    invoke-static {p1, p3, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    const/16 v5, 0x20

    .line 10
    .line 11
    const-string v6, "SAN "

    .line 12
    .line 13
    const/4 v8, 0x0

    .line 14
    const/16 v9, 0x48

    .line 15
    .line 16
    const/16 v10, 0x4a

    .line 17
    .line 18
    const/4 v11, 0x1

    .line 19
    if-nez v4, :cond_7

    .line 20
    .line 21
    invoke-static {p1, v8, v2, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/16 v4, 0x41

    .line 29
    .line 30
    if-nez v7, :cond_1

    .line 31
    .line 32
    invoke-static {p1, p3, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {p2, v10, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    add-int/lit8 v2, v7, -0x1

    .line 43
    .line 44
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-direct {p0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_3

    .line 53
    .line 54
    if-nez p4, :cond_3

    .line 55
    .line 56
    add-int/lit8 v3, v7, 0x1

    .line 57
    .line 58
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-eq v6, v4, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    const/16 v4, 0x4f

    .line 69
    .line 70
    if-ne v3, v4, :cond_3

    .line 71
    .line 72
    :cond_2
    invoke-virtual {p2, v10, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    sub-int/2addr v3, v11

    .line 81
    if-ne v7, v3, :cond_4

    .line 82
    .line 83
    invoke-virtual {p2, v10, v5}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    add-int/lit8 v3, v7, 0x1

    .line 88
    .line 89
    sget-object v4, Lorg/apache/commons/codec/language/DoubleMetaphone;->L_T_K_S_N_M_B_Z:[Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p1, v3, v11, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-nez v3, :cond_5

    .line 96
    .line 97
    const-string v5, "K"

    .line 98
    .line 99
    const-string v6, "L"

    .line 100
    .line 101
    const/4 v3, 0x1

    .line 102
    const-string v4, "S"

    .line 103
    .line 104
    move-object v1, p1

    .line 105
    invoke-static/range {v1 .. v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-nez v2, :cond_5

    .line 110
    .line 111
    invoke-virtual {p2, v10}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 112
    .line 113
    .line 114
    :cond_5
    :goto_0
    add-int/lit8 v2, v7, 0x1

    .line 115
    .line 116
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-ne v0, v10, :cond_6

    .line 121
    .line 122
    add-int/lit8 v0, v7, 0x2

    .line 123
    .line 124
    return v0

    .line 125
    :cond_6
    return v2

    .line 126
    :cond_7
    :goto_1
    if-nez v7, :cond_8

    .line 127
    .line 128
    add-int/lit8 v3, v7, 0x4

    .line 129
    .line 130
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eq v0, v5, :cond_a

    .line 135
    .line 136
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eq v0, v2, :cond_a

    .line 141
    .line 142
    invoke-static {p1, v8, v2, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_9

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_9
    invoke-virtual {p2, v10, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_a
    :goto_2
    invoke-virtual {p2, v9}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 154
    .line 155
    .line 156
    :goto_3
    add-int/lit8 v0, v7, 0x1

    .line 157
    .line 158
    return v0
.end method

.method private handleL(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 3

    .line 1
    add-int/lit8 v0, p3, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/16 v2, 0x4c

    .line 8
    .line 9
    if-ne v1, v2, :cond_1

    .line 10
    .line 11
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->conditionL0(Ljava/lang/String;I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->appendPrimary(C)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p2, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 22
    .line 23
    .line 24
    :goto_0
    add-int/lit8 p3, p3, 0x2

    .line 25
    .line 26
    return p3

    .line 27
    :cond_1
    invoke-virtual {p2, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 28
    .line 29
    .line 30
    return v0
.end method

.method private handleP(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 2

    .line 1
    add-int/lit8 v0, p3, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v1, 0x48

    .line 8
    .line 9
    if-ne p0, v1, :cond_0

    .line 10
    .line 11
    const/16 p0, 0x46

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 p3, p3, 0x2

    .line 17
    .line 18
    return p3

    .line 19
    :cond_0
    const/16 p0, 0x50

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 22
    .line 23
    .line 24
    const-string p0, "P"

    .line 25
    .line 26
    const-string p2, "B"

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {p1, v0, v1, p0, p2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    add-int/lit8 p3, p3, 0x2

    .line 36
    .line 37
    return p3

    .line 38
    :cond_1
    return v0
.end method

.method private handleR(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    const/16 v1, 0x52

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-ne p3, v0, :cond_0

    .line 11
    .line 12
    if-nez p4, :cond_0

    .line 13
    .line 14
    add-int/lit8 p4, p3, -0x2

    .line 15
    .line 16
    const-string v0, "IE"

    .line 17
    .line 18
    invoke-static {p1, p4, v2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-eqz p4, :cond_0

    .line 23
    .line 24
    add-int/lit8 p4, p3, -0x4

    .line 25
    .line 26
    const-string v0, "ME"

    .line 27
    .line 28
    const-string v3, "MA"

    .line 29
    .line 30
    invoke-static {p1, p4, v2, v0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    if-nez p4, :cond_0

    .line 35
    .line 36
    invoke-virtual {p2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->appendAlternate(C)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 41
    .line 42
    .line 43
    :goto_0
    add-int/lit8 p2, p3, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-ne p0, v1, :cond_1

    .line 50
    .line 51
    add-int/2addr p3, v2

    .line 52
    return p3

    .line 53
    :cond_1
    return p2
.end method

.method private handleS(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I
    .locals 14

    .line 1
    move-object/from16 v7, p2

    .line 2
    .line 3
    move/from16 v8, p3

    .line 4
    .line 5
    add-int/lit8 v1, v8, -0x1

    .line 6
    .line 7
    const-string v2, "ISL"

    .line 8
    .line 9
    const-string v3, "YSL"

    .line 10
    .line 11
    const/4 v4, 0x3

    .line 12
    invoke-static {p1, v1, v4, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v9, 0x1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    add-int/lit8 v0, v8, 0x1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    const/16 v10, 0x58

    .line 23
    .line 24
    const/16 v11, 0x53

    .line 25
    .line 26
    if-nez v8, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x5

    .line 29
    const-string v2, "SUGAR"

    .line 30
    .line 31
    invoke-static {p1, v8, v1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v7, v10, v11}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 38
    .line 39
    .line 40
    add-int/lit8 v0, v8, 0x1

    .line 41
    .line 42
    return v0

    .line 43
    :cond_1
    const-string v1, "SH"

    .line 44
    .line 45
    const/4 v12, 0x2

    .line 46
    invoke-static {p1, v8, v12, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    add-int/lit8 v1, v8, 0x1

    .line 53
    .line 54
    const-string v5, "HOLM"

    .line 55
    .line 56
    const-string v6, "HOLZ"

    .line 57
    .line 58
    const/4 v2, 0x4

    .line 59
    const-string v3, "HEIM"

    .line 60
    .line 61
    const-string v4, "HOEK"

    .line 62
    .line 63
    move-object v0, p1

    .line 64
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {v7, v11}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    invoke-virtual {v7, v10}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 75
    .line 76
    .line 77
    :goto_0
    add-int/lit8 v0, v8, 0x2

    .line 78
    .line 79
    return v0

    .line 80
    :cond_3
    const-string v1, "SIO"

    .line 81
    .line 82
    const-string v2, "SIA"

    .line 83
    .line 84
    invoke-static {p1, v8, v4, v1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_c

    .line 89
    .line 90
    const/4 v1, 0x4

    .line 91
    const-string v2, "SIAN"

    .line 92
    .line 93
    invoke-static {p1, v8, v1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_4

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_4
    const-string v13, "Z"

    .line 101
    .line 102
    if-nez v8, :cond_5

    .line 103
    .line 104
    add-int/lit8 v1, v8, 0x1

    .line 105
    .line 106
    const-string v5, "L"

    .line 107
    .line 108
    const-string v6, "W"

    .line 109
    .line 110
    const/4 v2, 0x1

    .line 111
    const-string v3, "M"

    .line 112
    .line 113
    const-string v4, "N"

    .line 114
    .line 115
    move-object v0, p1

    .line 116
    invoke-static/range {v0 .. v6}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-nez v1, :cond_6

    .line 121
    .line 122
    :cond_5
    add-int/lit8 v1, v8, 0x1

    .line 123
    .line 124
    invoke-static {p1, v1, v9, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_8

    .line 129
    .line 130
    :cond_6
    invoke-virtual {v7, v11, v10}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 131
    .line 132
    .line 133
    add-int/lit8 v1, v8, 0x1

    .line 134
    .line 135
    invoke-static {p1, v1, v9, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_7

    .line 140
    .line 141
    add-int/lit8 v0, v8, 0x2

    .line 142
    .line 143
    return v0

    .line 144
    :cond_7
    return v1

    .line 145
    :cond_8
    const-string v2, "SC"

    .line 146
    .line 147
    invoke-static {p1, v8, v12, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-eqz v2, :cond_9

    .line 152
    .line 153
    invoke-direct/range {p0 .. p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleSC(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    return v0

    .line 158
    :cond_9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    sub-int/2addr v2, v9

    .line 163
    if-ne v8, v2, :cond_a

    .line 164
    .line 165
    add-int/lit8 v2, v8, -0x2

    .line 166
    .line 167
    const-string v3, "AI"

    .line 168
    .line 169
    const-string v4, "OI"

    .line 170
    .line 171
    invoke-static {p1, v2, v12, v3, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-eqz v2, :cond_a

    .line 176
    .line 177
    invoke-virtual {v7, v11}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->appendAlternate(C)V

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_a
    invoke-virtual {v7, v11}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 182
    .line 183
    .line 184
    :goto_1
    const-string v2, "S"

    .line 185
    .line 186
    invoke-static {p1, v1, v9, v2, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_b

    .line 191
    .line 192
    add-int/lit8 v0, v8, 0x2

    .line 193
    .line 194
    return v0

    .line 195
    :cond_b
    return v1

    .line 196
    :cond_c
    :goto_2
    if-eqz p4, :cond_d

    .line 197
    .line 198
    invoke-virtual {v7, v11}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 199
    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_d
    invoke-virtual {v7, v11, v10}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 203
    .line 204
    .line 205
    :goto_3
    add-int/lit8 v0, v8, 0x3

    .line 206
    .line 207
    return v0
.end method

.method private handleSC(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 14

    .line 1
    move-object/from16 v10, p2

    .line 2
    .line 3
    add-int/lit8 v2, p3, 0x2

    .line 4
    .line 5
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    const/16 v4, 0x48

    .line 10
    .line 11
    const/16 v11, 0x53

    .line 12
    .line 13
    const-string v12, "SK"

    .line 14
    .line 15
    const/4 v13, 0x3

    .line 16
    if-ne v3, v4, :cond_3

    .line 17
    .line 18
    add-int/lit8 v2, p3, 0x3

    .line 19
    .line 20
    const-string v8, "ED"

    .line 21
    .line 22
    const-string v9, "EM"

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    const-string v4, "OO"

    .line 26
    .line 27
    const-string v5, "ER"

    .line 28
    .line 29
    const-string v6, "EN"

    .line 30
    .line 31
    const-string v7, "UY"

    .line 32
    .line 33
    move-object v1, p1

    .line 34
    invoke-static/range {v1 .. v9}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    const-string v0, "ER"

    .line 41
    .line 42
    const-string v3, "EN"

    .line 43
    .line 44
    const/4 v4, 0x2

    .line 45
    invoke-static {p1, v2, v4, v0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    const-string v0, "X"

    .line 52
    .line 53
    invoke-virtual {v10, v0, v12}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {v10, v12}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    const/16 v2, 0x58

    .line 62
    .line 63
    if-nez p3, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0, p1, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-direct {p0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-nez v3, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0, p1, v13}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/16 v1, 0x57

    .line 80
    .line 81
    if-eq v0, v1, :cond_2

    .line 82
    .line 83
    invoke-virtual {v10, v2, v11}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    invoke-virtual {v10, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_3
    const-string v4, "E"

    .line 92
    .line 93
    const-string v5, "Y"

    .line 94
    .line 95
    move v1, v2

    .line 96
    const/4 v2, 0x1

    .line 97
    const-string v3, "I"

    .line 98
    .line 99
    move-object v0, p1

    .line 100
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    invoke-virtual {v10, v11}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_4
    invoke-virtual {v10, v12}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :goto_0
    add-int/lit8 v0, p3, 0x3

    .line 114
    .line 115
    return v0
.end method

.method private handleT(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 5

    .line 1
    const-string p0, "TION"

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-static {p1, p3, v0, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/16 v1, 0x58

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 14
    .line 15
    .line 16
    :goto_0
    add-int/2addr p3, v2

    .line 17
    return p3

    .line 18
    :cond_0
    const-string p0, "TIA"

    .line 19
    .line 20
    const-string v3, "TCH"

    .line 21
    .line 22
    invoke-static {p1, p3, v2, p0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const-string p0, "TH"

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-static {p1, p3, v1, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/16 v3, 0x54

    .line 40
    .line 41
    if-nez p0, :cond_4

    .line 42
    .line 43
    const-string p0, "TTH"

    .line 44
    .line 45
    invoke-static {p1, p3, v2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    invoke-virtual {p2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 53
    .line 54
    .line 55
    add-int/lit8 p0, p3, 0x1

    .line 56
    .line 57
    const-string p2, "T"

    .line 58
    .line 59
    const-string v0, "D"

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    invoke-static {p1, p0, v2, p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    add-int/2addr p3, v1

    .line 69
    return p3

    .line 70
    :cond_3
    return p0

    .line 71
    :cond_4
    :goto_1
    add-int/2addr p3, v1

    .line 72
    const-string p0, "OM"

    .line 73
    .line 74
    const-string v4, "AM"

    .line 75
    .line 76
    invoke-static {p1, p3, v1, p0, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_6

    .line 81
    .line 82
    const-string p0, "VAN "

    .line 83
    .line 84
    const-string v1, "VON "

    .line 85
    .line 86
    const/4 v4, 0x0

    .line 87
    invoke-static {p1, v4, v0, p0, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_6

    .line 92
    .line 93
    const-string p0, "SCH"

    .line 94
    .line 95
    invoke-static {p1, v4, v2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_5

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_5
    const/16 p0, 0x30

    .line 103
    .line 104
    invoke-virtual {p2, p0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 105
    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_6
    :goto_2
    invoke-virtual {p2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 109
    .line 110
    .line 111
    :goto_3
    return p3
.end method

.method private handleW(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 8

    .line 1
    const-string v0, "WR"

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {p1, p3, v1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/16 p0, 0x52

    .line 11
    .line 12
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 13
    .line 14
    .line 15
    add-int/2addr p3, v1

    .line 16
    return p3

    .line 17
    :cond_0
    const/16 v0, 0x46

    .line 18
    .line 19
    if-nez p3, :cond_3

    .line 20
    .line 21
    add-int/lit8 v2, p3, 0x1

    .line 22
    .line 23
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-direct {p0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    const-string v3, "WH"

    .line 34
    .line 35
    invoke-static {p1, p3, v1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-direct {p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/16 p1, 0x41

    .line 50
    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p2, p1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(CC)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {p2, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 58
    .line 59
    .line 60
    :goto_0
    return v2

    .line 61
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-int/lit8 v1, v1, -0x1

    .line 66
    .line 67
    if-ne p3, v1, :cond_4

    .line 68
    .line 69
    add-int/lit8 v1, p3, -0x1

    .line 70
    .line 71
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-direct {p0, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isVowel(C)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-nez p0, :cond_7

    .line 80
    .line 81
    :cond_4
    add-int/lit8 v2, p3, -0x1

    .line 82
    .line 83
    const-string v6, "OWSKI"

    .line 84
    .line 85
    const-string v7, "OWSKY"

    .line 86
    .line 87
    const/4 v3, 0x5

    .line 88
    const-string v4, "EWSKI"

    .line 89
    .line 90
    const-string v5, "EWSKY"

    .line 91
    .line 92
    move-object v1, p1

    .line 93
    invoke-static/range {v1 .. v7}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-nez p0, :cond_7

    .line 98
    .line 99
    const/4 p0, 0x3

    .line 100
    const-string p1, "SCH"

    .line 101
    .line 102
    const/4 v2, 0x0

    .line 103
    invoke-static {v1, v2, p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_5

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_5
    const-string p0, "WICZ"

    .line 111
    .line 112
    const-string p1, "WITZ"

    .line 113
    .line 114
    const/4 v0, 0x4

    .line 115
    invoke-static {v1, p3, v0, p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_6

    .line 120
    .line 121
    const-string p0, "TS"

    .line 122
    .line 123
    const-string p1, "FX"

    .line 124
    .line 125
    invoke-virtual {p2, p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    add-int/2addr p3, v0

    .line 129
    return p3

    .line 130
    :cond_6
    add-int/lit8 p3, p3, 0x1

    .line 131
    .line 132
    return p3

    .line 133
    :cond_7
    :goto_1
    invoke-virtual {p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->appendAlternate(C)V

    .line 134
    .line 135
    .line 136
    add-int/lit8 p3, p3, 0x1

    .line 137
    .line 138
    return p3
.end method

.method private handleX(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I
    .locals 5

    .line 1
    const/4 p0, 0x1

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    const/16 p1, 0x53

    .line 5
    .line 6
    invoke-virtual {p2, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 7
    .line 8
    .line 9
    add-int/2addr p3, p0

    .line 10
    return p3

    .line 11
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sub-int/2addr v0, p0

    .line 16
    const/4 v1, 0x2

    .line 17
    if-ne p3, v0, :cond_1

    .line 18
    .line 19
    add-int/lit8 v0, p3, -0x3

    .line 20
    .line 21
    const-string v2, "IAU"

    .line 22
    .line 23
    const-string v3, "EAU"

    .line 24
    .line 25
    const/4 v4, 0x3

    .line 26
    invoke-static {p1, v0, v4, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    add-int/lit8 v0, p3, -0x2

    .line 33
    .line 34
    const-string v2, "AU"

    .line 35
    .line 36
    const-string v3, "OU"

    .line 37
    .line 38
    invoke-static {p1, v0, v1, v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    :cond_1
    const-string v0, "KS"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    add-int/lit8 p2, p3, 0x1

    .line 50
    .line 51
    const-string v0, "C"

    .line 52
    .line 53
    const-string v2, "X"

    .line 54
    .line 55
    invoke-static {p1, p2, p0, v0, v2}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    add-int/2addr p3, v1

    .line 62
    return p3

    .line 63
    :cond_3
    return p2
.end method

.method private handleZ(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I
    .locals 6

    .line 1
    add-int/lit8 v1, p3, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v2, 0x48

    .line 8
    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    const/16 p0, 0x4a

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 p3, p3, 0x2

    .line 17
    .line 18
    return p3

    .line 19
    :cond_0
    const-string v4, "ZI"

    .line 20
    .line 21
    const-string v5, "ZA"

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    const-string v3, "ZO"

    .line 25
    .line 26
    move-object v0, p1

    .line 27
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/codec/language/DoubleMetaphone;->contains(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    if-eqz p4, :cond_1

    .line 34
    .line 35
    if-lez p3, :cond_1

    .line 36
    .line 37
    add-int/lit8 p1, p3, -0x1

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/16 p4, 0x54

    .line 44
    .line 45
    if-eq p1, p4, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/16 p1, 0x53

    .line 49
    .line 50
    invoke-virtual {p2, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    :goto_0
    const-string p1, "S"

    .line 55
    .line 56
    const-string p4, "TS"

    .line 57
    .line 58
    invoke-virtual {p2, p1, p4}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :goto_1
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    const/16 p1, 0x5a

    .line 66
    .line 67
    if-ne p0, p1, :cond_3

    .line 68
    .line 69
    add-int/lit8 p3, p3, 0x2

    .line 70
    .line 71
    return p3

    .line 72
    :cond_3
    return v1
.end method

.method private isSilentStart(Ljava/lang/String;)Z
    .locals 4

    .line 1
    sget-object p0, Lorg/apache/commons/codec/language/DoubleMetaphone;->SILENT_START:[Ljava/lang/String;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    aget-object v3, p0, v2

    .line 9
    .line 10
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    return v1
.end method

.method private isSlavoGermanic(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/16 p0, 0x57

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, -0x1

    .line 8
    if-gt p0, v0, :cond_1

    .line 9
    .line 10
    const/16 p0, 0x4b

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-gt p0, v0, :cond_1

    .line 17
    .line 18
    const-string p0, "CZ"

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-gt p0, v0, :cond_1

    .line 25
    .line 26
    const-string p0, "WITZ"

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-le p0, v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method private isVowel(C)Z
    .locals 0

    .line 1
    const-string p0, "AEIOUY"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 p1, -0x1

    .line 8
    if-eq p0, p1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method


# virtual methods
.method public charAt(Ljava/lang/String;I)C
    .locals 0

    .line 1
    if-ltz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lt p2, p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public doubleMetaphone(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 263
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->doubleMetaphone(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public doubleMetaphone(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->cleanInput(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isSlavoGermanic(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-direct {p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isSilentStart(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    new-instance v2, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->getMaxCodeLen()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-direct {v2, p0, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;-><init>(Lorg/apache/commons/codec/language/DoubleMetaphone;I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->isComplete()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_5

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    add-int/lit8 v3, v3, -0x1

    .line 37
    .line 38
    if-gt v1, v3, :cond_5

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    const/16 v4, 0xc7

    .line 45
    .line 46
    if-eq v3, v4, :cond_4

    .line 47
    .line 48
    const/16 v4, 0xd1

    .line 49
    .line 50
    const/16 v5, 0x4e

    .line 51
    .line 52
    if-eq v3, v4, :cond_3

    .line 53
    .line 54
    const/16 v4, 0x4b

    .line 55
    .line 56
    const/16 v6, 0x46

    .line 57
    .line 58
    packed-switch v3, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :pswitch_0
    invoke-direct {p0, p1, v2, v1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleZ(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_0

    .line 69
    :pswitch_1
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleX(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    goto :goto_0

    .line 74
    :pswitch_2
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleW(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    goto :goto_0

    .line 79
    :pswitch_3
    invoke-virtual {v2, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 80
    .line 81
    .line 82
    add-int/lit8 v3, v1, 0x1

    .line 83
    .line 84
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    const/16 v5, 0x56

    .line 89
    .line 90
    if-ne v4, v5, :cond_2

    .line 91
    .line 92
    :goto_2
    add-int/lit8 v1, v1, 0x2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    move v1, v3

    .line 96
    goto :goto_0

    .line 97
    :pswitch_4
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleT(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    goto :goto_0

    .line 102
    :pswitch_5
    invoke-direct {p0, p1, v2, v1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleS(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    goto :goto_0

    .line 107
    :pswitch_6
    invoke-direct {p0, p1, v2, v1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleR(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_0

    .line 112
    :pswitch_7
    invoke-virtual {v2, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 113
    .line 114
    .line 115
    add-int/lit8 v3, v1, 0x1

    .line 116
    .line 117
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    const/16 v5, 0x51

    .line 122
    .line 123
    if-ne v4, v5, :cond_2

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :pswitch_8
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleP(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    goto :goto_0

    .line 131
    :pswitch_9
    invoke-virtual {v2, v5}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 132
    .line 133
    .line 134
    add-int/lit8 v3, v1, 0x1

    .line 135
    .line 136
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    if-ne v4, v5, :cond_2

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :pswitch_a
    const/16 v3, 0x4d

    .line 144
    .line 145
    invoke-virtual {v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 146
    .line 147
    .line 148
    invoke-direct {p0, p1, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->conditionM0(Ljava/lang/String;I)Z

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    if-eqz v3, :cond_1

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :pswitch_b
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleL(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :pswitch_c
    invoke-virtual {v2, v4}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 162
    .line 163
    .line 164
    add-int/lit8 v3, v1, 0x1

    .line 165
    .line 166
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    if-ne v5, v4, :cond_2

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :pswitch_d
    invoke-direct {p0, p1, v2, v1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleJ(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :pswitch_e
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleH(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :pswitch_f
    invoke-direct {p0, p1, v2, v1, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleG(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;IZ)I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :pswitch_10
    invoke-virtual {v2, v6}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 192
    .line 193
    .line 194
    add-int/lit8 v3, v1, 0x1

    .line 195
    .line 196
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    if-ne v4, v6, :cond_2

    .line 201
    .line 202
    goto :goto_2

    .line 203
    :pswitch_11
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleD(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :pswitch_12
    invoke-direct {p0, p1, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleC(Ljava/lang/String;Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :pswitch_13
    const/16 v3, 0x50

    .line 216
    .line 217
    invoke-virtual {v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 218
    .line 219
    .line 220
    add-int/lit8 v3, v1, 0x1

    .line 221
    .line 222
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    const/16 v5, 0x42

    .line 227
    .line 228
    if-ne v4, v5, :cond_2

    .line 229
    .line 230
    goto/16 :goto_2

    .line 231
    .line 232
    :pswitch_14
    invoke-direct {p0, v2, v1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->handleAEIOUY(Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;I)I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :cond_3
    invoke-virtual {v2, v5}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 239
    .line 240
    .line 241
    goto/16 :goto_1

    .line 242
    .line 243
    :cond_4
    const/16 v3, 0x53

    .line 244
    .line 245
    invoke-virtual {v2, v3}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->append(C)V

    .line 246
    .line 247
    .line 248
    goto/16 :goto_1

    .line 249
    .line 250
    :cond_5
    if-eqz p2, :cond_6

    .line 251
    .line 252
    invoke-virtual {v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->getAlternate()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    return-object p0

    .line 257
    :cond_6
    invoke-virtual {v2}, Lorg/apache/commons/codec/language/DoubleMetaphone$DoubleMetaphoneResult;->getPrimary()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    return-object p0

    .line 262
    nop

    .line 263
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_14
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_14
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_14
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_14
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_14
        :pswitch_0
    .end packed-switch
.end method

.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->doubleMetaphone(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lorg/apache/commons/codec/EncoderException;

    .line 13
    .line 14
    const-string p1, "DoubleMetaphone encode parameter is not of type String"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lorg/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 20
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/DoubleMetaphone;->doubleMetaphone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getMaxCodeLen()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/codec/language/DoubleMetaphone;->maxCodeLen:I

    .line 2
    .line 3
    return p0
.end method

.method public isDoubleMetaphoneEqual(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/codec/language/DoubleMetaphone;->isDoubleMetaphoneEqual(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public isDoubleMetaphoneEqual(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->doubleMetaphone(Ljava/lang/String;Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/codec/language/DoubleMetaphone;->doubleMetaphone(Ljava/lang/String;Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public setMaxCodeLen(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/codec/language/DoubleMetaphone;->maxCodeLen:I

    .line 2
    .line 3
    return-void
.end method
