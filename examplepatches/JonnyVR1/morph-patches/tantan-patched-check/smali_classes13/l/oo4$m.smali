.class Ll/oo4$m;
.super Ll/oo4$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oo4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "m"
.end annotation


# instance fields
.field private b:S

.field private c:J

.field final synthetic d:Ll/oo4;


# direct methods
.method public constructor <init>(Ll/oo4;IJ)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/oo4$m;->d:Ll/oo4;

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
    iput-short p1, p0, Ll/oo4$m;->b:S

    .line 9
    .line 10
    iput-wide p3, p0, Ll/oo4$m;->c:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/oo4$m;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public clear()I
    .locals 0

    .line 1
    iget-short p0, p0, Ll/oo4$m;->b:S

    .line 2
    .line 3
    return p0
.end method
