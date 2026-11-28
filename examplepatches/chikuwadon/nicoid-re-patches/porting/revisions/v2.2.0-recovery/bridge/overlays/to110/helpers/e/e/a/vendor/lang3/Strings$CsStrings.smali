.class public final Le/e/a/vendor/lang3/Strings$CsStrings;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CS:Le/e/a/vendor/lang3/Strings$CsStrings;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 267
    new-instance v0, Le/e/a/vendor/lang3/Strings$CsStrings;

    .line 351
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 267
    sput-object v0, Le/e/a/vendor/lang3/Strings$CsStrings;->CS:Le/e/a/vendor/lang3/Strings$CsStrings;

    return-void
.end method


# virtual methods
.method public final indexOf(Ljava/lang/String;Ljava/lang/CharSequence;I)I
    .registers 4

    .line 249
    sget p0, Le/e/a/vendor/lang3/CharSequenceUtils;->$r8$clinit:I

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 82
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public final replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 14

    .line 1310
    invoke-static {p1}, Le/e/a/vendor/lang3/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p2}, Le/e/a/vendor/lang3/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p3, :cond_1

    const/4 v0, 0x0

    .line 1314
    invoke-virtual {p0, p1, p2, v0}, Le/e/a/vendor/lang3/Strings$CsStrings;->indexOf(Ljava/lang/String;Ljava/lang/CharSequence;I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 1318
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1319
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    int-to-long v8, v3

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    .line 330
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    const/4 v8, 0x4

    shl-long/2addr v6, v8

    int-to-long v8, v5

    add-long/2addr v8, v6

    const-wide/32 v5, 0x7ffffff7

    .line 332
    invoke-static {v8, v9, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    .line 1319
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    move v5, v2

    :goto_0
    if-eq v1, v2, :cond_0

    .line 1321
    invoke-virtual {v4, p1, v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int v0, v1, v3

    add-int/2addr v5, v2

    if-eqz v5, :cond_0

    .line 1326
    invoke-virtual {p0, p1, p2, v0}, Le/e/a/vendor/lang3/Strings$CsStrings;->indexOf(Ljava/lang/String;Ljava/lang/CharSequence;I)I

    move-result v1

    goto :goto_0

    .line 1328
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v4, p1, v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 1329
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    return-object p1
.end method
