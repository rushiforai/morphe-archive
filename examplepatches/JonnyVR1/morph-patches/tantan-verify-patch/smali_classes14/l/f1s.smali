.class public Ll/f1s;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/f1s;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    sget-object p0, Ll/itd0;->d:Ll/itd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/itd0;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v1, Ll/bk3;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/bk3;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    sget-object p0, Ll/itd0;->e:Ll/itd0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/itd0;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v1, Ll/fm3;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/fm3;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/itd0;->a()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance v1, Ll/fk3;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/fk3;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/itd0;->a()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance v1, Ll/gm3;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/gm3;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public a(Ll/itd0;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/itd0<",
            "TV;>;)TV;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f1s;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/itd0;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
