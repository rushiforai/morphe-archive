.class public Ltech/sud/runtime/core/h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ltech/sud/runtime/a/b;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/a/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltech/sud/runtime/core/h;->a:Ltech/sud/runtime/a/b;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLog(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/h;->a:Ltech/sud/runtime/a/b;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    move-object p3, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {v1, p3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    move-object p3, v1

    .line 16
    :goto_0
    if-nez p4, :cond_1

    .line 17
    .line 18
    move-object p4, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    new-instance v1, Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v1, p4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    move-object p4, v1

    .line 26
    :goto_1
    if-nez p5, :cond_2

    .line 27
    .line 28
    :goto_2
    move-object p5, v0

    .line 29
    goto :goto_3

    .line 30
    :cond_2
    new-instance v0, Ljava/lang/String;

    .line 31
    .line 32
    invoke-direct {v0, p5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_2

    .line 36
    :goto_3
    iget-object p0, p0, Ltech/sud/runtime/core/h;->a:Ltech/sud/runtime/a/b;

    .line 37
    .line 38
    invoke-interface/range {p0 .. p5}, Ltech/sud/runtime/a/b;->a(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method
