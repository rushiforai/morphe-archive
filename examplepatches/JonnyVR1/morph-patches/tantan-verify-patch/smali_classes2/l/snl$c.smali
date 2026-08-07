.class public Ll/snl$c;
.super Ll/vhi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/snl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public f:J

.field public g:J

.field public h:J


# direct methods
.method public constructor <init>(Ll/z06;Ll/yk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/vhi;-><init>(Ll/z06;Ll/yk90;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic i(Ll/snl$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/snl$c;->h:J

    return-wide v0
.end method

.method public static bridge synthetic j(Ll/snl$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/snl$c;->g:J

    return-wide v0
.end method

.method public static bridge synthetic k(Ll/snl$c;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/snl$c;->f:J

    return-wide v0
.end method

.method public static bridge synthetic l(Ll/snl$c;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/snl$c;->h:J

    return-void
.end method

.method public static bridge synthetic m(Ll/snl$c;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/snl$c;->g:J

    return-void
.end method

.method public static bridge synthetic n(Ll/snl$c;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/snl$c;->f:J

    return-void
.end method
