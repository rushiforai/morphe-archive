.class Ll/oo4$n;
.super Ll/oo4$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oo4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "n"
.end annotation


# instance fields
.field private b:S

.field private c:S

.field final synthetic d:Ll/oo4;


# direct methods
.method public constructor <init>(Ll/oo4;IJ)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/oo4$n;->d:Ll/oo4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Ll/oo4$a;-><init>(Ll/oo4;Ll/oo4$a;)V

    .line 5
    .line 6
    .line 7
    int-to-short p1, p2

    .line 8
    iput-short p1, p0, Ll/oo4$n;->b:S

    .line 9
    .line 10
    long-to-int p1, p3

    .line 11
    int-to-short p1, p1

    .line 12
    iput-short p1, p0, Ll/oo4$n;->c:S

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-short p0, p0, Ll/oo4$n;->c:S

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public clear()I
    .locals 0

    .line 1
    iget-short p0, p0, Ll/oo4$n;->b:S

    .line 2
    .line 3
    return p0
.end method
