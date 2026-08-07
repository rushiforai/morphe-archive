.class Ll/af00$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bje$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/af00;->e(Ll/qe00;[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[Ljava/lang/String;

.field final synthetic b:Ll/qe00;

.field final synthetic c:Ll/af00;


# direct methods
.method public constructor <init>(Ll/af00;[Ljava/lang/String;Ll/qe00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/af00$a;->c:Ll/af00;

    .line 2
    .line 3
    iput-object p2, p0, Ll/af00$a;->a:[Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/af00$a;->b:Ll/qe00;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/yie;->a()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-object v3, p0, Ll/af00$a;->a:[Ljava/lang/String;

    .line 11
    .line 12
    array-length v4, v3

    .line 13
    const/4 v5, 0x0

    .line 14
    :goto_0
    if-ge v5, v4, :cond_1

    .line 15
    .line 16
    aget-object v6, v3, v5

    .line 17
    .line 18
    iget-object v7, p0, Ll/af00$a;->c:Ll/af00;

    .line 19
    .line 20
    invoke-static {v7}, Ll/af00;->a(Ll/af00;)Ljava/util/Map;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    check-cast v7, Ll/aje;

    .line 29
    .line 30
    if-eqz v7, :cond_0

    .line 31
    .line 32
    invoke-virtual {v7}, Ll/aje;->e()I

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    invoke-virtual {v7, v1, v2}, Ll/aje;->k(J)V

    .line 39
    .line 40
    .line 41
    add-int/lit8 v5, v5, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p0, "do not exit dynamic resource: "

    .line 45
    .line 46
    invoke-static {p0, v6}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    new-instance v1, Ll/loh0;

    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    new-array v2, v2, [Ll/aje;

    .line 64
    .line 65
    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, [Ll/aje;

    .line 70
    .line 71
    invoke-direct {v1, v0}, Ll/loh0;-><init>([Ll/aje;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/af00$a;->b:Ll/qe00;

    .line 75
    .line 76
    invoke-virtual {v1, p0}, Ll/loh0;->f(Ll/qe00;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ll/loh0;->a()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "lclclc_"

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/immomo/resdownloader/log/MLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/af00$a;->b:Ll/qe00;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-interface {p0, v0, p1}, Ll/qe00;->a(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
