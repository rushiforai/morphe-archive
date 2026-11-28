.class Le/e/a/BikeRecordVersion220Smoke;
.super Ljava/lang/Object;
.source "BikeRecordVersion220Smoke.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5

    .line 5
    nop

    .line 12
    const-string p0, "R,1.5.1-dev,1700000001,100,one\nB,1.5.1-dev.2,1700000002,200,two\nR,1.5.1-dev.10,1700000003,150,three\nB,1.5.1,1700000004,300,stable\nR,1.5.0-dev.19,1700000005,250,older\nB,1.5.2,1700000006,300,current\nX,1.5.1-dev.2,1700000007,200,opaque"

    const-string v0, "R,1.5.1-dev,"

    const-string v1, "R,1.5.1,"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 13
    const-string v2, "B,1.5.1-dev.2,"

    const-string v3, "B,1.5.1,"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 14
    const-string v2, "R,1.5.1-dev.10,"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 15
    invoke-static {p0}, Le/e/a/BikeRecordVersion220;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 17
    invoke-static {p0}, Le/e/a/BikeRecordVersion220;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 20
    const-string p0, ""

    invoke-static {p0}, Le/e/a/BikeRecordVersion220;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 21
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, "PASS: version-only migration of recent and best records, idempotency and empty history"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 22
    return-void

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "Empty history"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0

    .line 18
    :cond_1
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "Migration must be idempotent"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0

    .line 16
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
