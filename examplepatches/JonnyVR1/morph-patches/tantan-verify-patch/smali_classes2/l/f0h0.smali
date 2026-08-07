.class public final Ll/f0h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bkg0;


# static fields
.field public static final f:Ljava/lang/String;


# instance fields
.field public final a:Ll/mrg0;

.field public final b:Ll/glg0;

.field public c:Ltech/sud/gip/core/GameInfo;

.field public final d:J

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/f0h0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/f0h0;->f:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/dlg0;Ll/mrg0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/f0h0;->d:J

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/f0h0;->e:Z

    .line 10
    .line 11
    new-instance p1, Ll/upg0;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/upg0;-><init>(Ll/f0h0;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/qvg0;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/qvg0;-><init>(Ll/f0h0;)V

    .line 19
    .line 20
    .line 21
    iput-object p3, p0, Ll/f0h0;->a:Ll/mrg0;

    .line 22
    .line 23
    iget-object p1, p2, Ll/dlg0;->b:Ll/glg0;

    .line 24
    .line 25
    iput-object p1, p0, Ll/f0h0;->b:Ll/glg0;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a(Ltech/sud/gip/core/GameInfo;ILjava/lang/String;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/f0h0;->e:Z

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/f0h0;->a:Ll/mrg0;

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    const-string p2, "gameInfo params cannot be null"

    .line 10
    .line 11
    const/4 p3, 0x2

    .line 12
    invoke-virtual {p0, p3, p1, p2}, Ll/mrg0;->b(IILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput-object p1, p0, Ll/f0h0;->c:Ltech/sud/gip/core/GameInfo;

    .line 17
    .line 18
    iget-object p2, p0, Ll/f0h0;->b:Ll/glg0;

    .line 19
    .line 20
    iget p1, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 21
    .line 22
    new-instance p3, Ll/syg0;

    .line 23
    .line 24
    invoke-direct {p3, p0}, Ll/syg0;-><init>(Ll/f0h0;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    if-ne p0, p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p2, Ll/glg0;->a:Ll/ilg0;

    .line 31
    .line 32
    invoke-virtual {p0, p1, p3}, Ll/tog0;->b(ILl/elg0;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const/4 p0, 0x5

    .line 37
    if-ne p0, p1, :cond_2

    .line 38
    .line 39
    iget-object p0, p2, Ll/glg0;->b:Ll/ksg0;

    .line 40
    .line 41
    invoke-virtual {p0, p1, p3}, Ll/tog0;->b(ILl/elg0;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    new-instance p0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p2, "\u4e0d\u652f\u6301engine="

    .line 51
    .line 52
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p3, p0}, Ll/syg0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final cancel()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/f0h0;->e:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/f0h0;->c:Ltech/sud/gip/core/GameInfo;

    .line 5
    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    iget-object v2, p0, Ll/f0h0;->b:Ll/glg0;

    .line 9
    .line 10
    iget v1, v1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 11
    .line 12
    iget-wide v3, p0, Ll/f0h0;->d:J

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, v2, Ll/glg0;->a:Ll/ilg0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    sget-object p0, Ll/bhg0;->d:Ljava/lang/String;

    .line 22
    .line 23
    sget-object p0, Ll/weg0;->a:Ll/bhg0;

    .line 24
    .line 25
    invoke-virtual {p0, v3, v4}, Ll/bhg0;->e(J)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 p0, 0x5

    .line 30
    if-ne p0, v1, :cond_1

    .line 31
    .line 32
    iget-object p0, v2, Ll/glg0;->b:Ll/ksg0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    sget-object p0, Ll/bhg0;->d:Ljava/lang/String;

    .line 38
    .line 39
    sget-object p0, Ll/weg0;->a:Ll/bhg0;

    .line 40
    .line 41
    invoke-virtual {p0, v3, v4}, Ll/bhg0;->e(J)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method
