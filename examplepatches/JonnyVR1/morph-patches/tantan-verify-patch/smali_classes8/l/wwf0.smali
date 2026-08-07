.class public Ll/wwf0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ll/wwf0;

.field public static final e:Ll/wwf0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final f:Ll/wwf0;

.field public static final g:Ll/wwf0;

.field public static final h:Ll/wwf0;

.field public static final i:[Ll/wwf0;


# instance fields
.field public final a:I

.field public final b:Z

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ll/wwf0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-direct {v0, v1, v2, v1}, Ll/wwf0;-><init>(IZZ)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/wwf0;->d:Ll/wwf0;

    .line 9
    .line 10
    new-instance v3, Ll/wwf0;

    .line 11
    .line 12
    invoke-direct {v3, v2, v2, v2}, Ll/wwf0;-><init>(IZZ)V

    .line 13
    .line 14
    .line 15
    sput-object v3, Ll/wwf0;->e:Ll/wwf0;

    .line 16
    .line 17
    new-instance v4, Ll/wwf0;

    .line 18
    .line 19
    const/4 v5, 0x2

    .line 20
    invoke-direct {v4, v5, v1, v1}, Ll/wwf0;-><init>(IZZ)V

    .line 21
    .line 22
    .line 23
    sput-object v4, Ll/wwf0;->f:Ll/wwf0;

    .line 24
    .line 25
    new-instance v5, Ll/wwf0;

    .line 26
    .line 27
    const/4 v6, 0x3

    .line 28
    invoke-direct {v5, v6, v2, v1}, Ll/wwf0;-><init>(IZZ)V

    .line 29
    .line 30
    .line 31
    sput-object v5, Ll/wwf0;->g:Ll/wwf0;

    .line 32
    .line 33
    new-instance v6, Ll/wwf0;

    .line 34
    .line 35
    const/4 v7, 0x4

    .line 36
    invoke-direct {v6, v7, v2, v1}, Ll/wwf0;-><init>(IZZ)V

    .line 37
    .line 38
    .line 39
    sput-object v6, Ll/wwf0;->h:Ll/wwf0;

    .line 40
    .line 41
    filled-new-array {v0, v3, v4, v5, v6}, [Ll/wwf0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Ll/wwf0;->i:[Ll/wwf0;

    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(IZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/wwf0;->a:I

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/wwf0;->b:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/wwf0;->c:Z

    .line 9
    .line 10
    return-void
.end method
