.class public Ll/eud0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/eud0;->a:Z

    .line 6
    .line 7
    iput v0, p0, Ll/eud0;->b:I

    .line 8
    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/eud0;->a:Z

    .line 13
    .line 14
    iput p1, p0, Ll/eud0;->b:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public a(I)Ll/eud0;
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Ll/eud0;->a:Z

    .line 5
    .line 6
    iput p1, p0, Ll/eud0;->b:I

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public b()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/eud0;->b:I

    .line 2
    .line 3
    const/4 v0, 0x3

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
