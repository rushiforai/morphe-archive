.class public final Ll/f710;
.super Ll/xpf0;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final o:Ll/ig60;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "Mp4WebvttDecoder"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/xpf0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/ig60;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/ig60;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/f710;->o:Ll/ig60;

    .line 12
    .line 13
    return-void
.end method

.method public static B(Ll/ig60;I)Ll/myb;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move-object v1, v0

    .line 3
    move-object v2, v1

    .line 4
    :cond_0
    :goto_0
    if-lez p1, :cond_3

    .line 5
    .line 6
    const/16 v3, 0x8

    .line 7
    .line 8
    if-lt p1, v3, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    invoke-virtual {p0}, Ll/ig60;->q()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    add-int/lit8 p1, p1, -0x8

    .line 19
    .line 20
    sub-int/2addr v4, v3

    .line 21
    invoke-virtual {p0}, Ll/ig60;->e()[B

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {p0}, Ll/ig60;->f()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-static {v3, v6, v4}, Ll/bmk0;->F([BII)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {p0, v4}, Ll/ig60;->V(I)V

    .line 34
    .line 35
    .line 36
    sub-int/2addr p1, v4

    .line 37
    const v4, 0x73747467

    .line 38
    .line 39
    .line 40
    if-ne v5, v4, :cond_1

    .line 41
    .line 42
    invoke-static {v3}, Ll/cvp0;->o(Ljava/lang/String;)Ll/myb$b;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const v4, 0x7061796c

    .line 48
    .line 49
    .line 50
    if-ne v5, v4, :cond_0

    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 57
    .line 58
    invoke-static {v0, v1, v3}, Ll/cvp0;->q(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Landroid/text/SpannedString;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    new-instance p0, Lcom/google/android/exoplayer2/text/SubtitleDecoderException;

    .line 64
    .line 65
    const-string p1, "Incomplete vtt cue box header found."

    .line 66
    .line 67
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/text/SubtitleDecoderException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p0

    .line 71
    :cond_3
    if-nez v1, :cond_4

    .line 72
    .line 73
    const-string v1, ""

    .line 74
    .line 75
    :cond_4
    if-eqz v2, :cond_5

    .line 76
    .line 77
    invoke-virtual {v2, v1}, Ll/myb$b;->o(Ljava/lang/CharSequence;)Ll/myb$b;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ll/myb$b;->a()Ll/myb;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_5
    invoke-static {v1}, Ll/cvp0;->l(Ljava/lang/CharSequence;)Ll/myb;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0
.end method


# virtual methods
.method public A([BIZ)Ll/mdg0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .line 1
    iget-object p3, p0, Ll/f710;->o:Ll/ig60;

    .line 2
    .line 3
    invoke-virtual {p3, p1, p2}, Ll/ig60;->S([BI)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    :goto_0
    iget-object p2, p0, Ll/f710;->o:Ll/ig60;

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/ig60;->a()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-lez p2, :cond_2

    .line 18
    .line 19
    iget-object p2, p0, Ll/f710;->o:Ll/ig60;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/ig60;->a()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const/16 p3, 0x8

    .line 26
    .line 27
    if-lt p2, p3, :cond_1

    .line 28
    .line 29
    iget-object p2, p0, Ll/f710;->o:Ll/ig60;

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/ig60;->q()I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iget-object p3, p0, Ll/f710;->o:Ll/ig60;

    .line 36
    .line 37
    invoke-virtual {p3}, Ll/ig60;->q()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    iget-object v0, p0, Ll/f710;->o:Ll/ig60;

    .line 42
    .line 43
    const v1, 0x76747463

    .line 44
    .line 45
    .line 46
    if-ne p3, v1, :cond_0

    .line 47
    .line 48
    add-int/lit8 p2, p2, -0x8

    .line 49
    .line 50
    invoke-static {v0, p2}, Ll/f710;->B(Ll/ig60;I)Ll/myb;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    add-int/lit8 p2, p2, -0x8

    .line 59
    .line 60
    invoke-virtual {v0, p2}, Ll/ig60;->V(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    new-instance p0, Lcom/google/android/exoplayer2/text/SubtitleDecoderException;

    .line 65
    .line 66
    const-string p1, "Incomplete Mp4Webvtt Top Level box header found."

    .line 67
    .line 68
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/text/SubtitleDecoderException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0

    .line 72
    :cond_2
    new-instance p0, Ll/g710;

    .line 73
    .line 74
    invoke-direct {p0, p1}, Ll/g710;-><init>(Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    return-object p0
.end method
