.class Ll/jqf$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jqf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field a:F

.field b:Ll/dj60;

.field c:Landroid/animation/TimeInterpolator;


# direct methods
.method public constructor <init>(FLl/dj60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/jqf$a;->a:F

    .line 5
    .line 6
    iput-object p2, p0, Ll/jqf$a;->b:Ll/dj60;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-object p1, p2, Ll/dj60;->h:Landroid/animation/TimeInterpolator;

    .line 11
    .line 12
    iput-object p1, p0, Ll/jqf$a;->c:Landroid/animation/TimeInterpolator;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static d(FLl/dj60;)Ll/jqf$a;
    .locals 1

    .line 1
    new-instance v0, Ll/jqf$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/jqf$a;-><init>(FLl/dj60;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Ll/jqf$a;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public b()Landroid/animation/TimeInterpolator;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqf$a;->c:Landroid/animation/TimeInterpolator;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/dj60;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jqf$a;->b:Ll/dj60;

    .line 2
    .line 3
    return-object p0
.end method
