.class Ll/oo4$h;
.super Ll/oo4$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oo4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field private b:I

.field private c:J

.field final synthetic d:Ll/oo4;


# direct methods
.method public constructor <init>(Ll/oo4;IJ)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/oo4$h;->d:Ll/oo4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Ll/oo4$a;-><init>(Ll/oo4;Ll/oo4$a;)V

    .line 5
    .line 6
    .line 7
    iput p2, p0, Ll/oo4$h;->b:I

    .line 8
    .line 9
    iput-wide p3, p0, Ll/oo4$h;->c:J

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/oo4$h;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public clear()I
    .locals 0

    .line 1
    iget p0, p0, Ll/oo4$h;->b:I

    .line 2
    .line 3
    return p0
.end method
