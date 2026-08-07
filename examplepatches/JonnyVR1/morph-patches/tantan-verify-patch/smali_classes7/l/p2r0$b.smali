.class Ll/p2r0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p2r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:J

.field public c:I

.field public d:I

.field public e:Ljava/lang/String;

.field public f:J


# direct methods
.method public constructor <init>(Ljava/lang/String;JIILjava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p2r0$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/p2r0$b;->b:J

    .line 7
    .line 8
    iput p4, p0, Ll/p2r0$b;->c:I

    .line 9
    .line 10
    iput p5, p0, Ll/p2r0$b;->d:I

    .line 11
    .line 12
    iput-object p6, p0, Ll/p2r0$b;->e:Ljava/lang/String;

    .line 13
    .line 14
    iput-wide p7, p0, Ll/p2r0$b;->f:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Ll/p2r0$b;)Z
    .locals 2

    .line 1
    iget-object v0, p1, Ll/p2r0$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/p2r0$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Ll/p2r0$b;->e:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Ll/p2r0$b;->e:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget v0, p1, Ll/p2r0$b;->c:I

    .line 22
    .line 23
    iget v1, p0, Ll/p2r0$b;->c:I

    .line 24
    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    iget v0, p1, Ll/p2r0$b;->d:I

    .line 28
    .line 29
    iget v1, p0, Ll/p2r0$b;->d:I

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget-wide v0, p1, Ll/p2r0$b;->b:J

    .line 34
    .line 35
    iget-wide p0, p0, Ll/p2r0$b;->b:J

    .line 36
    .line 37
    sub-long/2addr v0, p0

    .line 38
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 39
    .line 40
    .line 41
    move-result-wide p0

    .line 42
    const-wide/16 v0, 0x1388

    .line 43
    .line 44
    cmp-long p0, p0, v0

    .line 45
    .line 46
    if-lez p0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 52
    return p0
.end method
