.class public Ll/ktv;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/net/Uri;

.field public b:I

.field public c:I

.field public d:Ll/tvb$a;

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ll/tvb$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ktv;->a:Landroid/net/Uri;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ktv;->d:Ll/tvb$a;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/ktv;->e:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ktv;->b:I

    .line 2
    .line 3
    iput p2, p0, Ll/ktv;->c:I

    .line 4
    .line 5
    return-void
.end method

.method public b(Landroid/content/Context;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/ktv;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Ll/ktv;->b:I

    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget v0, p0, Ll/ktv;->c:I

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/ktv;->e:Z

    .line 17
    .line 18
    invoke-static {}, Ll/tvb;->h()Ll/tvb;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v3, p0, Ll/ktv;->a:Landroid/net/Uri;

    .line 23
    .line 24
    iget v4, p0, Ll/ktv;->b:I

    .line 25
    .line 26
    iget v5, p0, Ll/ktv;->c:I

    .line 27
    .line 28
    iget-object v6, p0, Ll/ktv;->d:Ll/tvb$a;

    .line 29
    .line 30
    move-object v2, p1

    .line 31
    invoke-virtual/range {v1 .. v6}, Ll/tvb;->m(Landroid/content/Context;Landroid/net/Uri;IILl/tvb$a;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/ktv;->a:Landroid/net/Uri;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget v0, p0, Ll/ktv;->b:I

    .line 42
    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget p0, p0, Ll/ktv;->c:I

    .line 48
    .line 49
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {p1, v0, p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "LoadBitmapCommand for %s delayed, wrong dimensions {width=%d, height=%d}"

    .line 58
    .line 59
    invoke-static {p1, p0}, Ll/xvb;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
