.class public final Ll/h4s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/AppOpsManager$OnOpActiveChangedListener;


# instance fields
.field public final synthetic a:Ll/j4s0;


# direct methods
.method public constructor <init>(Ll/j4s0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h4s0;->a:Ll/j4s0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onOpActiveChanged(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/h4s0;->a:Ll/j4s0;

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide p2

    .line 9
    invoke-static {p1, p2, p3}, Ll/j4s0;->g(Ll/j4s0;J)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/h4s0;->a:Ll/j4s0;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-static {p0, p1}, Ll/j4s0;->f(Ll/j4s0;Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide p2

    .line 23
    invoke-static {p1}, Ll/j4s0;->a(Ll/j4s0;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    cmp-long p1, v0, v2

    .line 30
    .line 31
    if-lez p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/h4s0;->a:Ll/j4s0;

    .line 34
    .line 35
    invoke-static {p1}, Ll/j4s0;->a(Ll/j4s0;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    cmp-long p4, p2, v0

    .line 40
    .line 41
    if-ltz p4, :cond_1

    .line 42
    .line 43
    invoke-static {p1}, Ll/j4s0;->a(Ll/j4s0;)J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    sub-long/2addr p2, v0

    .line 48
    invoke-static {p1, p2, p3}, Ll/j4s0;->e(Ll/j4s0;J)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Ll/h4s0;->a:Ll/j4s0;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-static {p0, p1}, Ll/j4s0;->f(Ll/j4s0;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
