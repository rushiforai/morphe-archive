.class Ll/oo4$f;
.super Ll/oo4$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oo4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field private b:I

.field private c:B

.field final synthetic d:Ll/oo4;


# direct methods
.method public constructor <init>(Ll/oo4;IJ)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/oo4$f;->d:Ll/oo4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Ll/oo4$a;-><init>(Ll/oo4;Ll/oo4$a;)V

    .line 5
    .line 6
    .line 7
    iput p2, p0, Ll/oo4$f;->b:I

    .line 8
    .line 9
    long-to-int p1, p3

    .line 10
    int-to-byte p1, p1

    .line 11
    iput-byte p1, p0, Ll/oo4$f;->c:B

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-byte p0, p0, Ll/oo4$f;->c:B

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public clear()I
    .locals 0

    .line 1
    iget p0, p0, Ll/oo4$f;->b:I

    .line 2
    .line 3
    return p0
.end method
