.class public Ll/oq60;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/s4;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/lq60;

.field public c:Ll/mq60;


# direct methods
.method public constructor <init>(Ll/lq60;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ll/n93;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/n93;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 20
    .line 21
    new-instance v1, Ll/mvd0;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/mvd0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 30
    .line 31
    new-instance v1, Ll/d8d0;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/d8d0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 40
    .line 41
    new-instance v1, Ll/lgw;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/lgw;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 50
    .line 51
    new-instance v1, Ll/eol;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/eol;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 60
    .line 61
    new-instance v1, Ll/qud0;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/qud0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 70
    .line 71
    new-instance v1, Ll/sk60;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/sk60;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 80
    .line 81
    new-instance v1, Ll/vh0;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/vh0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 90
    .line 91
    new-instance v1, Ll/nvd0;

    .line 92
    .line 93
    invoke-direct {v1}, Ll/nvd0;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 100
    .line 101
    new-instance v1, Ll/g9c;

    .line 102
    .line 103
    invoke-direct {v1}, Ll/g9c;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    iput-object p1, p0, Ll/oq60;->b:Ll/lq60;

    .line 110
    .line 111
    return-void
.end method

.method public static synthetic a(Ll/oq60;Ll/s4;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oq60;->c(Ll/s4;)V

    return-void
.end method


# virtual methods
.method public b()Ll/mq60;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oq60;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/nq60;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/nq60;-><init>(Ll/oq60;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/oq60;->c:Ll/mq60;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic c(Ll/s4;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oq60;->b:Ll/lq60;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/s4;->g(Ll/lq60;)Ll/mq60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/oq60;->c:Ll/mq60;

    .line 8
    .line 9
    return-void
.end method
