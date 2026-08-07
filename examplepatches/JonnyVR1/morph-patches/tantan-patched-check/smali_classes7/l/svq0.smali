.class public Ll/svq0;
.super Ll/vvq0$c;
.source "SourceFile"


# instance fields
.field protected j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/vvq0$c;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Ll/svq0;->j:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static i(Ljava/lang/String;)Ll/svq0;
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/svq0;

    .line 11
    .line 12
    const-string v2, "status = ?"

    .line 13
    .line 14
    const-string v3, "a job build to delete uploaded job"

    .line 15
    .line 16
    invoke-direct {v1, p0, v2, v0, v3}, Ll/svq0;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object v1
.end method
