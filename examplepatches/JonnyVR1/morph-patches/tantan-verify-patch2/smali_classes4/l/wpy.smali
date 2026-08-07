.class public Ll/wpy;
.super Ll/eoi0;
.source "SourceFile"


# instance fields
.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;IIIIJLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eoi0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/eoi0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/wpy;->i:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Ll/wpy;->e:I

    .line 9
    .line 10
    iput p4, p0, Ll/wpy;->f:I

    .line 11
    .line 12
    iput p5, p0, Ll/wpy;->g:I

    .line 13
    .line 14
    iput p6, p0, Ll/wpy;->h:I

    .line 15
    .line 16
    iput-object p9, p0, Ll/eoi0;->c:Ljava/lang/String;

    .line 17
    .line 18
    iput-wide p7, p0, Ll/eoi0;->b:J

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIII)V
    .locals 10

    const-wide/16 v7, 0x0

    .line 21
    const-string v9, ""

    const/4 v1, -0x1

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v9}, Ll/wpy;-><init>(ILjava/lang/String;IIIIJLjava/lang/String;)V

    return-void
.end method
