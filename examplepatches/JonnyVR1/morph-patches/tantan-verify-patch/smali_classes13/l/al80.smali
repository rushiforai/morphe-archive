.class public Ll/al80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Ll/al80;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/f3m;

.field public b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:J

.field public f:Z

.field public g:I


# direct methods
.method public constructor <init>(Ll/f3m;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/al80;->f:Z

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Ll/al80;->g:I

    .line 9
    .line 10
    iput-object p1, p0, Ll/al80;->a:Ll/f3m;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Ll/al80;->e:J

    .line 17
    .line 18
    instance-of v0, p1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->getPriority()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x5

    .line 29
    if-ne v0, v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->getPriority()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Ll/al80;->g:I

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    instance-of v0, p1, Ll/g3m;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    check-cast p1, Ll/g3m;

    .line 43
    .line 44
    invoke-interface {p1}, Ll/g3m;->getPriority()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const/4 v1, 0x4

    .line 49
    if-ne v0, v1, :cond_1

    .line 50
    .line 51
    invoke-interface {p1}, Ll/g3m;->getPriority()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, p0, Ll/al80;->g:I

    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public static a(Ll/f3m;)Ll/al80;
    .locals 1

    .line 1
    new-instance v0, Ll/al80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/al80;-><init>(Ll/f3m;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b(Ll/al80;)I
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/al80;->h()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/al80;->h()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-wide v0, p0, Ll/al80;->e:J

    .line 12
    .line 13
    iget-wide p0, p1, Ll/al80;->e:J

    .line 14
    .line 15
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p1}, Ll/al80;->h()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-virtual {p0}, Ll/al80;->h()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    sub-int/2addr p1, p0

    .line 29
    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/al80;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/al80;->b(Ll/al80;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/al80;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/f3m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/al80;->a:Ll/f3m;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/al80;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Ljava/lang/ref/WeakReference;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/al80;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/al80;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/al80;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public n(Ljava/lang/String;)Ll/al80;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/al80;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Z)Ll/al80;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/al80;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Ll/al80;
    .locals 0

    .line 1
    iput p1, p0, Ll/al80;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/al80;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public r(Ljava/lang/ref/WeakReference;)Ll/al80;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;)",
            "Ll/al80;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/al80;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    return-object p0
.end method
