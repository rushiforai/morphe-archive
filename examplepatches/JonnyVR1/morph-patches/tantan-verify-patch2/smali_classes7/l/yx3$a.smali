.class public final Ll/yx3$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yx3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:I

.field public d:I

.field public e:I

.field public f:Z

.field public g:Z

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/yx3$a;->c:I

    .line 6
    .line 7
    iput v0, p0, Ll/yx3$a;->d:I

    .line 8
    .line 9
    iput v0, p0, Ll/yx3$a;->e:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ll/yx3;
    .locals 1

    .line 1
    new-instance v0, Ll/yx3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yx3;-><init>(Ll/yx3$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b(ILjava/util/concurrent/TimeUnit;)Ll/yx3$a;
    .locals 2

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    .line 5
    .line 6
    .line 7
    move-result-wide p1

    .line 8
    const-wide/32 v0, 0x7fffffff

    .line 9
    .line 10
    .line 11
    cmp-long v0, p1, v0

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    const p1, 0x7fffffff

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    long-to-int p1, p1

    .line 20
    :goto_0
    iput p1, p0, Ll/yx3$a;->d:I

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "maxStale < 0: "

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public c()Ll/yx3$a;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/yx3$a;->a:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public d()Ll/yx3$a;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/yx3$a;->b:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public e()Ll/yx3$a;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/yx3$a;->f:Z

    .line 3
    .line 4
    return-object p0
.end method
