.class public abstract Ll/stg0;
.super Ll/phg0;
.source "SourceFile"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/phg0;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/phg0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/phg0;->e:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/phg0;->f:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/phg0;->g:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance p0, LSudthrow/Sudint;

    .line 19
    .line 20
    const-string v0, "Control frame cant have rsv3==true set"

    .line 21
    .line 22
    invoke-direct {p0, v0}, LSudthrow/Sudint;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0

    .line 26
    :cond_1
    new-instance p0, LSudthrow/Sudint;

    .line 27
    .line 28
    const-string v0, "Control frame cant have rsv2==true set"

    .line 29
    .line 30
    invoke-direct {p0, v0}, LSudthrow/Sudint;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :cond_2
    new-instance p0, LSudthrow/Sudint;

    .line 35
    .line 36
    const-string v0, "Control frame cant have rsv1==true set"

    .line 37
    .line 38
    invoke-direct {p0, v0}, LSudthrow/Sudint;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p0

    .line 42
    :cond_3
    new-instance p0, LSudthrow/Sudint;

    .line 43
    .line 44
    const-string v0, "Control frame cant have fin==false set"

    .line 45
    .line 46
    invoke-direct {p0, v0}, LSudthrow/Sudint;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0
.end method
