.class public Ll/p6j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/p6j$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:F

.field public final d:J


# direct methods
.method public constructor <init>(IIFJ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v0

    .line 11
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v4, "width must be positive, but is: "

    .line 14
    .line 15
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-static {v2, v3}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    if-lez p2, :cond_1

    .line 29
    .line 30
    move v0, v1

    .line 31
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v2, "height must be positive, but is: "

    .line 34
    .line 35
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iput p1, p0, Ll/p6j;->a:I

    .line 49
    .line 50
    iput p2, p0, Ll/p6j;->b:I

    .line 51
    .line 52
    iput p3, p0, Ll/p6j;->c:F

    .line 53
    .line 54
    iput-wide p4, p0, Ll/p6j;->d:J

    .line 55
    .line 56
    return-void
.end method

.method public synthetic constructor <init>(IIFJLl/p6j$a;)V
    .locals 0

    .line 57
    invoke-direct/range {p0 .. p5}, Ll/p6j;-><init>(IIFJ)V

    return-void
.end method
