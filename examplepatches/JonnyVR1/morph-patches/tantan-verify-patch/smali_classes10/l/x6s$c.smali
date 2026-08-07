.class public Ll/x6s$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x6s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public c:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/x6s$c;->b:I

    .line 5
    .line 6
    mul-int/lit16 p1, p1, 0x3e8

    .line 7
    .line 8
    iput p1, p0, Ll/x6s$c;->a:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Ll/x6s$c;->c:I

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic a(Ll/x6s$c;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/x6s$c;->a:I

    return p0
.end method


# virtual methods
.method public b()Z
    .locals 3

    .line 1
    iget v0, p0, Ll/x6s$c;->c:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Ll/x6s$c;->c:I

    .line 6
    .line 7
    iget v2, p0, Ll/x6s$c;->b:I

    .line 8
    .line 9
    if-gt v0, v2, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/x6s$c;->c()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/x6s$c;->c:I

    .line 3
    .line 4
    return-void
.end method
