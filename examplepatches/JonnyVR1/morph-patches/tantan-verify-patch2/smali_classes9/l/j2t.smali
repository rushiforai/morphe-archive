.class public Ll/j2t;
.super Ll/jsv;
.source "SourceFile"


# static fields
.field public static final c:Ll/j2t;


# instance fields
.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/j2t;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j2t;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/j2t;->c:Ll/j2t;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/jsv;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/j2t;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x2

    .line 9
    invoke-direct {p0, v0}, Ll/jsv;-><init>(I)V

    .line 10
    iput p1, p0, Ll/j2t;->b:I

    return-void
.end method


# virtual methods
.method public l()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/j2t;->b:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public m()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/j2t;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
