.class public final Ll/l;
.super Ll/p;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/b13;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p;-><init>(Ll/b13;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/StringBuilder;I)V
    .locals 0

    .line 1
    const/16 p0, 0x2710

    .line 2
    .line 3
    if-ge p2, p0, :cond_0

    .line 4
    .line 5
    const-string p0, "(3202)"

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "(3203)"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i(I)I
    .locals 0

    .line 1
    const/16 p0, 0x2710

    .line 2
    .line 3
    if-ge p1, p0, :cond_0

    .line 4
    .line 5
    return p1

    .line 6
    :cond_0
    sub-int/2addr p1, p0

    .line 7
    return p1
.end method
