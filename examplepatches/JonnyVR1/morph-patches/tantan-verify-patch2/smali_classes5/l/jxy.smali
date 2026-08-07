.class public Ll/jxy;
.super Ll/z4z;
.source "SourceFile"


# direct methods
.method public constructor <init>(ILandroid/widget/TextView;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ixy;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/ixy;-><init>(Landroid/widget/TextView;)V

    .line 4
    .line 5
    .line 6
    const/16 p2, 0x3e8

    .line 7
    .line 8
    invoke-direct {p0, p1, p2, v0}, Ll/z4z;-><init>(IILl/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Landroid/widget/TextView;Ljava/lang/Long;)V
    .locals 5

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const-wide/16 v3, 0x3e8

    .line 10
    .line 11
    div-long/2addr v1, v3

    .line 12
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v1, "%d s"

    .line 21
    .line 22
    invoke-static {v0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
