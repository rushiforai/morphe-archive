.class public final Ll/qur0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:J


# direct methods
.method public constructor <init>(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/qur0;->a:I

    .line 5
    .line 6
    iput-wide p2, p0, Ll/qur0;->b:J

    .line 7
    .line 8
    return-void
.end method

.method public static a(Ll/qer0;Ll/bgw0;)Ll/qur0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast p0, Ll/fer0;

    .line 6
    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p0, v0, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v2}, Ll/bgw0;->k(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/bgw0;->v()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p1}, Ll/bgw0;->H()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    new-instance p1, Ll/qur0;

    .line 25
    .line 26
    invoke-direct {p1, p0, v0, v1}, Ll/qur0;-><init>(IJ)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method
