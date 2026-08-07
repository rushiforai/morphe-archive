.class public final Ll/xuw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x2e0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xuw$b;
    }
.end annotation


# static fields
.field public static final b:Ll/dez;


# instance fields
.field public final a:Ll/dez;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/xuw$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xuw$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xuw;->b:Ll/dez;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-static {}, Ll/xuw;->b()Ll/dez;

    move-result-object v0

    invoke-direct {p0, v0}, Ll/xuw;-><init>(Ll/dez;)V

    return-void
.end method

.method public constructor <init>(Ll/dez;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "messageInfoFactory"

    .line 5
    .line 6
    invoke-static {p1, v0}, Landroidx/datastore/preferences/protobuf/s;->b(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ll/dez;

    .line 11
    .line 12
    iput-object p1, p0, Ll/xuw;->a:Ll/dez;

    .line 13
    .line 14
    return-void
.end method

.method public static b()Ll/dez;
    .locals 5

    .line 1
    new-instance v0, Ll/xuw$b;

    .line 2
    .line 3
    invoke-static {}, Ll/ulj;->c()Ll/ulj;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Ll/xuw;->c()Ll/dez;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x2

    .line 12
    new-array v3, v3, [Ll/dez;

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    aput-object v1, v3, v4

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    aput-object v2, v3, v1

    .line 19
    .line 20
    invoke-direct {v0, v3}, Ll/xuw$b;-><init>([Ll/dez;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static c()Ll/dez;
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "androidx.datastore.preferences.protobuf.DescriptorMessageInfoFactory"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "getInstance"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/dez;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    return-object v0

    .line 21
    :catch_0
    sget-object v0, Ll/xuw;->b:Ll/dez;

    .line 22
    .line 23
    return-object v0
.end method

.method public static d(Ll/cez;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/cez;->c()Landroidx/datastore/preferences/protobuf/ProtoSyntax;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Landroidx/datastore/preferences/protobuf/ProtoSyntax;->PROTO2:Landroidx/datastore/preferences/protobuf/ProtoSyntax;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static e(Ljava/lang/Class;Ll/cez;)Landroidx/datastore/preferences/protobuf/i0;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ll/cez;",
            ")",
            "Landroidx/datastore/preferences/protobuf/i0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-class v0, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {p1}, Ll/xuw;->d(Ll/cez;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/w130;->b()Ll/v130;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-static {}, Landroidx/datastore/preferences/protobuf/w;->b()Landroidx/datastore/preferences/protobuf/w;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {}, Landroidx/datastore/preferences/protobuf/j0;->M()Landroidx/datastore/preferences/protobuf/l0;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-static {}, Ll/wqf;->b()Landroidx/datastore/preferences/protobuf/m;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    invoke-static {}, Ll/zww;->b()Landroidx/datastore/preferences/protobuf/z;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    move-object v1, p0

    .line 36
    move-object v2, p1

    .line 37
    invoke-static/range {v1 .. v7}, Landroidx/datastore/preferences/protobuf/d0;->R(Ljava/lang/Class;Ll/cez;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    move-object v0, p0

    .line 43
    move-object v1, p1

    .line 44
    invoke-static {}, Ll/w130;->b()Ll/v130;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-static {}, Landroidx/datastore/preferences/protobuf/w;->b()Landroidx/datastore/preferences/protobuf/w;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {}, Landroidx/datastore/preferences/protobuf/j0;->M()Landroidx/datastore/preferences/protobuf/l0;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-static {}, Ll/zww;->b()Landroidx/datastore/preferences/protobuf/z;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-static/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->R(Ljava/lang/Class;Ll/cez;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    move-object v0, p0

    .line 67
    move-object v1, p1

    .line 68
    invoke-static {v1}, Ll/xuw;->d(Ll/cez;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_2

    .line 73
    .line 74
    invoke-static {}, Ll/w130;->a()Ll/v130;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {}, Landroidx/datastore/preferences/protobuf/w;->a()Landroidx/datastore/preferences/protobuf/w;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {}, Landroidx/datastore/preferences/protobuf/j0;->H()Landroidx/datastore/preferences/protobuf/l0;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-static {}, Ll/wqf;->a()Landroidx/datastore/preferences/protobuf/m;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-static {}, Ll/zww;->a()Landroidx/datastore/preferences/protobuf/z;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-static/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->R(Ljava/lang/Class;Ll/cez;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_2
    invoke-static {}, Ll/w130;->a()Ll/v130;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {}, Landroidx/datastore/preferences/protobuf/w;->a()Landroidx/datastore/preferences/protobuf/w;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-static {}, Landroidx/datastore/preferences/protobuf/j0;->I()Landroidx/datastore/preferences/protobuf/l0;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    const/4 v5, 0x0

    .line 112
    invoke-static {}, Ll/zww;->a()Landroidx/datastore/preferences/protobuf/z;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    invoke-static/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->R(Ljava/lang/Class;Ll/cez;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/Class;)Landroidx/datastore/preferences/protobuf/i0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Landroidx/datastore/preferences/protobuf/i0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroidx/datastore/preferences/protobuf/j0;->J(Ljava/lang/Class;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xuw;->a:Ll/dez;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/dez;->a(Ljava/lang/Class;)Ll/cez;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/cez;->a()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-class v0, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-static {}, Landroidx/datastore/preferences/protobuf/j0;->M()Landroidx/datastore/preferences/protobuf/l0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {}, Ll/wqf;->b()Landroidx/datastore/preferences/protobuf/m;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {p0}, Ll/cez;->b()Landroidx/datastore/preferences/protobuf/b0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p1, v0, p0}, Landroidx/datastore/preferences/protobuf/e0;->m(Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/b0;)Landroidx/datastore/preferences/protobuf/e0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_0
    invoke-static {}, Landroidx/datastore/preferences/protobuf/j0;->H()Landroidx/datastore/preferences/protobuf/l0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {}, Ll/wqf;->a()Landroidx/datastore/preferences/protobuf/m;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {p0}, Ll/cez;->b()Landroidx/datastore/preferences/protobuf/b0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p1, v0, p0}, Landroidx/datastore/preferences/protobuf/e0;->m(Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/b0;)Landroidx/datastore/preferences/protobuf/e0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_1
    invoke-static {p1, p0}, Ll/xuw;->e(Ljava/lang/Class;Ll/cez;)Landroidx/datastore/preferences/protobuf/i0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
