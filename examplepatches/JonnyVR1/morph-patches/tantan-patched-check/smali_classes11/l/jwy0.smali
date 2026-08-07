.class public final Ll/jwy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Ll/jwy0;


# instance fields
.field public final a:J

.field public final b:J

.field public final c:J

.field public final d:Ll/imw0;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Ll/jwy0;

    .line 2
    .line 3
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    move-wide v3, v1

    .line 9
    move-wide v5, v1

    .line 10
    invoke-direct/range {v0 .. v6}, Ll/jwy0;-><init>(JJJ)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/jwy0;->e:Ll/jwy0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(JJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/jwy0;->a:J

    .line 5
    .line 6
    iput-wide p3, p0, Ll/jwy0;->b:J

    .line 7
    .line 8
    iput-wide p5, p0, Ll/jwy0;->c:J

    .line 9
    .line 10
    new-instance p1, Ll/imw0;

    .line 11
    .line 12
    const/16 p2, 0xa

    .line 13
    .line 14
    invoke-direct {p1, p2}, Ll/imw0;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/jwy0;->d:Ll/imw0;

    .line 18
    .line 19
    return-void
.end method
