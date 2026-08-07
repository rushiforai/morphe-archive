.class public final Ll/tmg0;
.super Ljava/util/concurrent/FutureTask;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# instance fields
.field public final a:Ll/teg0;


# direct methods
.method public constructor <init>(Ll/teg0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/tmg0;->a:Ll/teg0;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final compareTo(Ljava/lang/Object;)I
    .locals 2

    .line 1
    check-cast p1, Ll/tmg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tmg0;->a:Ll/teg0;

    .line 4
    .line 5
    iget v0, p0, Ll/teg0;->s:I

    .line 6
    .line 7
    iget-object p1, p1, Ll/tmg0;->a:Ll/teg0;

    .line 8
    .line 9
    iget v1, p1, Ll/teg0;->s:I

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget p0, p0, Ll/teg0;->a:I

    .line 14
    .line 15
    iget p1, p1, Ll/teg0;->a:I

    .line 16
    .line 17
    :goto_0
    sub-int/2addr p0, p1

    .line 18
    return p0

    .line 19
    :cond_0
    invoke-static {v1}, Ll/pxg0;->a(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {v0}, Ll/pxg0;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    goto :goto_0
.end method
