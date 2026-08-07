.class public final Landroidx/datastore/preferences/protobuf/d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/datastore/preferences/protobuf/i0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/datastore/preferences/protobuf/i0<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final r:[I

.field public static final s:Lsun/misc/Unsafe;


# instance fields
.field public final a:[I

.field public final b:[Ljava/lang/Object;

.field public final c:I

.field public final d:I

.field public final e:Landroidx/datastore/preferences/protobuf/b0;

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Z

.field public final j:[I

.field public final k:I

.field public final l:I

.field public final m:Ll/v130;

.field public final n:Landroidx/datastore/preferences/protobuf/w;

.field public final o:Landroidx/datastore/preferences/protobuf/l0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/datastore/preferences/protobuf/l0<",
            "**>;"
        }
    .end annotation
.end field

.field public final p:Landroidx/datastore/preferences/protobuf/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/datastore/preferences/protobuf/m<",
            "*>;"
        }
    .end annotation
.end field

.field public final q:Landroidx/datastore/preferences/protobuf/z;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Landroidx/datastore/preferences/protobuf/d0;->r:[I

    .line 5
    .line 6
    invoke-static {}, Ll/lyj0;->F()Lsun/misc/Unsafe;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>([I[Ljava/lang/Object;IILandroidx/datastore/preferences/protobuf/b0;ZZ[IIILl/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I[",
            "Ljava/lang/Object;",
            "II",
            "Landroidx/datastore/preferences/protobuf/b0;",
            "ZZ[III",
            "Ll/v130;",
            "Landroidx/datastore/preferences/protobuf/w;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "**>;",
            "Landroidx/datastore/preferences/protobuf/m<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/z;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/datastore/preferences/protobuf/d0;->b:[Ljava/lang/Object;

    .line 7
    .line 8
    iput p3, p0, Landroidx/datastore/preferences/protobuf/d0;->c:I

    .line 9
    .line 10
    iput p4, p0, Landroidx/datastore/preferences/protobuf/d0;->d:I

    .line 11
    .line 12
    instance-of p1, p5, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;

    .line 13
    .line 14
    iput-boolean p1, p0, Landroidx/datastore/preferences/protobuf/d0;->g:Z

    .line 15
    .line 16
    iput-boolean p6, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 17
    .line 18
    if-eqz p14, :cond_0

    .line 19
    .line 20
    invoke-virtual {p14, p5}, Landroidx/datastore/preferences/protobuf/m;->e(Landroidx/datastore/preferences/protobuf/b0;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    iput-boolean p1, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 30
    .line 31
    iput-boolean p7, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 32
    .line 33
    iput-object p8, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    .line 34
    .line 35
    iput p9, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    .line 36
    .line 37
    iput p10, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    .line 38
    .line 39
    iput-object p11, p0, Landroidx/datastore/preferences/protobuf/d0;->m:Ll/v130;

    .line 40
    .line 41
    iput-object p12, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 42
    .line 43
    iput-object p13, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 44
    .line 45
    iput-object p14, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 46
    .line 47
    iput-object p5, p0, Landroidx/datastore/preferences/protobuf/d0;->e:Landroidx/datastore/preferences/protobuf/b0;

    .line 48
    .line 49
    move-object p1, p15

    .line 50
    iput-object p1, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 51
    .line 52
    return-void
.end method

.method public static A(Ljava/lang/Object;J)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)I"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static B(I)Z
    .locals 1

    .line 1
    const/high16 v0, 0x20000000

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static E(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/i0;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {p0, v0, v1}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p2, p0}, Landroidx/datastore/preferences/protobuf/i0;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static J(I)Z
    .locals 1

    .line 1
    const/high16 v0, 0x10000000

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static K(Ljava/lang/Object;J)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "J)",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public static L(Ljava/lang/Object;J)J
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)J"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static R(Ljava/lang/Class;Ll/cez;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ll/cez;",
            "Ll/v130;",
            "Landroidx/datastore/preferences/protobuf/w;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "**>;",
            "Landroidx/datastore/preferences/protobuf/m<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/z;",
            ")",
            "Landroidx/datastore/preferences/protobuf/d0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of p0, p1, Ll/nlc0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/nlc0;

    .line 6
    .line 7
    invoke-static/range {p1 .. p6}, Landroidx/datastore/preferences/protobuf/d0;->T(Ll/nlc0;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    check-cast p1, Ll/b9g0;

    .line 13
    .line 14
    invoke-static/range {p1 .. p6}, Landroidx/datastore/preferences/protobuf/d0;->S(Ll/b9g0;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static S(Ll/b9g0;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/b9g0;",
            "Ll/v130;",
            "Landroidx/datastore/preferences/protobuf/w;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "**>;",
            "Landroidx/datastore/preferences/protobuf/m<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/z;",
            ")",
            "Landroidx/datastore/preferences/protobuf/d0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Ll/b9g0;->c()Landroidx/datastore/preferences/protobuf/ProtoSyntax;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Landroidx/datastore/preferences/protobuf/ProtoSyntax;->PROTO3:Landroidx/datastore/preferences/protobuf/ProtoSyntax;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    move v9, v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v9, v2

    .line 14
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ll/b9g0;->e()[Landroidx/datastore/preferences/protobuf/o;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    array-length v1, v0

    .line 19
    const/4 v3, 0x0

    .line 20
    if-nez v1, :cond_4

    .line 21
    .line 22
    array-length v1, v0

    .line 23
    mul-int/lit8 v4, v1, 0x3

    .line 24
    .line 25
    new-array v4, v4, [I

    .line 26
    .line 27
    mul-int/lit8 v1, v1, 0x2

    .line 28
    .line 29
    new-array v5, v1, [Ljava/lang/Object;

    .line 30
    .line 31
    array-length v1, v0

    .line 32
    if-gtz v1, :cond_3

    .line 33
    .line 34
    invoke-virtual/range {p0 .. p0}, Ll/b9g0;->d()[I

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    sget-object v1, Landroidx/datastore/preferences/protobuf/d0;->r:[I

    .line 41
    .line 42
    :cond_1
    array-length v6, v0

    .line 43
    if-gtz v6, :cond_2

    .line 44
    .line 45
    sget-object v0, Landroidx/datastore/preferences/protobuf/d0;->r:[I

    .line 46
    .line 47
    sget-object v3, Landroidx/datastore/preferences/protobuf/d0;->r:[I

    .line 48
    .line 49
    array-length v6, v1

    .line 50
    array-length v7, v0

    .line 51
    add-int/2addr v6, v7

    .line 52
    array-length v7, v3

    .line 53
    add-int/2addr v6, v7

    .line 54
    new-array v11, v6, [I

    .line 55
    .line 56
    array-length v6, v1

    .line 57
    invoke-static {v1, v2, v11, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    .line 59
    .line 60
    array-length v6, v1

    .line 61
    array-length v7, v0

    .line 62
    invoke-static {v0, v2, v11, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    array-length v6, v1

    .line 66
    array-length v7, v0

    .line 67
    add-int/2addr v6, v7

    .line 68
    array-length v7, v3

    .line 69
    invoke-static {v3, v2, v11, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    .line 71
    .line 72
    new-instance v3, Landroidx/datastore/preferences/protobuf/d0;

    .line 73
    .line 74
    invoke-virtual/range {p0 .. p0}, Ll/b9g0;->b()Landroidx/datastore/preferences/protobuf/b0;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    array-length v12, v1

    .line 79
    array-length v1, v1

    .line 80
    array-length v0, v0

    .line 81
    add-int v13, v1, v0

    .line 82
    .line 83
    const/4 v6, 0x0

    .line 84
    const/4 v7, 0x0

    .line 85
    const/4 v10, 0x1

    .line 86
    move-object/from16 v14, p1

    .line 87
    .line 88
    move-object/from16 v15, p2

    .line 89
    .line 90
    move-object/from16 v16, p3

    .line 91
    .line 92
    move-object/from16 v17, p4

    .line 93
    .line 94
    move-object/from16 v18, p5

    .line 95
    .line 96
    invoke-direct/range {v3 .. v18}, Landroidx/datastore/preferences/protobuf/d0;-><init>([I[Ljava/lang/Object;IILandroidx/datastore/preferences/protobuf/b0;ZZ[IIILl/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)V

    .line 97
    .line 98
    .line 99
    return-object v3

    .line 100
    :cond_2
    aget-object v0, v0, v2

    .line 101
    .line 102
    throw v3

    .line 103
    :cond_3
    aget-object v0, v0, v2

    .line 104
    .line 105
    throw v3

    .line 106
    :cond_4
    aget-object v0, v0, v2

    .line 107
    .line 108
    throw v3
.end method

.method public static T(Ll/nlc0;Ll/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)Landroidx/datastore/preferences/protobuf/d0;
    .locals 35
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/nlc0;",
            "Ll/v130;",
            "Landroidx/datastore/preferences/protobuf/w;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "**>;",
            "Landroidx/datastore/preferences/protobuf/m<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/z;",
            ")",
            "Landroidx/datastore/preferences/protobuf/d0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Ll/nlc0;->c()Landroidx/datastore/preferences/protobuf/ProtoSyntax;

    move-result-object v0

    sget-object v1, Landroidx/datastore/preferences/protobuf/ProtoSyntax;->PROTO3:Landroidx/datastore/preferences/protobuf/ProtoSyntax;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v10, 0x1

    goto :goto_0

    :cond_0
    move v10, v2

    .line 2
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ll/nlc0;->e()Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 4
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const v6, 0xd800

    if-lt v4, v6, :cond_2

    and-int/lit16 v4, v4, 0x1fff

    const/4 v7, 0x1

    const/16 v8, 0xd

    :goto_1
    add-int/lit8 v9, v7, 0x1

    .line 5
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v6, :cond_1

    and-int/lit16 v7, v7, 0x1fff

    shl-int/2addr v7, v8

    or-int/2addr v4, v7

    add-int/lit8 v8, v8, 0xd

    move v7, v9

    goto :goto_1

    :cond_1
    shl-int/2addr v7, v8

    or-int/2addr v4, v7

    goto :goto_2

    :cond_2
    const/4 v9, 0x1

    :goto_2
    add-int/lit8 v7, v9, 0x1

    .line 6
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v6, :cond_4

    and-int/lit16 v8, v8, 0x1fff

    const/16 v9, 0xd

    :goto_3
    add-int/lit8 v11, v7, 0x1

    .line 7
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v6, :cond_3

    and-int/lit16 v7, v7, 0x1fff

    shl-int/2addr v7, v9

    or-int/2addr v8, v7

    add-int/lit8 v9, v9, 0xd

    move v7, v11

    goto :goto_3

    :cond_3
    shl-int/2addr v7, v9

    or-int/2addr v8, v7

    move v7, v11

    :cond_4
    if-nez v8, :cond_5

    .line 8
    sget-object v8, Landroidx/datastore/preferences/protobuf/d0;->r:[I

    move v9, v2

    move v11, v9

    move v13, v11

    move v14, v13

    move v15, v14

    move-object v12, v8

    move v8, v15

    goto/16 :goto_c

    :cond_5
    add-int/lit8 v8, v7, 0x1

    .line 9
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-lt v7, v6, :cond_7

    and-int/lit16 v7, v7, 0x1fff

    const/16 v9, 0xd

    :goto_4
    add-int/lit8 v11, v8, 0x1

    .line 10
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v6, :cond_6

    and-int/lit16 v8, v8, 0x1fff

    shl-int/2addr v8, v9

    or-int/2addr v7, v8

    add-int/lit8 v9, v9, 0xd

    move v8, v11

    goto :goto_4

    :cond_6
    shl-int/2addr v8, v9

    or-int/2addr v7, v8

    move v8, v11

    :cond_7
    add-int/lit8 v9, v8, 0x1

    .line 11
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v6, :cond_9

    and-int/lit16 v8, v8, 0x1fff

    const/16 v11, 0xd

    :goto_5
    add-int/lit8 v12, v9, 0x1

    .line 12
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v6, :cond_8

    and-int/lit16 v9, v9, 0x1fff

    shl-int/2addr v9, v11

    or-int/2addr v8, v9

    add-int/lit8 v11, v11, 0xd

    move v9, v12

    goto :goto_5

    :cond_8
    shl-int/2addr v9, v11

    or-int/2addr v8, v9

    move v9, v12

    :cond_9
    add-int/lit8 v11, v9, 0x1

    .line 13
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-lt v9, v6, :cond_b

    and-int/lit16 v9, v9, 0x1fff

    const/16 v12, 0xd

    :goto_6
    add-int/lit8 v13, v11, 0x1

    .line 14
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v6, :cond_a

    and-int/lit16 v11, v11, 0x1fff

    shl-int/2addr v11, v12

    or-int/2addr v9, v11

    add-int/lit8 v12, v12, 0xd

    move v11, v13

    goto :goto_6

    :cond_a
    shl-int/2addr v11, v12

    or-int/2addr v9, v11

    move v11, v13

    :cond_b
    add-int/lit8 v12, v11, 0x1

    .line 15
    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-lt v11, v6, :cond_d

    and-int/lit16 v11, v11, 0x1fff

    const/16 v13, 0xd

    :goto_7
    add-int/lit8 v14, v12, 0x1

    .line 16
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v6, :cond_c

    and-int/lit16 v12, v12, 0x1fff

    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    add-int/lit8 v13, v13, 0xd

    move v12, v14

    goto :goto_7

    :cond_c
    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    move v12, v14

    :cond_d
    add-int/lit8 v13, v12, 0x1

    .line 17
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-lt v12, v6, :cond_f

    and-int/lit16 v12, v12, 0x1fff

    const/16 v14, 0xd

    :goto_8
    add-int/lit8 v15, v13, 0x1

    .line 18
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v6, :cond_e

    and-int/lit16 v13, v13, 0x1fff

    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    add-int/lit8 v14, v14, 0xd

    move v13, v15

    goto :goto_8

    :cond_e
    shl-int/2addr v13, v14

    or-int/2addr v12, v13

    move v13, v15

    :cond_f
    add-int/lit8 v14, v13, 0x1

    .line 19
    invoke-virtual {v0, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    if-lt v13, v6, :cond_11

    and-int/lit16 v13, v13, 0x1fff

    const/16 v15, 0xd

    :goto_9
    add-int/lit8 v16, v14, 0x1

    .line 20
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v6, :cond_10

    and-int/lit16 v14, v14, 0x1fff

    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    add-int/lit8 v15, v15, 0xd

    move/from16 v14, v16

    goto :goto_9

    :cond_10
    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    move/from16 v14, v16

    :cond_11
    add-int/lit8 v15, v14, 0x1

    .line 21
    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    if-lt v14, v6, :cond_13

    and-int/lit16 v14, v14, 0x1fff

    const/16 v16, 0xd

    :goto_a
    add-int/lit8 v17, v15, 0x1

    .line 22
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-lt v15, v6, :cond_12

    and-int/lit16 v15, v15, 0x1fff

    shl-int v15, v15, v16

    or-int/2addr v14, v15

    add-int/lit8 v16, v16, 0xd

    move/from16 v15, v17

    goto :goto_a

    :cond_12
    shl-int v15, v15, v16

    or-int/2addr v14, v15

    move/from16 v15, v17

    :cond_13
    add-int/lit8 v16, v15, 0x1

    .line 23
    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    if-lt v15, v6, :cond_15

    and-int/lit16 v15, v15, 0x1fff

    move/from16 v2, v16

    const/16 v16, 0xd

    :goto_b
    add-int/lit8 v18, v2, 0x1

    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-lt v2, v6, :cond_14

    and-int/lit16 v2, v2, 0x1fff

    shl-int v2, v2, v16

    or-int/2addr v15, v2

    add-int/lit8 v16, v16, 0xd

    move/from16 v2, v18

    goto :goto_b

    :cond_14
    shl-int v2, v2, v16

    or-int/2addr v15, v2

    move/from16 v16, v18

    :cond_15
    add-int v2, v15, v13

    add-int/2addr v2, v14

    .line 25
    new-array v2, v2, [I

    mul-int/lit8 v14, v7, 0x2

    add-int/2addr v14, v8

    move v8, v11

    move v11, v12

    move-object v12, v2

    move v2, v7

    move/from16 v7, v16

    .line 26
    :goto_c
    sget-object v5, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 27
    invoke-virtual/range {p0 .. p0}, Ll/nlc0;->d()[Ljava/lang/Object;

    move-result-object v18

    .line 28
    invoke-virtual/range {p0 .. p0}, Ll/nlc0;->b()Landroidx/datastore/preferences/protobuf/b0;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    mul-int/lit8 v6, v11, 0x3

    .line 29
    new-array v6, v6, [I

    mul-int/lit8 v11, v11, 0x2

    .line 30
    new-array v11, v11, [Ljava/lang/Object;

    add-int/2addr v13, v15

    move/from16 v24, v13

    move/from16 v23, v15

    const/16 v21, 0x0

    const/16 v22, 0x0

    :goto_d
    if-ge v7, v1, :cond_33

    add-int/lit8 v25, v7, 0x1

    .line 31
    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    move/from16 v26, v1

    const v1, 0xd800

    if-lt v7, v1, :cond_17

    and-int/lit16 v7, v7, 0x1fff

    move/from16 v1, v25

    const/16 v25, 0xd

    :goto_e
    add-int/lit8 v27, v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    move/from16 v28, v2

    const v2, 0xd800

    if-lt v1, v2, :cond_16

    and-int/lit16 v1, v1, 0x1fff

    shl-int v1, v1, v25

    or-int/2addr v7, v1

    add-int/lit8 v25, v25, 0xd

    move/from16 v1, v27

    move/from16 v2, v28

    goto :goto_e

    :cond_16
    shl-int v1, v1, v25

    or-int/2addr v7, v1

    move/from16 v1, v27

    goto :goto_f

    :cond_17
    move/from16 v28, v2

    move/from16 v1, v25

    :goto_f
    add-int/lit8 v2, v1, 0x1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    move/from16 v25, v2

    const v2, 0xd800

    if-lt v1, v2, :cond_19

    and-int/lit16 v1, v1, 0x1fff

    move/from16 v2, v25

    const/16 v25, 0xd

    :goto_10
    add-int/lit8 v27, v2, 0x1

    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    move/from16 v29, v1

    const v1, 0xd800

    if-lt v2, v1, :cond_18

    and-int/lit16 v1, v2, 0x1fff

    shl-int v1, v1, v25

    or-int v1, v29, v1

    add-int/lit8 v25, v25, 0xd

    move/from16 v2, v27

    goto :goto_10

    :cond_18
    shl-int v1, v2, v25

    or-int v1, v29, v1

    move/from16 v2, v27

    goto :goto_11

    :cond_19
    move/from16 v2, v25

    :goto_11
    move/from16 v25, v4

    and-int/lit16 v4, v1, 0xff

    move-object/from16 v27, v6

    and-int/lit16 v6, v1, 0x400

    if-eqz v6, :cond_1a

    add-int/lit8 v6, v21, 0x1

    .line 35
    aput v22, v12, v21

    move/from16 v21, v6

    :cond_1a
    const/16 v6, 0x33

    move/from16 v31, v7

    if-lt v4, v6, :cond_22

    add-int/lit8 v6, v2, 0x1

    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const v7, 0xd800

    if-lt v2, v7, :cond_1c

    and-int/lit16 v2, v2, 0x1fff

    const/16 v33, 0xd

    :goto_12
    add-int/lit8 v34, v6, 0x1

    .line 37
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-lt v6, v7, :cond_1b

    and-int/lit16 v6, v6, 0x1fff

    shl-int v6, v6, v33

    or-int/2addr v2, v6

    add-int/lit8 v33, v33, 0xd

    move/from16 v6, v34

    const v7, 0xd800

    goto :goto_12

    :cond_1b
    shl-int v6, v6, v33

    or-int/2addr v2, v6

    move/from16 v6, v34

    :cond_1c
    add-int/lit8 v7, v4, -0x33

    move/from16 v33, v2

    const/16 v2, 0x9

    if-eq v7, v2, :cond_1e

    const/16 v2, 0x11

    if-ne v7, v2, :cond_1d

    goto :goto_14

    :cond_1d
    const/16 v2, 0xc

    if-ne v7, v2, :cond_1f

    and-int/lit8 v2, v25, 0x1

    const/4 v7, 0x1

    if-ne v2, v7, :cond_1f

    .line 38
    div-int/lit8 v2, v22, 0x3

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v7

    add-int/lit8 v7, v14, 0x1

    aget-object v14, v18, v14

    aput-object v14, v11, v2

    :goto_13
    move v14, v7

    goto :goto_15

    .line 39
    :cond_1e
    :goto_14
    div-int/lit8 v2, v22, 0x3

    mul-int/lit8 v2, v2, 0x2

    const/16 v20, 0x1

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v7, v14, 0x1

    aget-object v14, v18, v14

    aput-object v14, v11, v2

    goto :goto_13

    :cond_1f
    :goto_15
    mul-int/lit8 v2, v33, 0x2

    .line 40
    aget-object v7, v18, v2

    move/from16 v29, v2

    .line 41
    instance-of v2, v7, Ljava/lang/reflect/Field;

    if-eqz v2, :cond_20

    .line 42
    check-cast v7, Ljava/lang/reflect/Field;

    :goto_16
    move v2, v6

    goto :goto_17

    .line 43
    :cond_20
    check-cast v7, Ljava/lang/String;

    invoke-static {v3, v7}, Landroidx/datastore/preferences/protobuf/d0;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 44
    aput-object v7, v18, v29

    goto :goto_16

    .line 45
    :goto_17
    invoke-virtual {v5, v7}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v6

    long-to-int v6, v6

    add-int/lit8 v7, v29, 0x1

    move/from16 v29, v2

    .line 46
    aget-object v2, v18, v7

    move/from16 v30, v6

    .line 47
    instance-of v6, v2, Ljava/lang/reflect/Field;

    if-eqz v6, :cond_21

    .line 48
    check-cast v2, Ljava/lang/reflect/Field;

    goto :goto_18

    .line 49
    :cond_21
    check-cast v2, Ljava/lang/String;

    invoke-static {v3, v2}, Landroidx/datastore/preferences/protobuf/d0;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 50
    aput-object v2, v18, v7

    .line 51
    :goto_18
    invoke-virtual {v5, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v6

    long-to-int v2, v6

    move-object/from16 v32, v0

    move v0, v2

    move/from16 v7, v29

    move/from16 v6, v30

    const/4 v2, 0x0

    move/from16 v29, v8

    move v8, v14

    move v14, v9

    goto/16 :goto_23

    :cond_22
    add-int/lit8 v6, v14, 0x1

    .line 52
    aget-object v7, v18, v14

    check-cast v7, Ljava/lang/String;

    invoke-static {v3, v7}, Landroidx/datastore/preferences/protobuf/d0;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    move/from16 v33, v6

    const/16 v6, 0x9

    if-eq v4, v6, :cond_23

    const/16 v6, 0x11

    if-ne v4, v6, :cond_24

    :cond_23
    move/from16 v29, v8

    const/4 v8, 0x1

    goto/16 :goto_1c

    :cond_24
    const/16 v6, 0x1b

    if-eq v4, v6, :cond_25

    const/16 v6, 0x31

    if-ne v4, v6, :cond_26

    :cond_25
    move/from16 v29, v8

    const/4 v8, 0x1

    goto :goto_1b

    :cond_26
    const/16 v6, 0xc

    if-eq v4, v6, :cond_2a

    const/16 v6, 0x1e

    if-eq v4, v6, :cond_2a

    const/16 v6, 0x2c

    if-ne v4, v6, :cond_27

    goto :goto_19

    :cond_27
    const/16 v6, 0x32

    if-ne v4, v6, :cond_29

    add-int/lit8 v6, v23, 0x1

    .line 53
    aput v22, v12, v23

    .line 54
    div-int/lit8 v23, v22, 0x3

    mul-int/lit8 v23, v23, 0x2

    add-int/lit8 v29, v14, 0x2

    aget-object v30, v18, v33

    aput-object v30, v11, v23

    move/from16 v30, v6

    and-int/lit16 v6, v1, 0x800

    if-eqz v6, :cond_28

    add-int/lit8 v23, v23, 0x1

    add-int/lit8 v6, v14, 0x3

    .line 55
    aget-object v14, v18, v29

    aput-object v14, v11, v23

    move/from16 v29, v8

    move v14, v9

    move/from16 v23, v30

    goto :goto_1e

    :cond_28
    move v14, v9

    move/from16 v6, v29

    move/from16 v23, v30

    move/from16 v29, v8

    goto :goto_1e

    :cond_29
    move/from16 v29, v8

    const/4 v8, 0x1

    goto :goto_1d

    :cond_2a
    :goto_19
    and-int/lit8 v6, v25, 0x1

    move/from16 v29, v8

    const/4 v8, 0x1

    if-ne v6, v8, :cond_2b

    .line 56
    div-int/lit8 v6, v22, 0x3

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v8

    add-int/lit8 v14, v14, 0x2

    aget-object v20, v18, v33

    aput-object v20, v11, v6

    :goto_1a
    move v6, v14

    move v14, v9

    goto :goto_1e

    .line 57
    :goto_1b
    div-int/lit8 v6, v22, 0x3

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v8

    add-int/lit8 v14, v14, 0x2

    aget-object v20, v18, v33

    aput-object v20, v11, v6

    goto :goto_1a

    .line 58
    :goto_1c
    div-int/lit8 v6, v22, 0x3

    mul-int/lit8 v6, v6, 0x2

    add-int/2addr v6, v8

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v14

    aput-object v14, v11, v6

    :cond_2b
    :goto_1d
    move v14, v9

    move/from16 v6, v33

    .line 59
    :goto_1e
    invoke-virtual {v5, v7}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v8

    long-to-int v7, v8

    and-int/lit8 v8, v25, 0x1

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2f

    const/16 v8, 0x11

    if-gt v4, v8, :cond_2f

    add-int/lit8 v8, v2, 0x1

    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const v9, 0xd800

    if-lt v2, v9, :cond_2d

    and-int/lit16 v2, v2, 0x1fff

    const/16 v19, 0xd

    :goto_1f
    add-int/lit8 v30, v8, 0x1

    .line 61
    invoke-virtual {v0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-lt v8, v9, :cond_2c

    and-int/lit16 v8, v8, 0x1fff

    shl-int v8, v8, v19

    or-int/2addr v2, v8

    add-int/lit8 v19, v19, 0xd

    move/from16 v8, v30

    goto :goto_1f

    :cond_2c
    shl-int v8, v8, v19

    or-int/2addr v2, v8

    goto :goto_20

    :cond_2d
    move/from16 v30, v8

    :goto_20
    mul-int/lit8 v8, v28, 0x2

    .line 62
    div-int/lit8 v19, v2, 0x20

    add-int v8, v8, v19

    .line 63
    aget-object v9, v18, v8

    move-object/from16 v32, v0

    .line 64
    instance-of v0, v9, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_2e

    .line 65
    check-cast v9, Ljava/lang/reflect/Field;

    goto :goto_21

    .line 66
    :cond_2e
    check-cast v9, Ljava/lang/String;

    invoke-static {v3, v9}, Landroidx/datastore/preferences/protobuf/d0;->n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    .line 67
    aput-object v9, v18, v8

    .line 68
    :goto_21
    invoke-virtual {v5, v9}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v8

    long-to-int v0, v8

    .line 69
    rem-int/lit8 v2, v2, 0x20

    goto :goto_22

    :cond_2f
    move-object/from16 v32, v0

    move/from16 v30, v2

    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_22
    const/16 v8, 0x12

    if-lt v4, v8, :cond_30

    const/16 v8, 0x31

    if-gt v4, v8, :cond_30

    add-int/lit8 v8, v24, 0x1

    .line 70
    aput v7, v12, v24

    move/from16 v24, v8

    :cond_30
    move v8, v6

    move v6, v7

    move/from16 v7, v30

    :goto_23
    add-int/lit8 v9, v22, 0x1

    .line 71
    aput v31, v27, v22

    add-int/lit8 v30, v22, 0x2

    move/from16 v31, v0

    and-int/lit16 v0, v1, 0x200

    if-eqz v0, :cond_31

    const/high16 v0, 0x20000000

    goto :goto_24

    :cond_31
    const/4 v0, 0x0

    :goto_24
    and-int/lit16 v1, v1, 0x100

    if-eqz v1, :cond_32

    const/high16 v1, 0x10000000

    goto :goto_25

    :cond_32
    const/4 v1, 0x0

    :goto_25
    or-int/2addr v0, v1

    shl-int/lit8 v1, v4, 0x14

    or-int/2addr v0, v1

    or-int/2addr v0, v6

    .line 72
    aput v0, v27, v9

    add-int/lit8 v22, v22, 0x3

    shl-int/lit8 v0, v2, 0x14

    or-int v0, v0, v31

    .line 73
    aput v0, v27, v30

    move v9, v14

    move/from16 v4, v25

    move/from16 v1, v26

    move-object/from16 v6, v27

    move/from16 v2, v28

    move-object/from16 v0, v32

    move v14, v8

    move/from16 v8, v29

    goto/16 :goto_d

    :cond_33
    move-object/from16 v27, v6

    move/from16 v29, v8

    move v14, v9

    .line 74
    new-instance v4, Landroidx/datastore/preferences/protobuf/d0;

    .line 75
    invoke-virtual/range {p0 .. p0}, Ll/nlc0;->b()Landroidx/datastore/preferences/protobuf/b0;

    move-result-object v9

    move-object v6, v11

    const/4 v11, 0x0

    move-object/from16 v16, p2

    move-object/from16 v17, p3

    move-object/from16 v18, p4

    move-object/from16 v19, p5

    move v7, v14

    move-object/from16 v5, v27

    move v14, v13

    move v13, v15

    move-object/from16 v15, p1

    invoke-direct/range {v4 .. v19}, Landroidx/datastore/preferences/protobuf/d0;-><init>([I[Ljava/lang/Object;IILandroidx/datastore/preferences/protobuf/b0;ZZ[IIILl/v130;Landroidx/datastore/preferences/protobuf/w;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Landroidx/datastore/preferences/protobuf/z;)V

    return-object v4
.end method

.method public static V(I)J
    .locals 2

    .line 1
    const v0, 0xfffff

    and-int/2addr p0, v0

    int-to-long v0, p0

    return-wide v0
.end method

.method public static W(Ljava/lang/Object;J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static X(Ljava/lang/Object;J)D
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)D"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Double;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public static Y(Ljava/lang/Object;J)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)F"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static Z(Ljava/lang/Object;J)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)I"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static a0(Ljava/lang/Object;J)J
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)J"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public static l(Ljava/lang/Object;J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->r(Ljava/lang/Object;J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static n0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    array-length v1, v0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_1

    .line 13
    .line 14
    aget-object v3, v0, v2

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    return-object v3

    .line 27
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, p0, v0}, Ll/ikx0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public static o(Ljava/lang/Object;J)D
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)D"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->y(Ljava/lang/Object;J)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static r0(I)I
    .locals 1

    .line 1
    const/high16 v0, 0xff00000

    and-int/2addr p0, v0

    ushr-int/lit8 p0, p0, 0x14

    return p0
.end method

.method public static s(Ljava/lang/Object;J)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;J)F"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ll/lyj0;->z(Ljava/lang/Object;J)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static w(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/m0;
    .locals 2

    .line 1
    check-cast p0, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 4
    .line 5
    invoke-static {}, Landroidx/datastore/preferences/protobuf/m0;->e()Landroidx/datastore/preferences/protobuf/m0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Landroidx/datastore/preferences/protobuf/m0;->l()Landroidx/datastore/preferences/protobuf/m0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 16
    .line 17
    :cond_0
    return-object v0
.end method


# virtual methods
.method public final C(Ljava/lang/Object;I)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_11

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    invoke-static {p0}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const-wide/16 v5, 0x0

    .line 20
    .line 21
    packed-switch p0, :pswitch_data_0

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/fig0;->a()V

    .line 25
    .line 26
    .line 27
    return v1

    .line 28
    :pswitch_0
    invoke-static {p1, v3, v4}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    return v2

    .line 35
    :cond_0
    return v1

    .line 36
    :pswitch_1
    invoke-static {p1, v3, v4}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    cmp-long p0, p0, v5

    .line 41
    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    return v2

    .line 45
    :cond_1
    return v1

    .line 46
    :pswitch_2
    invoke-static {p1, v3, v4}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    return v2

    .line 53
    :cond_2
    return v1

    .line 54
    :pswitch_3
    invoke-static {p1, v3, v4}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 55
    .line 56
    .line 57
    move-result-wide p0

    .line 58
    cmp-long p0, p0, v5

    .line 59
    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    return v2

    .line 63
    :cond_3
    return v1

    .line 64
    :pswitch_4
    invoke-static {p1, v3, v4}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    return v2

    .line 71
    :cond_4
    return v1

    .line 72
    :pswitch_5
    invoke-static {p1, v3, v4}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_5

    .line 77
    .line 78
    return v2

    .line 79
    :cond_5
    return v1

    .line 80
    :pswitch_6
    invoke-static {p1, v3, v4}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_6

    .line 85
    .line 86
    return v2

    .line 87
    :cond_6
    return v1

    .line 88
    :pswitch_7
    sget-object p0, Landroidx/datastore/preferences/protobuf/ByteString;->EMPTY:Landroidx/datastore/preferences/protobuf/ByteString;

    .line 89
    .line 90
    invoke-static {p1, v3, v4}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/ByteString;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    :goto_0
    xor-int/2addr p0, v2

    .line 99
    return p0

    .line 100
    :pswitch_8
    invoke-static {p1, v3, v4}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    if-eqz p0, :cond_7

    .line 105
    .line 106
    return v2

    .line 107
    :cond_7
    return v1

    .line 108
    :pswitch_9
    invoke-static {p1, v3, v4}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    instance-of p1, p0, Ljava/lang/String;

    .line 113
    .line 114
    if-eqz p1, :cond_8

    .line 115
    .line 116
    check-cast p0, Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    goto :goto_0

    .line 123
    :cond_8
    instance-of p1, p0, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 124
    .line 125
    if-eqz p1, :cond_9

    .line 126
    .line 127
    sget-object p1, Landroidx/datastore/preferences/protobuf/ByteString;->EMPTY:Landroidx/datastore/preferences/protobuf/ByteString;

    .line 128
    .line 129
    invoke-virtual {p1, p0}, Landroidx/datastore/preferences/protobuf/ByteString;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    goto :goto_0

    .line 134
    :cond_9
    invoke-static {}, Ll/fig0;->a()V

    .line 135
    .line 136
    .line 137
    return v1

    .line 138
    :pswitch_a
    invoke-static {p1, v3, v4}, Ll/lyj0;->r(Ljava/lang/Object;J)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    return p0

    .line 143
    :pswitch_b
    invoke-static {p1, v3, v4}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_a

    .line 148
    .line 149
    return v2

    .line 150
    :cond_a
    return v1

    .line 151
    :pswitch_c
    invoke-static {p1, v3, v4}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 152
    .line 153
    .line 154
    move-result-wide p0

    .line 155
    cmp-long p0, p0, v5

    .line 156
    .line 157
    if-eqz p0, :cond_b

    .line 158
    .line 159
    return v2

    .line 160
    :cond_b
    return v1

    .line 161
    :pswitch_d
    invoke-static {p1, v3, v4}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_c

    .line 166
    .line 167
    return v2

    .line 168
    :cond_c
    return v1

    .line 169
    :pswitch_e
    invoke-static {p1, v3, v4}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 170
    .line 171
    .line 172
    move-result-wide p0

    .line 173
    cmp-long p0, p0, v5

    .line 174
    .line 175
    if-eqz p0, :cond_d

    .line 176
    .line 177
    return v2

    .line 178
    :cond_d
    return v1

    .line 179
    :pswitch_f
    invoke-static {p1, v3, v4}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 180
    .line 181
    .line 182
    move-result-wide p0

    .line 183
    cmp-long p0, p0, v5

    .line 184
    .line 185
    if-eqz p0, :cond_e

    .line 186
    .line 187
    return v2

    .line 188
    :cond_e
    return v1

    .line 189
    :pswitch_10
    invoke-static {p1, v3, v4}, Ll/lyj0;->z(Ljava/lang/Object;J)F

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    const/4 p1, 0x0

    .line 194
    cmpl-float p0, p0, p1

    .line 195
    .line 196
    if-eqz p0, :cond_f

    .line 197
    .line 198
    return v2

    .line 199
    :cond_f
    return v1

    .line 200
    :pswitch_11
    invoke-static {p1, v3, v4}, Ll/lyj0;->y(Ljava/lang/Object;J)D

    .line 201
    .line 202
    .line 203
    move-result-wide p0

    .line 204
    const-wide/16 v3, 0x0

    .line 205
    .line 206
    cmpl-double p0, p0, v3

    .line 207
    .line 208
    if-eqz p0, :cond_10

    .line 209
    .line 210
    return v2

    .line 211
    :cond_10
    return v1

    .line 212
    :cond_11
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/d0;->i0(I)I

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    ushr-int/lit8 p2, p0, 0x14

    .line 217
    .line 218
    shl-int p2, v2, p2

    .line 219
    .line 220
    const v0, 0xfffff

    .line 221
    .line 222
    .line 223
    and-int/2addr p0, v0

    .line 224
    int-to-long v3, p0

    .line 225
    invoke-static {p1, v3, v4}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    and-int/2addr p0, p2

    .line 230
    if-eqz p0, :cond_12

    .line 231
    .line 232
    return v2

    .line 233
    :cond_12
    return v1

    .line 234
    nop

    .line 235
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final D(Ljava/lang/Object;III)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;III)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    and-int p0, p3, p4

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final F(Ljava/lang/Object;II)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "II)Z"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {p1, v0, v1}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p2, 0x0

    .line 24
    move p3, p2

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ge p3, v1, :cond_2

    .line 30
    .line 31
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {p0, v1}, Landroidx/datastore/preferences/protobuf/i0;->b(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    return p2

    .line 42
    :cond_1
    add-int/lit8 p3, p3, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return v0
.end method

.method public final G(Ljava/lang/Object;II)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 2
    .line 3
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {v0, p1}, Landroidx/datastore/preferences/protobuf/z;->g(Ljava/lang/Object;)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 v0, 0x1

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->u(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 28
    .line 29
    invoke-interface {p0, p2}, Landroidx/datastore/preferences/protobuf/z;->b(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/y$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/y$a;->c:Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;->getJavaType()Landroidx/datastore/preferences/protobuf/WireFormat$JavaType;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object p2, Landroidx/datastore/preferences/protobuf/WireFormat$JavaType;->MESSAGE:Landroidx/datastore/preferences/protobuf/WireFormat$JavaType;

    .line 40
    .line 41
    if-eq p0, p2, :cond_1

    .line 42
    .line 43
    return v0

    .line 44
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/4 p1, 0x0

    .line 53
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-eqz p2, :cond_4

    .line 58
    .line 59
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    if-nez p1, :cond_3

    .line 64
    .line 65
    invoke-static {}, Ll/g7b0;->a()Ll/g7b0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {p1, p3}, Ll/g7b0;->d(Ljava/lang/Class;)Landroidx/datastore/preferences/protobuf/i0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :cond_3
    invoke-interface {p1, p2}, Landroidx/datastore/preferences/protobuf/i0;->b(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-nez p2, :cond_2

    .line 82
    .line 83
    const/4 p0, 0x0

    .line 84
    return p0

    .line 85
    :cond_4
    return v0
.end method

.method public final H(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {p2, v0, v1}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-ne p0, p1, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public final I(Ljava/lang/Object;II)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ne p0, p2, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final M(Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/h0;Landroidx/datastore/preferences/protobuf/l;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            "ET::",
            "Landroidx/datastore/preferences/protobuf/p$b<",
            "TET;>;>(",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "TUT;TUB;>;",
            "Landroidx/datastore/preferences/protobuf/m<",
            "TET;>;TT;",
            "Landroidx/datastore/preferences/protobuf/h0;",
            "Landroidx/datastore/preferences/protobuf/l;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v9, p3

    move-object/from16 v5, p5

    const/4 v0, 0x0

    move-object v7, v0

    move-object v10, v7

    .line 1
    :cond_0
    :goto_0
    :try_start_0
    invoke-interface/range {p4 .. p4}, Landroidx/datastore/preferences/protobuf/h0;->o()I

    move-result v2

    .line 2
    invoke-virtual {p0, v2}, Landroidx/datastore/preferences/protobuf/d0;->g0(I)I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-gez v3, :cond_b

    const v3, 0x7fffffff

    if-ne v2, v3, :cond_2

    .line 3
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    :goto_1
    iget v2, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    if-ge v0, v2, :cond_1

    .line 4
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    aget v2, v2, v0

    .line 5
    invoke-virtual {p0, v9, v2, v7, p1}, Landroidx/datastore/preferences/protobuf/d0;->q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    if-eqz v7, :cond_19

    .line 6
    :goto_2
    invoke-virtual {p1, v9, v7}, Landroidx/datastore/preferences/protobuf/l0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_15

    .line 7
    :cond_2
    :try_start_1
    iget-boolean v3, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    if-nez v3, :cond_3

    move-object/from16 v4, p2

    move-object v2, v0

    goto :goto_3

    :cond_3
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/d0;->e:Landroidx/datastore/preferences/protobuf/b0;

    move-object/from16 v4, p2

    .line 8
    invoke-virtual {v4, v5, v3, v2}, Landroidx/datastore/preferences/protobuf/m;->b(Landroidx/datastore/preferences/protobuf/l;Landroidx/datastore/preferences/protobuf/b0;I)Ljava/lang/Object;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_3
    if-eqz v2, :cond_5

    if-nez v10, :cond_4

    .line 9
    :try_start_2
    invoke-virtual/range {p2 .. p3}, Landroidx/datastore/preferences/protobuf/m;->d(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    move-result-object v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_4
    move-object v3, v4

    move-object v4, v2

    move-object v2, v3

    move-object v8, p1

    move-object/from16 v3, p4

    move-object v6, v10

    goto :goto_4

    :catchall_0
    move-exception v0

    goto/16 :goto_16

    .line 10
    :goto_4
    :try_start_3
    invoke-virtual/range {v2 .. v8}, Landroidx/datastore/preferences/protobuf/m;->g(Landroidx/datastore/preferences/protobuf/h0;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l;Landroidx/datastore/preferences/protobuf/p;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v4, v3

    move-object v10, v6

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object v11, v7

    goto/16 :goto_16

    :cond_5
    move-object/from16 v4, p4

    move-object v11, v7

    .line 11
    :try_start_4
    invoke-virtual {p1, v4}, Landroidx/datastore/preferences/protobuf/l0;->q(Landroidx/datastore/preferences/protobuf/h0;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 12
    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->r()Z

    move-result v2

    if-eqz v2, :cond_6

    :goto_5
    move-object v7, v11

    goto :goto_0

    :cond_6
    move-object v7, v11

    goto :goto_8

    :catchall_2
    move-exception v0

    :goto_6
    move-object v7, v11

    goto/16 :goto_16

    :cond_7
    if-nez v11, :cond_8

    .line 13
    invoke-virtual {p1, v9}, Landroidx/datastore/preferences/protobuf/l0;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-object v7, v2

    goto :goto_7

    :cond_8
    move-object v7, v11

    .line 14
    :goto_7
    :try_start_5
    invoke-virtual {p1, v7, v4}, Landroidx/datastore/preferences/protobuf/l0;->m(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/h0;)Z

    move-result v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v2, :cond_9

    goto :goto_0

    .line 15
    :cond_9
    :goto_8
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    :goto_9
    iget v2, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    if-ge v0, v2, :cond_a

    .line 16
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    aget v2, v2, v0

    .line 17
    invoke-virtual {p0, v9, v2, v7, p1}, Landroidx/datastore/preferences/protobuf/d0;->q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_a
    if-eqz v7, :cond_19

    goto :goto_2

    :cond_b
    move-object/from16 v4, p4

    move-object v11, v7

    .line 18
    :try_start_6
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    move-result v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 19
    :try_start_7
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    move-result v7

    packed-switch v7, :pswitch_data_0

    if-nez v11, :cond_c

    .line 20
    invoke-virtual {p1}, Landroidx/datastore/preferences/protobuf/l0;->n()Ljava/lang/Object;

    move-result-object v2
    :try_end_7
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-object v7, v2

    goto :goto_b

    :catch_0
    :goto_a
    move-object v7, v11

    goto/16 :goto_12

    :cond_c
    move-object v7, v11

    .line 21
    :goto_b
    :try_start_8
    invoke-virtual {p1, v7, v4}, Landroidx/datastore/preferences/protobuf/l0;->m(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/h0;)Z

    move-result v2
    :try_end_8
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_8 .. :try_end_8} :catch_5
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    if-nez v2, :cond_0

    .line 22
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    :goto_c
    iget v2, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    if-ge v0, v2, :cond_d

    .line 23
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    aget v2, v2, v0

    .line 24
    invoke-virtual {p0, v9, v2, v7, p1}, Landroidx/datastore/preferences/protobuf/d0;->q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_d
    if-eqz v7, :cond_19

    goto/16 :goto_2

    .line 25
    :pswitch_0
    :try_start_9
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    .line 26
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v12

    invoke-interface {v4, v12, v5}, Landroidx/datastore/preferences/protobuf/h0;->h(Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)Ljava/lang/Object;

    move-result-object v12

    .line 27
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 28
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto :goto_5

    .line 29
    :pswitch_1
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->K()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 30
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 31
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 32
    :pswitch_2
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->e()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 33
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 34
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 35
    :pswitch_3
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->b()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 36
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 37
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 38
    :pswitch_4
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->N()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 39
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 40
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 41
    :pswitch_5
    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->d()I

    move-result v7

    .line 42
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    move-result-object v12

    if-eqz v12, :cond_f

    .line 43
    invoke-interface {v12, v7}, Landroidx/datastore/preferences/protobuf/s$e;->a(I)Z

    move-result v12

    if-eqz v12, :cond_e

    goto :goto_d

    .line 44
    :cond_e
    invoke-static {v2, v7, v11, p1}, Landroidx/datastore/preferences/protobuf/j0;->L(IILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    goto/16 :goto_0

    .line 45
    :cond_f
    :goto_d
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v12

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v9, v12, v13, v6}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 47
    :pswitch_6
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->c()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 48
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 49
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 50
    :pswitch_7
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->g()Landroidx/datastore/preferences/protobuf/ByteString;

    move-result-object v12

    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 51
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 52
    :pswitch_8
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 53
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v12

    invoke-static {v9, v12, v13}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v7

    .line 54
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v12

    .line 55
    invoke-interface {v4, v12, v5}, Landroidx/datastore/preferences/protobuf/h0;->v(Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)Ljava/lang/Object;

    move-result-object v12

    .line 56
    invoke-static {v7, v12}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 57
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v12

    invoke-static {v9, v12, v13, v7}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_e

    .line 58
    :cond_10
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    .line 59
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v12

    .line 60
    invoke-interface {v4, v12, v5}, Landroidx/datastore/preferences/protobuf/h0;->v(Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)Ljava/lang/Object;

    move-result-object v12

    .line 61
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 62
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 63
    :goto_e
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 64
    :pswitch_9
    invoke-virtual {p0, v9, v6, v4}, Landroidx/datastore/preferences/protobuf/d0;->l0(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/h0;)V

    .line 65
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 66
    :pswitch_a
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->y()Z

    move-result v12

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    .line 67
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 68
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 69
    :pswitch_b
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->H()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 70
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 71
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 72
    :pswitch_c
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->w()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 73
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 74
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 75
    :pswitch_d
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->D()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 76
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 77
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 78
    :pswitch_e
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->j()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 79
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 80
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 81
    :pswitch_f
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->u()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 82
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 83
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 84
    :pswitch_10
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->readFloat()F

    move-result v12

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    .line 85
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 86
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    goto/16 :goto_5

    .line 87
    :pswitch_11
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->readDouble()D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    .line 88
    invoke-static {v9, v6, v7, v12}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 89
    invoke-virtual {p0, v9, v2, v3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V
    :try_end_9
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto/16 :goto_5

    .line 90
    :pswitch_12
    :try_start_a
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->u(I)Ljava/lang/Object;

    move-result-object v4

    move-object v1, p0

    move-object/from16 v6, p4

    move-object v2, v9

    invoke-virtual/range {v1 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->N(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l;Landroidx/datastore/preferences/protobuf/h0;)V

    move-object/from16 v9, p3

    move-object/from16 v4, p4

    :goto_f
    move-object/from16 v5, p5

    goto/16 :goto_5

    :catchall_3
    move-exception v0

    move-object/from16 v9, p3

    goto/16 :goto_6

    :catch_1
    move-object/from16 v9, p3

    move-object/from16 v4, p4

    :catch_2
    move-object/from16 v5, p5

    goto/16 :goto_a

    .line 91
    :pswitch_13
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v4

    .line 92
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v6
    :try_end_a
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    move-object v1, p0

    move-object/from16 v2, p3

    move-object/from16 v7, p5

    move-wide v3, v4

    move-object/from16 v5, p4

    .line 93
    :try_start_b
    invoke-virtual/range {v1 .. v7}, Landroidx/datastore/preferences/protobuf/d0;->j0(Ljava/lang/Object;JLandroidx/datastore/preferences/protobuf/h0;Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)V
    :try_end_b
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    move-object v9, v2

    move-object v4, v5

    goto :goto_f

    :catchall_4
    move-exception v0

    move-object v9, v2

    goto/16 :goto_6

    :catch_3
    move-object v9, v2

    move-object v4, v5

    move-object v7, v11

    move-object/from16 v5, p5

    goto/16 :goto_12

    .line 94
    :pswitch_14
    :try_start_c
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 95
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 96
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->a(Ljava/util/List;)V

    goto :goto_f

    .line 97
    :pswitch_15
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 98
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 99
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->i(Ljava/util/List;)V

    goto :goto_f

    .line 100
    :pswitch_16
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 101
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 102
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->l(Ljava/util/List;)V

    goto :goto_f

    .line 103
    :pswitch_17
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 104
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 105
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->x(Ljava/util/List;)V

    goto :goto_f

    .line 106
    :pswitch_18
    iget-object v5, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 107
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v5, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    .line 108
    invoke-interface {v4, v5}, Landroidx/datastore/preferences/protobuf/h0;->B(Ljava/util/List;)V

    .line 109
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    move-result-object v3

    .line 110
    invoke-static {v2, v5, v3, v11, p1}, Landroidx/datastore/preferences/protobuf/j0;->A(ILjava/util/List;Landroidx/datastore/preferences/protobuf/s$e;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    :goto_10
    move-object/from16 v5, p5

    goto/16 :goto_0

    .line 111
    :pswitch_19
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 112
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 113
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->G(Ljava/util/List;)V

    goto/16 :goto_f

    .line 114
    :pswitch_1a
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 115
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 116
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->f(Ljava/util/List;)V

    goto/16 :goto_f

    .line 117
    :pswitch_1b
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 118
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 119
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->n(Ljava/util/List;)V

    goto/16 :goto_f

    .line 120
    :pswitch_1c
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 121
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 122
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->F(Ljava/util/List;)V

    goto/16 :goto_f

    .line 123
    :pswitch_1d
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 124
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 125
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->m(Ljava/util/List;)V

    goto/16 :goto_f

    .line 126
    :pswitch_1e
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 127
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 128
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->z(Ljava/util/List;)V

    goto/16 :goto_f

    .line 129
    :pswitch_1f
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 130
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 131
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->A(Ljava/util/List;)V

    goto/16 :goto_f

    .line 132
    :pswitch_20
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 133
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 134
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->q(Ljava/util/List;)V

    goto/16 :goto_f

    .line 135
    :pswitch_21
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 136
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 137
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->t(Ljava/util/List;)V

    goto/16 :goto_f

    .line 138
    :pswitch_22
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 139
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 140
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->a(Ljava/util/List;)V

    goto/16 :goto_f

    .line 141
    :pswitch_23
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 142
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 143
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->i(Ljava/util/List;)V

    goto/16 :goto_f

    .line 144
    :pswitch_24
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 145
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 146
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->l(Ljava/util/List;)V

    goto/16 :goto_f

    .line 147
    :pswitch_25
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 148
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 149
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->x(Ljava/util/List;)V

    goto/16 :goto_f

    .line 150
    :pswitch_26
    iget-object v5, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 151
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v5, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v5

    .line 152
    invoke-interface {v4, v5}, Landroidx/datastore/preferences/protobuf/h0;->B(Ljava/util/List;)V

    .line 153
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    move-result-object v3

    .line 154
    invoke-static {v2, v5, v3, v11, p1}, Landroidx/datastore/preferences/protobuf/j0;->A(ILjava/util/List;Landroidx/datastore/preferences/protobuf/s$e;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    goto/16 :goto_10

    .line 155
    :pswitch_27
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 156
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 157
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->G(Ljava/util/List;)V

    goto/16 :goto_f

    .line 158
    :pswitch_28
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 159
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v5

    invoke-virtual {v2, v9, v5, v6}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 160
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->s(Ljava/util/List;)V

    goto/16 :goto_f

    .line 161
    :pswitch_29
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v5
    :try_end_c
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    move-object v1, p0

    move v3, v6

    move-object v2, v9

    move-object/from16 v6, p5

    .line 162
    :try_start_d
    invoke-virtual/range {v1 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->k0(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/h0;Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)V
    :try_end_d
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    move-object v9, v2

    move-object v5, v6

    goto/16 :goto_5

    :catch_4
    move-object v9, v2

    move-object v5, v6

    goto/16 :goto_a

    .line 163
    :pswitch_2a
    :try_start_e
    invoke-virtual {p0, v9, v6, v4}, Landroidx/datastore/preferences/protobuf/d0;->m0(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/h0;)V

    goto/16 :goto_5

    .line 164
    :pswitch_2b
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 165
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 166
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->f(Ljava/util/List;)V

    goto/16 :goto_5

    .line 167
    :pswitch_2c
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 168
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 169
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->n(Ljava/util/List;)V

    goto/16 :goto_5

    .line 170
    :pswitch_2d
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 171
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 172
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->F(Ljava/util/List;)V

    goto/16 :goto_5

    .line 173
    :pswitch_2e
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 174
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 175
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->m(Ljava/util/List;)V

    goto/16 :goto_5

    .line 176
    :pswitch_2f
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 177
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 178
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->z(Ljava/util/List;)V

    goto/16 :goto_5

    .line 179
    :pswitch_30
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 180
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 181
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->A(Ljava/util/List;)V

    goto/16 :goto_5

    .line 182
    :pswitch_31
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 183
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 184
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->q(Ljava/util/List;)V

    goto/16 :goto_5

    .line 185
    :pswitch_32
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 186
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-virtual {v2, v9, v6, v7}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    move-result-object v2

    .line 187
    invoke-interface {v4, v2}, Landroidx/datastore/preferences/protobuf/h0;->t(Ljava/util/List;)V

    goto/16 :goto_5

    .line 188
    :pswitch_33
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 189
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v12

    invoke-static {v9, v12, v13}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 190
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v3

    .line 191
    invoke-interface {v4, v3, v5}, Landroidx/datastore/preferences/protobuf/h0;->h(Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)Ljava/lang/Object;

    move-result-object v3

    .line 192
    invoke-static {v2, v3}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 193
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_5

    .line 194
    :cond_11
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    .line 195
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v2

    .line 196
    invoke-interface {v4, v2, v5}, Landroidx/datastore/preferences/protobuf/h0;->h(Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)Ljava/lang/Object;

    move-result-object v2

    .line 197
    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 198
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 199
    :pswitch_34
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->K()J

    move-result-wide v12

    invoke-static {v9, v6, v7, v12, v13}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 200
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 201
    :pswitch_35
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->e()I

    move-result v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 202
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 203
    :pswitch_36
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->b()J

    move-result-wide v12

    invoke-static {v9, v6, v7, v12, v13}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 204
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 205
    :pswitch_37
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->N()I

    move-result v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 206
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 207
    :pswitch_38
    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->d()I

    move-result v7

    .line 208
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    move-result-object v12

    if-eqz v12, :cond_13

    .line 209
    invoke-interface {v12, v7}, Landroidx/datastore/preferences/protobuf/s$e;->a(I)Z

    move-result v12

    if-eqz v12, :cond_12

    goto :goto_11

    .line 210
    :cond_12
    invoke-static {v2, v7, v11, p1}, Landroidx/datastore/preferences/protobuf/j0;->L(IILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    goto/16 :goto_0

    .line 211
    :cond_13
    :goto_11
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v12

    invoke-static {v9, v12, v13, v7}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 212
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 213
    :pswitch_39
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->c()I

    move-result v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 214
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 215
    :pswitch_3a
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->g()Landroidx/datastore/preferences/protobuf/ByteString;

    move-result-object v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 216
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 217
    :pswitch_3b
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 218
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v12

    invoke-static {v9, v12, v13}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    .line 219
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v3

    .line 220
    invoke-interface {v4, v3, v5}, Landroidx/datastore/preferences/protobuf/h0;->v(Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)Ljava/lang/Object;

    move-result-object v3

    .line 221
    invoke-static {v2, v3}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 222
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_5

    .line 223
    :cond_14
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    .line 224
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v2

    .line 225
    invoke-interface {v4, v2, v5}, Landroidx/datastore/preferences/protobuf/h0;->v(Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)Ljava/lang/Object;

    move-result-object v2

    .line 226
    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 227
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 228
    :pswitch_3c
    invoke-virtual {p0, v9, v6, v4}, Landroidx/datastore/preferences/protobuf/d0;->l0(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/h0;)V

    .line 229
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 230
    :pswitch_3d
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->y()Z

    move-result v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->J(Ljava/lang/Object;JZ)V

    .line 231
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 232
    :pswitch_3e
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->H()I

    move-result v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 233
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 234
    :pswitch_3f
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->w()J

    move-result-wide v12

    invoke-static {v9, v6, v7, v12, v13}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 235
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 236
    :pswitch_40
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->D()I

    move-result v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 237
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 238
    :pswitch_41
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->j()J

    move-result-wide v12

    invoke-static {v9, v6, v7, v12, v13}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 239
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 240
    :pswitch_42
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->u()J

    move-result-wide v12

    invoke-static {v9, v6, v7, v12, v13}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 241
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 242
    :pswitch_43
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->readFloat()F

    move-result v2

    invoke-static {v9, v6, v7, v2}, Ll/lyj0;->Q(Ljava/lang/Object;JF)V

    .line 243
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    goto/16 :goto_5

    .line 244
    :pswitch_44
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v6

    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->readDouble()D

    move-result-wide v12

    invoke-static {v9, v6, v7, v12, v13}, Ll/lyj0;->P(Ljava/lang/Object;JD)V

    .line 245
    invoke-virtual {p0, v9, v3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V
    :try_end_e
    .catch Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException$InvalidWireTypeException; {:try_start_e .. :try_end_e} :catch_0
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    goto/16 :goto_5

    .line 246
    :catch_5
    :goto_12
    :try_start_f
    invoke-virtual {p1, v4}, Landroidx/datastore/preferences/protobuf/l0;->q(Landroidx/datastore/preferences/protobuf/h0;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 247
    invoke-interface {v4}, Landroidx/datastore/preferences/protobuf/h0;->r()Z

    move-result v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    if-nez v2, :cond_0

    .line 248
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    :goto_13
    iget v2, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    if-ge v0, v2, :cond_15

    .line 249
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    aget v2, v2, v0

    .line 250
    invoke-virtual {p0, v9, v2, v7, p1}, Landroidx/datastore/preferences/protobuf/d0;->q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    :cond_15
    if-eqz v7, :cond_19

    goto/16 :goto_2

    :cond_16
    if-nez v7, :cond_17

    .line 251
    :try_start_10
    invoke-virtual {p1, v9}, Landroidx/datastore/preferences/protobuf/l0;->f(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    .line 252
    :cond_17
    invoke-virtual {p1, v7, v4}, Landroidx/datastore/preferences/protobuf/l0;->m(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/h0;)Z

    move-result v2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    if-nez v2, :cond_0

    .line 253
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    :goto_14
    iget v2, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    if-ge v0, v2, :cond_18

    .line 254
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    aget v2, v2, v0

    .line 255
    invoke-virtual {p0, v9, v2, v7, p1}, Landroidx/datastore/preferences/protobuf/d0;->q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_18
    if-eqz v7, :cond_19

    goto/16 :goto_2

    :cond_19
    :goto_15
    return-void

    .line 256
    :goto_16
    iget v2, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    :goto_17
    iget v3, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    if-ge v2, v3, :cond_1a

    .line 257
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    aget v3, v3, v2

    .line 258
    invoke-virtual {p0, v9, v3, v7, p1}, Landroidx/datastore/preferences/protobuf/d0;->q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    :cond_1a
    if-eqz v7, :cond_1b

    .line 259
    invoke-virtual {p1, v9, v7}, Landroidx/datastore/preferences/protobuf/l0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 260
    :cond_1b
    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final N(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l;Landroidx/datastore/preferences/protobuf/h0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Object;",
            "Landroidx/datastore/preferences/protobuf/l;",
            "Landroidx/datastore/preferences/protobuf/h0;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {p1, v0, v1}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 14
    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    invoke-interface {v2, p3}, Landroidx/datastore/preferences/protobuf/z;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p1, v0, v1, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-interface {v2, p2}, Landroidx/datastore/preferences/protobuf/z;->h(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 32
    .line 33
    invoke-interface {v2, p3}, Landroidx/datastore/preferences/protobuf/z;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 38
    .line 39
    invoke-interface {v3, v2, p2}, Landroidx/datastore/preferences/protobuf/z;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0, v1, v2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    move-object p2, v2

    .line 46
    :cond_1
    :goto_0
    iget-object p1, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 47
    .line 48
    invoke-interface {p1, p2}, Landroidx/datastore/preferences/protobuf/z;->e(Ljava/lang/Object;)Ljava/util/Map;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 53
    .line 54
    invoke-interface {p0, p3}, Landroidx/datastore/preferences/protobuf/z;->b(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/y$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p5, p1, p0, p4}, Landroidx/datastore/preferences/protobuf/h0;->J(Ljava/util/Map;Landroidx/datastore/preferences/protobuf/y$a;Landroidx/datastore/preferences/protobuf/l;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final O(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p1, v0, v1}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {p2, v0, v1}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    invoke-static {v2, p2}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p1, v0, v1, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    if-eqz p2, :cond_2

    .line 40
    .line 41
    invoke-static {p1, v0, v1, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method

.method public final P(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    invoke-virtual {p0, p2, v1, p3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p1, v2, v3}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p2, v2, v3}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    invoke-static {v0, p2}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p1, v2, v3, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, v1, p3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    if-eqz p2, :cond_2

    .line 44
    .line 45
    invoke-static {p1, v2, v3, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, v1, p3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void
.end method

.method public final Q(Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    packed-switch v0, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :pswitch_0
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->P(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_1
    invoke-virtual {p0, p2, v3, p3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, v3, p3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_2
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->P(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :pswitch_3
    invoke-virtual {p0, p2, v3, p3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1, v3, p3}, Landroidx/datastore/preferences/protobuf/d0;->p0(Ljava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_4
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 65
    .line 66
    invoke-static {p0, p1, p2, v1, v2}, Landroidx/datastore/preferences/protobuf/j0;->F(Landroidx/datastore/preferences/protobuf/z;Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :pswitch_5
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 71
    .line 72
    invoke-virtual {p0, p1, p2, v1, v2}, Landroidx/datastore/preferences/protobuf/w;->d(Ljava/lang/Object;Ljava/lang/Object;J)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :pswitch_6
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->O(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :pswitch_7
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    invoke-static {p1, v1, v2, v3, v4}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :pswitch_8
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_0

    .line 102
    .line 103
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :pswitch_9
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_0

    .line 119
    .line 120
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 121
    .line 122
    .line 123
    move-result-wide v3

    .line 124
    invoke-static {p1, v1, v2, v3, v4}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :pswitch_a
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_0

    .line 136
    .line 137
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :pswitch_b
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_0

    .line 153
    .line 154
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :pswitch_c
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_0

    .line 170
    .line 171
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :pswitch_d
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-eqz v0, :cond_0

    .line 187
    .line 188
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :pswitch_e
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->O(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :pswitch_f
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_0

    .line 208
    .line 209
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :pswitch_10
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_0

    .line 225
    .line 226
    invoke-static {p2, v1, v2}, Ll/lyj0;->r(Ljava/lang/Object;J)Z

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->J(Ljava/lang/Object;JZ)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :pswitch_11
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-eqz v0, :cond_0

    .line 242
    .line 243
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 244
    .line 245
    .line 246
    move-result p2

    .line 247
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :pswitch_12
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    if-eqz v0, :cond_0

    .line 259
    .line 260
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 261
    .line 262
    .line 263
    move-result-wide v3

    .line 264
    invoke-static {p1, v1, v2, v3, v4}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :pswitch_13
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-eqz v0, :cond_0

    .line 276
    .line 277
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 278
    .line 279
    .line 280
    move-result p2

    .line 281
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 285
    .line 286
    .line 287
    return-void

    .line 288
    :pswitch_14
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-eqz v0, :cond_0

    .line 293
    .line 294
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 295
    .line 296
    .line 297
    move-result-wide v3

    .line 298
    invoke-static {p1, v1, v2, v3, v4}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :pswitch_15
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_0

    .line 310
    .line 311
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 312
    .line 313
    .line 314
    move-result-wide v3

    .line 315
    invoke-static {p1, v1, v2, v3, v4}, Ll/lyj0;->S(Ljava/lang/Object;JJ)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :pswitch_16
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-eqz v0, :cond_0

    .line 327
    .line 328
    invoke-static {p2, v1, v2}, Ll/lyj0;->z(Ljava/lang/Object;J)F

    .line 329
    .line 330
    .line 331
    move-result p2

    .line 332
    invoke-static {p1, v1, v2, p2}, Ll/lyj0;->Q(Ljava/lang/Object;JF)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 336
    .line 337
    .line 338
    return-void

    .line 339
    :pswitch_17
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    if-eqz v0, :cond_0

    .line 344
    .line 345
    invoke-static {p2, v1, v2}, Ll/lyj0;->y(Ljava/lang/Object;J)D

    .line 346
    .line 347
    .line 348
    move-result-wide v3

    .line 349
    invoke-static {p1, v1, v2, v3, v4}, Ll/lyj0;->P(Ljava/lang/Object;JD)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->o0(Ljava/lang/Object;I)V

    .line 353
    .line 354
    .line 355
    :cond_0
    :goto_0
    return-void

    .line 356
    nop

    .line 357
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final U(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 6
    .line 7
    array-length v1, v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2, v0}, Landroidx/datastore/preferences/protobuf/d0;->Q(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x3

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 21
    .line 22
    invoke-static {v0, p1, p2}, Landroidx/datastore/preferences/protobuf/j0;->G(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 30
    .line 31
    invoke-static {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/j0;->E(Landroidx/datastore/preferences/protobuf/m;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final b(Ljava/lang/Object;)Z
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    iget v4, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    if-ge v2, v4, :cond_8

    .line 9
    .line 10
    iget-object v4, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    .line 11
    .line 12
    aget v4, v4, v2

    .line 13
    .line 14
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 19
    .line 20
    .line 21
    move-result v7

    .line 22
    iget-boolean v8, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 23
    .line 24
    if-nez v8, :cond_0

    .line 25
    .line 26
    iget-object v8, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 27
    .line 28
    add-int/lit8 v9, v4, 0x2

    .line 29
    .line 30
    aget v8, v8, v9

    .line 31
    .line 32
    const v9, 0xfffff

    .line 33
    .line 34
    .line 35
    and-int/2addr v9, v8

    .line 36
    ushr-int/lit8 v8, v8, 0x14

    .line 37
    .line 38
    shl-int/2addr v5, v8

    .line 39
    if-eq v9, v0, :cond_1

    .line 40
    .line 41
    sget-object v0, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 42
    .line 43
    int-to-long v10, v9

    .line 44
    invoke-virtual {v0, p1, v10, v11}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    move v0, v9

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    move v5, v1

    .line 51
    :cond_1
    :goto_1
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/d0;->J(I)Z

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    if-eqz v8, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0, p1, v4, v3, v5}, Landroidx/datastore/preferences/protobuf/d0;->D(Ljava/lang/Object;III)Z

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    if-nez v8, :cond_2

    .line 62
    .line 63
    return v1

    .line 64
    :cond_2
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 65
    .line 66
    .line 67
    move-result v8

    .line 68
    const/16 v9, 0x9

    .line 69
    .line 70
    if-eq v8, v9, :cond_6

    .line 71
    .line 72
    const/16 v9, 0x11

    .line 73
    .line 74
    if-eq v8, v9, :cond_6

    .line 75
    .line 76
    const/16 v5, 0x1b

    .line 77
    .line 78
    if-eq v8, v5, :cond_5

    .line 79
    .line 80
    const/16 v5, 0x3c

    .line 81
    .line 82
    if-eq v8, v5, :cond_4

    .line 83
    .line 84
    const/16 v5, 0x44

    .line 85
    .line 86
    if-eq v8, v5, :cond_4

    .line 87
    .line 88
    const/16 v5, 0x31

    .line 89
    .line 90
    if-eq v8, v5, :cond_5

    .line 91
    .line 92
    const/16 v5, 0x32

    .line 93
    .line 94
    if-eq v8, v5, :cond_3

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_3
    invoke-virtual {p0, p1, v7, v4}, Landroidx/datastore/preferences/protobuf/d0;->G(Ljava/lang/Object;II)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-nez v4, :cond_7

    .line 102
    .line 103
    return v1

    .line 104
    :cond_4
    invoke-virtual {p0, p1, v6, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_7

    .line 109
    .line 110
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-static {p1, v7, v4}, Landroidx/datastore/preferences/protobuf/d0;->E(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/i0;)Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-nez v4, :cond_7

    .line 119
    .line 120
    return v1

    .line 121
    :cond_5
    invoke-virtual {p0, p1, v7, v4}, Landroidx/datastore/preferences/protobuf/d0;->F(Ljava/lang/Object;II)Z

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    if-nez v4, :cond_7

    .line 126
    .line 127
    return v1

    .line 128
    :cond_6
    invoke-virtual {p0, p1, v4, v3, v5}, Landroidx/datastore/preferences/protobuf/d0;->D(Ljava/lang/Object;III)Z

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    if-eqz v5, :cond_7

    .line 133
    .line 134
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-static {p1, v7, v4}, Landroidx/datastore/preferences/protobuf/d0;->E(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/i0;)Z

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    if-nez v4, :cond_7

    .line 143
    .line 144
    return v1

    .line 145
    :cond_7
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_8
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 150
    .line 151
    if-eqz v0, :cond_9

    .line 152
    .line 153
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 154
    .line 155
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Landroidx/datastore/preferences/protobuf/p;->p()Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-nez p0, :cond_9

    .line 164
    .line 165
    return v1

    .line 166
    :cond_9
    return v5
.end method

.method public final b0(Ljava/lang/Object;[BIIIJLandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(TT;[BIIIJ",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-wide v2, p6

    .line 2
    sget-object v4, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 3
    .line 4
    invoke-virtual {p0, p5}, Landroidx/datastore/preferences/protobuf/d0;->u(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v5

    .line 8
    invoke-virtual {v4, p1, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v6

    .line 12
    iget-object v7, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 13
    .line 14
    invoke-interface {v7, v6}, Landroidx/datastore/preferences/protobuf/z;->h(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v7

    .line 18
    if-eqz v7, :cond_0

    .line 19
    .line 20
    iget-object v7, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 21
    .line 22
    invoke-interface {v7, v5}, Landroidx/datastore/preferences/protobuf/z;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v7

    .line 26
    iget-object v8, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 27
    .line 28
    invoke-interface {v8, v7, v6}, Landroidx/datastore/preferences/protobuf/z;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v4, p1, v2, v3, v7}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    move-object v6, v7

    .line 35
    :cond_0
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 36
    .line 37
    invoke-interface {v1, v5}, Landroidx/datastore/preferences/protobuf/z;->b(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/y$a;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 42
    .line 43
    invoke-interface {v1, v6}, Landroidx/datastore/preferences/protobuf/z;->e(Ljava/lang/Object;)Ljava/util/Map;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    move-object v0, p0

    .line 48
    move-object v1, p2

    .line 49
    move v2, p3

    .line 50
    move v3, p4

    .line 51
    move-object/from16 v6, p8

    .line 52
    .line 53
    invoke-virtual/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->m([BIILandroidx/datastore/preferences/protobuf/y$a;Ljava/util/Map;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    return v0
.end method

.method public c(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroidx/datastore/preferences/protobuf/Writer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Landroidx/datastore/preferences/protobuf/Writer;->G()Landroidx/datastore/preferences/protobuf/Writer$FieldOrder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Landroidx/datastore/preferences/protobuf/Writer$FieldOrder;->DESCENDING:Landroidx/datastore/preferences/protobuf/Writer$FieldOrder;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d0;->v0(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d0;->u0(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d0;->t0(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final c0(Ljava/lang/Object;[BIIIIIIIJILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIIIIIIIJI",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p5

    .line 6
    .line 7
    move/from16 v8, p6

    .line 8
    .line 9
    move/from16 v3, p7

    .line 10
    .line 11
    move-wide/from16 v9, p10

    .line 12
    .line 13
    move/from16 v4, p12

    .line 14
    .line 15
    sget-object v11, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 16
    .line 17
    iget-object v5, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 18
    .line 19
    add-int/lit8 v6, v4, 0x2

    .line 20
    .line 21
    aget v5, v5, v6

    .line 22
    .line 23
    const v6, 0xfffff

    .line 24
    .line 25
    .line 26
    and-int/2addr v5, v6

    .line 27
    int-to-long v12, v5

    .line 28
    const/4 v5, 0x5

    .line 29
    const/4 v14, 0x0

    .line 30
    const/4 v6, 0x1

    .line 31
    const/4 v7, 0x2

    .line 32
    packed-switch p9, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    :cond_0
    move/from16 v15, p3

    .line 36
    .line 37
    goto/16 :goto_6

    .line 38
    .line 39
    :pswitch_0
    const/4 v5, 0x3

    .line 40
    if-ne v3, v5, :cond_0

    .line 41
    .line 42
    and-int/lit8 v2, v2, -0x8

    .line 43
    .line 44
    or-int/lit8 v6, v2, 0x4

    .line 45
    .line 46
    invoke-virtual {v0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    move-object/from16 v3, p2

    .line 51
    .line 52
    move/from16 v4, p3

    .line 53
    .line 54
    move/from16 v5, p4

    .line 55
    .line 56
    move-object/from16 v7, p13

    .line 57
    .line 58
    invoke-static/range {v2 .. v7}, Landroidx/datastore/preferences/protobuf/d;->n(Landroidx/datastore/preferences/protobuf/i0;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    move-object v5, v7

    .line 63
    invoke-virtual {v11, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-ne v2, v8, :cond_1

    .line 68
    .line 69
    invoke-virtual {v11, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v14

    .line 73
    :cond_1
    if-nez v14, :cond_2

    .line 74
    .line 75
    iget-object v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 76
    .line 77
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 82
    .line 83
    invoke-static {v14, v2}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    :goto_0
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 91
    .line 92
    .line 93
    return v0

    .line 94
    :pswitch_1
    move-object/from16 v6, p2

    .line 95
    .line 96
    move/from16 v15, p3

    .line 97
    .line 98
    move-object/from16 v5, p13

    .line 99
    .line 100
    if-nez v3, :cond_b

    .line 101
    .line 102
    invoke-static {v6, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iget-wide v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 107
    .line 108
    invoke-static {v2, v3}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    .line 109
    .line 110
    .line 111
    move-result-wide v2

    .line 112
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 120
    .line 121
    .line 122
    return v0

    .line 123
    :pswitch_2
    move-object/from16 v6, p2

    .line 124
    .line 125
    move/from16 v15, p3

    .line 126
    .line 127
    move-object/from16 v5, p13

    .line 128
    .line 129
    if-nez v3, :cond_b

    .line 130
    .line 131
    invoke-static {v6, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    iget v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 136
    .line 137
    invoke-static {v2}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 149
    .line 150
    .line 151
    return v0

    .line 152
    :pswitch_3
    move-object/from16 v6, p2

    .line 153
    .line 154
    move/from16 v15, p3

    .line 155
    .line 156
    move-object/from16 v5, p13

    .line 157
    .line 158
    if-nez v3, :cond_b

    .line 159
    .line 160
    invoke-static {v6, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    iget v5, v5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 165
    .line 166
    invoke-virtual {v0, v4}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    if-eqz v0, :cond_4

    .line 171
    .line 172
    invoke-interface {v0, v5}, Landroidx/datastore/preferences/protobuf/s$e;->a(I)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_3

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_3
    invoke-static {v1}, Landroidx/datastore/preferences/protobuf/d0;->w(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/m0;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    int-to-long v4, v5

    .line 184
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v0, v2, v1}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    return v3

    .line 192
    :cond_4
    :goto_1
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v11, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 200
    .line 201
    .line 202
    return v3

    .line 203
    :pswitch_4
    move-object/from16 v6, p2

    .line 204
    .line 205
    move/from16 v15, p3

    .line 206
    .line 207
    move-object/from16 v5, p13

    .line 208
    .line 209
    if-ne v3, v7, :cond_b

    .line 210
    .line 211
    invoke-static {v6, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->b([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    iget-object v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 216
    .line 217
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 221
    .line 222
    .line 223
    return v0

    .line 224
    :pswitch_5
    move-object/from16 v6, p2

    .line 225
    .line 226
    move/from16 v15, p3

    .line 227
    .line 228
    move-object/from16 v5, p13

    .line 229
    .line 230
    if-ne v3, v7, :cond_b

    .line 231
    .line 232
    invoke-virtual {v0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    move/from16 v2, p4

    .line 237
    .line 238
    invoke-static {v0, v6, v15, v2, v5}, Landroidx/datastore/preferences/protobuf/d;->p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    invoke-virtual {v11, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 243
    .line 244
    .line 245
    move-result v2

    .line 246
    if-ne v2, v8, :cond_5

    .line 247
    .line 248
    invoke-virtual {v11, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v14

    .line 252
    :cond_5
    if-nez v14, :cond_6

    .line 253
    .line 254
    iget-object v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 255
    .line 256
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 257
    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_6
    iget-object v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 261
    .line 262
    invoke-static {v14, v2}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    :goto_2
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 270
    .line 271
    .line 272
    return v0

    .line 273
    :pswitch_6
    move-object/from16 v6, p2

    .line 274
    .line 275
    move/from16 v15, p3

    .line 276
    .line 277
    move-object/from16 v5, p13

    .line 278
    .line 279
    if-ne v3, v7, :cond_b

    .line 280
    .line 281
    invoke-static {v6, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    iget v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 286
    .line 287
    if-nez v2, :cond_7

    .line 288
    .line 289
    const-string v2, ""

    .line 290
    .line 291
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 292
    .line 293
    .line 294
    goto :goto_4

    .line 295
    :cond_7
    const/high16 v3, 0x20000000

    .line 296
    .line 297
    and-int v3, p8, v3

    .line 298
    .line 299
    if-eqz v3, :cond_9

    .line 300
    .line 301
    add-int v3, v0, v2

    .line 302
    .line 303
    invoke-static {v6, v0, v3}, Landroidx/datastore/preferences/protobuf/Utf8;->t([BII)Z

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    if-eqz v3, :cond_8

    .line 308
    .line 309
    goto :goto_3

    .line 310
    :cond_8
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->invalidUtf8()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    throw v0

    .line 315
    :cond_9
    :goto_3
    new-instance v3, Ljava/lang/String;

    .line 316
    .line 317
    sget-object v4, Landroidx/datastore/preferences/protobuf/s;->a:Ljava/nio/charset/Charset;

    .line 318
    .line 319
    invoke-direct {v3, v6, v0, v2, v4}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v11, v1, v9, v10, v3}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    add-int/2addr v0, v2

    .line 326
    :goto_4
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 327
    .line 328
    .line 329
    return v0

    .line 330
    :pswitch_7
    move-object/from16 v0, p2

    .line 331
    .line 332
    move/from16 v15, p3

    .line 333
    .line 334
    move-object/from16 v5, p13

    .line 335
    .line 336
    if-nez v3, :cond_b

    .line 337
    .line 338
    invoke-static {v0, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    iget-wide v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 343
    .line 344
    const-wide/16 v4, 0x0

    .line 345
    .line 346
    cmp-long v2, v2, v4

    .line 347
    .line 348
    if-eqz v2, :cond_a

    .line 349
    .line 350
    goto :goto_5

    .line 351
    :cond_a
    const/4 v6, 0x0

    .line 352
    :goto_5
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 360
    .line 361
    .line 362
    return v0

    .line 363
    :pswitch_8
    move-object/from16 v0, p2

    .line 364
    .line 365
    move/from16 v15, p3

    .line 366
    .line 367
    if-ne v3, v5, :cond_b

    .line 368
    .line 369
    invoke-static/range {p2 .. p3}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    invoke-virtual {v11, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 378
    .line 379
    .line 380
    add-int/lit8 v0, v15, 0x4

    .line 381
    .line 382
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 383
    .line 384
    .line 385
    return v0

    .line 386
    :pswitch_9
    move-object/from16 v0, p2

    .line 387
    .line 388
    move/from16 v15, p3

    .line 389
    .line 390
    if-ne v3, v6, :cond_b

    .line 391
    .line 392
    invoke-static/range {p2 .. p3}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 393
    .line 394
    .line 395
    move-result-wide v2

    .line 396
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    invoke-virtual {v11, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 401
    .line 402
    .line 403
    add-int/lit8 v0, v15, 0x8

    .line 404
    .line 405
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 406
    .line 407
    .line 408
    return v0

    .line 409
    :pswitch_a
    move-object/from16 v0, p2

    .line 410
    .line 411
    move/from16 v15, p3

    .line 412
    .line 413
    move-object/from16 v5, p13

    .line 414
    .line 415
    if-nez v3, :cond_b

    .line 416
    .line 417
    invoke-static {v0, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    iget v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 422
    .line 423
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 431
    .line 432
    .line 433
    return v0

    .line 434
    :pswitch_b
    move-object/from16 v0, p2

    .line 435
    .line 436
    move/from16 v15, p3

    .line 437
    .line 438
    move-object/from16 v5, p13

    .line 439
    .line 440
    if-nez v3, :cond_b

    .line 441
    .line 442
    invoke-static {v0, v15, v5}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    iget-wide v2, v5, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 447
    .line 448
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 449
    .line 450
    .line 451
    move-result-object v2

    .line 452
    invoke-virtual {v11, v1, v9, v10, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 456
    .line 457
    .line 458
    return v0

    .line 459
    :pswitch_c
    move-object/from16 v0, p2

    .line 460
    .line 461
    move/from16 v15, p3

    .line 462
    .line 463
    if-ne v3, v5, :cond_b

    .line 464
    .line 465
    invoke-static/range {p2 .. p3}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    .line 466
    .line 467
    .line 468
    move-result v0

    .line 469
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    invoke-virtual {v11, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 474
    .line 475
    .line 476
    add-int/lit8 v0, v15, 0x4

    .line 477
    .line 478
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 479
    .line 480
    .line 481
    return v0

    .line 482
    :pswitch_d
    move-object/from16 v0, p2

    .line 483
    .line 484
    move/from16 v15, p3

    .line 485
    .line 486
    if-ne v3, v6, :cond_b

    .line 487
    .line 488
    invoke-static/range {p2 .. p3}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    .line 489
    .line 490
    .line 491
    move-result-wide v2

    .line 492
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 493
    .line 494
    .line 495
    move-result-object v0

    .line 496
    invoke-virtual {v11, v1, v9, v10, v0}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 497
    .line 498
    .line 499
    add-int/lit8 v0, v15, 0x8

    .line 500
    .line 501
    invoke-virtual {v11, v1, v12, v13, v8}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 502
    .line 503
    .line 504
    return v0

    .line 505
    :cond_b
    :goto_6
    return v15

    .line 506
    nop

    :pswitch_data_0
    .packed-switch 0x33
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public d(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v2, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, v2}, Landroidx/datastore/preferences/protobuf/d0;->p(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    add-int/lit8 v2, v2, 0x3

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/datastore/preferences/protobuf/l0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 25
    .line 26
    invoke-virtual {v2, p2}, Landroidx/datastore/preferences/protobuf/l0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    return v1

    .line 37
    :cond_2
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 48
    .line 49
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Landroidx/datastore/preferences/protobuf/p;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_3
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public d0(Ljava/lang/Object;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 28
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIII",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move/from16 v15, p5

    move-object/from16 v7, p6

    .line 1
    sget-object v8, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    const/4 v9, -0x1

    const/16 v16, 0x0

    move/from16 v3, p3

    move v5, v9

    move v10, v5

    move/from16 v6, v16

    move v11, v6

    move v12, v11

    :goto_0
    if-ge v3, v4, :cond_1e

    add-int/lit8 v12, v3, 0x1

    .line 2
    aget-byte v3, v2, v3

    if-gez v3, :cond_0

    .line 3
    invoke-static {v3, v2, v12, v7}, Landroidx/datastore/preferences/protobuf/d;->H(I[BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v12

    .line 4
    iget v3, v7, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    :cond_0
    move/from16 v26, v12

    move v12, v3

    move/from16 v3, v26

    ushr-int/lit8 v13, v12, 0x3

    and-int/lit8 v7, v12, 0x7

    const/4 v14, 0x3

    if-le v13, v5, :cond_1

    .line 5
    div-int/2addr v6, v14

    invoke-virtual {v0, v13, v6}, Landroidx/datastore/preferences/protobuf/d0;->h0(II)I

    move-result v5

    goto :goto_1

    .line 6
    :cond_1
    invoke-virtual {v0, v13}, Landroidx/datastore/preferences/protobuf/d0;->g0(I)I

    move-result v5

    :goto_1
    if-ne v5, v9, :cond_2

    move v2, v3

    move-object/from16 v25, v8

    move/from16 v19, v10

    move/from16 v18, v13

    move-object/from16 v10, p6

    move-object v8, v0

    move v0, v12

    move/from16 v12, v16

    goto/16 :goto_15

    .line 7
    :cond_2
    iget-object v6, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    add-int/lit8 v17, v5, 0x1

    aget v6, v6, v17

    .line 8
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    move-result v14

    move/from16 v18, v10

    .line 9
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    move-result-wide v9

    const/16 v2, 0x11

    move/from16 v19, v3

    if-gt v14, v2, :cond_11

    .line 10
    iget-object v2, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    add-int/lit8 v20, v5, 0x2

    aget v2, v2, v20

    ushr-int/lit8 v20, v2, 0x14

    const/4 v3, 0x1

    shl-int v20, v3, v20

    const v22, 0xfffff

    and-int v2, v2, v22

    move/from16 v3, v18

    move/from16 v18, v13

    if-eq v2, v3, :cond_4

    const/4 v13, -0x1

    move/from16 v17, v14

    if-eq v3, v13, :cond_3

    int-to-long v13, v3

    .line 11
    invoke-virtual {v8, v1, v13, v14, v11}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :cond_3
    int-to-long v13, v2

    .line 12
    invoke-virtual {v8, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result v3

    move v11, v2

    move v13, v3

    goto :goto_2

    :cond_4
    move/from16 v17, v14

    move v13, v11

    move v11, v3

    :goto_2
    const/4 v2, 0x5

    packed-switch v17, :pswitch_data_0

    move-object/from16 v10, p6

    move-object v9, v1

    move v14, v5

    :goto_3
    move-object v1, v8

    move/from16 v7, v19

    move-object/from16 v8, p2

    goto/16 :goto_e

    :pswitch_0
    const/4 v2, 0x3

    if-ne v7, v2, :cond_6

    shl-int/lit8 v2, v18, 0x3

    or-int/lit8 v6, v2, 0x4

    .line 13
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v2

    move-object/from16 v3, p2

    move-object/from16 v7, p6

    move v14, v5

    move v5, v4

    move/from16 v4, v19

    .line 14
    invoke-static/range {v2 .. v7}, Landroidx/datastore/preferences/protobuf/d;->n(Landroidx/datastore/preferences/protobuf/i0;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    move-object v4, v7

    and-int v5, v13, v20

    if-nez v5, :cond_5

    .line 15
    iget-object v5, v4, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    invoke-virtual {v8, v1, v9, v10, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_4

    .line 16
    :cond_5
    invoke-virtual {v8, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, v4, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 17
    invoke-static {v5, v6}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 18
    invoke-virtual {v8, v1, v9, v10, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_4
    or-int v5, v13, v20

    move-object v6, v3

    move v3, v2

    move-object v2, v6

    move-object v7, v4

    move v10, v11

    move v6, v14

    const/4 v9, -0x1

    move/from16 v4, p4

    move v11, v5

    move/from16 v5, v18

    goto/16 :goto_0

    :cond_6
    move v14, v5

    move-object/from16 v10, p6

    move-object v9, v1

    goto :goto_3

    :pswitch_1
    move-object/from16 v3, p2

    move-object/from16 v4, p6

    move v14, v5

    move/from16 v5, v19

    if-nez v7, :cond_7

    .line 19
    invoke-static {v3, v5, v4}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v7

    .line 20
    iget-wide v5, v4, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 21
    invoke-static {v5, v6}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    move-result-wide v5

    move-object v2, v1

    move-object v1, v8

    move-object v8, v3

    move-wide/from16 v26, v9

    move/from16 v9, p4

    move-object v10, v4

    move-wide/from16 v3, v26

    .line 22
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object v3, v1

    move-object v1, v2

    or-int v2, v13, v20

    move v4, v11

    move v11, v2

    move-object v2, v8

    move-object v8, v3

    move v3, v7

    move-object v7, v10

    move v10, v4

    move v4, v9

    :goto_5
    move v6, v14

    move/from16 v5, v18

    :goto_6
    const/4 v9, -0x1

    goto/16 :goto_0

    :cond_7
    move-object v9, v8

    move-object v8, v3

    move-object v3, v9

    move/from16 v9, p4

    move-object v10, v4

    :cond_8
    move-object v9, v1

    move-object v1, v3

    move v7, v5

    goto/16 :goto_e

    :pswitch_2
    move v14, v5

    move/from16 p3, v7

    move-object v3, v8

    move-wide v6, v9

    move/from16 v5, v19

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    move v9, v4

    if-nez p3, :cond_8

    .line 23
    invoke-static {v8, v5, v10}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    .line 24
    iget v4, v10, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 25
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    move-result v4

    .line 26
    invoke-virtual {v3, v1, v6, v7, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    :goto_7
    or-int v4, v13, v20

    move-object v5, v3

    move v3, v2

    move-object v2, v8

    move-object v8, v5

    move-object v7, v10

    move v10, v11

    move v6, v14

    move/from16 v5, v18

    move v11, v4

    move v4, v9

    goto :goto_6

    :pswitch_3
    move v14, v5

    move/from16 p3, v7

    move-object v3, v8

    move-wide v6, v9

    move/from16 v5, v19

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    move v9, v4

    if-nez p3, :cond_8

    .line 27
    invoke-static {v8, v5, v10}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    .line 28
    iget v4, v10, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 29
    invoke-virtual {v0, v14}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    move-result-object v5

    if-eqz v5, :cond_a

    .line 30
    invoke-interface {v5, v4}, Landroidx/datastore/preferences/protobuf/s$e;->a(I)Z

    move-result v5

    if-eqz v5, :cond_9

    goto :goto_8

    .line 31
    :cond_9
    invoke-static {v1}, Landroidx/datastore/preferences/protobuf/d0;->w(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/m0;

    move-result-object v5

    int-to-long v6, v4

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v5, v12, v4}, Landroidx/datastore/preferences/protobuf/m0;->n(ILjava/lang/Object;)V

    move-object v4, v3

    move v3, v2

    move-object v2, v8

    move-object v8, v4

    move v4, v9

    move-object v7, v10

    move v10, v11

    move v11, v13

    goto :goto_5

    .line 32
    :cond_a
    :goto_8
    invoke-virtual {v3, v1, v6, v7, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto :goto_7

    :pswitch_4
    move-wide v2, v9

    move v9, v4

    move v4, v7

    move-wide v6, v2

    move-object/from16 v10, p6

    move v14, v5

    move-object v3, v8

    move/from16 v5, v19

    const/4 v2, 0x2

    move-object/from16 v8, p2

    if-ne v4, v2, :cond_8

    .line 33
    invoke-static {v8, v5, v10}, Landroidx/datastore/preferences/protobuf/d;->b([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    .line 34
    iget-object v4, v10, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    invoke-virtual {v3, v1, v6, v7, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_7

    :pswitch_5
    move-wide v2, v9

    move v9, v4

    move v4, v7

    move-wide v6, v2

    move-object/from16 v10, p6

    move v14, v5

    move-object v3, v8

    move/from16 v5, v19

    const/4 v2, 0x2

    move-object/from16 v8, p2

    if-ne v4, v2, :cond_8

    .line 35
    invoke-virtual {v0, v14}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v2

    .line 36
    invoke-static {v2, v8, v5, v9, v10}, Landroidx/datastore/preferences/protobuf/d;->p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    and-int v4, v13, v20

    if-nez v4, :cond_b

    .line 37
    iget-object v4, v10, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    invoke-virtual {v3, v1, v6, v7, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_7

    .line 38
    :cond_b
    invoke-virtual {v3, v1, v6, v7}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v10, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 39
    invoke-static {v4, v5}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 40
    invoke-virtual {v3, v1, v6, v7, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    goto/16 :goto_7

    :pswitch_6
    move v14, v5

    move v2, v6

    move v4, v7

    move-object v3, v8

    move-wide v6, v9

    move/from16 v5, v19

    const/4 v9, 0x2

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    if-ne v4, v9, :cond_8

    const/high16 v4, 0x20000000

    and-int/2addr v2, v4

    if-nez v2, :cond_c

    .line 41
    invoke-static {v8, v5, v10}, Landroidx/datastore/preferences/protobuf/d;->C([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    goto :goto_9

    .line 42
    :cond_c
    invoke-static {v8, v5, v10}, Landroidx/datastore/preferences/protobuf/d;->F([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    .line 43
    :goto_9
    iget-object v4, v10, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    invoke-virtual {v3, v1, v6, v7, v4}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :goto_a
    or-int v4, v13, v20

    move-object v5, v3

    move v3, v2

    move-object v2, v8

    move-object v8, v5

    move-object v7, v10

    move v10, v11

    move v6, v14

    move/from16 v5, v18

    const/4 v9, -0x1

    move v11, v4

    move/from16 v4, p4

    goto/16 :goto_0

    :pswitch_7
    move v14, v5

    move v4, v7

    move-object v3, v8

    move-wide v6, v9

    move/from16 v5, v19

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    if-nez v4, :cond_8

    .line 44
    invoke-static {v8, v5, v10}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    .line 45
    iget-wide v4, v10, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    const-wide/16 v23, 0x0

    cmp-long v4, v4, v23

    if-eqz v4, :cond_d

    const/4 v4, 0x1

    goto :goto_b

    :cond_d
    move/from16 v4, v16

    :goto_b
    invoke-static {v1, v6, v7, v4}, Ll/lyj0;->J(Ljava/lang/Object;JZ)V

    goto :goto_a

    :pswitch_8
    move v14, v5

    move v4, v7

    move-object v3, v8

    move-wide v6, v9

    move/from16 v5, v19

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    if-ne v4, v2, :cond_8

    .line 46
    invoke-static {v8, v5}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    move-result v2

    invoke-virtual {v3, v1, v6, v7, v2}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    add-int/lit8 v2, v5, 0x4

    goto :goto_a

    :pswitch_9
    move v14, v5

    move v4, v7

    move-object v3, v8

    move-wide v6, v9

    move/from16 v5, v19

    const/4 v2, 0x1

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    if-ne v4, v2, :cond_e

    move v4, v5

    move-wide/from16 v21, v6

    .line 47
    invoke-static {v8, v4}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    move-result-wide v5

    move-object v2, v1

    move-object v1, v3

    move v7, v4

    move-wide/from16 v3, v21

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object v3, v1

    move-object v1, v2

    add-int/lit8 v2, v7, 0x8

    goto :goto_a

    :cond_e
    move v7, v5

    :cond_f
    move-object v9, v1

    move-object v1, v3

    goto/16 :goto_e

    :pswitch_a
    move v14, v5

    move v4, v7

    move-object v3, v8

    move-wide v5, v9

    move/from16 v7, v19

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    if-nez v4, :cond_f

    .line 48
    invoke-static {v8, v7, v10}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    .line 49
    iget v4, v10, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    invoke-virtual {v3, v1, v5, v6, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    goto/16 :goto_a

    :pswitch_b
    move v14, v5

    move v4, v7

    move-object v3, v8

    move-wide v5, v9

    move/from16 v7, v19

    move-object/from16 v8, p2

    move-object/from16 v10, p6

    if-nez v4, :cond_f

    .line 50
    invoke-static {v8, v7, v10}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v7

    move-wide/from16 v21, v5

    .line 51
    iget-wide v5, v10, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    move-object v2, v1

    move-object v1, v3

    move-wide/from16 v3, v21

    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    move-object v9, v2

    or-int v2, v13, v20

    move/from16 v4, p4

    move v3, v7

    :goto_c
    move-object v7, v10

    move v10, v11

    move v6, v14

    move/from16 v5, v18

    move v11, v2

    move-object v2, v8

    move-object v8, v1

    move-object v1, v9

    goto/16 :goto_6

    :pswitch_c
    move v14, v5

    move v4, v7

    move-wide v5, v9

    move/from16 v7, v19

    move-object/from16 v10, p6

    move-object v9, v1

    move-object v1, v8

    move-object/from16 v8, p2

    if-ne v4, v2, :cond_10

    .line 52
    invoke-static {v8, v7}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    move-result v2

    invoke-static {v9, v5, v6, v2}, Ll/lyj0;->Q(Ljava/lang/Object;JF)V

    add-int/lit8 v3, v7, 0x4

    :goto_d
    or-int v2, v13, v20

    move/from16 v4, p4

    goto :goto_c

    :pswitch_d
    move v14, v5

    move v4, v7

    move-wide v5, v9

    move/from16 v7, v19

    const/4 v2, 0x1

    move-object/from16 v10, p6

    move-object v9, v1

    move-object v1, v8

    move-object/from16 v8, p2

    if-ne v4, v2, :cond_10

    .line 53
    invoke-static {v8, v7}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    move-result-wide v2

    invoke-static {v9, v5, v6, v2, v3}, Ll/lyj0;->P(Ljava/lang/Object;JD)V

    add-int/lit8 v3, v7, 0x8

    goto :goto_d

    :cond_10
    :goto_e
    move-object v8, v0

    move-object/from16 v25, v1

    move v2, v7

    move/from16 v19, v11

    move v0, v12

    move v11, v13

    move v12, v14

    goto/16 :goto_15

    :cond_11
    move v2, v6

    move v4, v7

    move/from16 v17, v14

    move/from16 v3, v18

    move/from16 v7, v19

    move v14, v5

    move-wide v5, v9

    move/from16 v18, v13

    move-object/from16 v10, p6

    move-object v9, v1

    move-object v1, v8

    move-object/from16 v8, p2

    const/16 v13, 0x1b

    move/from16 v19, v3

    move/from16 v3, v17

    if-ne v3, v13, :cond_15

    const/4 v13, 0x2

    if-ne v4, v13, :cond_14

    .line 54
    invoke-virtual {v1, v9, v5, v6}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/datastore/preferences/protobuf/s$i;

    .line 55
    invoke-interface {v2}, Landroidx/datastore/preferences/protobuf/s$i;->q()Z

    move-result v3

    if-nez v3, :cond_13

    .line 56
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_12

    const/16 v3, 0xa

    goto :goto_f

    :cond_12
    mul-int/lit8 v3, v3, 0x2

    .line 57
    :goto_f
    invoke-interface {v2, v3}, Landroidx/datastore/preferences/protobuf/s$i;->d(I)Landroidx/datastore/preferences/protobuf/s$i;

    move-result-object v2

    .line 58
    invoke-virtual {v1, v9, v5, v6, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    :cond_13
    move-object v3, v1

    move-object v6, v2

    .line 59
    invoke-virtual {v0, v14}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    move-result-object v1

    move-object v2, v8

    move-object v8, v3

    move-object v3, v2

    move/from16 v5, p4

    move v4, v7

    move-object v7, v10

    move v2, v12

    .line 60
    invoke-static/range {v1 .. v7}, Landroidx/datastore/preferences/protobuf/d;->q(Landroidx/datastore/preferences/protobuf/i0;I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    move-result v1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v7, p6

    move v3, v1

    move-object v1, v9

    move v6, v14

    move/from16 v5, v18

    move/from16 v10, v19

    goto/16 :goto_6

    :cond_14
    move-object/from16 v25, v1

    move v3, v7

    move/from16 v17, v11

    move v9, v12

    move v12, v14

    goto/16 :goto_13

    :cond_15
    move-object v8, v1

    const/16 v1, 0x31

    if-gt v3, v1, :cond_17

    int-to-long v9, v2

    move-wide v1, v5

    move v5, v12

    move-wide v12, v1

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v25, v8

    move/from16 v17, v11

    move v8, v14

    move/from16 v6, v18

    move-object/from16 v14, p6

    move v11, v3

    move v3, v7

    move v7, v4

    move/from16 v4, p4

    .line 61
    invoke-virtual/range {v0 .. v14}, Landroidx/datastore/preferences/protobuf/d0;->f0(Ljava/lang/Object;[BIIIIIIJIJLandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v7

    move v9, v5

    move v12, v8

    if-eq v7, v3, :cond_16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move v3, v7

    move v6, v12

    move/from16 v11, v17

    move/from16 v5, v18

    move/from16 v10, v19

    move-object/from16 v8, v25

    move-object/from16 v7, p6

    :goto_10
    move v12, v9

    goto/16 :goto_6

    :cond_16
    move-object/from16 v8, p0

    move-object/from16 v10, p6

    move v2, v7

    :goto_11
    move v0, v9

    :goto_12
    move/from16 v11, v17

    goto/16 :goto_15

    :cond_17
    move-object/from16 v25, v8

    move/from16 v17, v11

    move v9, v12

    move v12, v14

    move v11, v3

    move v3, v7

    move v7, v4

    const/16 v0, 0x32

    if-ne v11, v0, :cond_1a

    const/4 v13, 0x2

    if-ne v7, v13, :cond_19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v8, p6

    move-wide v6, v5

    move v5, v12

    .line 62
    invoke-virtual/range {v0 .. v8}, Landroidx/datastore/preferences/protobuf/d0;->b0(Ljava/lang/Object;[BIIIJLandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v6

    if-eq v6, v3, :cond_18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v7, p6

    move v3, v6

    move v6, v12

    move/from16 v11, v17

    move/from16 v5, v18

    move/from16 v10, v19

    move-object/from16 v8, v25

    goto :goto_10

    :cond_18
    move-object/from16 v8, p0

    move-object/from16 v10, p6

    move v2, v6

    goto :goto_11

    :cond_19
    :goto_13
    move-object/from16 v8, p0

    move-object/from16 v10, p6

    move v2, v3

    goto :goto_11

    :cond_1a
    move-wide v0, v5

    move v5, v9

    move v9, v11

    move-wide v10, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v4, p4

    move-object/from16 v13, p6

    move v8, v2

    move/from16 v6, v18

    move-object/from16 v2, p2

    .line 63
    invoke-virtual/range {v0 .. v13}, Landroidx/datastore/preferences/protobuf/d0;->c0(Ljava/lang/Object;[BIIIIIIIJILandroidx/datastore/preferences/protobuf/d$b;)I

    move-result v7

    move-object v8, v0

    move v0, v5

    move-object v10, v13

    if-eq v7, v3, :cond_1b

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v4, p4

    move v3, v7

    move-object v7, v10

    move v6, v12

    move/from16 v11, v17

    :goto_14
    move/from16 v5, v18

    move/from16 v10, v19

    const/4 v9, -0x1

    move v12, v0

    move-object v0, v8

    move-object/from16 v8, v25

    goto/16 :goto_0

    :cond_1b
    move v2, v7

    goto :goto_12

    :goto_15
    if-ne v0, v15, :cond_1c

    if-eqz v15, :cond_1c

    move-object/from16 v9, p1

    move/from16 v4, p4

    move v12, v0

    move v3, v2

    move/from16 v10, v19

    :goto_16
    const/4 v13, -0x1

    goto :goto_19

    .line 64
    :cond_1c
    iget-boolean v1, v8, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    if-eqz v1, :cond_1d

    iget-object v1, v10, Landroidx/datastore/preferences/protobuf/d$b;->d:Landroidx/datastore/preferences/protobuf/l;

    .line 65
    invoke-static {}, Landroidx/datastore/preferences/protobuf/l;->b()Landroidx/datastore/preferences/protobuf/l;

    move-result-object v3

    if-eq v1, v3, :cond_1d

    .line 66
    iget-object v5, v8, Landroidx/datastore/preferences/protobuf/d0;->e:Landroidx/datastore/preferences/protobuf/b0;

    iget-object v6, v8, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    move-object/from16 v4, p1

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object v7, v10

    invoke-static/range {v0 .. v7}, Landroidx/datastore/preferences/protobuf/d;->g(I[BIILjava/lang/Object;Landroidx/datastore/preferences/protobuf/b0;Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    move-object v9, v4

    move/from16 v4, p4

    :goto_17
    move v3, v2

    goto :goto_18

    :cond_1d
    move-object/from16 v9, p1

    .line 67
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/d0;->w(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/m0;

    move-result-object v4

    move-object/from16 v1, p2

    move/from16 v3, p4

    move-object/from16 v5, p6

    .line 68
    invoke-static/range {v0 .. v5}, Landroidx/datastore/preferences/protobuf/d;->G(I[BIILandroidx/datastore/preferences/protobuf/m0;Landroidx/datastore/preferences/protobuf/d$b;)I

    move-result v2

    move v4, v3

    goto :goto_17

    :goto_18
    move-object/from16 v2, p2

    move-object/from16 v7, p6

    move-object v1, v9

    move v6, v12

    goto :goto_14

    :cond_1e
    move-object v9, v1

    move-object/from16 v25, v8

    move/from16 v19, v10

    move/from16 v17, v11

    move-object v8, v0

    goto :goto_16

    :goto_19
    if-eq v10, v13, :cond_1f

    int-to-long v0, v10

    move-object/from16 v2, v25

    .line 69
    invoke-virtual {v2, v9, v0, v1, v11}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 70
    :cond_1f
    iget v0, v8, Landroidx/datastore/preferences/protobuf/d0;->k:I

    const/4 v1, 0x0

    :goto_1a
    iget v2, v8, Landroidx/datastore/preferences/protobuf/d0;->l:I

    if-ge v0, v2, :cond_20

    .line 71
    iget-object v2, v8, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    aget v2, v2, v0

    iget-object v5, v8, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 72
    invoke-virtual {v8, v9, v2, v1, v5}, Landroidx/datastore/preferences/protobuf/d0;->q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/datastore/preferences/protobuf/m0;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_20
    if-eqz v1, :cond_21

    .line 73
    iget-object v0, v8, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 74
    invoke-virtual {v0, v9, v1}, Landroidx/datastore/preferences/protobuf/l0;->o(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_21
    if-nez v15, :cond_23

    if-ne v3, v4, :cond_22

    goto :goto_1b

    .line 75
    :cond_22
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->parseFailure()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :cond_23
    if-gt v3, v4, :cond_24

    if-ne v12, v15, :cond_24

    :goto_1b
    return v3

    .line 76
    :cond_24
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->parseFailure()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    move-result-object v0

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/h0;Landroidx/datastore/preferences/protobuf/l;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroidx/datastore/preferences/protobuf/h0;",
            "Landroidx/datastore/preferences/protobuf/l;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 5
    .line 6
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-object v3, p1

    .line 10
    move-object v4, p2

    .line 11
    move-object v5, p3

    .line 12
    invoke-virtual/range {v0 .. v5}, Landroidx/datastore/preferences/protobuf/d0;->M(Landroidx/datastore/preferences/protobuf/l0;Landroidx/datastore/preferences/protobuf/m;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/h0;Landroidx/datastore/preferences/protobuf/l;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final e0(Ljava/lang/Object;[BIILandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BII",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v7, p2

    .line 4
    .line 5
    move/from16 v8, p4

    .line 6
    .line 7
    move-object/from16 v13, p5

    .line 8
    .line 9
    sget-object v1, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 10
    .line 11
    const/4 v15, -0x1

    .line 12
    const/16 v16, 0x0

    .line 13
    .line 14
    move/from16 v2, p3

    .line 15
    .line 16
    move v3, v15

    .line 17
    move/from16 v4, v16

    .line 18
    .line 19
    :goto_0
    if-ge v2, v8, :cond_15

    .line 20
    .line 21
    add-int/lit8 v5, v2, 0x1

    .line 22
    .line 23
    aget-byte v2, v7, v2

    .line 24
    .line 25
    if-gez v2, :cond_0

    .line 26
    .line 27
    invoke-static {v2, v7, v5, v13}, Landroidx/datastore/preferences/protobuf/d;->H(I[BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    iget v2, v13, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 32
    .line 33
    :cond_0
    move v9, v5

    .line 34
    move v5, v2

    .line 35
    ushr-int/lit8 v10, v5, 0x3

    .line 36
    .line 37
    and-int/lit8 v2, v5, 0x7

    .line 38
    .line 39
    if-le v10, v3, :cond_1

    .line 40
    .line 41
    div-int/lit8 v4, v4, 0x3

    .line 42
    .line 43
    invoke-virtual {v0, v10, v4}, Landroidx/datastore/preferences/protobuf/d0;->h0(II)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    :goto_1
    move v12, v3

    .line 48
    goto :goto_2

    .line 49
    :cond_1
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->g0(I)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    goto :goto_1

    .line 54
    :goto_2
    if-ne v12, v15, :cond_2

    .line 55
    .line 56
    move-object/from16 v17, v1

    .line 57
    .line 58
    move v2, v9

    .line 59
    move v6, v10

    .line 60
    move/from16 v12, v16

    .line 61
    .line 62
    goto/16 :goto_11

    .line 63
    .line 64
    :cond_2
    iget-object v3, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 65
    .line 66
    add-int/lit8 v4, v12, 0x1

    .line 67
    .line 68
    aget v3, v3, v4

    .line 69
    .line 70
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 71
    .line 72
    .line 73
    move-result v11

    .line 74
    move v6, v3

    .line 75
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 76
    .line 77
    .line 78
    move-result-wide v3

    .line 79
    const/16 v14, 0x11

    .line 80
    .line 81
    const/4 v15, 0x2

    .line 82
    if-gt v11, v14, :cond_b

    .line 83
    .line 84
    packed-switch v11, :pswitch_data_0

    .line 85
    .line 86
    .line 87
    move-object/from16 v17, v1

    .line 88
    .line 89
    :goto_3
    move v3, v9

    .line 90
    move v9, v10

    .line 91
    move v10, v5

    .line 92
    goto/16 :goto_10

    .line 93
    .line 94
    :pswitch_0
    if-nez v2, :cond_3

    .line 95
    .line 96
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    iget-wide v5, v13, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 101
    .line 102
    invoke-static {v5, v6}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    .line 103
    .line 104
    .line 105
    move-result-wide v5

    .line 106
    move-object/from16 v2, p1

    .line 107
    .line 108
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 109
    .line 110
    .line 111
    move-object v3, v1

    .line 112
    move-object v1, v2

    .line 113
    move-object v1, v3

    .line 114
    :goto_4
    move v2, v9

    .line 115
    :goto_5
    move v3, v10

    .line 116
    move v4, v12

    .line 117
    :goto_6
    const/4 v15, -0x1

    .line 118
    goto :goto_0

    .line 119
    :cond_3
    move-object v3, v1

    .line 120
    move-object/from16 v1, p1

    .line 121
    .line 122
    :cond_4
    move-object/from16 v17, v3

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :pswitch_1
    move-wide v14, v3

    .line 126
    move-object v3, v1

    .line 127
    move-object/from16 v1, p1

    .line 128
    .line 129
    if-nez v2, :cond_4

    .line 130
    .line 131
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    iget v4, v13, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 136
    .line 137
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    invoke-virtual {v3, v1, v14, v15, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 142
    .line 143
    .line 144
    :goto_7
    move-object v1, v3

    .line 145
    goto :goto_5

    .line 146
    :pswitch_2
    move-wide v14, v3

    .line 147
    move-object v3, v1

    .line 148
    move-object/from16 v1, p1

    .line 149
    .line 150
    if-nez v2, :cond_4

    .line 151
    .line 152
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    iget v4, v13, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 157
    .line 158
    invoke-virtual {v3, v1, v14, v15, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 159
    .line 160
    .line 161
    goto :goto_7

    .line 162
    :pswitch_3
    move/from16 p3, v5

    .line 163
    .line 164
    move-wide v4, v3

    .line 165
    move-object v3, v1

    .line 166
    move-object/from16 v1, p1

    .line 167
    .line 168
    if-ne v2, v15, :cond_5

    .line 169
    .line 170
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->b([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    iget-object v6, v13, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 175
    .line 176
    invoke-virtual {v3, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    goto :goto_7

    .line 180
    :cond_5
    :goto_8
    move-object/from16 v17, v3

    .line 181
    .line 182
    :goto_9
    move v3, v9

    .line 183
    move v9, v10

    .line 184
    move/from16 v10, p3

    .line 185
    .line 186
    goto/16 :goto_10

    .line 187
    .line 188
    :pswitch_4
    move/from16 p3, v5

    .line 189
    .line 190
    move-wide v4, v3

    .line 191
    move-object v3, v1

    .line 192
    move-object/from16 v1, p1

    .line 193
    .line 194
    if-ne v2, v15, :cond_5

    .line 195
    .line 196
    invoke-virtual {v0, v12}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    invoke-static {v2, v7, v9, v8, v13}, Landroidx/datastore/preferences/protobuf/d;->p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    invoke-virtual {v3, v1, v4, v5}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    if-nez v6, :cond_6

    .line 209
    .line 210
    iget-object v6, v13, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 211
    .line 212
    invoke-virtual {v3, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    goto :goto_7

    .line 216
    :cond_6
    iget-object v9, v13, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 217
    .line 218
    invoke-static {v6, v9}, Landroidx/datastore/preferences/protobuf/s;->h(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v6

    .line 222
    invoke-virtual {v3, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 223
    .line 224
    .line 225
    goto :goto_7

    .line 226
    :pswitch_5
    move/from16 p3, v5

    .line 227
    .line 228
    move-wide v4, v3

    .line 229
    move-object v3, v1

    .line 230
    move-object/from16 v1, p1

    .line 231
    .line 232
    if-ne v2, v15, :cond_5

    .line 233
    .line 234
    const/high16 v2, 0x20000000

    .line 235
    .line 236
    and-int/2addr v2, v6

    .line 237
    if-nez v2, :cond_7

    .line 238
    .line 239
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->C([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    goto :goto_a

    .line 244
    :cond_7
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->F([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    :goto_a
    iget-object v6, v13, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 249
    .line 250
    invoke-virtual {v3, v1, v4, v5, v6}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    goto :goto_7

    .line 254
    :pswitch_6
    move/from16 p3, v5

    .line 255
    .line 256
    move-wide v4, v3

    .line 257
    move-object v3, v1

    .line 258
    move-object/from16 v1, p1

    .line 259
    .line 260
    if-nez v2, :cond_5

    .line 261
    .line 262
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    iget-wide v14, v13, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 267
    .line 268
    const-wide/16 v18, 0x0

    .line 269
    .line 270
    cmp-long v6, v14, v18

    .line 271
    .line 272
    if-eqz v6, :cond_8

    .line 273
    .line 274
    const/4 v14, 0x1

    .line 275
    goto :goto_b

    .line 276
    :cond_8
    move/from16 v14, v16

    .line 277
    .line 278
    :goto_b
    invoke-static {v1, v4, v5, v14}, Ll/lyj0;->J(Ljava/lang/Object;JZ)V

    .line 279
    .line 280
    .line 281
    goto/16 :goto_7

    .line 282
    .line 283
    :pswitch_7
    move/from16 p3, v5

    .line 284
    .line 285
    const/4 v6, 0x5

    .line 286
    move-wide v4, v3

    .line 287
    move-object v3, v1

    .line 288
    move-object/from16 v1, p1

    .line 289
    .line 290
    if-ne v2, v6, :cond_5

    .line 291
    .line 292
    invoke-static {v7, v9}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    invoke-virtual {v3, v1, v4, v5, v2}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 297
    .line 298
    .line 299
    add-int/lit8 v2, v9, 0x4

    .line 300
    .line 301
    goto/16 :goto_7

    .line 302
    .line 303
    :pswitch_8
    move/from16 p3, v5

    .line 304
    .line 305
    const/4 v6, 0x1

    .line 306
    move-wide v4, v3

    .line 307
    move-object v3, v1

    .line 308
    move-object/from16 v1, p1

    .line 309
    .line 310
    if-ne v2, v6, :cond_5

    .line 311
    .line 312
    move-wide v14, v4

    .line 313
    invoke-static {v7, v9}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 314
    .line 315
    .line 316
    move-result-wide v5

    .line 317
    move-object v2, v1

    .line 318
    move-object v1, v3

    .line 319
    move-wide v3, v14

    .line 320
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 321
    .line 322
    .line 323
    move-object v3, v1

    .line 324
    move-object v1, v2

    .line 325
    add-int/lit8 v2, v9, 0x8

    .line 326
    .line 327
    goto/16 :goto_7

    .line 328
    .line 329
    :pswitch_9
    move-wide v14, v3

    .line 330
    move/from16 p3, v5

    .line 331
    .line 332
    move-object v3, v1

    .line 333
    move-object/from16 v1, p1

    .line 334
    .line 335
    if-nez v2, :cond_5

    .line 336
    .line 337
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 338
    .line 339
    .line 340
    move-result v2

    .line 341
    iget v4, v13, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 342
    .line 343
    invoke-virtual {v3, v1, v14, v15, v4}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 344
    .line 345
    .line 346
    goto/16 :goto_7

    .line 347
    .line 348
    :pswitch_a
    move-wide v14, v3

    .line 349
    move/from16 p3, v5

    .line 350
    .line 351
    move-object v3, v1

    .line 352
    move-object/from16 v1, p1

    .line 353
    .line 354
    if-nez v2, :cond_9

    .line 355
    .line 356
    invoke-static {v7, v9, v13}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 357
    .line 358
    .line 359
    move-result v9

    .line 360
    iget-wide v5, v13, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 361
    .line 362
    move-object v2, v1

    .line 363
    move-object v1, v3

    .line 364
    move-wide v3, v14

    .line 365
    invoke-virtual/range {v1 .. v6}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 366
    .line 367
    .line 368
    move-object v14, v2

    .line 369
    goto/16 :goto_4

    .line 370
    .line 371
    :cond_9
    move-object v14, v1

    .line 372
    goto/16 :goto_8

    .line 373
    .line 374
    :pswitch_b
    move-object/from16 v14, p1

    .line 375
    .line 376
    move/from16 p3, v5

    .line 377
    .line 378
    const/4 v6, 0x5

    .line 379
    if-ne v2, v6, :cond_a

    .line 380
    .line 381
    invoke-static {v7, v9}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    .line 382
    .line 383
    .line 384
    move-result v2

    .line 385
    invoke-static {v14, v3, v4, v2}, Ll/lyj0;->Q(Ljava/lang/Object;JF)V

    .line 386
    .line 387
    .line 388
    add-int/lit8 v2, v9, 0x4

    .line 389
    .line 390
    goto/16 :goto_5

    .line 391
    .line 392
    :cond_a
    move-object/from16 v17, v1

    .line 393
    .line 394
    goto/16 :goto_9

    .line 395
    .line 396
    :pswitch_c
    move-object/from16 v14, p1

    .line 397
    .line 398
    move/from16 p3, v5

    .line 399
    .line 400
    const/4 v6, 0x1

    .line 401
    if-ne v2, v6, :cond_a

    .line 402
    .line 403
    invoke-static {v7, v9}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    .line 404
    .line 405
    .line 406
    move-result-wide v5

    .line 407
    invoke-static {v14, v3, v4, v5, v6}, Ll/lyj0;->P(Ljava/lang/Object;JD)V

    .line 408
    .line 409
    .line 410
    add-int/lit8 v2, v9, 0x8

    .line 411
    .line 412
    goto/16 :goto_5

    .line 413
    .line 414
    :cond_b
    move-object/from16 v14, p1

    .line 415
    .line 416
    move/from16 p3, v5

    .line 417
    .line 418
    const/16 v5, 0x1b

    .line 419
    .line 420
    if-ne v11, v5, :cond_e

    .line 421
    .line 422
    if-ne v2, v15, :cond_a

    .line 423
    .line 424
    invoke-virtual {v1, v14, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    check-cast v2, Landroidx/datastore/preferences/protobuf/s$i;

    .line 429
    .line 430
    invoke-interface {v2}, Landroidx/datastore/preferences/protobuf/s$i;->q()Z

    .line 431
    .line 432
    .line 433
    move-result v5

    .line 434
    if-nez v5, :cond_d

    .line 435
    .line 436
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 437
    .line 438
    .line 439
    move-result v5

    .line 440
    if-nez v5, :cond_c

    .line 441
    .line 442
    const/16 v5, 0xa

    .line 443
    .line 444
    goto :goto_c

    .line 445
    :cond_c
    mul-int/lit8 v5, v5, 0x2

    .line 446
    .line 447
    :goto_c
    invoke-interface {v2, v5}, Landroidx/datastore/preferences/protobuf/s$i;->d(I)Landroidx/datastore/preferences/protobuf/s$i;

    .line 448
    .line 449
    .line 450
    move-result-object v2

    .line 451
    invoke-virtual {v1, v14, v3, v4, v2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 452
    .line 453
    .line 454
    :cond_d
    move-object v3, v1

    .line 455
    move-object v6, v2

    .line 456
    invoke-virtual {v0, v12}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 457
    .line 458
    .line 459
    move-result-object v1

    .line 460
    move/from16 v2, p3

    .line 461
    .line 462
    move-object/from16 v17, v3

    .line 463
    .line 464
    move-object v3, v7

    .line 465
    move v5, v8

    .line 466
    move v4, v9

    .line 467
    move-object v7, v13

    .line 468
    invoke-static/range {v1 .. v7}, Landroidx/datastore/preferences/protobuf/d;->q(Landroidx/datastore/preferences/protobuf/i0;I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 469
    .line 470
    .line 471
    move-result v2

    .line 472
    move-object/from16 v7, p2

    .line 473
    .line 474
    move/from16 v8, p4

    .line 475
    .line 476
    move-object/from16 v13, p5

    .line 477
    .line 478
    move v3, v10

    .line 479
    :goto_d
    move v4, v12

    .line 480
    move-object/from16 v1, v17

    .line 481
    .line 482
    goto/16 :goto_6

    .line 483
    .line 484
    :cond_e
    move/from16 v5, p3

    .line 485
    .line 486
    move-object/from16 v17, v1

    .line 487
    .line 488
    move v1, v9

    .line 489
    const/16 v7, 0x31

    .line 490
    .line 491
    if-gt v11, v7, :cond_10

    .line 492
    .line 493
    move v7, v10

    .line 494
    int-to-long v9, v6

    .line 495
    move v6, v7

    .line 496
    move v8, v12

    .line 497
    move v7, v2

    .line 498
    move-wide v12, v3

    .line 499
    move-object/from16 v2, p2

    .line 500
    .line 501
    move/from16 v4, p4

    .line 502
    .line 503
    move v3, v1

    .line 504
    move-object v1, v14

    .line 505
    move-object/from16 v14, p5

    .line 506
    .line 507
    invoke-virtual/range {v0 .. v14}, Landroidx/datastore/preferences/protobuf/d0;->f0(Ljava/lang/Object;[BIIIIIIJIJLandroidx/datastore/preferences/protobuf/d$b;)I

    .line 508
    .line 509
    .line 510
    move-result v7

    .line 511
    move v10, v5

    .line 512
    move v9, v6

    .line 513
    move v12, v8

    .line 514
    if-eq v7, v3, :cond_f

    .line 515
    .line 516
    move-object/from16 v0, p0

    .line 517
    .line 518
    move/from16 v8, p4

    .line 519
    .line 520
    move-object/from16 v13, p5

    .line 521
    .line 522
    move v2, v7

    .line 523
    move v3, v9

    .line 524
    :goto_e
    move v4, v12

    .line 525
    move-object/from16 v1, v17

    .line 526
    .line 527
    const/4 v15, -0x1

    .line 528
    move-object/from16 v7, p2

    .line 529
    .line 530
    goto/16 :goto_0

    .line 531
    .line 532
    :cond_f
    move v2, v7

    .line 533
    :goto_f
    move v6, v9

    .line 534
    move v5, v10

    .line 535
    goto/16 :goto_11

    .line 536
    .line 537
    :cond_10
    move v7, v2

    .line 538
    move v9, v10

    .line 539
    move v10, v5

    .line 540
    move-wide v4, v3

    .line 541
    move v3, v1

    .line 542
    const/16 v0, 0x32

    .line 543
    .line 544
    if-ne v11, v0, :cond_13

    .line 545
    .line 546
    if-ne v7, v15, :cond_12

    .line 547
    .line 548
    move-object/from16 v0, p0

    .line 549
    .line 550
    move-object/from16 v1, p1

    .line 551
    .line 552
    move-object/from16 v2, p2

    .line 553
    .line 554
    move-object/from16 v8, p5

    .line 555
    .line 556
    move-wide v6, v4

    .line 557
    move v5, v12

    .line 558
    move/from16 v4, p4

    .line 559
    .line 560
    invoke-virtual/range {v0 .. v8}, Landroidx/datastore/preferences/protobuf/d0;->b0(Ljava/lang/Object;[BIIIJLandroidx/datastore/preferences/protobuf/d$b;)I

    .line 561
    .line 562
    .line 563
    move-result v6

    .line 564
    if-eq v6, v3, :cond_11

    .line 565
    .line 566
    move-object/from16 v0, p0

    .line 567
    .line 568
    move-object/from16 v7, p2

    .line 569
    .line 570
    move/from16 v8, p4

    .line 571
    .line 572
    move-object/from16 v13, p5

    .line 573
    .line 574
    move v2, v6

    .line 575
    move v3, v9

    .line 576
    goto :goto_d

    .line 577
    :cond_11
    move v2, v6

    .line 578
    goto :goto_f

    .line 579
    :cond_12
    :goto_10
    move v2, v3

    .line 580
    goto :goto_f

    .line 581
    :cond_13
    move-object/from16 v0, p0

    .line 582
    .line 583
    move-object/from16 v1, p1

    .line 584
    .line 585
    move-object/from16 v2, p2

    .line 586
    .line 587
    move-object/from16 v13, p5

    .line 588
    .line 589
    move v8, v6

    .line 590
    move v6, v9

    .line 591
    move v9, v11

    .line 592
    move-wide/from16 v20, v4

    .line 593
    .line 594
    move/from16 v4, p4

    .line 595
    .line 596
    move v5, v10

    .line 597
    move-wide/from16 v10, v20

    .line 598
    .line 599
    invoke-virtual/range {v0 .. v13}, Landroidx/datastore/preferences/protobuf/d0;->c0(Ljava/lang/Object;[BIIIIIIIJILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 600
    .line 601
    .line 602
    move-result v7

    .line 603
    if-eq v7, v3, :cond_14

    .line 604
    .line 605
    move-object/from16 v0, p0

    .line 606
    .line 607
    move/from16 v8, p4

    .line 608
    .line 609
    move-object/from16 v13, p5

    .line 610
    .line 611
    move v3, v6

    .line 612
    move v2, v7

    .line 613
    goto :goto_e

    .line 614
    :cond_14
    move v2, v7

    .line 615
    :goto_11
    invoke-static/range {p1 .. p1}, Landroidx/datastore/preferences/protobuf/d0;->w(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/m0;

    .line 616
    .line 617
    .line 618
    move-result-object v4

    .line 619
    move-object/from16 v1, p2

    .line 620
    .line 621
    move/from16 v3, p4

    .line 622
    .line 623
    move v0, v5

    .line 624
    move-object/from16 v5, p5

    .line 625
    .line 626
    invoke-static/range {v0 .. v5}, Landroidx/datastore/preferences/protobuf/d;->G(I[BIILandroidx/datastore/preferences/protobuf/m0;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 627
    .line 628
    .line 629
    move-result v2

    .line 630
    move-object/from16 v0, p0

    .line 631
    .line 632
    move-object/from16 v7, p2

    .line 633
    .line 634
    move-object/from16 v13, p5

    .line 635
    .line 636
    move v8, v3

    .line 637
    move v3, v6

    .line 638
    goto/16 :goto_d

    .line 639
    .line 640
    :cond_15
    move v4, v8

    .line 641
    if-ne v2, v4, :cond_16

    .line 642
    .line 643
    return v2

    .line 644
    :cond_16
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->parseFailure()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 645
    .line 646
    .line 647
    move-result-object v0

    .line 648
    throw v0

    .line 649
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_9
        :pswitch_2
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public f(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->k:I

    .line 2
    .line 3
    :goto_0
    iget v1, p0, Landroidx/datastore/preferences/protobuf/d0;->l:I

    .line 4
    .line 5
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    .line 6
    .line 7
    if-ge v0, v1, :cond_1

    .line 8
    .line 9
    aget v1, v2, v0

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v1}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget-object v4, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 27
    .line 28
    invoke-interface {v4, v3}, Landroidx/datastore/preferences/protobuf/z;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {p1, v1, v2, v3}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    array-length v0, v2

    .line 39
    :goto_2
    if-ge v1, v0, :cond_2

    .line 40
    .line 41
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 42
    .line 43
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/d0;->j:[I

    .line 44
    .line 45
    aget v3, v3, v1

    .line 46
    .line 47
    int-to-long v3, v3

    .line 48
    invoke-virtual {v2, p1, v3, v4}, Landroidx/datastore/preferences/protobuf/w;->c(Ljava/lang/Object;J)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 55
    .line 56
    invoke-virtual {v0, p1}, Landroidx/datastore/preferences/protobuf/l0;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/m;->f(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public final f0(Ljava/lang/Object;[BIIIIIIJIJLandroidx/datastore/preferences/protobuf/d$b;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BIIIIIIJIJ",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move/from16 v1, p8

    .line 2
    .line 3
    move-wide/from16 v2, p12

    .line 4
    .line 5
    sget-object v4, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 6
    .line 7
    invoke-virtual {v4, p1, v2, v3}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    check-cast v5, Landroidx/datastore/preferences/protobuf/s$i;

    .line 12
    .line 13
    invoke-interface {v5}, Landroidx/datastore/preferences/protobuf/s$i;->q()Z

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    const/4 v7, 0x2

    .line 18
    if-nez v6, :cond_1

    .line 19
    .line 20
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v6

    .line 24
    if-nez v6, :cond_0

    .line 25
    .line 26
    const/16 v6, 0xa

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    mul-int/2addr v6, v7

    .line 30
    :goto_0
    invoke-interface {v5, v6}, Landroidx/datastore/preferences/protobuf/s$i;->d(I)Landroidx/datastore/preferences/protobuf/s$i;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-virtual {v4, p1, v2, v3, v5}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    move-object v6, v5

    .line 38
    const/4 v2, 0x1

    .line 39
    const/4 v3, 0x5

    .line 40
    packed-switch p11, :pswitch_data_0

    .line 41
    .line 42
    .line 43
    goto/16 :goto_2

    .line 44
    .line 45
    :pswitch_0
    const/4 p1, 0x3

    .line 46
    if-ne p7, p1, :cond_f

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    move-object p6, p0

    .line 53
    move-object/from16 p8, p2

    .line 54
    .line 55
    move/from16 p9, p3

    .line 56
    .line 57
    move/from16 p10, p4

    .line 58
    .line 59
    move p7, p5

    .line 60
    move-object/from16 p12, p14

    .line 61
    .line 62
    move-object/from16 p11, v6

    .line 63
    .line 64
    invoke-static/range {p6 .. p12}, Landroidx/datastore/preferences/protobuf/d;->o(Landroidx/datastore/preferences/protobuf/i0;I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    return p0

    .line 69
    :pswitch_1
    move-object/from16 p0, p14

    .line 70
    .line 71
    if-ne p7, v7, :cond_2

    .line 72
    .line 73
    invoke-static {p2, p3, v6, p0}, Landroidx/datastore/preferences/protobuf/d;->x([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0

    .line 78
    :cond_2
    if-nez p7, :cond_f

    .line 79
    .line 80
    move-object/from16 p11, p0

    .line 81
    .line 82
    move-object p7, p2

    .line 83
    move/from16 p8, p3

    .line 84
    .line 85
    move/from16 p9, p4

    .line 86
    .line 87
    move p6, p5

    .line 88
    move-object/from16 p10, v6

    .line 89
    .line 90
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->B(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    return p0

    .line 95
    :pswitch_2
    move-object/from16 p0, p14

    .line 96
    .line 97
    if-ne p7, v7, :cond_3

    .line 98
    .line 99
    invoke-static {p2, p3, v6, p0}, Landroidx/datastore/preferences/protobuf/d;->w([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    return p0

    .line 104
    :cond_3
    if-nez p7, :cond_f

    .line 105
    .line 106
    move-object/from16 p11, p0

    .line 107
    .line 108
    move-object p7, p2

    .line 109
    move/from16 p8, p3

    .line 110
    .line 111
    move/from16 p9, p4

    .line 112
    .line 113
    move p6, p5

    .line 114
    move-object/from16 p10, v6

    .line 115
    .line 116
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->A(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    return p0

    .line 121
    :pswitch_3
    move-object/from16 v2, p14

    .line 122
    .line 123
    if-ne p7, v7, :cond_4

    .line 124
    .line 125
    invoke-static {p2, p3, v6, v2}, Landroidx/datastore/preferences/protobuf/d;->y([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    goto :goto_1

    .line 130
    :cond_4
    if-nez p7, :cond_f

    .line 131
    .line 132
    move-object v3, p2

    .line 133
    move v4, p3

    .line 134
    move v5, p4

    .line 135
    move-object v7, v2

    .line 136
    move v2, p5

    .line 137
    invoke-static/range {v2 .. v7}, Landroidx/datastore/preferences/protobuf/d;->J(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    :goto_1
    check-cast p1, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;

    .line 142
    .line 143
    iget-object p3, p1, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 144
    .line 145
    invoke-static {}, Landroidx/datastore/preferences/protobuf/m0;->e()Landroidx/datastore/preferences/protobuf/m0;

    .line 146
    .line 147
    .line 148
    move-result-object p4

    .line 149
    if-ne p3, p4, :cond_5

    .line 150
    .line 151
    const/4 p3, 0x0

    .line 152
    :cond_5
    invoke-virtual {p0, v1}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    .line 153
    .line 154
    .line 155
    move-result-object p4

    .line 156
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 157
    .line 158
    invoke-static {p6, v6, p4, p3, p0}, Landroidx/datastore/preferences/protobuf/j0;->A(ILjava/util/List;Landroidx/datastore/preferences/protobuf/s$e;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    check-cast p0, Landroidx/datastore/preferences/protobuf/m0;

    .line 163
    .line 164
    if-eqz p0, :cond_6

    .line 165
    .line 166
    iput-object p0, p1, Landroidx/datastore/preferences/protobuf/GeneratedMessageLite;->unknownFields:Landroidx/datastore/preferences/protobuf/m0;

    .line 167
    .line 168
    :cond_6
    return p2

    .line 169
    :pswitch_4
    if-ne p7, v7, :cond_f

    .line 170
    .line 171
    move-object p7, p2

    .line 172
    move/from16 p8, p3

    .line 173
    .line 174
    move/from16 p9, p4

    .line 175
    .line 176
    move p6, p5

    .line 177
    move-object/from16 p11, p14

    .line 178
    .line 179
    move-object/from16 p10, v6

    .line 180
    .line 181
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->c(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    return p0

    .line 186
    :pswitch_5
    if-ne p7, v7, :cond_f

    .line 187
    .line 188
    invoke-virtual {p0, v1}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    move-object p6, p0

    .line 193
    move-object/from16 p8, p2

    .line 194
    .line 195
    move/from16 p9, p3

    .line 196
    .line 197
    move/from16 p10, p4

    .line 198
    .line 199
    move p7, p5

    .line 200
    move-object/from16 p12, p14

    .line 201
    .line 202
    move-object/from16 p11, v6

    .line 203
    .line 204
    invoke-static/range {p6 .. p12}, Landroidx/datastore/preferences/protobuf/d;->q(Landroidx/datastore/preferences/protobuf/i0;I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    return p0

    .line 209
    :pswitch_6
    if-ne p7, v7, :cond_f

    .line 210
    .line 211
    const-wide/32 p0, 0x20000000

    .line 212
    .line 213
    .line 214
    and-long p0, p9, p0

    .line 215
    .line 216
    const-wide/16 v0, 0x0

    .line 217
    .line 218
    cmp-long p0, p0, v0

    .line 219
    .line 220
    if-nez p0, :cond_7

    .line 221
    .line 222
    move-object p7, p2

    .line 223
    move/from16 p8, p3

    .line 224
    .line 225
    move/from16 p9, p4

    .line 226
    .line 227
    move p6, p5

    .line 228
    move-object/from16 p11, p14

    .line 229
    .line 230
    move-object/from16 p10, v6

    .line 231
    .line 232
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->D(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    return p0

    .line 237
    :cond_7
    move-object p7, p2

    .line 238
    move/from16 p8, p3

    .line 239
    .line 240
    move/from16 p9, p4

    .line 241
    .line 242
    move p6, p5

    .line 243
    move-object/from16 p11, p14

    .line 244
    .line 245
    move-object/from16 p10, v6

    .line 246
    .line 247
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->E(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    return p0

    .line 252
    :pswitch_7
    move-object/from16 p0, p14

    .line 253
    .line 254
    if-ne p7, v7, :cond_8

    .line 255
    .line 256
    invoke-static {p2, p3, v6, p0}, Landroidx/datastore/preferences/protobuf/d;->r([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    return p0

    .line 261
    :cond_8
    if-nez p7, :cond_f

    .line 262
    .line 263
    move-object/from16 p11, p0

    .line 264
    .line 265
    move-object p7, p2

    .line 266
    move/from16 p8, p3

    .line 267
    .line 268
    move/from16 p9, p4

    .line 269
    .line 270
    move p6, p5

    .line 271
    move-object/from16 p10, v6

    .line 272
    .line 273
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->a(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    return p0

    .line 278
    :pswitch_8
    move-object/from16 v2, p14

    .line 279
    .line 280
    if-ne p7, v7, :cond_9

    .line 281
    .line 282
    invoke-static {p2, p3, v6, v2}, Landroidx/datastore/preferences/protobuf/d;->t([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 283
    .line 284
    .line 285
    move-result p0

    .line 286
    return p0

    .line 287
    :cond_9
    if-ne p7, v3, :cond_f

    .line 288
    .line 289
    move-object p7, p2

    .line 290
    move/from16 p8, p3

    .line 291
    .line 292
    move/from16 p9, p4

    .line 293
    .line 294
    move p6, p5

    .line 295
    move-object/from16 p11, v2

    .line 296
    .line 297
    move-object/from16 p10, v6

    .line 298
    .line 299
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->i(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 300
    .line 301
    .line 302
    move-result p0

    .line 303
    return p0

    .line 304
    :pswitch_9
    move-object/from16 p0, p14

    .line 305
    .line 306
    if-ne p7, v7, :cond_a

    .line 307
    .line 308
    invoke-static {p2, p3, v6, p0}, Landroidx/datastore/preferences/protobuf/d;->u([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 309
    .line 310
    .line 311
    move-result p0

    .line 312
    return p0

    .line 313
    :cond_a
    if-ne p7, v2, :cond_f

    .line 314
    .line 315
    move-object/from16 p11, p0

    .line 316
    .line 317
    move-object p7, p2

    .line 318
    move/from16 p8, p3

    .line 319
    .line 320
    move/from16 p9, p4

    .line 321
    .line 322
    move p6, p5

    .line 323
    move-object/from16 p10, v6

    .line 324
    .line 325
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->k(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 326
    .line 327
    .line 328
    move-result p0

    .line 329
    return p0

    .line 330
    :pswitch_a
    move-object/from16 p0, p14

    .line 331
    .line 332
    if-ne p7, v7, :cond_b

    .line 333
    .line 334
    invoke-static {p2, p3, v6, p0}, Landroidx/datastore/preferences/protobuf/d;->y([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 335
    .line 336
    .line 337
    move-result p0

    .line 338
    return p0

    .line 339
    :cond_b
    if-nez p7, :cond_f

    .line 340
    .line 341
    move-object/from16 p11, p0

    .line 342
    .line 343
    move-object p7, p2

    .line 344
    move/from16 p8, p3

    .line 345
    .line 346
    move/from16 p9, p4

    .line 347
    .line 348
    move p6, p5

    .line 349
    move-object/from16 p10, v6

    .line 350
    .line 351
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->J(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 352
    .line 353
    .line 354
    move-result p0

    .line 355
    return p0

    .line 356
    :pswitch_b
    move-object/from16 p0, p14

    .line 357
    .line 358
    if-ne p7, v7, :cond_c

    .line 359
    .line 360
    invoke-static {p2, p3, v6, p0}, Landroidx/datastore/preferences/protobuf/d;->z([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 361
    .line 362
    .line 363
    move-result p0

    .line 364
    return p0

    .line 365
    :cond_c
    if-nez p7, :cond_f

    .line 366
    .line 367
    move-object/from16 p11, p0

    .line 368
    .line 369
    move-object p7, p2

    .line 370
    move/from16 p8, p3

    .line 371
    .line 372
    move/from16 p9, p4

    .line 373
    .line 374
    move p6, p5

    .line 375
    move-object/from16 p10, v6

    .line 376
    .line 377
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->M(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 378
    .line 379
    .line 380
    move-result p0

    .line 381
    return p0

    .line 382
    :pswitch_c
    move-object/from16 v2, p14

    .line 383
    .line 384
    if-ne p7, v7, :cond_d

    .line 385
    .line 386
    invoke-static {p2, p3, v6, v2}, Landroidx/datastore/preferences/protobuf/d;->v([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 387
    .line 388
    .line 389
    move-result p0

    .line 390
    return p0

    .line 391
    :cond_d
    if-ne p7, v3, :cond_f

    .line 392
    .line 393
    move-object p7, p2

    .line 394
    move/from16 p8, p3

    .line 395
    .line 396
    move/from16 p9, p4

    .line 397
    .line 398
    move p6, p5

    .line 399
    move-object/from16 p11, v2

    .line 400
    .line 401
    move-object/from16 p10, v6

    .line 402
    .line 403
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->m(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 404
    .line 405
    .line 406
    move-result p0

    .line 407
    return p0

    .line 408
    :pswitch_d
    move-object/from16 p0, p14

    .line 409
    .line 410
    if-ne p7, v7, :cond_e

    .line 411
    .line 412
    invoke-static {p2, p3, v6, p0}, Landroidx/datastore/preferences/protobuf/d;->s([BILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 413
    .line 414
    .line 415
    move-result p0

    .line 416
    return p0

    .line 417
    :cond_e
    if-ne p7, v2, :cond_f

    .line 418
    .line 419
    move-object/from16 p11, p0

    .line 420
    .line 421
    move-object p7, p2

    .line 422
    move/from16 p8, p3

    .line 423
    .line 424
    move/from16 p9, p4

    .line 425
    .line 426
    move p6, p5

    .line 427
    move-object/from16 p10, v6

    .line 428
    .line 429
    invoke-static/range {p6 .. p11}, Landroidx/datastore/preferences/protobuf/d;->e(I[BIILandroidx/datastore/preferences/protobuf/s$i;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 430
    .line 431
    .line 432
    move-result p0

    .line 433
    return p0

    .line 434
    :cond_f
    :goto_2
    return p3

    .line 435
    :pswitch_data_0
    .packed-switch 0x12
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_a
        :pswitch_3
        :pswitch_8
        :pswitch_9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public g(Ljava/lang/Object;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/d0;->y(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/d0;->x(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final g0(I)I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->c:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->d:I

    .line 6
    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Landroidx/datastore/preferences/protobuf/d0;->q0(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, -0x1

    .line 16
    return p0
.end method

.method public h()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->m:Ll/v130;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->e:Landroidx/datastore/preferences/protobuf/b0;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/v130;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final h0(II)I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->c:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Landroidx/datastore/preferences/protobuf/d0;->d:I

    .line 6
    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroidx/datastore/preferences/protobuf/d0;->q0(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method public i(Ljava/lang/Object;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    invoke-virtual {p0, v1}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 17
    .line 18
    .line 19
    move-result-wide v5

    .line 20
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/16 v7, 0x25

    .line 25
    .line 26
    packed-switch v3, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :pswitch_0
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    mul-int/lit8 v2, v2, 0x35

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    :goto_1
    add-int/2addr v2, v3

    .line 48
    goto/16 :goto_3

    .line 49
    .line 50
    :pswitch_1
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    mul-int/lit8 v2, v2, 0x35

    .line 57
    .line 58
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 59
    .line 60
    .line 61
    move-result-wide v3

    .line 62
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    goto :goto_1

    .line 67
    :pswitch_2
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    mul-int/lit8 v2, v2, 0x35

    .line 74
    .line 75
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    goto :goto_1

    .line 80
    :pswitch_3
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_1

    .line 85
    .line 86
    mul-int/lit8 v2, v2, 0x35

    .line 87
    .line 88
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    goto :goto_1

    .line 97
    :pswitch_4
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-eqz v3, :cond_1

    .line 102
    .line 103
    mul-int/lit8 v2, v2, 0x35

    .line 104
    .line 105
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    goto :goto_1

    .line 110
    :pswitch_5
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_1

    .line 115
    .line 116
    mul-int/lit8 v2, v2, 0x35

    .line 117
    .line 118
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    goto :goto_1

    .line 123
    :pswitch_6
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_1

    .line 128
    .line 129
    mul-int/lit8 v2, v2, 0x35

    .line 130
    .line 131
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    goto :goto_1

    .line 136
    :pswitch_7
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-eqz v3, :cond_1

    .line 141
    .line 142
    mul-int/lit8 v2, v2, 0x35

    .line 143
    .line 144
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    goto :goto_1

    .line 153
    :pswitch_8
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-eqz v3, :cond_1

    .line 158
    .line 159
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    mul-int/lit8 v2, v2, 0x35

    .line 164
    .line 165
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    goto :goto_1

    .line 170
    :pswitch_9
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-eqz v3, :cond_1

    .line 175
    .line 176
    mul-int/lit8 v2, v2, 0x35

    .line 177
    .line 178
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    check-cast v3, Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    goto/16 :goto_1

    .line 189
    .line 190
    :pswitch_a
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    if-eqz v3, :cond_1

    .line 195
    .line 196
    mul-int/lit8 v2, v2, 0x35

    .line 197
    .line 198
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->W(Ljava/lang/Object;J)Z

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/s;->c(Z)I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    goto/16 :goto_1

    .line 207
    .line 208
    :pswitch_b
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-eqz v3, :cond_1

    .line 213
    .line 214
    mul-int/lit8 v2, v2, 0x35

    .line 215
    .line 216
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    goto/16 :goto_1

    .line 221
    .line 222
    :pswitch_c
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-eqz v3, :cond_1

    .line 227
    .line 228
    mul-int/lit8 v2, v2, 0x35

    .line 229
    .line 230
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 231
    .line 232
    .line 233
    move-result-wide v3

    .line 234
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    goto/16 :goto_1

    .line 239
    .line 240
    :pswitch_d
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    if-eqz v3, :cond_1

    .line 245
    .line 246
    mul-int/lit8 v2, v2, 0x35

    .line 247
    .line 248
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 249
    .line 250
    .line 251
    move-result v3

    .line 252
    goto/16 :goto_1

    .line 253
    .line 254
    :pswitch_e
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    if-eqz v3, :cond_1

    .line 259
    .line 260
    mul-int/lit8 v2, v2, 0x35

    .line 261
    .line 262
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 263
    .line 264
    .line 265
    move-result-wide v3

    .line 266
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    goto/16 :goto_1

    .line 271
    .line 272
    :pswitch_f
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    if-eqz v3, :cond_1

    .line 277
    .line 278
    mul-int/lit8 v2, v2, 0x35

    .line 279
    .line 280
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 281
    .line 282
    .line 283
    move-result-wide v3

    .line 284
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    goto/16 :goto_1

    .line 289
    .line 290
    :pswitch_10
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    if-eqz v3, :cond_1

    .line 295
    .line 296
    mul-int/lit8 v2, v2, 0x35

    .line 297
    .line 298
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->Y(Ljava/lang/Object;J)F

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    goto/16 :goto_1

    .line 307
    .line 308
    :pswitch_11
    invoke-virtual {p0, p1, v4, v1}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 309
    .line 310
    .line 311
    move-result v3

    .line 312
    if-eqz v3, :cond_1

    .line 313
    .line 314
    mul-int/lit8 v2, v2, 0x35

    .line 315
    .line 316
    invoke-static {p1, v5, v6}, Landroidx/datastore/preferences/protobuf/d0;->X(Ljava/lang/Object;J)D

    .line 317
    .line 318
    .line 319
    move-result-wide v3

    .line 320
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 321
    .line 322
    .line 323
    move-result-wide v3

    .line 324
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    goto/16 :goto_1

    .line 329
    .line 330
    :pswitch_12
    mul-int/lit8 v2, v2, 0x35

    .line 331
    .line 332
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 337
    .line 338
    .line 339
    move-result v3

    .line 340
    goto/16 :goto_1

    .line 341
    .line 342
    :pswitch_13
    mul-int/lit8 v2, v2, 0x35

    .line 343
    .line 344
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v3

    .line 348
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 349
    .line 350
    .line 351
    move-result v3

    .line 352
    goto/16 :goto_1

    .line 353
    .line 354
    :pswitch_14
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v3

    .line 358
    if-eqz v3, :cond_0

    .line 359
    .line 360
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 361
    .line 362
    .line 363
    move-result v7

    .line 364
    :cond_0
    :goto_2
    mul-int/lit8 v2, v2, 0x35

    .line 365
    .line 366
    add-int/2addr v2, v7

    .line 367
    goto/16 :goto_3

    .line 368
    .line 369
    :pswitch_15
    mul-int/lit8 v2, v2, 0x35

    .line 370
    .line 371
    invoke-static {p1, v5, v6}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 372
    .line 373
    .line 374
    move-result-wide v3

    .line 375
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    goto/16 :goto_1

    .line 380
    .line 381
    :pswitch_16
    mul-int/lit8 v2, v2, 0x35

    .line 382
    .line 383
    invoke-static {p1, v5, v6}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 384
    .line 385
    .line 386
    move-result v3

    .line 387
    goto/16 :goto_1

    .line 388
    .line 389
    :pswitch_17
    mul-int/lit8 v2, v2, 0x35

    .line 390
    .line 391
    invoke-static {p1, v5, v6}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 392
    .line 393
    .line 394
    move-result-wide v3

    .line 395
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    goto/16 :goto_1

    .line 400
    .line 401
    :pswitch_18
    mul-int/lit8 v2, v2, 0x35

    .line 402
    .line 403
    invoke-static {p1, v5, v6}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 404
    .line 405
    .line 406
    move-result v3

    .line 407
    goto/16 :goto_1

    .line 408
    .line 409
    :pswitch_19
    mul-int/lit8 v2, v2, 0x35

    .line 410
    .line 411
    invoke-static {p1, v5, v6}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 412
    .line 413
    .line 414
    move-result v3

    .line 415
    goto/16 :goto_1

    .line 416
    .line 417
    :pswitch_1a
    mul-int/lit8 v2, v2, 0x35

    .line 418
    .line 419
    invoke-static {p1, v5, v6}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    goto/16 :goto_1

    .line 424
    .line 425
    :pswitch_1b
    mul-int/lit8 v2, v2, 0x35

    .line 426
    .line 427
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 432
    .line 433
    .line 434
    move-result v3

    .line 435
    goto/16 :goto_1

    .line 436
    .line 437
    :pswitch_1c
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    move-result-object v3

    .line 441
    if-eqz v3, :cond_0

    .line 442
    .line 443
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 444
    .line 445
    .line 446
    move-result v7

    .line 447
    goto :goto_2

    .line 448
    :pswitch_1d
    mul-int/lit8 v2, v2, 0x35

    .line 449
    .line 450
    invoke-static {p1, v5, v6}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 451
    .line 452
    .line 453
    move-result-object v3

    .line 454
    check-cast v3, Ljava/lang/String;

    .line 455
    .line 456
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 457
    .line 458
    .line 459
    move-result v3

    .line 460
    goto/16 :goto_1

    .line 461
    .line 462
    :pswitch_1e
    mul-int/lit8 v2, v2, 0x35

    .line 463
    .line 464
    invoke-static {p1, v5, v6}, Ll/lyj0;->r(Ljava/lang/Object;J)Z

    .line 465
    .line 466
    .line 467
    move-result v3

    .line 468
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/s;->c(Z)I

    .line 469
    .line 470
    .line 471
    move-result v3

    .line 472
    goto/16 :goto_1

    .line 473
    .line 474
    :pswitch_1f
    mul-int/lit8 v2, v2, 0x35

    .line 475
    .line 476
    invoke-static {p1, v5, v6}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 477
    .line 478
    .line 479
    move-result v3

    .line 480
    goto/16 :goto_1

    .line 481
    .line 482
    :pswitch_20
    mul-int/lit8 v2, v2, 0x35

    .line 483
    .line 484
    invoke-static {p1, v5, v6}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 485
    .line 486
    .line 487
    move-result-wide v3

    .line 488
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 489
    .line 490
    .line 491
    move-result v3

    .line 492
    goto/16 :goto_1

    .line 493
    .line 494
    :pswitch_21
    mul-int/lit8 v2, v2, 0x35

    .line 495
    .line 496
    invoke-static {p1, v5, v6}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 497
    .line 498
    .line 499
    move-result v3

    .line 500
    goto/16 :goto_1

    .line 501
    .line 502
    :pswitch_22
    mul-int/lit8 v2, v2, 0x35

    .line 503
    .line 504
    invoke-static {p1, v5, v6}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 505
    .line 506
    .line 507
    move-result-wide v3

    .line 508
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 509
    .line 510
    .line 511
    move-result v3

    .line 512
    goto/16 :goto_1

    .line 513
    .line 514
    :pswitch_23
    mul-int/lit8 v2, v2, 0x35

    .line 515
    .line 516
    invoke-static {p1, v5, v6}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 517
    .line 518
    .line 519
    move-result-wide v3

    .line 520
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 521
    .line 522
    .line 523
    move-result v3

    .line 524
    goto/16 :goto_1

    .line 525
    .line 526
    :pswitch_24
    mul-int/lit8 v2, v2, 0x35

    .line 527
    .line 528
    invoke-static {p1, v5, v6}, Ll/lyj0;->z(Ljava/lang/Object;J)F

    .line 529
    .line 530
    .line 531
    move-result v3

    .line 532
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 533
    .line 534
    .line 535
    move-result v3

    .line 536
    goto/16 :goto_1

    .line 537
    .line 538
    :pswitch_25
    mul-int/lit8 v2, v2, 0x35

    .line 539
    .line 540
    invoke-static {p1, v5, v6}, Ll/lyj0;->y(Ljava/lang/Object;J)D

    .line 541
    .line 542
    .line 543
    move-result-wide v3

    .line 544
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 545
    .line 546
    .line 547
    move-result-wide v3

    .line 548
    invoke-static {v3, v4}, Landroidx/datastore/preferences/protobuf/s;->f(J)I

    .line 549
    .line 550
    .line 551
    move-result v3

    .line 552
    goto/16 :goto_1

    .line 553
    .line 554
    :cond_1
    :goto_3
    add-int/lit8 v1, v1, 0x3

    .line 555
    .line 556
    goto/16 :goto_0

    .line 557
    .line 558
    :cond_2
    mul-int/lit8 v2, v2, 0x35

    .line 559
    .line 560
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 561
    .line 562
    invoke-virtual {v0, p1}, Landroidx/datastore/preferences/protobuf/l0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 567
    .line 568
    .line 569
    move-result v0

    .line 570
    add-int/2addr v2, v0

    .line 571
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 572
    .line 573
    if-eqz v0, :cond_3

    .line 574
    .line 575
    mul-int/lit8 v2, v2, 0x35

    .line 576
    .line 577
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 578
    .line 579
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 580
    .line 581
    .line 582
    move-result-object p0

    .line 583
    invoke-virtual {p0}, Landroidx/datastore/preferences/protobuf/p;->hashCode()I

    .line 584
    .line 585
    .line 586
    move-result p0

    .line 587
    add-int/2addr v2, p0

    .line 588
    :cond_3
    return v2

    .line 589
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final i0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method public j(Ljava/lang/Object;[BIILandroidx/datastore/preferences/protobuf/d$b;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BII",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p5}, Landroidx/datastore/preferences/protobuf/d0;->e0(Ljava/lang/Object;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v6, 0x0

    .line 10
    move-object v1, p0

    .line 11
    move-object v2, p1

    .line 12
    move-object v3, p2

    .line 13
    move v4, p3

    .line 14
    move v5, p4

    .line 15
    move-object v7, p5

    .line 16
    invoke-virtual/range {v1 .. v7}, Landroidx/datastore/preferences/protobuf/d0;->d0(Ljava/lang/Object;[BIIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final j0(Ljava/lang/Object;JLandroidx/datastore/preferences/protobuf/h0;Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "J",
            "Landroidx/datastore/preferences/protobuf/h0;",
            "Landroidx/datastore/preferences/protobuf/i0<",
            "TE;>;",
            "Landroidx/datastore/preferences/protobuf/l;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p4, p0, p5, p6}, Landroidx/datastore/preferences/protobuf/h0;->M(Ljava/util/List;Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final k(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final k0(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/h0;Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Landroidx/datastore/preferences/protobuf/h0;",
            "Landroidx/datastore/preferences/protobuf/i0<",
            "TE;>;",
            "Landroidx/datastore/preferences/protobuf/l;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, v1}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p3, p0, p4, p5}, Landroidx/datastore/preferences/protobuf/h0;->E(Ljava/util/List;Landroidx/datastore/preferences/protobuf/i0;Landroidx/datastore/preferences/protobuf/l;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final l0(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/h0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->B(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-interface {p3}, Landroidx/datastore/preferences/protobuf/h0;->O()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, v0, v1, p0}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-boolean p0, p0, Landroidx/datastore/preferences/protobuf/d0;->g:Z

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-interface {p3}, Landroidx/datastore/preferences/protobuf/h0;->L()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, v0, v1, p0}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    invoke-interface {p3}, Landroidx/datastore/preferences/protobuf/h0;->g()Landroidx/datastore/preferences/protobuf/ByteString;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p1, v0, v1, p0}, Ll/lyj0;->T(Ljava/lang/Object;JLjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final m([BIILandroidx/datastore/preferences/protobuf/y$a;Ljava/util/Map;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">([BII",
            "Landroidx/datastore/preferences/protobuf/y$a<",
            "TK;TV;>;",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v6, p6

    .line 2
    .line 3
    invoke-static {p1, p2, v6}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget v0, v6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 8
    .line 9
    if-ltz v0, :cond_6

    .line 10
    .line 11
    sub-int v1, p3, p2

    .line 12
    .line 13
    if-gt v0, v1, :cond_6

    .line 14
    .line 15
    add-int v7, p2, v0

    .line 16
    .line 17
    iget-object v0, p4, Landroidx/datastore/preferences/protobuf/y$a;->b:Ljava/lang/Object;

    .line 18
    .line 19
    iget-object v1, p4, Landroidx/datastore/preferences/protobuf/y$a;->d:Ljava/lang/Object;

    .line 20
    .line 21
    move-object v8, v0

    .line 22
    move-object v9, v1

    .line 23
    :goto_0
    if-ge p2, v7, :cond_4

    .line 24
    .line 25
    add-int/lit8 v0, p2, 0x1

    .line 26
    .line 27
    aget-byte p2, p1, p2

    .line 28
    .line 29
    if-gez p2, :cond_0

    .line 30
    .line 31
    invoke-static {p2, p1, v0, v6}, Landroidx/datastore/preferences/protobuf/d;->H(I[BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget p2, v6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 36
    .line 37
    :cond_0
    move v2, v0

    .line 38
    ushr-int/lit8 v0, p2, 0x3

    .line 39
    .line 40
    and-int/lit8 v1, p2, 0x7

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    if-eq v0, v3, :cond_2

    .line 44
    .line 45
    const/4 v3, 0x2

    .line 46
    if-eq v0, v3, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object v0, p4, Landroidx/datastore/preferences/protobuf/y$a;->c:Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;->getWireType()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-ne v1, v0, :cond_3

    .line 56
    .line 57
    iget-object v4, p4, Landroidx/datastore/preferences/protobuf/y$a;->c:Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 58
    .line 59
    iget-object p2, p4, Landroidx/datastore/preferences/protobuf/y$a;->d:Ljava/lang/Object;

    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    move-object v0, p0

    .line 66
    move-object v1, p1

    .line 67
    move v3, p3

    .line 68
    invoke-virtual/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->n([BIILandroidx/datastore/preferences/protobuf/WireFormat$FieldType;Ljava/lang/Class;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    iget-object v9, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    iget-object v0, p4, Landroidx/datastore/preferences/protobuf/y$a;->a:Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;->getWireType()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-ne v1, v0, :cond_3

    .line 82
    .line 83
    iget-object v4, p4, Landroidx/datastore/preferences/protobuf/y$a;->a:Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;

    .line 84
    .line 85
    const/4 v5, 0x0

    .line 86
    move-object v0, p0

    .line 87
    move-object v1, p1

    .line 88
    move v3, p3

    .line 89
    invoke-virtual/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->n([BIILandroidx/datastore/preferences/protobuf/WireFormat$FieldType;Ljava/lang/Class;Landroidx/datastore/preferences/protobuf/d$b;)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    iget-object v8, v6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    :goto_1
    invoke-static {p2, p1, v2, p3, v6}, Landroidx/datastore/preferences/protobuf/d;->N(I[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    goto :goto_0

    .line 101
    :cond_4
    if-ne p2, v7, :cond_5

    .line 102
    .line 103
    invoke-interface {p5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    return v7

    .line 107
    :cond_5
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->parseFailure()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    throw p0

    .line 112
    :cond_6
    invoke-static {}, Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;->truncatedMessage()Landroidx/datastore/preferences/protobuf/InvalidProtocolBufferException;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    throw p0
.end method

.method public final m0(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/h0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->B(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->n:Landroidx/datastore/preferences/protobuf/w;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p3, p0}, Landroidx/datastore/preferences/protobuf/h0;->C(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {p2}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-virtual {p0, p1, v0, v1}, Landroidx/datastore/preferences/protobuf/w;->e(Ljava/lang/Object;J)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p3, p0}, Landroidx/datastore/preferences/protobuf/h0;->p(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final n([BIILandroidx/datastore/preferences/protobuf/WireFormat$FieldType;Ljava/lang/Class;Landroidx/datastore/preferences/protobuf/d$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Landroidx/datastore/preferences/protobuf/WireFormat$FieldType;",
            "Ljava/lang/Class<",
            "*>;",
            "Landroidx/datastore/preferences/protobuf/d$b;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object p0, Landroidx/datastore/preferences/protobuf/d0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p4}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    aget p0, p0, p4

    .line 8
    .line 9
    const/4 p4, 0x0

    .line 10
    packed-switch p0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    const-string p0, "unsupported field type."

    .line 14
    .line 15
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return p4

    .line 19
    :pswitch_0
    invoke-static {p1, p2, p6}, Landroidx/datastore/preferences/protobuf/d;->F([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :pswitch_1
    invoke-static {p1, p2, p6}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iget-wide p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 29
    .line 30
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/g;->c(J)J

    .line 31
    .line 32
    .line 33
    move-result-wide p1

    .line 34
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 39
    .line 40
    return p0

    .line 41
    :pswitch_2
    invoke-static {p1, p2, p6}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    iget p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 46
    .line 47
    invoke-static {p1}, Landroidx/datastore/preferences/protobuf/g;->b(I)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 56
    .line 57
    return p0

    .line 58
    :pswitch_3
    invoke-static {}, Ll/g7b0;->a()Ll/g7b0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, p5}, Ll/g7b0;->d(Ljava/lang/Class;)Landroidx/datastore/preferences/protobuf/i0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p0, p1, p2, p3, p6}, Landroidx/datastore/preferences/protobuf/d;->p(Landroidx/datastore/preferences/protobuf/i0;[BIILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :pswitch_4
    invoke-static {p1, p2, p6}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    iget-wide p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 76
    .line 77
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 82
    .line 83
    return p0

    .line 84
    :pswitch_5
    invoke-static {p1, p2, p6}, Landroidx/datastore/preferences/protobuf/d;->I([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    iget p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->a:I

    .line 89
    .line 90
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 95
    .line 96
    return p0

    .line 97
    :pswitch_6
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->l([BI)F

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iput-object p0, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 106
    .line 107
    add-int/lit8 p2, p2, 0x4

    .line 108
    .line 109
    return p2

    .line 110
    :pswitch_7
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->j([BI)J

    .line 111
    .line 112
    .line 113
    move-result-wide p0

    .line 114
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    iput-object p0, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 119
    .line 120
    add-int/lit8 p2, p2, 0x8

    .line 121
    .line 122
    return p2

    .line 123
    :pswitch_8
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->h([BI)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    iput-object p0, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 132
    .line 133
    add-int/lit8 p2, p2, 0x4

    .line 134
    .line 135
    return p2

    .line 136
    :pswitch_9
    invoke-static {p1, p2}, Landroidx/datastore/preferences/protobuf/d;->d([BI)D

    .line 137
    .line 138
    .line 139
    move-result-wide p0

    .line 140
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    iput-object p0, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 145
    .line 146
    add-int/lit8 p2, p2, 0x8

    .line 147
    .line 148
    return p2

    .line 149
    :pswitch_a
    invoke-static {p1, p2, p6}, Landroidx/datastore/preferences/protobuf/d;->b([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    return p0

    .line 154
    :pswitch_b
    invoke-static {p1, p2, p6}, Landroidx/datastore/preferences/protobuf/d;->L([BILandroidx/datastore/preferences/protobuf/d$b;)I

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    iget-wide p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->b:J

    .line 159
    .line 160
    const-wide/16 v0, 0x0

    .line 161
    .line 162
    cmp-long p1, p1, v0

    .line 163
    .line 164
    if-eqz p1, :cond_0

    .line 165
    .line 166
    const/4 p4, 0x1

    .line 167
    :cond_0
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p6, Landroidx/datastore/preferences/protobuf/d$b;->c:Ljava/lang/Object;

    .line 172
    .line 173
    return p0

    .line 174
    nop

    .line 175
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final o0(Ljava/lang/Object;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/d0;->i0(I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    ushr-int/lit8 p2, p0, 0x14

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    shl-int p2, v0, p2

    .line 14
    .line 15
    const v0, 0xfffff

    .line 16
    .line 17
    .line 18
    and-int/2addr p0, v0

    .line 19
    int-to-long v0, p0

    .line 20
    invoke-static {p1, v0, v1}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    or-int/2addr p0, p2

    .line 25
    invoke-static {p1, v0, v1, p0}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final p(Ljava/lang/Object;Ljava/lang/Object;I)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;I)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x1

    .line 15
    packed-switch v0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    return v4

    .line 19
    :pswitch_0
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->H(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/j0;->K(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    return v4

    .line 40
    :cond_0
    return v3

    .line 41
    :pswitch_1
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/j0;->K(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :pswitch_2
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/j0;->K(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    return p0

    .line 67
    :pswitch_3
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/j0;->K(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    return v4

    .line 88
    :cond_1
    return v3

    .line 89
    :pswitch_4
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    invoke-static {p1, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 96
    .line 97
    .line 98
    move-result-wide p0

    .line 99
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 100
    .line 101
    .line 102
    move-result-wide p2

    .line 103
    cmp-long p0, p0, p2

    .line 104
    .line 105
    if-nez p0, :cond_2

    .line 106
    .line 107
    return v4

    .line 108
    :cond_2
    return v3

    .line 109
    :pswitch_5
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_3

    .line 114
    .line 115
    invoke-static {p1, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-ne p0, p1, :cond_3

    .line 124
    .line 125
    return v4

    .line 126
    :cond_3
    return v3

    .line 127
    :pswitch_6
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_4

    .line 132
    .line 133
    invoke-static {p1, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 134
    .line 135
    .line 136
    move-result-wide p0

    .line 137
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 138
    .line 139
    .line 140
    move-result-wide p2

    .line 141
    cmp-long p0, p0, p2

    .line 142
    .line 143
    if-nez p0, :cond_4

    .line 144
    .line 145
    return v4

    .line 146
    :cond_4
    return v3

    .line 147
    :pswitch_7
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_5

    .line 152
    .line 153
    invoke-static {p1, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-ne p0, p1, :cond_5

    .line 162
    .line 163
    return v4

    .line 164
    :cond_5
    return v3

    .line 165
    :pswitch_8
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_6

    .line 170
    .line 171
    invoke-static {p1, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-ne p0, p1, :cond_6

    .line 180
    .line 181
    return v4

    .line 182
    :cond_6
    return v3

    .line 183
    :pswitch_9
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_7

    .line 188
    .line 189
    invoke-static {p1, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-ne p0, p1, :cond_7

    .line 198
    .line 199
    return v4

    .line 200
    :cond_7
    return v3

    .line 201
    :pswitch_a
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    if-eqz p0, :cond_8

    .line 206
    .line 207
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/j0;->K(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    if-eqz p0, :cond_8

    .line 220
    .line 221
    return v4

    .line 222
    :cond_8
    return v3

    .line 223
    :pswitch_b
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-eqz p0, :cond_9

    .line 228
    .line 229
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/j0;->K(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-eqz p0, :cond_9

    .line 242
    .line 243
    return v4

    .line 244
    :cond_9
    return v3

    .line 245
    :pswitch_c
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    if-eqz p0, :cond_a

    .line 250
    .line 251
    invoke-static {p1, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    invoke-static {p2, v1, v2}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-static {p0, p1}, Landroidx/datastore/preferences/protobuf/j0;->K(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result p0

    .line 263
    if-eqz p0, :cond_a

    .line 264
    .line 265
    return v4

    .line 266
    :cond_a
    return v3

    .line 267
    :pswitch_d
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    if-eqz p0, :cond_b

    .line 272
    .line 273
    invoke-static {p1, v1, v2}, Ll/lyj0;->r(Ljava/lang/Object;J)Z

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    invoke-static {p2, v1, v2}, Ll/lyj0;->r(Ljava/lang/Object;J)Z

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    if-ne p0, p1, :cond_b

    .line 282
    .line 283
    return v4

    .line 284
    :cond_b
    return v3

    .line 285
    :pswitch_e
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 286
    .line 287
    .line 288
    move-result p0

    .line 289
    if-eqz p0, :cond_c

    .line 290
    .line 291
    invoke-static {p1, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 296
    .line 297
    .line 298
    move-result p1

    .line 299
    if-ne p0, p1, :cond_c

    .line 300
    .line 301
    return v4

    .line 302
    :cond_c
    return v3

    .line 303
    :pswitch_f
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    if-eqz p0, :cond_d

    .line 308
    .line 309
    invoke-static {p1, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 310
    .line 311
    .line 312
    move-result-wide p0

    .line 313
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 314
    .line 315
    .line 316
    move-result-wide p2

    .line 317
    cmp-long p0, p0, p2

    .line 318
    .line 319
    if-nez p0, :cond_d

    .line 320
    .line 321
    return v4

    .line 322
    :cond_d
    return v3

    .line 323
    :pswitch_10
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    if-eqz p0, :cond_e

    .line 328
    .line 329
    invoke-static {p1, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    invoke-static {p2, v1, v2}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    if-ne p0, p1, :cond_e

    .line 338
    .line 339
    return v4

    .line 340
    :cond_e
    return v3

    .line 341
    :pswitch_11
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 342
    .line 343
    .line 344
    move-result p0

    .line 345
    if-eqz p0, :cond_f

    .line 346
    .line 347
    invoke-static {p1, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 348
    .line 349
    .line 350
    move-result-wide p0

    .line 351
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 352
    .line 353
    .line 354
    move-result-wide p2

    .line 355
    cmp-long p0, p0, p2

    .line 356
    .line 357
    if-nez p0, :cond_f

    .line 358
    .line 359
    return v4

    .line 360
    :cond_f
    return v3

    .line 361
    :pswitch_12
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 362
    .line 363
    .line 364
    move-result p0

    .line 365
    if-eqz p0, :cond_10

    .line 366
    .line 367
    invoke-static {p1, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 368
    .line 369
    .line 370
    move-result-wide p0

    .line 371
    invoke-static {p2, v1, v2}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 372
    .line 373
    .line 374
    move-result-wide p2

    .line 375
    cmp-long p0, p0, p2

    .line 376
    .line 377
    if-nez p0, :cond_10

    .line 378
    .line 379
    return v4

    .line 380
    :cond_10
    return v3

    .line 381
    :pswitch_13
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 382
    .line 383
    .line 384
    move-result p0

    .line 385
    if-eqz p0, :cond_11

    .line 386
    .line 387
    invoke-static {p1, v1, v2}, Ll/lyj0;->z(Ljava/lang/Object;J)F

    .line 388
    .line 389
    .line 390
    move-result p0

    .line 391
    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 392
    .line 393
    .line 394
    move-result p0

    .line 395
    invoke-static {p2, v1, v2}, Ll/lyj0;->z(Ljava/lang/Object;J)F

    .line 396
    .line 397
    .line 398
    move-result p1

    .line 399
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 400
    .line 401
    .line 402
    move-result p1

    .line 403
    if-ne p0, p1, :cond_11

    .line 404
    .line 405
    return v4

    .line 406
    :cond_11
    return v3

    .line 407
    :pswitch_14
    invoke-virtual {p0, p1, p2, p3}, Landroidx/datastore/preferences/protobuf/d0;->k(Ljava/lang/Object;Ljava/lang/Object;I)Z

    .line 408
    .line 409
    .line 410
    move-result p0

    .line 411
    if-eqz p0, :cond_12

    .line 412
    .line 413
    invoke-static {p1, v1, v2}, Ll/lyj0;->y(Ljava/lang/Object;J)D

    .line 414
    .line 415
    .line 416
    move-result-wide p0

    .line 417
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 418
    .line 419
    .line 420
    move-result-wide p0

    .line 421
    invoke-static {p2, v1, v2}, Ll/lyj0;->y(Ljava/lang/Object;J)D

    .line 422
    .line 423
    .line 424
    move-result-wide p2

    .line 425
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 426
    .line 427
    .line 428
    move-result-wide p2

    .line 429
    cmp-long p0, p0, p2

    .line 430
    .line 431
    if-nez p0, :cond_12

    .line 432
    .line 433
    return v4

    .line 434
    :cond_12
    return v3

    .line 435
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final p0(Ljava/lang/Object;II)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p3}, Landroidx/datastore/preferences/protobuf/d0;->i0(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p3, 0xfffff

    .line 6
    .line 7
    .line 8
    and-int/2addr p0, p3

    .line 9
    int-to-long v0, p0

    .line 10
    invoke-static {p1, v0, v1, p2}, Ll/lyj0;->R(Ljava/lang/Object;JI)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final q(Ljava/lang/Object;ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "ITUB;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "TUT;TUB;>;)TUB;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {p1, v0, v1}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p2}, Landroidx/datastore/preferences/protobuf/d0;->t(I)Landroidx/datastore/preferences/protobuf/s$e;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-nez v4, :cond_1

    .line 25
    .line 26
    :goto_0
    return-object p3

    .line 27
    :cond_1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 28
    .line 29
    invoke-interface {v0, p1}, Landroidx/datastore/preferences/protobuf/z;->e(Ljava/lang/Object;)Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    move-object v0, p0

    .line 34
    move v1, p2

    .line 35
    move-object v5, p3

    .line 36
    move-object v6, p4

    .line 37
    invoke-virtual/range {v0 .. v6}, Landroidx/datastore/preferences/protobuf/d0;->r(IILjava/util/Map;Landroidx/datastore/preferences/protobuf/s$e;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final q0(II)I
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    div-int/lit8 v0, v0, 0x3

    .line 5
    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    :goto_0
    if-gt p2, v0, :cond_2

    .line 9
    .line 10
    add-int v1, v0, p2

    .line 11
    .line 12
    ushr-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    mul-int/lit8 v2, v1, 0x3

    .line 15
    .line 16
    invoke-virtual {p0, v2}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-ne p1, v3, :cond_0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    if-ge p1, v3, :cond_1

    .line 24
    .line 25
    add-int/lit8 v1, v1, -0x1

    .line 26
    .line 27
    move v0, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    move p2, v1

    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/4 p0, -0x1

    .line 34
    return p0
.end method

.method public final r(IILjava/util/Map;Landroidx/datastore/preferences/protobuf/s$e;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/l0;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(II",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Landroidx/datastore/preferences/protobuf/s$e;",
            "TUB;",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "TUT;TUB;>;)TUB;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/datastore/preferences/protobuf/d0;->u(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Landroidx/datastore/preferences/protobuf/z;->b(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/y$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    check-cast p3, Ljava/util/Map$Entry;

    .line 30
    .line 31
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-interface {p4, v0}, Landroidx/datastore/preferences/protobuf/s$e;->a(I)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    if-nez p5, :cond_1

    .line 48
    .line 49
    invoke-virtual {p6}, Landroidx/datastore/preferences/protobuf/l0;->n()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p5

    .line 53
    :cond_1
    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {p0, v0, v1}, Landroidx/datastore/preferences/protobuf/y;->b(Landroidx/datastore/preferences/protobuf/y$a;Ljava/lang/Object;Ljava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-static {v0}, Landroidx/datastore/preferences/protobuf/ByteString;->newCodedBuilder(I)Landroidx/datastore/preferences/protobuf/ByteString$g;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/ByteString$g;->b()Landroidx/datastore/preferences/protobuf/CodedOutputStream;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    :try_start_0
    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    invoke-static {v1, p0, v2, p3}, Landroidx/datastore/preferences/protobuf/y;->e(Landroidx/datastore/preferences/protobuf/CodedOutputStream;Landroidx/datastore/preferences/protobuf/y$a;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/ByteString$g;->a()Landroidx/datastore/preferences/protobuf/ByteString;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-virtual {p6, p5, p2, p3}, Landroidx/datastore/preferences/protobuf/l0;->d(Ljava/lang/Object;ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :catch_0
    move-exception p0

    .line 96
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    const/4 p0, 0x0

    .line 100
    return-object p0

    .line 101
    :cond_2
    return-object p5
.end method

.method public final s0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method public final t(I)Landroidx/datastore/preferences/protobuf/s$e;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->b:[Ljava/lang/Object;

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    mul-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    aget-object p0, p0, p1

    .line 10
    .line 11
    check-cast p0, Landroidx/datastore/preferences/protobuf/s$e;

    .line 12
    .line 13
    return-object p0
.end method

.method public final t0(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroidx/datastore/preferences/protobuf/Writer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-boolean v3, v0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 8
    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    iget-object v3, v0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 12
    .line 13
    invoke-virtual {v3, v1}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/p;->n()Z

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    if-nez v5, :cond_0

    .line 22
    .line 23
    invoke-virtual {v3}, Landroidx/datastore/preferences/protobuf/p;->s()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    check-cast v5, Ljava/util/Map$Entry;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v3, 0x0

    .line 35
    const/4 v5, 0x0

    .line 36
    :goto_0
    iget-object v6, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 37
    .line 38
    array-length v6, v6

    .line 39
    sget-object v7, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 40
    .line 41
    const/4 v9, -0x1

    .line 42
    const/4 v10, 0x0

    .line 43
    const/4 v11, 0x0

    .line 44
    :goto_1
    if-ge v10, v6, :cond_7

    .line 45
    .line 46
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 47
    .line 48
    .line 49
    move-result v12

    .line 50
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 51
    .line 52
    .line 53
    move-result v13

    .line 54
    invoke-static {v12}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 55
    .line 56
    .line 57
    move-result v14

    .line 58
    iget-boolean v15, v0, Landroidx/datastore/preferences/protobuf/d0;->h:Z

    .line 59
    .line 60
    if-nez v15, :cond_2

    .line 61
    .line 62
    const/16 v15, 0x11

    .line 63
    .line 64
    if-gt v14, v15, :cond_2

    .line 65
    .line 66
    iget-object v15, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 67
    .line 68
    add-int/lit8 v16, v10, 0x2

    .line 69
    .line 70
    aget v15, v15, v16

    .line 71
    .line 72
    const v16, 0xfffff

    .line 73
    .line 74
    .line 75
    and-int v8, v15, v16

    .line 76
    .line 77
    move-object/from16 v16, v5

    .line 78
    .line 79
    const/16 v17, 0x1

    .line 80
    .line 81
    if-eq v8, v9, :cond_1

    .line 82
    .line 83
    int-to-long v4, v8

    .line 84
    invoke-virtual {v7, v1, v4, v5}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 85
    .line 86
    .line 87
    move-result v11

    .line 88
    move v9, v8

    .line 89
    :cond_1
    ushr-int/lit8 v4, v15, 0x14

    .line 90
    .line 91
    shl-int v4, v17, v4

    .line 92
    .line 93
    move-object/from16 v5, v16

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_2
    move-object/from16 v16, v5

    .line 97
    .line 98
    const/16 v17, 0x1

    .line 99
    .line 100
    move-object/from16 v5, v16

    .line 101
    .line 102
    const/4 v4, 0x0

    .line 103
    :goto_2
    if-eqz v5, :cond_4

    .line 104
    .line 105
    iget-object v8, v0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 106
    .line 107
    invoke-virtual {v8, v5}, Landroidx/datastore/preferences/protobuf/m;->a(Ljava/util/Map$Entry;)I

    .line 108
    .line 109
    .line 110
    move-result v8

    .line 111
    if-gt v8, v13, :cond_4

    .line 112
    .line 113
    iget-object v8, v0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 114
    .line 115
    invoke-virtual {v8, v2, v5}, Landroidx/datastore/preferences/protobuf/m;->j(Landroidx/datastore/preferences/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 116
    .line 117
    .line 118
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    if-eqz v5, :cond_3

    .line 123
    .line 124
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    check-cast v5, Ljava/util/Map$Entry;

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_3
    const/4 v5, 0x0

    .line 132
    goto :goto_2

    .line 133
    :cond_4
    move-object v8, v3

    .line 134
    move v15, v4

    .line 135
    invoke-static {v12}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 136
    .line 137
    .line 138
    move-result-wide v3

    .line 139
    packed-switch v14, :pswitch_data_0

    .line 140
    .line 141
    .line 142
    :cond_5
    :goto_3
    const/4 v14, 0x0

    .line 143
    goto/16 :goto_5

    .line 144
    .line 145
    :pswitch_0
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 146
    .line 147
    .line 148
    move-result v12

    .line 149
    if-eqz v12, :cond_5

    .line 150
    .line 151
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->D(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 160
    .line 161
    .line 162
    goto :goto_3

    .line 163
    :pswitch_1
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 164
    .line 165
    .line 166
    move-result v12

    .line 167
    if-eqz v12, :cond_5

    .line 168
    .line 169
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 170
    .line 171
    .line 172
    move-result-wide v3

    .line 173
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->l(IJ)V

    .line 174
    .line 175
    .line 176
    goto :goto_3

    .line 177
    :pswitch_2
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 178
    .line 179
    .line 180
    move-result v12

    .line 181
    if-eqz v12, :cond_5

    .line 182
    .line 183
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->O(II)V

    .line 188
    .line 189
    .line 190
    goto :goto_3

    .line 191
    :pswitch_3
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 192
    .line 193
    .line 194
    move-result v12

    .line 195
    if-eqz v12, :cond_5

    .line 196
    .line 197
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 198
    .line 199
    .line 200
    move-result-wide v3

    .line 201
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->A(IJ)V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :pswitch_4
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 206
    .line 207
    .line 208
    move-result v12

    .line 209
    if-eqz v12, :cond_5

    .line 210
    .line 211
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->r(II)V

    .line 216
    .line 217
    .line 218
    goto :goto_3

    .line 219
    :pswitch_5
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 220
    .line 221
    .line 222
    move-result v12

    .line 223
    if-eqz v12, :cond_5

    .line 224
    .line 225
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->M(II)V

    .line 230
    .line 231
    .line 232
    goto :goto_3

    .line 233
    :pswitch_6
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 234
    .line 235
    .line 236
    move-result v12

    .line 237
    if-eqz v12, :cond_5

    .line 238
    .line 239
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->n(II)V

    .line 244
    .line 245
    .line 246
    goto :goto_3

    .line 247
    :pswitch_7
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 248
    .line 249
    .line 250
    move-result v12

    .line 251
    if-eqz v12, :cond_5

    .line 252
    .line 253
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    check-cast v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 258
    .line 259
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 260
    .line 261
    .line 262
    goto :goto_3

    .line 263
    :pswitch_8
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 264
    .line 265
    .line 266
    move-result v12

    .line 267
    if-eqz v12, :cond_5

    .line 268
    .line 269
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 274
    .line 275
    .line 276
    move-result-object v4

    .line 277
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->j(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 278
    .line 279
    .line 280
    goto/16 :goto_3

    .line 281
    .line 282
    :pswitch_9
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 283
    .line 284
    .line 285
    move-result v12

    .line 286
    if-eqz v12, :cond_5

    .line 287
    .line 288
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    invoke-virtual {v0, v13, v3, v2}, Landroidx/datastore/preferences/protobuf/d0;->x0(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 293
    .line 294
    .line 295
    goto/16 :goto_3

    .line 296
    .line 297
    :pswitch_a
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 298
    .line 299
    .line 300
    move-result v12

    .line 301
    if-eqz v12, :cond_5

    .line 302
    .line 303
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->W(Ljava/lang/Object;J)Z

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->q(IZ)V

    .line 308
    .line 309
    .line 310
    goto/16 :goto_3

    .line 311
    .line 312
    :pswitch_b
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 313
    .line 314
    .line 315
    move-result v12

    .line 316
    if-eqz v12, :cond_5

    .line 317
    .line 318
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 319
    .line 320
    .line 321
    move-result v3

    .line 322
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->c(II)V

    .line 323
    .line 324
    .line 325
    goto/16 :goto_3

    .line 326
    .line 327
    :pswitch_c
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 328
    .line 329
    .line 330
    move-result v12

    .line 331
    if-eqz v12, :cond_5

    .line 332
    .line 333
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 334
    .line 335
    .line 336
    move-result-wide v3

    .line 337
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->p(IJ)V

    .line 338
    .line 339
    .line 340
    goto/16 :goto_3

    .line 341
    .line 342
    :pswitch_d
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 343
    .line 344
    .line 345
    move-result v12

    .line 346
    if-eqz v12, :cond_5

    .line 347
    .line 348
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 349
    .line 350
    .line 351
    move-result v3

    .line 352
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->g(II)V

    .line 353
    .line 354
    .line 355
    goto/16 :goto_3

    .line 356
    .line 357
    :pswitch_e
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 358
    .line 359
    .line 360
    move-result v12

    .line 361
    if-eqz v12, :cond_5

    .line 362
    .line 363
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 364
    .line 365
    .line 366
    move-result-wide v3

    .line 367
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->e(IJ)V

    .line 368
    .line 369
    .line 370
    goto/16 :goto_3

    .line 371
    .line 372
    :pswitch_f
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 373
    .line 374
    .line 375
    move-result v12

    .line 376
    if-eqz v12, :cond_5

    .line 377
    .line 378
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 379
    .line 380
    .line 381
    move-result-wide v3

    .line 382
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->I(IJ)V

    .line 383
    .line 384
    .line 385
    goto/16 :goto_3

    .line 386
    .line 387
    :pswitch_10
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 388
    .line 389
    .line 390
    move-result v12

    .line 391
    if-eqz v12, :cond_5

    .line 392
    .line 393
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->Y(Ljava/lang/Object;J)F

    .line 394
    .line 395
    .line 396
    move-result v3

    .line 397
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->L(IF)V

    .line 398
    .line 399
    .line 400
    goto/16 :goto_3

    .line 401
    .line 402
    :pswitch_11
    invoke-virtual {v0, v1, v13, v10}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 403
    .line 404
    .line 405
    move-result v12

    .line 406
    if-eqz v12, :cond_5

    .line 407
    .line 408
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->X(Ljava/lang/Object;J)D

    .line 409
    .line 410
    .line 411
    move-result-wide v3

    .line 412
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->E(ID)V

    .line 413
    .line 414
    .line 415
    goto/16 :goto_3

    .line 416
    .line 417
    :pswitch_12
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    move-result-object v3

    .line 421
    invoke-virtual {v0, v2, v13, v3, v10}, Landroidx/datastore/preferences/protobuf/d0;->w0(Landroidx/datastore/preferences/protobuf/Writer;ILjava/lang/Object;I)V

    .line 422
    .line 423
    .line 424
    goto/16 :goto_3

    .line 425
    .line 426
    :pswitch_13
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 427
    .line 428
    .line 429
    move-result v12

    .line 430
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 431
    .line 432
    .line 433
    move-result-object v3

    .line 434
    check-cast v3, Ljava/util/List;

    .line 435
    .line 436
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 437
    .line 438
    .line 439
    move-result-object v4

    .line 440
    invoke-static {v12, v3, v2, v4}, Landroidx/datastore/preferences/protobuf/j0;->U(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 441
    .line 442
    .line 443
    goto/16 :goto_3

    .line 444
    .line 445
    :pswitch_14
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 446
    .line 447
    .line 448
    move-result v12

    .line 449
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v3

    .line 453
    check-cast v3, Ljava/util/List;

    .line 454
    .line 455
    move/from16 v13, v17

    .line 456
    .line 457
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->b0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 458
    .line 459
    .line 460
    goto/16 :goto_3

    .line 461
    .line 462
    :pswitch_15
    move/from16 v13, v17

    .line 463
    .line 464
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 465
    .line 466
    .line 467
    move-result v12

    .line 468
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v3

    .line 472
    check-cast v3, Ljava/util/List;

    .line 473
    .line 474
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->a0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 475
    .line 476
    .line 477
    goto/16 :goto_3

    .line 478
    .line 479
    :pswitch_16
    move/from16 v13, v17

    .line 480
    .line 481
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 482
    .line 483
    .line 484
    move-result v12

    .line 485
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object v3

    .line 489
    check-cast v3, Ljava/util/List;

    .line 490
    .line 491
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->Z(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 492
    .line 493
    .line 494
    goto/16 :goto_3

    .line 495
    .line 496
    :pswitch_17
    move/from16 v13, v17

    .line 497
    .line 498
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 499
    .line 500
    .line 501
    move-result v12

    .line 502
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object v3

    .line 506
    check-cast v3, Ljava/util/List;

    .line 507
    .line 508
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->Y(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 509
    .line 510
    .line 511
    goto/16 :goto_3

    .line 512
    .line 513
    :pswitch_18
    move/from16 v13, v17

    .line 514
    .line 515
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 516
    .line 517
    .line 518
    move-result v12

    .line 519
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 520
    .line 521
    .line 522
    move-result-object v3

    .line 523
    check-cast v3, Ljava/util/List;

    .line 524
    .line 525
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->Q(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 526
    .line 527
    .line 528
    goto/16 :goto_3

    .line 529
    .line 530
    :pswitch_19
    move/from16 v13, v17

    .line 531
    .line 532
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 533
    .line 534
    .line 535
    move-result v12

    .line 536
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    move-result-object v3

    .line 540
    check-cast v3, Ljava/util/List;

    .line 541
    .line 542
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->d0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 543
    .line 544
    .line 545
    goto/16 :goto_3

    .line 546
    .line 547
    :pswitch_1a
    move/from16 v13, v17

    .line 548
    .line 549
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 550
    .line 551
    .line 552
    move-result v12

    .line 553
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 554
    .line 555
    .line 556
    move-result-object v3

    .line 557
    check-cast v3, Ljava/util/List;

    .line 558
    .line 559
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->N(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 560
    .line 561
    .line 562
    goto/16 :goto_3

    .line 563
    .line 564
    :pswitch_1b
    move/from16 v13, v17

    .line 565
    .line 566
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 567
    .line 568
    .line 569
    move-result v12

    .line 570
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object v3

    .line 574
    check-cast v3, Ljava/util/List;

    .line 575
    .line 576
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->R(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 577
    .line 578
    .line 579
    goto/16 :goto_3

    .line 580
    .line 581
    :pswitch_1c
    move/from16 v13, v17

    .line 582
    .line 583
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 584
    .line 585
    .line 586
    move-result v12

    .line 587
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 588
    .line 589
    .line 590
    move-result-object v3

    .line 591
    check-cast v3, Ljava/util/List;

    .line 592
    .line 593
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->S(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 594
    .line 595
    .line 596
    goto/16 :goto_3

    .line 597
    .line 598
    :pswitch_1d
    move/from16 v13, v17

    .line 599
    .line 600
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 601
    .line 602
    .line 603
    move-result v12

    .line 604
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 605
    .line 606
    .line 607
    move-result-object v3

    .line 608
    check-cast v3, Ljava/util/List;

    .line 609
    .line 610
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->V(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 611
    .line 612
    .line 613
    goto/16 :goto_3

    .line 614
    .line 615
    :pswitch_1e
    move/from16 v13, v17

    .line 616
    .line 617
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 618
    .line 619
    .line 620
    move-result v12

    .line 621
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 622
    .line 623
    .line 624
    move-result-object v3

    .line 625
    check-cast v3, Ljava/util/List;

    .line 626
    .line 627
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->e0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 628
    .line 629
    .line 630
    goto/16 :goto_3

    .line 631
    .line 632
    :pswitch_1f
    move/from16 v13, v17

    .line 633
    .line 634
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 635
    .line 636
    .line 637
    move-result v12

    .line 638
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 639
    .line 640
    .line 641
    move-result-object v3

    .line 642
    check-cast v3, Ljava/util/List;

    .line 643
    .line 644
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->W(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 645
    .line 646
    .line 647
    goto/16 :goto_3

    .line 648
    .line 649
    :pswitch_20
    move/from16 v13, v17

    .line 650
    .line 651
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 652
    .line 653
    .line 654
    move-result v12

    .line 655
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 656
    .line 657
    .line 658
    move-result-object v3

    .line 659
    check-cast v3, Ljava/util/List;

    .line 660
    .line 661
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->T(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 662
    .line 663
    .line 664
    goto/16 :goto_3

    .line 665
    .line 666
    :pswitch_21
    move/from16 v13, v17

    .line 667
    .line 668
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 669
    .line 670
    .line 671
    move-result v12

    .line 672
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 673
    .line 674
    .line 675
    move-result-object v3

    .line 676
    check-cast v3, Ljava/util/List;

    .line 677
    .line 678
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->P(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 679
    .line 680
    .line 681
    goto/16 :goto_3

    .line 682
    .line 683
    :pswitch_22
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 684
    .line 685
    .line 686
    move-result v12

    .line 687
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 688
    .line 689
    .line 690
    move-result-object v3

    .line 691
    check-cast v3, Ljava/util/List;

    .line 692
    .line 693
    const/4 v13, 0x0

    .line 694
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->b0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 695
    .line 696
    .line 697
    :goto_4
    move v14, v13

    .line 698
    goto/16 :goto_5

    .line 699
    .line 700
    :pswitch_23
    const/4 v13, 0x0

    .line 701
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 702
    .line 703
    .line 704
    move-result v12

    .line 705
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 706
    .line 707
    .line 708
    move-result-object v3

    .line 709
    check-cast v3, Ljava/util/List;

    .line 710
    .line 711
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->a0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 712
    .line 713
    .line 714
    goto :goto_4

    .line 715
    :pswitch_24
    const/4 v13, 0x0

    .line 716
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 717
    .line 718
    .line 719
    move-result v12

    .line 720
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 721
    .line 722
    .line 723
    move-result-object v3

    .line 724
    check-cast v3, Ljava/util/List;

    .line 725
    .line 726
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->Z(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 727
    .line 728
    .line 729
    goto :goto_4

    .line 730
    :pswitch_25
    const/4 v13, 0x0

    .line 731
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 732
    .line 733
    .line 734
    move-result v12

    .line 735
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-result-object v3

    .line 739
    check-cast v3, Ljava/util/List;

    .line 740
    .line 741
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->Y(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 742
    .line 743
    .line 744
    goto :goto_4

    .line 745
    :pswitch_26
    const/4 v13, 0x0

    .line 746
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 747
    .line 748
    .line 749
    move-result v12

    .line 750
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 751
    .line 752
    .line 753
    move-result-object v3

    .line 754
    check-cast v3, Ljava/util/List;

    .line 755
    .line 756
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->Q(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 757
    .line 758
    .line 759
    goto :goto_4

    .line 760
    :pswitch_27
    const/4 v13, 0x0

    .line 761
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 762
    .line 763
    .line 764
    move-result v12

    .line 765
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 766
    .line 767
    .line 768
    move-result-object v3

    .line 769
    check-cast v3, Ljava/util/List;

    .line 770
    .line 771
    invoke-static {v12, v3, v2, v13}, Landroidx/datastore/preferences/protobuf/j0;->d0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 772
    .line 773
    .line 774
    goto :goto_4

    .line 775
    :pswitch_28
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 776
    .line 777
    .line 778
    move-result v12

    .line 779
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 780
    .line 781
    .line 782
    move-result-object v3

    .line 783
    check-cast v3, Ljava/util/List;

    .line 784
    .line 785
    invoke-static {v12, v3, v2}, Landroidx/datastore/preferences/protobuf/j0;->O(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 786
    .line 787
    .line 788
    goto/16 :goto_3

    .line 789
    .line 790
    :pswitch_29
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 791
    .line 792
    .line 793
    move-result v12

    .line 794
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 795
    .line 796
    .line 797
    move-result-object v3

    .line 798
    check-cast v3, Ljava/util/List;

    .line 799
    .line 800
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 801
    .line 802
    .line 803
    move-result-object v4

    .line 804
    invoke-static {v12, v3, v2, v4}, Landroidx/datastore/preferences/protobuf/j0;->X(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 805
    .line 806
    .line 807
    goto/16 :goto_3

    .line 808
    .line 809
    :pswitch_2a
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 810
    .line 811
    .line 812
    move-result v12

    .line 813
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 814
    .line 815
    .line 816
    move-result-object v3

    .line 817
    check-cast v3, Ljava/util/List;

    .line 818
    .line 819
    invoke-static {v12, v3, v2}, Landroidx/datastore/preferences/protobuf/j0;->c0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 820
    .line 821
    .line 822
    goto/16 :goto_3

    .line 823
    .line 824
    :pswitch_2b
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 825
    .line 826
    .line 827
    move-result v12

    .line 828
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 829
    .line 830
    .line 831
    move-result-object v3

    .line 832
    check-cast v3, Ljava/util/List;

    .line 833
    .line 834
    const/4 v14, 0x0

    .line 835
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->N(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 836
    .line 837
    .line 838
    goto/16 :goto_5

    .line 839
    .line 840
    :pswitch_2c
    const/4 v14, 0x0

    .line 841
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 842
    .line 843
    .line 844
    move-result v12

    .line 845
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 846
    .line 847
    .line 848
    move-result-object v3

    .line 849
    check-cast v3, Ljava/util/List;

    .line 850
    .line 851
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->R(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 852
    .line 853
    .line 854
    goto/16 :goto_5

    .line 855
    .line 856
    :pswitch_2d
    const/4 v14, 0x0

    .line 857
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 858
    .line 859
    .line 860
    move-result v12

    .line 861
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 862
    .line 863
    .line 864
    move-result-object v3

    .line 865
    check-cast v3, Ljava/util/List;

    .line 866
    .line 867
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->S(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 868
    .line 869
    .line 870
    goto/16 :goto_5

    .line 871
    .line 872
    :pswitch_2e
    const/4 v14, 0x0

    .line 873
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 874
    .line 875
    .line 876
    move-result v12

    .line 877
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 878
    .line 879
    .line 880
    move-result-object v3

    .line 881
    check-cast v3, Ljava/util/List;

    .line 882
    .line 883
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->V(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 884
    .line 885
    .line 886
    goto/16 :goto_5

    .line 887
    .line 888
    :pswitch_2f
    const/4 v14, 0x0

    .line 889
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 890
    .line 891
    .line 892
    move-result v12

    .line 893
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 894
    .line 895
    .line 896
    move-result-object v3

    .line 897
    check-cast v3, Ljava/util/List;

    .line 898
    .line 899
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->e0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 900
    .line 901
    .line 902
    goto/16 :goto_5

    .line 903
    .line 904
    :pswitch_30
    const/4 v14, 0x0

    .line 905
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 906
    .line 907
    .line 908
    move-result v12

    .line 909
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 910
    .line 911
    .line 912
    move-result-object v3

    .line 913
    check-cast v3, Ljava/util/List;

    .line 914
    .line 915
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->W(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 916
    .line 917
    .line 918
    goto/16 :goto_5

    .line 919
    .line 920
    :pswitch_31
    const/4 v14, 0x0

    .line 921
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 922
    .line 923
    .line 924
    move-result v12

    .line 925
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 926
    .line 927
    .line 928
    move-result-object v3

    .line 929
    check-cast v3, Ljava/util/List;

    .line 930
    .line 931
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->T(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 932
    .line 933
    .line 934
    goto/16 :goto_5

    .line 935
    .line 936
    :pswitch_32
    const/4 v14, 0x0

    .line 937
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 938
    .line 939
    .line 940
    move-result v12

    .line 941
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 942
    .line 943
    .line 944
    move-result-object v3

    .line 945
    check-cast v3, Ljava/util/List;

    .line 946
    .line 947
    invoke-static {v12, v3, v2, v14}, Landroidx/datastore/preferences/protobuf/j0;->P(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 948
    .line 949
    .line 950
    goto/16 :goto_5

    .line 951
    .line 952
    :pswitch_33
    const/4 v14, 0x0

    .line 953
    and-int v12, v11, v15

    .line 954
    .line 955
    if-eqz v12, :cond_6

    .line 956
    .line 957
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 958
    .line 959
    .line 960
    move-result-object v3

    .line 961
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 962
    .line 963
    .line 964
    move-result-object v4

    .line 965
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->D(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 966
    .line 967
    .line 968
    goto/16 :goto_5

    .line 969
    .line 970
    :pswitch_34
    const/4 v14, 0x0

    .line 971
    and-int v12, v11, v15

    .line 972
    .line 973
    if-eqz v12, :cond_6

    .line 974
    .line 975
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 976
    .line 977
    .line 978
    move-result-wide v3

    .line 979
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->l(IJ)V

    .line 980
    .line 981
    .line 982
    goto/16 :goto_5

    .line 983
    .line 984
    :pswitch_35
    const/4 v14, 0x0

    .line 985
    and-int v12, v11, v15

    .line 986
    .line 987
    if-eqz v12, :cond_6

    .line 988
    .line 989
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 990
    .line 991
    .line 992
    move-result v3

    .line 993
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->O(II)V

    .line 994
    .line 995
    .line 996
    goto/16 :goto_5

    .line 997
    .line 998
    :pswitch_36
    const/4 v14, 0x0

    .line 999
    and-int v12, v11, v15

    .line 1000
    .line 1001
    if-eqz v12, :cond_6

    .line 1002
    .line 1003
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1004
    .line 1005
    .line 1006
    move-result-wide v3

    .line 1007
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->A(IJ)V

    .line 1008
    .line 1009
    .line 1010
    goto/16 :goto_5

    .line 1011
    .line 1012
    :pswitch_37
    const/4 v14, 0x0

    .line 1013
    and-int v12, v11, v15

    .line 1014
    .line 1015
    if-eqz v12, :cond_6

    .line 1016
    .line 1017
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1018
    .line 1019
    .line 1020
    move-result v3

    .line 1021
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->r(II)V

    .line 1022
    .line 1023
    .line 1024
    goto/16 :goto_5

    .line 1025
    .line 1026
    :pswitch_38
    const/4 v14, 0x0

    .line 1027
    and-int v12, v11, v15

    .line 1028
    .line 1029
    if-eqz v12, :cond_6

    .line 1030
    .line 1031
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1032
    .line 1033
    .line 1034
    move-result v3

    .line 1035
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->M(II)V

    .line 1036
    .line 1037
    .line 1038
    goto/16 :goto_5

    .line 1039
    .line 1040
    :pswitch_39
    const/4 v14, 0x0

    .line 1041
    and-int v12, v11, v15

    .line 1042
    .line 1043
    if-eqz v12, :cond_6

    .line 1044
    .line 1045
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1046
    .line 1047
    .line 1048
    move-result v3

    .line 1049
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->n(II)V

    .line 1050
    .line 1051
    .line 1052
    goto/16 :goto_5

    .line 1053
    .line 1054
    :pswitch_3a
    const/4 v14, 0x0

    .line 1055
    and-int v12, v11, v15

    .line 1056
    .line 1057
    if-eqz v12, :cond_6

    .line 1058
    .line 1059
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1060
    .line 1061
    .line 1062
    move-result-object v3

    .line 1063
    check-cast v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1064
    .line 1065
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 1066
    .line 1067
    .line 1068
    goto/16 :goto_5

    .line 1069
    .line 1070
    :pswitch_3b
    const/4 v14, 0x0

    .line 1071
    and-int v12, v11, v15

    .line 1072
    .line 1073
    if-eqz v12, :cond_6

    .line 1074
    .line 1075
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1076
    .line 1077
    .line 1078
    move-result-object v3

    .line 1079
    invoke-virtual {v0, v10}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1080
    .line 1081
    .line 1082
    move-result-object v4

    .line 1083
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->j(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 1084
    .line 1085
    .line 1086
    goto/16 :goto_5

    .line 1087
    .line 1088
    :pswitch_3c
    const/4 v14, 0x0

    .line 1089
    and-int v12, v11, v15

    .line 1090
    .line 1091
    if-eqz v12, :cond_6

    .line 1092
    .line 1093
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1094
    .line 1095
    .line 1096
    move-result-object v3

    .line 1097
    invoke-virtual {v0, v13, v3, v2}, Landroidx/datastore/preferences/protobuf/d0;->x0(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 1098
    .line 1099
    .line 1100
    goto/16 :goto_5

    .line 1101
    .line 1102
    :pswitch_3d
    const/4 v14, 0x0

    .line 1103
    and-int v12, v11, v15

    .line 1104
    .line 1105
    if-eqz v12, :cond_6

    .line 1106
    .line 1107
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->l(Ljava/lang/Object;J)Z

    .line 1108
    .line 1109
    .line 1110
    move-result v3

    .line 1111
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->q(IZ)V

    .line 1112
    .line 1113
    .line 1114
    goto :goto_5

    .line 1115
    :pswitch_3e
    const/4 v14, 0x0

    .line 1116
    and-int v12, v11, v15

    .line 1117
    .line 1118
    if-eqz v12, :cond_6

    .line 1119
    .line 1120
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1121
    .line 1122
    .line 1123
    move-result v3

    .line 1124
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->c(II)V

    .line 1125
    .line 1126
    .line 1127
    goto :goto_5

    .line 1128
    :pswitch_3f
    const/4 v14, 0x0

    .line 1129
    and-int v12, v11, v15

    .line 1130
    .line 1131
    if-eqz v12, :cond_6

    .line 1132
    .line 1133
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1134
    .line 1135
    .line 1136
    move-result-wide v3

    .line 1137
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->p(IJ)V

    .line 1138
    .line 1139
    .line 1140
    goto :goto_5

    .line 1141
    :pswitch_40
    const/4 v14, 0x0

    .line 1142
    and-int v12, v11, v15

    .line 1143
    .line 1144
    if-eqz v12, :cond_6

    .line 1145
    .line 1146
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1147
    .line 1148
    .line 1149
    move-result v3

    .line 1150
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->g(II)V

    .line 1151
    .line 1152
    .line 1153
    goto :goto_5

    .line 1154
    :pswitch_41
    const/4 v14, 0x0

    .line 1155
    and-int v12, v11, v15

    .line 1156
    .line 1157
    if-eqz v12, :cond_6

    .line 1158
    .line 1159
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1160
    .line 1161
    .line 1162
    move-result-wide v3

    .line 1163
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->e(IJ)V

    .line 1164
    .line 1165
    .line 1166
    goto :goto_5

    .line 1167
    :pswitch_42
    const/4 v14, 0x0

    .line 1168
    and-int v12, v11, v15

    .line 1169
    .line 1170
    if-eqz v12, :cond_6

    .line 1171
    .line 1172
    invoke-virtual {v7, v1, v3, v4}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1173
    .line 1174
    .line 1175
    move-result-wide v3

    .line 1176
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->I(IJ)V

    .line 1177
    .line 1178
    .line 1179
    goto :goto_5

    .line 1180
    :pswitch_43
    const/4 v14, 0x0

    .line 1181
    and-int v12, v11, v15

    .line 1182
    .line 1183
    if-eqz v12, :cond_6

    .line 1184
    .line 1185
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->s(Ljava/lang/Object;J)F

    .line 1186
    .line 1187
    .line 1188
    move-result v3

    .line 1189
    invoke-interface {v2, v13, v3}, Landroidx/datastore/preferences/protobuf/Writer;->L(IF)V

    .line 1190
    .line 1191
    .line 1192
    goto :goto_5

    .line 1193
    :pswitch_44
    const/4 v14, 0x0

    .line 1194
    and-int v12, v11, v15

    .line 1195
    .line 1196
    if-eqz v12, :cond_6

    .line 1197
    .line 1198
    invoke-static {v1, v3, v4}, Landroidx/datastore/preferences/protobuf/d0;->o(Ljava/lang/Object;J)D

    .line 1199
    .line 1200
    .line 1201
    move-result-wide v3

    .line 1202
    invoke-interface {v2, v13, v3, v4}, Landroidx/datastore/preferences/protobuf/Writer;->E(ID)V

    .line 1203
    .line 1204
    .line 1205
    :cond_6
    :goto_5
    add-int/lit8 v10, v10, 0x3

    .line 1206
    .line 1207
    move-object v3, v8

    .line 1208
    goto/16 :goto_1

    .line 1209
    .line 1210
    :cond_7
    move-object v8, v3

    .line 1211
    move-object/from16 v16, v5

    .line 1212
    .line 1213
    :goto_6
    if-eqz v5, :cond_9

    .line 1214
    .line 1215
    iget-object v3, v0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 1216
    .line 1217
    invoke-virtual {v3, v2, v5}, Landroidx/datastore/preferences/protobuf/m;->j(Landroidx/datastore/preferences/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 1218
    .line 1219
    .line 1220
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 1221
    .line 1222
    .line 1223
    move-result v3

    .line 1224
    if-eqz v3, :cond_8

    .line 1225
    .line 1226
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1227
    .line 1228
    .line 1229
    move-result-object v3

    .line 1230
    check-cast v3, Ljava/util/Map$Entry;

    .line 1231
    .line 1232
    move-object v5, v3

    .line 1233
    goto :goto_6

    .line 1234
    :cond_8
    const/4 v5, 0x0

    .line 1235
    goto :goto_6

    .line 1236
    :cond_9
    iget-object v3, v0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 1237
    .line 1238
    invoke-virtual {v0, v3, v1, v2}, Landroidx/datastore/preferences/protobuf/d0;->y0(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 1239
    .line 1240
    .line 1241
    return-void

    .line 1242
    nop

    .line 1243
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final u(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->b:[Ljava/lang/Object;

    .line 2
    .line 3
    div-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    mul-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    aget-object p0, p0, p1

    .line 8
    .line 9
    return-object p0
.end method

.method public final u0(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroidx/datastore/preferences/protobuf/Writer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/p;->n()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/p;->s()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/util/Map$Entry;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move-object v0, v1

    .line 30
    move-object v2, v0

    .line 31
    :goto_0
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 32
    .line 33
    array-length v3, v3

    .line 34
    const/4 v4, 0x0

    .line 35
    move v5, v4

    .line 36
    :goto_1
    if-ge v5, v3, :cond_4

    .line 37
    .line 38
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    :goto_2
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v8, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 49
    .line 50
    invoke-virtual {v8, v2}, Landroidx/datastore/preferences/protobuf/m;->a(Ljava/util/Map$Entry;)I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    if-gt v8, v7, :cond_2

    .line 55
    .line 56
    iget-object v8, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 57
    .line 58
    invoke-virtual {v8, p2, v2}, Landroidx/datastore/preferences/protobuf/m;->j(Landroidx/datastore/preferences/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    check-cast v2, Ljava/util/Map$Entry;

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_1
    move-object v2, v1

    .line 75
    goto :goto_2

    .line 76
    :cond_2
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    const/4 v9, 0x1

    .line 81
    packed-switch v8, :pswitch_data_0

    .line 82
    .line 83
    .line 84
    goto/16 :goto_3

    .line 85
    .line 86
    :pswitch_0
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    if-eqz v8, :cond_3

    .line 91
    .line 92
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 93
    .line 94
    .line 95
    move-result-wide v8

    .line 96
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    invoke-interface {p2, v7, v6, v8}, Landroidx/datastore/preferences/protobuf/Writer;->D(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 105
    .line 106
    .line 107
    goto/16 :goto_3

    .line 108
    .line 109
    :pswitch_1
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    if-eqz v8, :cond_3

    .line 114
    .line 115
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 116
    .line 117
    .line 118
    move-result-wide v8

    .line 119
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 120
    .line 121
    .line 122
    move-result-wide v8

    .line 123
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->l(IJ)V

    .line 124
    .line 125
    .line 126
    goto/16 :goto_3

    .line 127
    .line 128
    :pswitch_2
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 129
    .line 130
    .line 131
    move-result v8

    .line 132
    if-eqz v8, :cond_3

    .line 133
    .line 134
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 135
    .line 136
    .line 137
    move-result-wide v8

    .line 138
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 139
    .line 140
    .line 141
    move-result v6

    .line 142
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->O(II)V

    .line 143
    .line 144
    .line 145
    goto/16 :goto_3

    .line 146
    .line 147
    :pswitch_3
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    if-eqz v8, :cond_3

    .line 152
    .line 153
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 154
    .line 155
    .line 156
    move-result-wide v8

    .line 157
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 158
    .line 159
    .line 160
    move-result-wide v8

    .line 161
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->A(IJ)V

    .line 162
    .line 163
    .line 164
    goto/16 :goto_3

    .line 165
    .line 166
    :pswitch_4
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 167
    .line 168
    .line 169
    move-result v8

    .line 170
    if-eqz v8, :cond_3

    .line 171
    .line 172
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 173
    .line 174
    .line 175
    move-result-wide v8

    .line 176
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 177
    .line 178
    .line 179
    move-result v6

    .line 180
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->r(II)V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_3

    .line 184
    .line 185
    :pswitch_5
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 186
    .line 187
    .line 188
    move-result v8

    .line 189
    if-eqz v8, :cond_3

    .line 190
    .line 191
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 192
    .line 193
    .line 194
    move-result-wide v8

    .line 195
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->M(II)V

    .line 200
    .line 201
    .line 202
    goto/16 :goto_3

    .line 203
    .line 204
    :pswitch_6
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 205
    .line 206
    .line 207
    move-result v8

    .line 208
    if-eqz v8, :cond_3

    .line 209
    .line 210
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 211
    .line 212
    .line 213
    move-result-wide v8

    .line 214
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 215
    .line 216
    .line 217
    move-result v6

    .line 218
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->n(II)V

    .line 219
    .line 220
    .line 221
    goto/16 :goto_3

    .line 222
    .line 223
    :pswitch_7
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 224
    .line 225
    .line 226
    move-result v8

    .line 227
    if-eqz v8, :cond_3

    .line 228
    .line 229
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 230
    .line 231
    .line 232
    move-result-wide v8

    .line 233
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    check-cast v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 238
    .line 239
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 240
    .line 241
    .line 242
    goto/16 :goto_3

    .line 243
    .line 244
    :pswitch_8
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 245
    .line 246
    .line 247
    move-result v8

    .line 248
    if-eqz v8, :cond_3

    .line 249
    .line 250
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 251
    .line 252
    .line 253
    move-result-wide v8

    .line 254
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v6

    .line 258
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 259
    .line 260
    .line 261
    move-result-object v8

    .line 262
    invoke-interface {p2, v7, v6, v8}, Landroidx/datastore/preferences/protobuf/Writer;->j(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 263
    .line 264
    .line 265
    goto/16 :goto_3

    .line 266
    .line 267
    :pswitch_9
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 268
    .line 269
    .line 270
    move-result v8

    .line 271
    if-eqz v8, :cond_3

    .line 272
    .line 273
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 274
    .line 275
    .line 276
    move-result-wide v8

    .line 277
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v6

    .line 281
    invoke-virtual {p0, v7, v6, p2}, Landroidx/datastore/preferences/protobuf/d0;->x0(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 282
    .line 283
    .line 284
    goto/16 :goto_3

    .line 285
    .line 286
    :pswitch_a
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 287
    .line 288
    .line 289
    move-result v8

    .line 290
    if-eqz v8, :cond_3

    .line 291
    .line 292
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 293
    .line 294
    .line 295
    move-result-wide v8

    .line 296
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->W(Ljava/lang/Object;J)Z

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->q(IZ)V

    .line 301
    .line 302
    .line 303
    goto/16 :goto_3

    .line 304
    .line 305
    :pswitch_b
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 306
    .line 307
    .line 308
    move-result v8

    .line 309
    if-eqz v8, :cond_3

    .line 310
    .line 311
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 312
    .line 313
    .line 314
    move-result-wide v8

    .line 315
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 316
    .line 317
    .line 318
    move-result v6

    .line 319
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->c(II)V

    .line 320
    .line 321
    .line 322
    goto/16 :goto_3

    .line 323
    .line 324
    :pswitch_c
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 325
    .line 326
    .line 327
    move-result v8

    .line 328
    if-eqz v8, :cond_3

    .line 329
    .line 330
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 331
    .line 332
    .line 333
    move-result-wide v8

    .line 334
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 335
    .line 336
    .line 337
    move-result-wide v8

    .line 338
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->p(IJ)V

    .line 339
    .line 340
    .line 341
    goto/16 :goto_3

    .line 342
    .line 343
    :pswitch_d
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 344
    .line 345
    .line 346
    move-result v8

    .line 347
    if-eqz v8, :cond_3

    .line 348
    .line 349
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 350
    .line 351
    .line 352
    move-result-wide v8

    .line 353
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 354
    .line 355
    .line 356
    move-result v6

    .line 357
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->g(II)V

    .line 358
    .line 359
    .line 360
    goto/16 :goto_3

    .line 361
    .line 362
    :pswitch_e
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 363
    .line 364
    .line 365
    move-result v8

    .line 366
    if-eqz v8, :cond_3

    .line 367
    .line 368
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 369
    .line 370
    .line 371
    move-result-wide v8

    .line 372
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 373
    .line 374
    .line 375
    move-result-wide v8

    .line 376
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->e(IJ)V

    .line 377
    .line 378
    .line 379
    goto/16 :goto_3

    .line 380
    .line 381
    :pswitch_f
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 382
    .line 383
    .line 384
    move-result v8

    .line 385
    if-eqz v8, :cond_3

    .line 386
    .line 387
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 388
    .line 389
    .line 390
    move-result-wide v8

    .line 391
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 392
    .line 393
    .line 394
    move-result-wide v8

    .line 395
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->I(IJ)V

    .line 396
    .line 397
    .line 398
    goto/16 :goto_3

    .line 399
    .line 400
    :pswitch_10
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 401
    .line 402
    .line 403
    move-result v8

    .line 404
    if-eqz v8, :cond_3

    .line 405
    .line 406
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 407
    .line 408
    .line 409
    move-result-wide v8

    .line 410
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->Y(Ljava/lang/Object;J)F

    .line 411
    .line 412
    .line 413
    move-result v6

    .line 414
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->L(IF)V

    .line 415
    .line 416
    .line 417
    goto/16 :goto_3

    .line 418
    .line 419
    :pswitch_11
    invoke-virtual {p0, p1, v7, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 420
    .line 421
    .line 422
    move-result v8

    .line 423
    if-eqz v8, :cond_3

    .line 424
    .line 425
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 426
    .line 427
    .line 428
    move-result-wide v8

    .line 429
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->X(Ljava/lang/Object;J)D

    .line 430
    .line 431
    .line 432
    move-result-wide v8

    .line 433
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->E(ID)V

    .line 434
    .line 435
    .line 436
    goto/16 :goto_3

    .line 437
    .line 438
    :pswitch_12
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 439
    .line 440
    .line 441
    move-result-wide v8

    .line 442
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object v6

    .line 446
    invoke-virtual {p0, p2, v7, v6, v5}, Landroidx/datastore/preferences/protobuf/d0;->w0(Landroidx/datastore/preferences/protobuf/Writer;ILjava/lang/Object;I)V

    .line 447
    .line 448
    .line 449
    goto/16 :goto_3

    .line 450
    .line 451
    :pswitch_13
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 452
    .line 453
    .line 454
    move-result v7

    .line 455
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 456
    .line 457
    .line 458
    move-result-wide v8

    .line 459
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 460
    .line 461
    .line 462
    move-result-object v6

    .line 463
    check-cast v6, Ljava/util/List;

    .line 464
    .line 465
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 466
    .line 467
    .line 468
    move-result-object v8

    .line 469
    invoke-static {v7, v6, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->U(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 470
    .line 471
    .line 472
    goto/16 :goto_3

    .line 473
    .line 474
    :pswitch_14
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 475
    .line 476
    .line 477
    move-result v7

    .line 478
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 479
    .line 480
    .line 481
    move-result-wide v10

    .line 482
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    move-result-object v6

    .line 486
    check-cast v6, Ljava/util/List;

    .line 487
    .line 488
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->b0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 489
    .line 490
    .line 491
    goto/16 :goto_3

    .line 492
    .line 493
    :pswitch_15
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 494
    .line 495
    .line 496
    move-result v7

    .line 497
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 498
    .line 499
    .line 500
    move-result-wide v10

    .line 501
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object v6

    .line 505
    check-cast v6, Ljava/util/List;

    .line 506
    .line 507
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->a0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 508
    .line 509
    .line 510
    goto/16 :goto_3

    .line 511
    .line 512
    :pswitch_16
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 513
    .line 514
    .line 515
    move-result v7

    .line 516
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 517
    .line 518
    .line 519
    move-result-wide v10

    .line 520
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 521
    .line 522
    .line 523
    move-result-object v6

    .line 524
    check-cast v6, Ljava/util/List;

    .line 525
    .line 526
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->Z(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 527
    .line 528
    .line 529
    goto/16 :goto_3

    .line 530
    .line 531
    :pswitch_17
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 532
    .line 533
    .line 534
    move-result v7

    .line 535
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 536
    .line 537
    .line 538
    move-result-wide v10

    .line 539
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 540
    .line 541
    .line 542
    move-result-object v6

    .line 543
    check-cast v6, Ljava/util/List;

    .line 544
    .line 545
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->Y(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 546
    .line 547
    .line 548
    goto/16 :goto_3

    .line 549
    .line 550
    :pswitch_18
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 551
    .line 552
    .line 553
    move-result v7

    .line 554
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 555
    .line 556
    .line 557
    move-result-wide v10

    .line 558
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 559
    .line 560
    .line 561
    move-result-object v6

    .line 562
    check-cast v6, Ljava/util/List;

    .line 563
    .line 564
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->Q(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 565
    .line 566
    .line 567
    goto/16 :goto_3

    .line 568
    .line 569
    :pswitch_19
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 570
    .line 571
    .line 572
    move-result v7

    .line 573
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 574
    .line 575
    .line 576
    move-result-wide v10

    .line 577
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 578
    .line 579
    .line 580
    move-result-object v6

    .line 581
    check-cast v6, Ljava/util/List;

    .line 582
    .line 583
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->d0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 584
    .line 585
    .line 586
    goto/16 :goto_3

    .line 587
    .line 588
    :pswitch_1a
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 589
    .line 590
    .line 591
    move-result v7

    .line 592
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 593
    .line 594
    .line 595
    move-result-wide v10

    .line 596
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 597
    .line 598
    .line 599
    move-result-object v6

    .line 600
    check-cast v6, Ljava/util/List;

    .line 601
    .line 602
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->N(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 603
    .line 604
    .line 605
    goto/16 :goto_3

    .line 606
    .line 607
    :pswitch_1b
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 608
    .line 609
    .line 610
    move-result v7

    .line 611
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 612
    .line 613
    .line 614
    move-result-wide v10

    .line 615
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 616
    .line 617
    .line 618
    move-result-object v6

    .line 619
    check-cast v6, Ljava/util/List;

    .line 620
    .line 621
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->R(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 622
    .line 623
    .line 624
    goto/16 :goto_3

    .line 625
    .line 626
    :pswitch_1c
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 627
    .line 628
    .line 629
    move-result v7

    .line 630
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 631
    .line 632
    .line 633
    move-result-wide v10

    .line 634
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 635
    .line 636
    .line 637
    move-result-object v6

    .line 638
    check-cast v6, Ljava/util/List;

    .line 639
    .line 640
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->S(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 641
    .line 642
    .line 643
    goto/16 :goto_3

    .line 644
    .line 645
    :pswitch_1d
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 646
    .line 647
    .line 648
    move-result v7

    .line 649
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 650
    .line 651
    .line 652
    move-result-wide v10

    .line 653
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 654
    .line 655
    .line 656
    move-result-object v6

    .line 657
    check-cast v6, Ljava/util/List;

    .line 658
    .line 659
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->V(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 660
    .line 661
    .line 662
    goto/16 :goto_3

    .line 663
    .line 664
    :pswitch_1e
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 665
    .line 666
    .line 667
    move-result v7

    .line 668
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 669
    .line 670
    .line 671
    move-result-wide v10

    .line 672
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 673
    .line 674
    .line 675
    move-result-object v6

    .line 676
    check-cast v6, Ljava/util/List;

    .line 677
    .line 678
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->e0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 679
    .line 680
    .line 681
    goto/16 :goto_3

    .line 682
    .line 683
    :pswitch_1f
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 684
    .line 685
    .line 686
    move-result v7

    .line 687
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 688
    .line 689
    .line 690
    move-result-wide v10

    .line 691
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 692
    .line 693
    .line 694
    move-result-object v6

    .line 695
    check-cast v6, Ljava/util/List;

    .line 696
    .line 697
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->W(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 698
    .line 699
    .line 700
    goto/16 :goto_3

    .line 701
    .line 702
    :pswitch_20
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 703
    .line 704
    .line 705
    move-result v7

    .line 706
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 707
    .line 708
    .line 709
    move-result-wide v10

    .line 710
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 711
    .line 712
    .line 713
    move-result-object v6

    .line 714
    check-cast v6, Ljava/util/List;

    .line 715
    .line 716
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->T(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 717
    .line 718
    .line 719
    goto/16 :goto_3

    .line 720
    .line 721
    :pswitch_21
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 722
    .line 723
    .line 724
    move-result v7

    .line 725
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 726
    .line 727
    .line 728
    move-result-wide v10

    .line 729
    invoke-static {p1, v10, v11}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 730
    .line 731
    .line 732
    move-result-object v6

    .line 733
    check-cast v6, Ljava/util/List;

    .line 734
    .line 735
    invoke-static {v7, v6, p2, v9}, Landroidx/datastore/preferences/protobuf/j0;->P(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 736
    .line 737
    .line 738
    goto/16 :goto_3

    .line 739
    .line 740
    :pswitch_22
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 741
    .line 742
    .line 743
    move-result v7

    .line 744
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 745
    .line 746
    .line 747
    move-result-wide v8

    .line 748
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 749
    .line 750
    .line 751
    move-result-object v6

    .line 752
    check-cast v6, Ljava/util/List;

    .line 753
    .line 754
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->b0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 755
    .line 756
    .line 757
    goto/16 :goto_3

    .line 758
    .line 759
    :pswitch_23
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 760
    .line 761
    .line 762
    move-result v7

    .line 763
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 764
    .line 765
    .line 766
    move-result-wide v8

    .line 767
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 768
    .line 769
    .line 770
    move-result-object v6

    .line 771
    check-cast v6, Ljava/util/List;

    .line 772
    .line 773
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->a0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 774
    .line 775
    .line 776
    goto/16 :goto_3

    .line 777
    .line 778
    :pswitch_24
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 779
    .line 780
    .line 781
    move-result v7

    .line 782
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 783
    .line 784
    .line 785
    move-result-wide v8

    .line 786
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 787
    .line 788
    .line 789
    move-result-object v6

    .line 790
    check-cast v6, Ljava/util/List;

    .line 791
    .line 792
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->Z(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 793
    .line 794
    .line 795
    goto/16 :goto_3

    .line 796
    .line 797
    :pswitch_25
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 798
    .line 799
    .line 800
    move-result v7

    .line 801
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 802
    .line 803
    .line 804
    move-result-wide v8

    .line 805
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 806
    .line 807
    .line 808
    move-result-object v6

    .line 809
    check-cast v6, Ljava/util/List;

    .line 810
    .line 811
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->Y(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 812
    .line 813
    .line 814
    goto/16 :goto_3

    .line 815
    .line 816
    :pswitch_26
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 817
    .line 818
    .line 819
    move-result v7

    .line 820
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 821
    .line 822
    .line 823
    move-result-wide v8

    .line 824
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 825
    .line 826
    .line 827
    move-result-object v6

    .line 828
    check-cast v6, Ljava/util/List;

    .line 829
    .line 830
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->Q(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 831
    .line 832
    .line 833
    goto/16 :goto_3

    .line 834
    .line 835
    :pswitch_27
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 836
    .line 837
    .line 838
    move-result v7

    .line 839
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 840
    .line 841
    .line 842
    move-result-wide v8

    .line 843
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 844
    .line 845
    .line 846
    move-result-object v6

    .line 847
    check-cast v6, Ljava/util/List;

    .line 848
    .line 849
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->d0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 850
    .line 851
    .line 852
    goto/16 :goto_3

    .line 853
    .line 854
    :pswitch_28
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 855
    .line 856
    .line 857
    move-result v7

    .line 858
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 859
    .line 860
    .line 861
    move-result-wide v8

    .line 862
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 863
    .line 864
    .line 865
    move-result-object v6

    .line 866
    check-cast v6, Ljava/util/List;

    .line 867
    .line 868
    invoke-static {v7, v6, p2}, Landroidx/datastore/preferences/protobuf/j0;->O(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 869
    .line 870
    .line 871
    goto/16 :goto_3

    .line 872
    .line 873
    :pswitch_29
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 874
    .line 875
    .line 876
    move-result v7

    .line 877
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 878
    .line 879
    .line 880
    move-result-wide v8

    .line 881
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 882
    .line 883
    .line 884
    move-result-object v6

    .line 885
    check-cast v6, Ljava/util/List;

    .line 886
    .line 887
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 888
    .line 889
    .line 890
    move-result-object v8

    .line 891
    invoke-static {v7, v6, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->X(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 892
    .line 893
    .line 894
    goto/16 :goto_3

    .line 895
    .line 896
    :pswitch_2a
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 897
    .line 898
    .line 899
    move-result v7

    .line 900
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 901
    .line 902
    .line 903
    move-result-wide v8

    .line 904
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 905
    .line 906
    .line 907
    move-result-object v6

    .line 908
    check-cast v6, Ljava/util/List;

    .line 909
    .line 910
    invoke-static {v7, v6, p2}, Landroidx/datastore/preferences/protobuf/j0;->c0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 911
    .line 912
    .line 913
    goto/16 :goto_3

    .line 914
    .line 915
    :pswitch_2b
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 916
    .line 917
    .line 918
    move-result v7

    .line 919
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 920
    .line 921
    .line 922
    move-result-wide v8

    .line 923
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 924
    .line 925
    .line 926
    move-result-object v6

    .line 927
    check-cast v6, Ljava/util/List;

    .line 928
    .line 929
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->N(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 930
    .line 931
    .line 932
    goto/16 :goto_3

    .line 933
    .line 934
    :pswitch_2c
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 935
    .line 936
    .line 937
    move-result v7

    .line 938
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 939
    .line 940
    .line 941
    move-result-wide v8

    .line 942
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 943
    .line 944
    .line 945
    move-result-object v6

    .line 946
    check-cast v6, Ljava/util/List;

    .line 947
    .line 948
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->R(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 949
    .line 950
    .line 951
    goto/16 :goto_3

    .line 952
    .line 953
    :pswitch_2d
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 954
    .line 955
    .line 956
    move-result v7

    .line 957
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 958
    .line 959
    .line 960
    move-result-wide v8

    .line 961
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 962
    .line 963
    .line 964
    move-result-object v6

    .line 965
    check-cast v6, Ljava/util/List;

    .line 966
    .line 967
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->S(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 968
    .line 969
    .line 970
    goto/16 :goto_3

    .line 971
    .line 972
    :pswitch_2e
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 973
    .line 974
    .line 975
    move-result v7

    .line 976
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 977
    .line 978
    .line 979
    move-result-wide v8

    .line 980
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 981
    .line 982
    .line 983
    move-result-object v6

    .line 984
    check-cast v6, Ljava/util/List;

    .line 985
    .line 986
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->V(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 987
    .line 988
    .line 989
    goto/16 :goto_3

    .line 990
    .line 991
    :pswitch_2f
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 992
    .line 993
    .line 994
    move-result v7

    .line 995
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 996
    .line 997
    .line 998
    move-result-wide v8

    .line 999
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v6

    .line 1003
    check-cast v6, Ljava/util/List;

    .line 1004
    .line 1005
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->e0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1006
    .line 1007
    .line 1008
    goto/16 :goto_3

    .line 1009
    .line 1010
    :pswitch_30
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 1011
    .line 1012
    .line 1013
    move-result v7

    .line 1014
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1015
    .line 1016
    .line 1017
    move-result-wide v8

    .line 1018
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1019
    .line 1020
    .line 1021
    move-result-object v6

    .line 1022
    check-cast v6, Ljava/util/List;

    .line 1023
    .line 1024
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->W(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1025
    .line 1026
    .line 1027
    goto/16 :goto_3

    .line 1028
    .line 1029
    :pswitch_31
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 1030
    .line 1031
    .line 1032
    move-result v7

    .line 1033
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1034
    .line 1035
    .line 1036
    move-result-wide v8

    .line 1037
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1038
    .line 1039
    .line 1040
    move-result-object v6

    .line 1041
    check-cast v6, Ljava/util/List;

    .line 1042
    .line 1043
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->T(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1044
    .line 1045
    .line 1046
    goto/16 :goto_3

    .line 1047
    .line 1048
    :pswitch_32
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 1049
    .line 1050
    .line 1051
    move-result v7

    .line 1052
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1053
    .line 1054
    .line 1055
    move-result-wide v8

    .line 1056
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v6

    .line 1060
    check-cast v6, Ljava/util/List;

    .line 1061
    .line 1062
    invoke-static {v7, v6, p2, v4}, Landroidx/datastore/preferences/protobuf/j0;->P(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1063
    .line 1064
    .line 1065
    goto/16 :goto_3

    .line 1066
    .line 1067
    :pswitch_33
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1068
    .line 1069
    .line 1070
    move-result v8

    .line 1071
    if-eqz v8, :cond_3

    .line 1072
    .line 1073
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1074
    .line 1075
    .line 1076
    move-result-wide v8

    .line 1077
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v6

    .line 1081
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1082
    .line 1083
    .line 1084
    move-result-object v8

    .line 1085
    invoke-interface {p2, v7, v6, v8}, Landroidx/datastore/preferences/protobuf/Writer;->D(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 1086
    .line 1087
    .line 1088
    goto/16 :goto_3

    .line 1089
    .line 1090
    :pswitch_34
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1091
    .line 1092
    .line 1093
    move-result v8

    .line 1094
    if-eqz v8, :cond_3

    .line 1095
    .line 1096
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1097
    .line 1098
    .line 1099
    move-result-wide v8

    .line 1100
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1101
    .line 1102
    .line 1103
    move-result-wide v8

    .line 1104
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->l(IJ)V

    .line 1105
    .line 1106
    .line 1107
    goto/16 :goto_3

    .line 1108
    .line 1109
    :pswitch_35
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1110
    .line 1111
    .line 1112
    move-result v8

    .line 1113
    if-eqz v8, :cond_3

    .line 1114
    .line 1115
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1116
    .line 1117
    .line 1118
    move-result-wide v8

    .line 1119
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1120
    .line 1121
    .line 1122
    move-result v6

    .line 1123
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->O(II)V

    .line 1124
    .line 1125
    .line 1126
    goto/16 :goto_3

    .line 1127
    .line 1128
    :pswitch_36
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1129
    .line 1130
    .line 1131
    move-result v8

    .line 1132
    if-eqz v8, :cond_3

    .line 1133
    .line 1134
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1135
    .line 1136
    .line 1137
    move-result-wide v8

    .line 1138
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1139
    .line 1140
    .line 1141
    move-result-wide v8

    .line 1142
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->A(IJ)V

    .line 1143
    .line 1144
    .line 1145
    goto/16 :goto_3

    .line 1146
    .line 1147
    :pswitch_37
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1148
    .line 1149
    .line 1150
    move-result v8

    .line 1151
    if-eqz v8, :cond_3

    .line 1152
    .line 1153
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1154
    .line 1155
    .line 1156
    move-result-wide v8

    .line 1157
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1158
    .line 1159
    .line 1160
    move-result v6

    .line 1161
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->r(II)V

    .line 1162
    .line 1163
    .line 1164
    goto/16 :goto_3

    .line 1165
    .line 1166
    :pswitch_38
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1167
    .line 1168
    .line 1169
    move-result v8

    .line 1170
    if-eqz v8, :cond_3

    .line 1171
    .line 1172
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1173
    .line 1174
    .line 1175
    move-result-wide v8

    .line 1176
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1177
    .line 1178
    .line 1179
    move-result v6

    .line 1180
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->M(II)V

    .line 1181
    .line 1182
    .line 1183
    goto/16 :goto_3

    .line 1184
    .line 1185
    :pswitch_39
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1186
    .line 1187
    .line 1188
    move-result v8

    .line 1189
    if-eqz v8, :cond_3

    .line 1190
    .line 1191
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1192
    .line 1193
    .line 1194
    move-result-wide v8

    .line 1195
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1196
    .line 1197
    .line 1198
    move-result v6

    .line 1199
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->n(II)V

    .line 1200
    .line 1201
    .line 1202
    goto/16 :goto_3

    .line 1203
    .line 1204
    :pswitch_3a
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1205
    .line 1206
    .line 1207
    move-result v8

    .line 1208
    if-eqz v8, :cond_3

    .line 1209
    .line 1210
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1211
    .line 1212
    .line 1213
    move-result-wide v8

    .line 1214
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v6

    .line 1218
    check-cast v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1219
    .line 1220
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 1221
    .line 1222
    .line 1223
    goto/16 :goto_3

    .line 1224
    .line 1225
    :pswitch_3b
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1226
    .line 1227
    .line 1228
    move-result v8

    .line 1229
    if-eqz v8, :cond_3

    .line 1230
    .line 1231
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1232
    .line 1233
    .line 1234
    move-result-wide v8

    .line 1235
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1236
    .line 1237
    .line 1238
    move-result-object v6

    .line 1239
    invoke-virtual {p0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1240
    .line 1241
    .line 1242
    move-result-object v8

    .line 1243
    invoke-interface {p2, v7, v6, v8}, Landroidx/datastore/preferences/protobuf/Writer;->j(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 1244
    .line 1245
    .line 1246
    goto/16 :goto_3

    .line 1247
    .line 1248
    :pswitch_3c
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1249
    .line 1250
    .line 1251
    move-result v8

    .line 1252
    if-eqz v8, :cond_3

    .line 1253
    .line 1254
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1255
    .line 1256
    .line 1257
    move-result-wide v8

    .line 1258
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1259
    .line 1260
    .line 1261
    move-result-object v6

    .line 1262
    invoke-virtual {p0, v7, v6, p2}, Landroidx/datastore/preferences/protobuf/d0;->x0(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 1263
    .line 1264
    .line 1265
    goto/16 :goto_3

    .line 1266
    .line 1267
    :pswitch_3d
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1268
    .line 1269
    .line 1270
    move-result v8

    .line 1271
    if-eqz v8, :cond_3

    .line 1272
    .line 1273
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1274
    .line 1275
    .line 1276
    move-result-wide v8

    .line 1277
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->l(Ljava/lang/Object;J)Z

    .line 1278
    .line 1279
    .line 1280
    move-result v6

    .line 1281
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->q(IZ)V

    .line 1282
    .line 1283
    .line 1284
    goto/16 :goto_3

    .line 1285
    .line 1286
    :pswitch_3e
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1287
    .line 1288
    .line 1289
    move-result v8

    .line 1290
    if-eqz v8, :cond_3

    .line 1291
    .line 1292
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1293
    .line 1294
    .line 1295
    move-result-wide v8

    .line 1296
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1297
    .line 1298
    .line 1299
    move-result v6

    .line 1300
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->c(II)V

    .line 1301
    .line 1302
    .line 1303
    goto :goto_3

    .line 1304
    :pswitch_3f
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1305
    .line 1306
    .line 1307
    move-result v8

    .line 1308
    if-eqz v8, :cond_3

    .line 1309
    .line 1310
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1311
    .line 1312
    .line 1313
    move-result-wide v8

    .line 1314
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1315
    .line 1316
    .line 1317
    move-result-wide v8

    .line 1318
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->p(IJ)V

    .line 1319
    .line 1320
    .line 1321
    goto :goto_3

    .line 1322
    :pswitch_40
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1323
    .line 1324
    .line 1325
    move-result v8

    .line 1326
    if-eqz v8, :cond_3

    .line 1327
    .line 1328
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1329
    .line 1330
    .line 1331
    move-result-wide v8

    .line 1332
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1333
    .line 1334
    .line 1335
    move-result v6

    .line 1336
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->g(II)V

    .line 1337
    .line 1338
    .line 1339
    goto :goto_3

    .line 1340
    :pswitch_41
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1341
    .line 1342
    .line 1343
    move-result v8

    .line 1344
    if-eqz v8, :cond_3

    .line 1345
    .line 1346
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1347
    .line 1348
    .line 1349
    move-result-wide v8

    .line 1350
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1351
    .line 1352
    .line 1353
    move-result-wide v8

    .line 1354
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->e(IJ)V

    .line 1355
    .line 1356
    .line 1357
    goto :goto_3

    .line 1358
    :pswitch_42
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1359
    .line 1360
    .line 1361
    move-result v8

    .line 1362
    if-eqz v8, :cond_3

    .line 1363
    .line 1364
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1365
    .line 1366
    .line 1367
    move-result-wide v8

    .line 1368
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1369
    .line 1370
    .line 1371
    move-result-wide v8

    .line 1372
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->I(IJ)V

    .line 1373
    .line 1374
    .line 1375
    goto :goto_3

    .line 1376
    :pswitch_43
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1377
    .line 1378
    .line 1379
    move-result v8

    .line 1380
    if-eqz v8, :cond_3

    .line 1381
    .line 1382
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1383
    .line 1384
    .line 1385
    move-result-wide v8

    .line 1386
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->s(Ljava/lang/Object;J)F

    .line 1387
    .line 1388
    .line 1389
    move-result v6

    .line 1390
    invoke-interface {p2, v7, v6}, Landroidx/datastore/preferences/protobuf/Writer;->L(IF)V

    .line 1391
    .line 1392
    .line 1393
    goto :goto_3

    .line 1394
    :pswitch_44
    invoke-virtual {p0, p1, v5}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1395
    .line 1396
    .line 1397
    move-result v8

    .line 1398
    if-eqz v8, :cond_3

    .line 1399
    .line 1400
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1401
    .line 1402
    .line 1403
    move-result-wide v8

    .line 1404
    invoke-static {p1, v8, v9}, Landroidx/datastore/preferences/protobuf/d0;->o(Ljava/lang/Object;J)D

    .line 1405
    .line 1406
    .line 1407
    move-result-wide v8

    .line 1408
    invoke-interface {p2, v7, v8, v9}, Landroidx/datastore/preferences/protobuf/Writer;->E(ID)V

    .line 1409
    .line 1410
    .line 1411
    :cond_3
    :goto_3
    add-int/lit8 v5, v5, 0x3

    .line 1412
    .line 1413
    goto/16 :goto_1

    .line 1414
    .line 1415
    :cond_4
    :goto_4
    if-eqz v2, :cond_6

    .line 1416
    .line 1417
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 1418
    .line 1419
    invoke-virtual {v3, p2, v2}, Landroidx/datastore/preferences/protobuf/m;->j(Landroidx/datastore/preferences/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 1420
    .line 1421
    .line 1422
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1423
    .line 1424
    .line 1425
    move-result v2

    .line 1426
    if-eqz v2, :cond_5

    .line 1427
    .line 1428
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1429
    .line 1430
    .line 1431
    move-result-object v2

    .line 1432
    check-cast v2, Ljava/util/Map$Entry;

    .line 1433
    .line 1434
    goto :goto_4

    .line 1435
    :cond_5
    move-object v2, v1

    .line 1436
    goto :goto_4

    .line 1437
    :cond_6
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 1438
    .line 1439
    invoke-virtual {p0, v0, p1, p2}, Landroidx/datastore/preferences/protobuf/d0;->y0(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 1440
    .line 1441
    .line 1442
    return-void

    .line 1443
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final v(I)Landroidx/datastore/preferences/protobuf/i0;
    .locals 3

    .line 1
    div-int/lit8 p1, p1, 0x3

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x2

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->b:[Ljava/lang/Object;

    .line 6
    .line 7
    aget-object v0, v0, p1

    .line 8
    .line 9
    check-cast v0, Landroidx/datastore/preferences/protobuf/i0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    invoke-static {}, Ll/g7b0;->a()Ll/g7b0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Landroidx/datastore/preferences/protobuf/d0;->b:[Ljava/lang/Object;

    .line 19
    .line 20
    add-int/lit8 v2, p1, 0x1

    .line 21
    .line 22
    aget-object v1, v1, v2

    .line 23
    .line 24
    check-cast v1, Ljava/lang/Class;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/g7b0;->d(Ljava/lang/Class;)Landroidx/datastore/preferences/protobuf/i0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->b:[Ljava/lang/Object;

    .line 31
    .line 32
    aput-object v0, p0, p1

    .line 33
    .line 34
    return-object v0
.end method

.method public final v0(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroidx/datastore/preferences/protobuf/Writer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Landroidx/datastore/preferences/protobuf/d0;->y0(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/p;->n()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/p;->g()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/util/Map$Entry;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move-object v0, v1

    .line 35
    move-object v2, v0

    .line 36
    :goto_0
    iget-object v3, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 37
    .line 38
    array-length v3, v3

    .line 39
    add-int/lit8 v3, v3, -0x3

    .line 40
    .line 41
    :goto_1
    if-ltz v3, :cond_4

    .line 42
    .line 43
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    :goto_2
    if-eqz v2, :cond_2

    .line 52
    .line 53
    iget-object v6, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 54
    .line 55
    invoke-virtual {v6, v2}, Landroidx/datastore/preferences/protobuf/m;->a(Ljava/util/Map$Entry;)I

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    if-le v6, v5, :cond_2

    .line 60
    .line 61
    iget-object v6, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 62
    .line 63
    invoke-virtual {v6, p2, v2}, Landroidx/datastore/preferences/protobuf/m;->j(Landroidx/datastore/preferences/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_1

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Ljava/util/Map$Entry;

    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_1
    move-object v2, v1

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    const/4 v7, 0x0

    .line 86
    const/4 v8, 0x1

    .line 87
    packed-switch v6, :pswitch_data_0

    .line 88
    .line 89
    .line 90
    goto/16 :goto_3

    .line 91
    .line 92
    :pswitch_0
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-eqz v6, :cond_3

    .line 97
    .line 98
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 99
    .line 100
    .line 101
    move-result-wide v6

    .line 102
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    invoke-interface {p2, v5, v4, v6}, Landroidx/datastore/preferences/protobuf/Writer;->D(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 111
    .line 112
    .line 113
    goto/16 :goto_3

    .line 114
    .line 115
    :pswitch_1
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    if-eqz v6, :cond_3

    .line 120
    .line 121
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 122
    .line 123
    .line 124
    move-result-wide v6

    .line 125
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 126
    .line 127
    .line 128
    move-result-wide v6

    .line 129
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->l(IJ)V

    .line 130
    .line 131
    .line 132
    goto/16 :goto_3

    .line 133
    .line 134
    :pswitch_2
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    if-eqz v6, :cond_3

    .line 139
    .line 140
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 141
    .line 142
    .line 143
    move-result-wide v6

    .line 144
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->O(II)V

    .line 149
    .line 150
    .line 151
    goto/16 :goto_3

    .line 152
    .line 153
    :pswitch_3
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 154
    .line 155
    .line 156
    move-result v6

    .line 157
    if-eqz v6, :cond_3

    .line 158
    .line 159
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 160
    .line 161
    .line 162
    move-result-wide v6

    .line 163
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 164
    .line 165
    .line 166
    move-result-wide v6

    .line 167
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->A(IJ)V

    .line 168
    .line 169
    .line 170
    goto/16 :goto_3

    .line 171
    .line 172
    :pswitch_4
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 173
    .line 174
    .line 175
    move-result v6

    .line 176
    if-eqz v6, :cond_3

    .line 177
    .line 178
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 179
    .line 180
    .line 181
    move-result-wide v6

    .line 182
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->r(II)V

    .line 187
    .line 188
    .line 189
    goto/16 :goto_3

    .line 190
    .line 191
    :pswitch_5
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 192
    .line 193
    .line 194
    move-result v6

    .line 195
    if-eqz v6, :cond_3

    .line 196
    .line 197
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 198
    .line 199
    .line 200
    move-result-wide v6

    .line 201
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->M(II)V

    .line 206
    .line 207
    .line 208
    goto/16 :goto_3

    .line 209
    .line 210
    :pswitch_6
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 211
    .line 212
    .line 213
    move-result v6

    .line 214
    if-eqz v6, :cond_3

    .line 215
    .line 216
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 217
    .line 218
    .line 219
    move-result-wide v6

    .line 220
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 221
    .line 222
    .line 223
    move-result v4

    .line 224
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->n(II)V

    .line 225
    .line 226
    .line 227
    goto/16 :goto_3

    .line 228
    .line 229
    :pswitch_7
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 230
    .line 231
    .line 232
    move-result v6

    .line 233
    if-eqz v6, :cond_3

    .line 234
    .line 235
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 236
    .line 237
    .line 238
    move-result-wide v6

    .line 239
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    check-cast v4, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 244
    .line 245
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 246
    .line 247
    .line 248
    goto/16 :goto_3

    .line 249
    .line 250
    :pswitch_8
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 251
    .line 252
    .line 253
    move-result v6

    .line 254
    if-eqz v6, :cond_3

    .line 255
    .line 256
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 257
    .line 258
    .line 259
    move-result-wide v6

    .line 260
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 265
    .line 266
    .line 267
    move-result-object v6

    .line 268
    invoke-interface {p2, v5, v4, v6}, Landroidx/datastore/preferences/protobuf/Writer;->j(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 269
    .line 270
    .line 271
    goto/16 :goto_3

    .line 272
    .line 273
    :pswitch_9
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 274
    .line 275
    .line 276
    move-result v6

    .line 277
    if-eqz v6, :cond_3

    .line 278
    .line 279
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 280
    .line 281
    .line 282
    move-result-wide v6

    .line 283
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v4

    .line 287
    invoke-virtual {p0, v5, v4, p2}, Landroidx/datastore/preferences/protobuf/d0;->x0(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 288
    .line 289
    .line 290
    goto/16 :goto_3

    .line 291
    .line 292
    :pswitch_a
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 293
    .line 294
    .line 295
    move-result v6

    .line 296
    if-eqz v6, :cond_3

    .line 297
    .line 298
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 299
    .line 300
    .line 301
    move-result-wide v6

    .line 302
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->W(Ljava/lang/Object;J)Z

    .line 303
    .line 304
    .line 305
    move-result v4

    .line 306
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->q(IZ)V

    .line 307
    .line 308
    .line 309
    goto/16 :goto_3

    .line 310
    .line 311
    :pswitch_b
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 312
    .line 313
    .line 314
    move-result v6

    .line 315
    if-eqz v6, :cond_3

    .line 316
    .line 317
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 318
    .line 319
    .line 320
    move-result-wide v6

    .line 321
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 322
    .line 323
    .line 324
    move-result v4

    .line 325
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->c(II)V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_3

    .line 329
    .line 330
    :pswitch_c
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 331
    .line 332
    .line 333
    move-result v6

    .line 334
    if-eqz v6, :cond_3

    .line 335
    .line 336
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 337
    .line 338
    .line 339
    move-result-wide v6

    .line 340
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 341
    .line 342
    .line 343
    move-result-wide v6

    .line 344
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->p(IJ)V

    .line 345
    .line 346
    .line 347
    goto/16 :goto_3

    .line 348
    .line 349
    :pswitch_d
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 350
    .line 351
    .line 352
    move-result v6

    .line 353
    if-eqz v6, :cond_3

    .line 354
    .line 355
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 356
    .line 357
    .line 358
    move-result-wide v6

    .line 359
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 360
    .line 361
    .line 362
    move-result v4

    .line 363
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->g(II)V

    .line 364
    .line 365
    .line 366
    goto/16 :goto_3

    .line 367
    .line 368
    :pswitch_e
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 369
    .line 370
    .line 371
    move-result v6

    .line 372
    if-eqz v6, :cond_3

    .line 373
    .line 374
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 375
    .line 376
    .line 377
    move-result-wide v6

    .line 378
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 379
    .line 380
    .line 381
    move-result-wide v6

    .line 382
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->e(IJ)V

    .line 383
    .line 384
    .line 385
    goto/16 :goto_3

    .line 386
    .line 387
    :pswitch_f
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 388
    .line 389
    .line 390
    move-result v6

    .line 391
    if-eqz v6, :cond_3

    .line 392
    .line 393
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 394
    .line 395
    .line 396
    move-result-wide v6

    .line 397
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 398
    .line 399
    .line 400
    move-result-wide v6

    .line 401
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->I(IJ)V

    .line 402
    .line 403
    .line 404
    goto/16 :goto_3

    .line 405
    .line 406
    :pswitch_10
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 407
    .line 408
    .line 409
    move-result v6

    .line 410
    if-eqz v6, :cond_3

    .line 411
    .line 412
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 413
    .line 414
    .line 415
    move-result-wide v6

    .line 416
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->Y(Ljava/lang/Object;J)F

    .line 417
    .line 418
    .line 419
    move-result v4

    .line 420
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->L(IF)V

    .line 421
    .line 422
    .line 423
    goto/16 :goto_3

    .line 424
    .line 425
    :pswitch_11
    invoke-virtual {p0, p1, v5, v3}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 426
    .line 427
    .line 428
    move-result v6

    .line 429
    if-eqz v6, :cond_3

    .line 430
    .line 431
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 432
    .line 433
    .line 434
    move-result-wide v6

    .line 435
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->X(Ljava/lang/Object;J)D

    .line 436
    .line 437
    .line 438
    move-result-wide v6

    .line 439
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->E(ID)V

    .line 440
    .line 441
    .line 442
    goto/16 :goto_3

    .line 443
    .line 444
    :pswitch_12
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 445
    .line 446
    .line 447
    move-result-wide v6

    .line 448
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object v4

    .line 452
    invoke-virtual {p0, p2, v5, v4, v3}, Landroidx/datastore/preferences/protobuf/d0;->w0(Landroidx/datastore/preferences/protobuf/Writer;ILjava/lang/Object;I)V

    .line 453
    .line 454
    .line 455
    goto/16 :goto_3

    .line 456
    .line 457
    :pswitch_13
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 458
    .line 459
    .line 460
    move-result v5

    .line 461
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 462
    .line 463
    .line 464
    move-result-wide v6

    .line 465
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 466
    .line 467
    .line 468
    move-result-object v4

    .line 469
    check-cast v4, Ljava/util/List;

    .line 470
    .line 471
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 472
    .line 473
    .line 474
    move-result-object v6

    .line 475
    invoke-static {v5, v4, p2, v6}, Landroidx/datastore/preferences/protobuf/j0;->U(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 476
    .line 477
    .line 478
    goto/16 :goto_3

    .line 479
    .line 480
    :pswitch_14
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 481
    .line 482
    .line 483
    move-result v5

    .line 484
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 485
    .line 486
    .line 487
    move-result-wide v6

    .line 488
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    move-result-object v4

    .line 492
    check-cast v4, Ljava/util/List;

    .line 493
    .line 494
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->b0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 495
    .line 496
    .line 497
    goto/16 :goto_3

    .line 498
    .line 499
    :pswitch_15
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 500
    .line 501
    .line 502
    move-result v5

    .line 503
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 504
    .line 505
    .line 506
    move-result-wide v6

    .line 507
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    move-result-object v4

    .line 511
    check-cast v4, Ljava/util/List;

    .line 512
    .line 513
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->a0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 514
    .line 515
    .line 516
    goto/16 :goto_3

    .line 517
    .line 518
    :pswitch_16
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 519
    .line 520
    .line 521
    move-result v5

    .line 522
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 523
    .line 524
    .line 525
    move-result-wide v6

    .line 526
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    move-result-object v4

    .line 530
    check-cast v4, Ljava/util/List;

    .line 531
    .line 532
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->Z(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 533
    .line 534
    .line 535
    goto/16 :goto_3

    .line 536
    .line 537
    :pswitch_17
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 538
    .line 539
    .line 540
    move-result v5

    .line 541
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 542
    .line 543
    .line 544
    move-result-wide v6

    .line 545
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 546
    .line 547
    .line 548
    move-result-object v4

    .line 549
    check-cast v4, Ljava/util/List;

    .line 550
    .line 551
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->Y(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 552
    .line 553
    .line 554
    goto/16 :goto_3

    .line 555
    .line 556
    :pswitch_18
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 557
    .line 558
    .line 559
    move-result v5

    .line 560
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 561
    .line 562
    .line 563
    move-result-wide v6

    .line 564
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 565
    .line 566
    .line 567
    move-result-object v4

    .line 568
    check-cast v4, Ljava/util/List;

    .line 569
    .line 570
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->Q(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 571
    .line 572
    .line 573
    goto/16 :goto_3

    .line 574
    .line 575
    :pswitch_19
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 576
    .line 577
    .line 578
    move-result v5

    .line 579
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 580
    .line 581
    .line 582
    move-result-wide v6

    .line 583
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    move-result-object v4

    .line 587
    check-cast v4, Ljava/util/List;

    .line 588
    .line 589
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->d0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 590
    .line 591
    .line 592
    goto/16 :goto_3

    .line 593
    .line 594
    :pswitch_1a
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 595
    .line 596
    .line 597
    move-result v5

    .line 598
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 599
    .line 600
    .line 601
    move-result-wide v6

    .line 602
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 603
    .line 604
    .line 605
    move-result-object v4

    .line 606
    check-cast v4, Ljava/util/List;

    .line 607
    .line 608
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->N(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 609
    .line 610
    .line 611
    goto/16 :goto_3

    .line 612
    .line 613
    :pswitch_1b
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 614
    .line 615
    .line 616
    move-result v5

    .line 617
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 618
    .line 619
    .line 620
    move-result-wide v6

    .line 621
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 622
    .line 623
    .line 624
    move-result-object v4

    .line 625
    check-cast v4, Ljava/util/List;

    .line 626
    .line 627
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->R(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 628
    .line 629
    .line 630
    goto/16 :goto_3

    .line 631
    .line 632
    :pswitch_1c
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 633
    .line 634
    .line 635
    move-result v5

    .line 636
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 637
    .line 638
    .line 639
    move-result-wide v6

    .line 640
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 641
    .line 642
    .line 643
    move-result-object v4

    .line 644
    check-cast v4, Ljava/util/List;

    .line 645
    .line 646
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->S(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 647
    .line 648
    .line 649
    goto/16 :goto_3

    .line 650
    .line 651
    :pswitch_1d
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 652
    .line 653
    .line 654
    move-result v5

    .line 655
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 656
    .line 657
    .line 658
    move-result-wide v6

    .line 659
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 660
    .line 661
    .line 662
    move-result-object v4

    .line 663
    check-cast v4, Ljava/util/List;

    .line 664
    .line 665
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->V(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 666
    .line 667
    .line 668
    goto/16 :goto_3

    .line 669
    .line 670
    :pswitch_1e
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 671
    .line 672
    .line 673
    move-result v5

    .line 674
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 675
    .line 676
    .line 677
    move-result-wide v6

    .line 678
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 679
    .line 680
    .line 681
    move-result-object v4

    .line 682
    check-cast v4, Ljava/util/List;

    .line 683
    .line 684
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->e0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 685
    .line 686
    .line 687
    goto/16 :goto_3

    .line 688
    .line 689
    :pswitch_1f
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 690
    .line 691
    .line 692
    move-result v5

    .line 693
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 694
    .line 695
    .line 696
    move-result-wide v6

    .line 697
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v4

    .line 701
    check-cast v4, Ljava/util/List;

    .line 702
    .line 703
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->W(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 704
    .line 705
    .line 706
    goto/16 :goto_3

    .line 707
    .line 708
    :pswitch_20
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 709
    .line 710
    .line 711
    move-result v5

    .line 712
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 713
    .line 714
    .line 715
    move-result-wide v6

    .line 716
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 717
    .line 718
    .line 719
    move-result-object v4

    .line 720
    check-cast v4, Ljava/util/List;

    .line 721
    .line 722
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->T(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 723
    .line 724
    .line 725
    goto/16 :goto_3

    .line 726
    .line 727
    :pswitch_21
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 728
    .line 729
    .line 730
    move-result v5

    .line 731
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 732
    .line 733
    .line 734
    move-result-wide v6

    .line 735
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-result-object v4

    .line 739
    check-cast v4, Ljava/util/List;

    .line 740
    .line 741
    invoke-static {v5, v4, p2, v8}, Landroidx/datastore/preferences/protobuf/j0;->P(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 742
    .line 743
    .line 744
    goto/16 :goto_3

    .line 745
    .line 746
    :pswitch_22
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 747
    .line 748
    .line 749
    move-result v5

    .line 750
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 751
    .line 752
    .line 753
    move-result-wide v8

    .line 754
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 755
    .line 756
    .line 757
    move-result-object v4

    .line 758
    check-cast v4, Ljava/util/List;

    .line 759
    .line 760
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->b0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 761
    .line 762
    .line 763
    goto/16 :goto_3

    .line 764
    .line 765
    :pswitch_23
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 766
    .line 767
    .line 768
    move-result v5

    .line 769
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 770
    .line 771
    .line 772
    move-result-wide v8

    .line 773
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 774
    .line 775
    .line 776
    move-result-object v4

    .line 777
    check-cast v4, Ljava/util/List;

    .line 778
    .line 779
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->a0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 780
    .line 781
    .line 782
    goto/16 :goto_3

    .line 783
    .line 784
    :pswitch_24
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 785
    .line 786
    .line 787
    move-result v5

    .line 788
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 789
    .line 790
    .line 791
    move-result-wide v8

    .line 792
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 793
    .line 794
    .line 795
    move-result-object v4

    .line 796
    check-cast v4, Ljava/util/List;

    .line 797
    .line 798
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->Z(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 799
    .line 800
    .line 801
    goto/16 :goto_3

    .line 802
    .line 803
    :pswitch_25
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 804
    .line 805
    .line 806
    move-result v5

    .line 807
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 808
    .line 809
    .line 810
    move-result-wide v8

    .line 811
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 812
    .line 813
    .line 814
    move-result-object v4

    .line 815
    check-cast v4, Ljava/util/List;

    .line 816
    .line 817
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->Y(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 818
    .line 819
    .line 820
    goto/16 :goto_3

    .line 821
    .line 822
    :pswitch_26
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 823
    .line 824
    .line 825
    move-result v5

    .line 826
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 827
    .line 828
    .line 829
    move-result-wide v8

    .line 830
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 831
    .line 832
    .line 833
    move-result-object v4

    .line 834
    check-cast v4, Ljava/util/List;

    .line 835
    .line 836
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->Q(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 837
    .line 838
    .line 839
    goto/16 :goto_3

    .line 840
    .line 841
    :pswitch_27
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 842
    .line 843
    .line 844
    move-result v5

    .line 845
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 846
    .line 847
    .line 848
    move-result-wide v8

    .line 849
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 850
    .line 851
    .line 852
    move-result-object v4

    .line 853
    check-cast v4, Ljava/util/List;

    .line 854
    .line 855
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->d0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 856
    .line 857
    .line 858
    goto/16 :goto_3

    .line 859
    .line 860
    :pswitch_28
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 861
    .line 862
    .line 863
    move-result v5

    .line 864
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 865
    .line 866
    .line 867
    move-result-wide v6

    .line 868
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 869
    .line 870
    .line 871
    move-result-object v4

    .line 872
    check-cast v4, Ljava/util/List;

    .line 873
    .line 874
    invoke-static {v5, v4, p2}, Landroidx/datastore/preferences/protobuf/j0;->O(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 875
    .line 876
    .line 877
    goto/16 :goto_3

    .line 878
    .line 879
    :pswitch_29
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 880
    .line 881
    .line 882
    move-result v5

    .line 883
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 884
    .line 885
    .line 886
    move-result-wide v6

    .line 887
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 888
    .line 889
    .line 890
    move-result-object v4

    .line 891
    check-cast v4, Ljava/util/List;

    .line 892
    .line 893
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 894
    .line 895
    .line 896
    move-result-object v6

    .line 897
    invoke-static {v5, v4, p2, v6}, Landroidx/datastore/preferences/protobuf/j0;->X(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 898
    .line 899
    .line 900
    goto/16 :goto_3

    .line 901
    .line 902
    :pswitch_2a
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 903
    .line 904
    .line 905
    move-result v5

    .line 906
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 907
    .line 908
    .line 909
    move-result-wide v6

    .line 910
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 911
    .line 912
    .line 913
    move-result-object v4

    .line 914
    check-cast v4, Ljava/util/List;

    .line 915
    .line 916
    invoke-static {v5, v4, p2}, Landroidx/datastore/preferences/protobuf/j0;->c0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 917
    .line 918
    .line 919
    goto/16 :goto_3

    .line 920
    .line 921
    :pswitch_2b
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 922
    .line 923
    .line 924
    move-result v5

    .line 925
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 926
    .line 927
    .line 928
    move-result-wide v8

    .line 929
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 930
    .line 931
    .line 932
    move-result-object v4

    .line 933
    check-cast v4, Ljava/util/List;

    .line 934
    .line 935
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->N(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 936
    .line 937
    .line 938
    goto/16 :goto_3

    .line 939
    .line 940
    :pswitch_2c
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 941
    .line 942
    .line 943
    move-result v5

    .line 944
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 945
    .line 946
    .line 947
    move-result-wide v8

    .line 948
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 949
    .line 950
    .line 951
    move-result-object v4

    .line 952
    check-cast v4, Ljava/util/List;

    .line 953
    .line 954
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->R(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 955
    .line 956
    .line 957
    goto/16 :goto_3

    .line 958
    .line 959
    :pswitch_2d
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 960
    .line 961
    .line 962
    move-result v5

    .line 963
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 964
    .line 965
    .line 966
    move-result-wide v8

    .line 967
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 968
    .line 969
    .line 970
    move-result-object v4

    .line 971
    check-cast v4, Ljava/util/List;

    .line 972
    .line 973
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->S(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 974
    .line 975
    .line 976
    goto/16 :goto_3

    .line 977
    .line 978
    :pswitch_2e
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 979
    .line 980
    .line 981
    move-result v5

    .line 982
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 983
    .line 984
    .line 985
    move-result-wide v8

    .line 986
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 987
    .line 988
    .line 989
    move-result-object v4

    .line 990
    check-cast v4, Ljava/util/List;

    .line 991
    .line 992
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->V(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 993
    .line 994
    .line 995
    goto/16 :goto_3

    .line 996
    .line 997
    :pswitch_2f
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 998
    .line 999
    .line 1000
    move-result v5

    .line 1001
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1002
    .line 1003
    .line 1004
    move-result-wide v8

    .line 1005
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v4

    .line 1009
    check-cast v4, Ljava/util/List;

    .line 1010
    .line 1011
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->e0(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1012
    .line 1013
    .line 1014
    goto/16 :goto_3

    .line 1015
    .line 1016
    :pswitch_30
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 1017
    .line 1018
    .line 1019
    move-result v5

    .line 1020
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1021
    .line 1022
    .line 1023
    move-result-wide v8

    .line 1024
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v4

    .line 1028
    check-cast v4, Ljava/util/List;

    .line 1029
    .line 1030
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->W(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1031
    .line 1032
    .line 1033
    goto/16 :goto_3

    .line 1034
    .line 1035
    :pswitch_31
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 1036
    .line 1037
    .line 1038
    move-result v5

    .line 1039
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1040
    .line 1041
    .line 1042
    move-result-wide v8

    .line 1043
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1044
    .line 1045
    .line 1046
    move-result-object v4

    .line 1047
    check-cast v4, Ljava/util/List;

    .line 1048
    .line 1049
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->T(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1050
    .line 1051
    .line 1052
    goto/16 :goto_3

    .line 1053
    .line 1054
    :pswitch_32
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 1055
    .line 1056
    .line 1057
    move-result v5

    .line 1058
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1059
    .line 1060
    .line 1061
    move-result-wide v8

    .line 1062
    invoke-static {p1, v8, v9}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v4

    .line 1066
    check-cast v4, Ljava/util/List;

    .line 1067
    .line 1068
    invoke-static {v5, v4, p2, v7}, Landroidx/datastore/preferences/protobuf/j0;->P(ILjava/util/List;Landroidx/datastore/preferences/protobuf/Writer;Z)V

    .line 1069
    .line 1070
    .line 1071
    goto/16 :goto_3

    .line 1072
    .line 1073
    :pswitch_33
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1074
    .line 1075
    .line 1076
    move-result v6

    .line 1077
    if-eqz v6, :cond_3

    .line 1078
    .line 1079
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1080
    .line 1081
    .line 1082
    move-result-wide v6

    .line 1083
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1084
    .line 1085
    .line 1086
    move-result-object v4

    .line 1087
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1088
    .line 1089
    .line 1090
    move-result-object v6

    .line 1091
    invoke-interface {p2, v5, v4, v6}, Landroidx/datastore/preferences/protobuf/Writer;->D(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 1092
    .line 1093
    .line 1094
    goto/16 :goto_3

    .line 1095
    .line 1096
    :pswitch_34
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1097
    .line 1098
    .line 1099
    move-result v6

    .line 1100
    if-eqz v6, :cond_3

    .line 1101
    .line 1102
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1103
    .line 1104
    .line 1105
    move-result-wide v6

    .line 1106
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1107
    .line 1108
    .line 1109
    move-result-wide v6

    .line 1110
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->l(IJ)V

    .line 1111
    .line 1112
    .line 1113
    goto/16 :goto_3

    .line 1114
    .line 1115
    :pswitch_35
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1116
    .line 1117
    .line 1118
    move-result v6

    .line 1119
    if-eqz v6, :cond_3

    .line 1120
    .line 1121
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1122
    .line 1123
    .line 1124
    move-result-wide v6

    .line 1125
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1126
    .line 1127
    .line 1128
    move-result v4

    .line 1129
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->O(II)V

    .line 1130
    .line 1131
    .line 1132
    goto/16 :goto_3

    .line 1133
    .line 1134
    :pswitch_36
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1135
    .line 1136
    .line 1137
    move-result v6

    .line 1138
    if-eqz v6, :cond_3

    .line 1139
    .line 1140
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1141
    .line 1142
    .line 1143
    move-result-wide v6

    .line 1144
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1145
    .line 1146
    .line 1147
    move-result-wide v6

    .line 1148
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->A(IJ)V

    .line 1149
    .line 1150
    .line 1151
    goto/16 :goto_3

    .line 1152
    .line 1153
    :pswitch_37
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1154
    .line 1155
    .line 1156
    move-result v6

    .line 1157
    if-eqz v6, :cond_3

    .line 1158
    .line 1159
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1160
    .line 1161
    .line 1162
    move-result-wide v6

    .line 1163
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1164
    .line 1165
    .line 1166
    move-result v4

    .line 1167
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->r(II)V

    .line 1168
    .line 1169
    .line 1170
    goto/16 :goto_3

    .line 1171
    .line 1172
    :pswitch_38
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1173
    .line 1174
    .line 1175
    move-result v6

    .line 1176
    if-eqz v6, :cond_3

    .line 1177
    .line 1178
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1179
    .line 1180
    .line 1181
    move-result-wide v6

    .line 1182
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1183
    .line 1184
    .line 1185
    move-result v4

    .line 1186
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->M(II)V

    .line 1187
    .line 1188
    .line 1189
    goto/16 :goto_3

    .line 1190
    .line 1191
    :pswitch_39
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1192
    .line 1193
    .line 1194
    move-result v6

    .line 1195
    if-eqz v6, :cond_3

    .line 1196
    .line 1197
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1198
    .line 1199
    .line 1200
    move-result-wide v6

    .line 1201
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1202
    .line 1203
    .line 1204
    move-result v4

    .line 1205
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->n(II)V

    .line 1206
    .line 1207
    .line 1208
    goto/16 :goto_3

    .line 1209
    .line 1210
    :pswitch_3a
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1211
    .line 1212
    .line 1213
    move-result v6

    .line 1214
    if-eqz v6, :cond_3

    .line 1215
    .line 1216
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1217
    .line 1218
    .line 1219
    move-result-wide v6

    .line 1220
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v4

    .line 1224
    check-cast v4, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1225
    .line 1226
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 1227
    .line 1228
    .line 1229
    goto/16 :goto_3

    .line 1230
    .line 1231
    :pswitch_3b
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1232
    .line 1233
    .line 1234
    move-result v6

    .line 1235
    if-eqz v6, :cond_3

    .line 1236
    .line 1237
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1238
    .line 1239
    .line 1240
    move-result-wide v6

    .line 1241
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1242
    .line 1243
    .line 1244
    move-result-object v4

    .line 1245
    invoke-virtual {p0, v3}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1246
    .line 1247
    .line 1248
    move-result-object v6

    .line 1249
    invoke-interface {p2, v5, v4, v6}, Landroidx/datastore/preferences/protobuf/Writer;->j(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)V

    .line 1250
    .line 1251
    .line 1252
    goto/16 :goto_3

    .line 1253
    .line 1254
    :pswitch_3c
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1255
    .line 1256
    .line 1257
    move-result v6

    .line 1258
    if-eqz v6, :cond_3

    .line 1259
    .line 1260
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1261
    .line 1262
    .line 1263
    move-result-wide v6

    .line 1264
    invoke-static {p1, v6, v7}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1265
    .line 1266
    .line 1267
    move-result-object v4

    .line 1268
    invoke-virtual {p0, v5, v4, p2}, Landroidx/datastore/preferences/protobuf/d0;->x0(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 1269
    .line 1270
    .line 1271
    goto/16 :goto_3

    .line 1272
    .line 1273
    :pswitch_3d
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1274
    .line 1275
    .line 1276
    move-result v6

    .line 1277
    if-eqz v6, :cond_3

    .line 1278
    .line 1279
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1280
    .line 1281
    .line 1282
    move-result-wide v6

    .line 1283
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->l(Ljava/lang/Object;J)Z

    .line 1284
    .line 1285
    .line 1286
    move-result v4

    .line 1287
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->q(IZ)V

    .line 1288
    .line 1289
    .line 1290
    goto/16 :goto_3

    .line 1291
    .line 1292
    :pswitch_3e
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1293
    .line 1294
    .line 1295
    move-result v6

    .line 1296
    if-eqz v6, :cond_3

    .line 1297
    .line 1298
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1299
    .line 1300
    .line 1301
    move-result-wide v6

    .line 1302
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1303
    .line 1304
    .line 1305
    move-result v4

    .line 1306
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->c(II)V

    .line 1307
    .line 1308
    .line 1309
    goto :goto_3

    .line 1310
    :pswitch_3f
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1311
    .line 1312
    .line 1313
    move-result v6

    .line 1314
    if-eqz v6, :cond_3

    .line 1315
    .line 1316
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1317
    .line 1318
    .line 1319
    move-result-wide v6

    .line 1320
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1321
    .line 1322
    .line 1323
    move-result-wide v6

    .line 1324
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->p(IJ)V

    .line 1325
    .line 1326
    .line 1327
    goto :goto_3

    .line 1328
    :pswitch_40
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1329
    .line 1330
    .line 1331
    move-result v6

    .line 1332
    if-eqz v6, :cond_3

    .line 1333
    .line 1334
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1335
    .line 1336
    .line 1337
    move-result-wide v6

    .line 1338
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->A(Ljava/lang/Object;J)I

    .line 1339
    .line 1340
    .line 1341
    move-result v4

    .line 1342
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->g(II)V

    .line 1343
    .line 1344
    .line 1345
    goto :goto_3

    .line 1346
    :pswitch_41
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1347
    .line 1348
    .line 1349
    move-result v6

    .line 1350
    if-eqz v6, :cond_3

    .line 1351
    .line 1352
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1353
    .line 1354
    .line 1355
    move-result-wide v6

    .line 1356
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1357
    .line 1358
    .line 1359
    move-result-wide v6

    .line 1360
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->e(IJ)V

    .line 1361
    .line 1362
    .line 1363
    goto :goto_3

    .line 1364
    :pswitch_42
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1365
    .line 1366
    .line 1367
    move-result v6

    .line 1368
    if-eqz v6, :cond_3

    .line 1369
    .line 1370
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1371
    .line 1372
    .line 1373
    move-result-wide v6

    .line 1374
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->L(Ljava/lang/Object;J)J

    .line 1375
    .line 1376
    .line 1377
    move-result-wide v6

    .line 1378
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->I(IJ)V

    .line 1379
    .line 1380
    .line 1381
    goto :goto_3

    .line 1382
    :pswitch_43
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1383
    .line 1384
    .line 1385
    move-result v6

    .line 1386
    if-eqz v6, :cond_3

    .line 1387
    .line 1388
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1389
    .line 1390
    .line 1391
    move-result-wide v6

    .line 1392
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->s(Ljava/lang/Object;J)F

    .line 1393
    .line 1394
    .line 1395
    move-result v4

    .line 1396
    invoke-interface {p2, v5, v4}, Landroidx/datastore/preferences/protobuf/Writer;->L(IF)V

    .line 1397
    .line 1398
    .line 1399
    goto :goto_3

    .line 1400
    :pswitch_44
    invoke-virtual {p0, p1, v3}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1401
    .line 1402
    .line 1403
    move-result v6

    .line 1404
    if-eqz v6, :cond_3

    .line 1405
    .line 1406
    invoke-static {v4}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 1407
    .line 1408
    .line 1409
    move-result-wide v6

    .line 1410
    invoke-static {p1, v6, v7}, Landroidx/datastore/preferences/protobuf/d0;->o(Ljava/lang/Object;J)D

    .line 1411
    .line 1412
    .line 1413
    move-result-wide v6

    .line 1414
    invoke-interface {p2, v5, v6, v7}, Landroidx/datastore/preferences/protobuf/Writer;->E(ID)V

    .line 1415
    .line 1416
    .line 1417
    :cond_3
    :goto_3
    add-int/lit8 v3, v3, -0x3

    .line 1418
    .line 1419
    goto/16 :goto_1

    .line 1420
    .line 1421
    :cond_4
    :goto_4
    if-eqz v2, :cond_6

    .line 1422
    .line 1423
    iget-object p1, p0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 1424
    .line 1425
    invoke-virtual {p1, p2, v2}, Landroidx/datastore/preferences/protobuf/m;->j(Landroidx/datastore/preferences/protobuf/Writer;Ljava/util/Map$Entry;)V

    .line 1426
    .line 1427
    .line 1428
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1429
    .line 1430
    .line 1431
    move-result p1

    .line 1432
    if-eqz p1, :cond_5

    .line 1433
    .line 1434
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1435
    .line 1436
    .line 1437
    move-result-object p1

    .line 1438
    check-cast p1, Ljava/util/Map$Entry;

    .line 1439
    .line 1440
    move-object v2, p1

    .line 1441
    goto :goto_4

    .line 1442
    :cond_5
    move-object v2, v1

    .line 1443
    goto :goto_4

    .line 1444
    :cond_6
    return-void

    .line 1445
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final w0(Landroidx/datastore/preferences/protobuf/Writer;ILjava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/datastore/preferences/protobuf/Writer;",
            "I",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 4
    .line 5
    invoke-virtual {p0, p4}, Landroidx/datastore/preferences/protobuf/d0;->u(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-interface {v0, p4}, Landroidx/datastore/preferences/protobuf/z;->b(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/y$a;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    iget-object p0, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 14
    .line 15
    invoke-interface {p0, p3}, Landroidx/datastore/preferences/protobuf/z;->g(Ljava/lang/Object;)Ljava/util/Map;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p1, p2, p4, p0}, Landroidx/datastore/preferences/protobuf/Writer;->m(ILandroidx/datastore/preferences/protobuf/y$a;Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final x(Ljava/lang/Object;)I
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget-object v2, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 6
    .line 7
    const/4 v4, -0x1

    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    const/4 v7, 0x0

    .line 11
    :goto_0
    iget-object v8, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 12
    .line 13
    array-length v8, v8

    .line 14
    if-ge v5, v8, :cond_15

    .line 15
    .line 16
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 17
    .line 18
    .line 19
    move-result v8

    .line 20
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 21
    .line 22
    .line 23
    move-result v9

    .line 24
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 25
    .line 26
    .line 27
    move-result v10

    .line 28
    const/16 v11, 0x11

    .line 29
    .line 30
    const v12, 0xfffff

    .line 31
    .line 32
    .line 33
    const/4 v13, 0x1

    .line 34
    if-gt v10, v11, :cond_1

    .line 35
    .line 36
    iget-object v11, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 37
    .line 38
    add-int/lit8 v14, v5, 0x2

    .line 39
    .line 40
    aget v11, v11, v14

    .line 41
    .line 42
    and-int/2addr v12, v11

    .line 43
    ushr-int/lit8 v14, v11, 0x14

    .line 44
    .line 45
    shl-int v14, v13, v14

    .line 46
    .line 47
    move/from16 v16, v14

    .line 48
    .line 49
    if-eq v12, v4, :cond_0

    .line 50
    .line 51
    int-to-long v13, v12

    .line 52
    invoke-virtual {v2, v1, v13, v14}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    move v4, v12

    .line 57
    :cond_0
    move/from16 v14, v16

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_1
    iget-boolean v11, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 61
    .line 62
    if-eqz v11, :cond_2

    .line 63
    .line 64
    sget-object v11, Landroidx/datastore/preferences/protobuf/FieldType;->DOUBLE_LIST_PACKED:Landroidx/datastore/preferences/protobuf/FieldType;

    .line 65
    .line 66
    invoke-virtual {v11}, Landroidx/datastore/preferences/protobuf/FieldType;->id()I

    .line 67
    .line 68
    .line 69
    move-result v11

    .line 70
    if-lt v10, v11, :cond_2

    .line 71
    .line 72
    sget-object v11, Landroidx/datastore/preferences/protobuf/FieldType;->SINT64_LIST_PACKED:Landroidx/datastore/preferences/protobuf/FieldType;

    .line 73
    .line 74
    invoke-virtual {v11}, Landroidx/datastore/preferences/protobuf/FieldType;->id()I

    .line 75
    .line 76
    .line 77
    move-result v11

    .line 78
    if-gt v10, v11, :cond_2

    .line 79
    .line 80
    iget-object v11, v0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 81
    .line 82
    add-int/lit8 v13, v5, 0x2

    .line 83
    .line 84
    aget v11, v11, v13

    .line 85
    .line 86
    and-int/2addr v11, v12

    .line 87
    :goto_1
    const/4 v14, 0x0

    .line 88
    goto :goto_2

    .line 89
    :cond_2
    const/4 v11, 0x0

    .line 90
    goto :goto_1

    .line 91
    :goto_2
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 92
    .line 93
    .line 94
    move-result-wide v12

    .line 95
    move/from16 v16, v4

    .line 96
    .line 97
    const/4 v8, 0x0

    .line 98
    const-wide/16 v3, 0x0

    .line 99
    .line 100
    packed-switch v10, :pswitch_data_0

    .line 101
    .line 102
    .line 103
    goto :goto_4

    .line 104
    :pswitch_0
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_3

    .line 109
    .line 110
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Landroidx/datastore/preferences/protobuf/b0;

    .line 115
    .line 116
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->t(ILandroidx/datastore/preferences/protobuf/b0;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    :goto_3
    add-int/2addr v6, v3

    .line 125
    :cond_3
    :goto_4
    const/4 v10, 0x0

    .line 126
    goto/16 :goto_8

    .line 127
    .line 128
    :pswitch_1
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-eqz v3, :cond_3

    .line 133
    .line 134
    invoke-static {v1, v12, v13}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 135
    .line 136
    .line 137
    move-result-wide v3

    .line 138
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->S(IJ)I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    goto :goto_3

    .line 143
    :pswitch_2
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-eqz v3, :cond_3

    .line 148
    .line 149
    invoke-static {v1, v12, v13}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Q(II)I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    goto :goto_3

    .line 158
    :pswitch_3
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 159
    .line 160
    .line 161
    move-result v8

    .line 162
    if-eqz v8, :cond_3

    .line 163
    .line 164
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->O(IJ)I

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    goto :goto_3

    .line 169
    :pswitch_4
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    if-eqz v3, :cond_3

    .line 174
    .line 175
    const/4 v8, 0x0

    .line 176
    invoke-static {v9, v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->M(II)I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    goto :goto_3

    .line 181
    :pswitch_5
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    if-eqz v3, :cond_3

    .line 186
    .line 187
    invoke-static {v1, v12, v13}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->l(II)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    goto :goto_3

    .line 196
    :pswitch_6
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 197
    .line 198
    .line 199
    move-result v3

    .line 200
    if-eqz v3, :cond_3

    .line 201
    .line 202
    invoke-static {v1, v12, v13}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->X(II)I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    goto :goto_3

    .line 211
    :pswitch_7
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-eqz v3, :cond_3

    .line 216
    .line 217
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    check-cast v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 222
    .line 223
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 224
    .line 225
    .line 226
    move-result v3

    .line 227
    goto :goto_3

    .line 228
    :pswitch_8
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    if-eqz v3, :cond_3

    .line 233
    .line 234
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/j0;->o(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    goto :goto_3

    .line 247
    :pswitch_9
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    if-eqz v3, :cond_3

    .line 252
    .line 253
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    instance-of v4, v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 258
    .line 259
    if-eqz v4, :cond_4

    .line 260
    .line 261
    check-cast v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 262
    .line 263
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 264
    .line 265
    .line 266
    move-result v3

    .line 267
    goto/16 :goto_3

    .line 268
    .line 269
    :cond_4
    check-cast v3, Ljava/lang/String;

    .line 270
    .line 271
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->U(ILjava/lang/String;)I

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    goto/16 :goto_3

    .line 276
    .line 277
    :pswitch_a
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 278
    .line 279
    .line 280
    move-result v3

    .line 281
    if-eqz v3, :cond_3

    .line 282
    .line 283
    const/4 v15, 0x1

    .line 284
    invoke-static {v9, v15}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->e(IZ)I

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    goto/16 :goto_3

    .line 289
    .line 290
    :pswitch_b
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    if-eqz v3, :cond_3

    .line 295
    .line 296
    const/4 v8, 0x0

    .line 297
    invoke-static {v9, v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->n(II)I

    .line 298
    .line 299
    .line 300
    move-result v3

    .line 301
    goto/16 :goto_3

    .line 302
    .line 303
    :pswitch_c
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 304
    .line 305
    .line 306
    move-result v8

    .line 307
    if-eqz v8, :cond_3

    .line 308
    .line 309
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->p(IJ)I

    .line 310
    .line 311
    .line 312
    move-result v3

    .line 313
    goto/16 :goto_3

    .line 314
    .line 315
    :pswitch_d
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 316
    .line 317
    .line 318
    move-result v3

    .line 319
    if-eqz v3, :cond_3

    .line 320
    .line 321
    invoke-static {v1, v12, v13}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 322
    .line 323
    .line 324
    move-result v3

    .line 325
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->w(II)I

    .line 326
    .line 327
    .line 328
    move-result v3

    .line 329
    goto/16 :goto_3

    .line 330
    .line 331
    :pswitch_e
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 332
    .line 333
    .line 334
    move-result v3

    .line 335
    if-eqz v3, :cond_3

    .line 336
    .line 337
    invoke-static {v1, v12, v13}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 338
    .line 339
    .line 340
    move-result-wide v3

    .line 341
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Z(IJ)I

    .line 342
    .line 343
    .line 344
    move-result v3

    .line 345
    goto/16 :goto_3

    .line 346
    .line 347
    :pswitch_f
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 348
    .line 349
    .line 350
    move-result v3

    .line 351
    if-eqz v3, :cond_3

    .line 352
    .line 353
    invoke-static {v1, v12, v13}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 354
    .line 355
    .line 356
    move-result-wide v3

    .line 357
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->y(IJ)I

    .line 358
    .line 359
    .line 360
    move-result v3

    .line 361
    goto/16 :goto_3

    .line 362
    .line 363
    :pswitch_10
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 364
    .line 365
    .line 366
    move-result v3

    .line 367
    if-eqz v3, :cond_3

    .line 368
    .line 369
    invoke-static {v9, v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->r(IF)I

    .line 370
    .line 371
    .line 372
    move-result v3

    .line 373
    goto/16 :goto_3

    .line 374
    .line 375
    :pswitch_11
    invoke-virtual {v0, v1, v9, v5}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    if-eqz v3, :cond_3

    .line 380
    .line 381
    const-wide/16 v3, 0x0

    .line 382
    .line 383
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->j(ID)I

    .line 384
    .line 385
    .line 386
    move-result v3

    .line 387
    goto/16 :goto_3

    .line 388
    .line 389
    :pswitch_12
    iget-object v3, v0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 390
    .line 391
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v4

    .line 395
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->u(I)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v8

    .line 399
    invoke-interface {v3, v9, v4, v8}, Landroidx/datastore/preferences/protobuf/z;->d(ILjava/lang/Object;Ljava/lang/Object;)I

    .line 400
    .line 401
    .line 402
    move-result v3

    .line 403
    goto/16 :goto_3

    .line 404
    .line 405
    :pswitch_13
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v3

    .line 409
    check-cast v3, Ljava/util/List;

    .line 410
    .line 411
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/j0;->j(ILjava/util/List;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 416
    .line 417
    .line 418
    move-result v3

    .line 419
    goto/16 :goto_3

    .line 420
    .line 421
    :pswitch_14
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v3

    .line 425
    check-cast v3, Ljava/util/List;

    .line 426
    .line 427
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->t(Ljava/util/List;)I

    .line 428
    .line 429
    .line 430
    move-result v3

    .line 431
    if-lez v3, :cond_3

    .line 432
    .line 433
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 434
    .line 435
    if-eqz v4, :cond_5

    .line 436
    .line 437
    int-to-long v10, v11

    .line 438
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 439
    .line 440
    .line 441
    :cond_5
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 442
    .line 443
    .line 444
    move-result v4

    .line 445
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 446
    .line 447
    .line 448
    move-result v8

    .line 449
    :goto_5
    add-int/2addr v4, v8

    .line 450
    add-int/2addr v4, v3

    .line 451
    add-int/2addr v6, v4

    .line 452
    goto/16 :goto_4

    .line 453
    .line 454
    :pswitch_15
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 455
    .line 456
    .line 457
    move-result-object v3

    .line 458
    check-cast v3, Ljava/util/List;

    .line 459
    .line 460
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->r(Ljava/util/List;)I

    .line 461
    .line 462
    .line 463
    move-result v3

    .line 464
    if-lez v3, :cond_3

    .line 465
    .line 466
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 467
    .line 468
    if-eqz v4, :cond_6

    .line 469
    .line 470
    int-to-long v10, v11

    .line 471
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 472
    .line 473
    .line 474
    :cond_6
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 475
    .line 476
    .line 477
    move-result v4

    .line 478
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 479
    .line 480
    .line 481
    move-result v8

    .line 482
    goto :goto_5

    .line 483
    :pswitch_16
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v3

    .line 487
    check-cast v3, Ljava/util/List;

    .line 488
    .line 489
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->i(Ljava/util/List;)I

    .line 490
    .line 491
    .line 492
    move-result v3

    .line 493
    if-lez v3, :cond_3

    .line 494
    .line 495
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 496
    .line 497
    if-eqz v4, :cond_7

    .line 498
    .line 499
    int-to-long v10, v11

    .line 500
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 501
    .line 502
    .line 503
    :cond_7
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 504
    .line 505
    .line 506
    move-result v4

    .line 507
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 508
    .line 509
    .line 510
    move-result v8

    .line 511
    goto :goto_5

    .line 512
    :pswitch_17
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    move-result-object v3

    .line 516
    check-cast v3, Ljava/util/List;

    .line 517
    .line 518
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->g(Ljava/util/List;)I

    .line 519
    .line 520
    .line 521
    move-result v3

    .line 522
    if-lez v3, :cond_3

    .line 523
    .line 524
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 525
    .line 526
    if-eqz v4, :cond_8

    .line 527
    .line 528
    int-to-long v10, v11

    .line 529
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 530
    .line 531
    .line 532
    :cond_8
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 533
    .line 534
    .line 535
    move-result v4

    .line 536
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 537
    .line 538
    .line 539
    move-result v8

    .line 540
    goto :goto_5

    .line 541
    :pswitch_18
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 542
    .line 543
    .line 544
    move-result-object v3

    .line 545
    check-cast v3, Ljava/util/List;

    .line 546
    .line 547
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->e(Ljava/util/List;)I

    .line 548
    .line 549
    .line 550
    move-result v3

    .line 551
    if-lez v3, :cond_3

    .line 552
    .line 553
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 554
    .line 555
    if-eqz v4, :cond_9

    .line 556
    .line 557
    int-to-long v10, v11

    .line 558
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 559
    .line 560
    .line 561
    :cond_9
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 562
    .line 563
    .line 564
    move-result v4

    .line 565
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 566
    .line 567
    .line 568
    move-result v8

    .line 569
    goto :goto_5

    .line 570
    :pswitch_19
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object v3

    .line 574
    check-cast v3, Ljava/util/List;

    .line 575
    .line 576
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->w(Ljava/util/List;)I

    .line 577
    .line 578
    .line 579
    move-result v3

    .line 580
    if-lez v3, :cond_3

    .line 581
    .line 582
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 583
    .line 584
    if-eqz v4, :cond_a

    .line 585
    .line 586
    int-to-long v10, v11

    .line 587
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 588
    .line 589
    .line 590
    :cond_a
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 591
    .line 592
    .line 593
    move-result v4

    .line 594
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 595
    .line 596
    .line 597
    move-result v8

    .line 598
    goto/16 :goto_5

    .line 599
    .line 600
    :pswitch_1a
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v3

    .line 604
    check-cast v3, Ljava/util/List;

    .line 605
    .line 606
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->b(Ljava/util/List;)I

    .line 607
    .line 608
    .line 609
    move-result v3

    .line 610
    if-lez v3, :cond_3

    .line 611
    .line 612
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 613
    .line 614
    if-eqz v4, :cond_b

    .line 615
    .line 616
    int-to-long v10, v11

    .line 617
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 618
    .line 619
    .line 620
    :cond_b
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 621
    .line 622
    .line 623
    move-result v4

    .line 624
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 625
    .line 626
    .line 627
    move-result v8

    .line 628
    goto/16 :goto_5

    .line 629
    .line 630
    :pswitch_1b
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 631
    .line 632
    .line 633
    move-result-object v3

    .line 634
    check-cast v3, Ljava/util/List;

    .line 635
    .line 636
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->g(Ljava/util/List;)I

    .line 637
    .line 638
    .line 639
    move-result v3

    .line 640
    if-lez v3, :cond_3

    .line 641
    .line 642
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 643
    .line 644
    if-eqz v4, :cond_c

    .line 645
    .line 646
    int-to-long v10, v11

    .line 647
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 648
    .line 649
    .line 650
    :cond_c
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 651
    .line 652
    .line 653
    move-result v4

    .line 654
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 655
    .line 656
    .line 657
    move-result v8

    .line 658
    goto/16 :goto_5

    .line 659
    .line 660
    :pswitch_1c
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 661
    .line 662
    .line 663
    move-result-object v3

    .line 664
    check-cast v3, Ljava/util/List;

    .line 665
    .line 666
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->i(Ljava/util/List;)I

    .line 667
    .line 668
    .line 669
    move-result v3

    .line 670
    if-lez v3, :cond_3

    .line 671
    .line 672
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 673
    .line 674
    if-eqz v4, :cond_d

    .line 675
    .line 676
    int-to-long v10, v11

    .line 677
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 678
    .line 679
    .line 680
    :cond_d
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 681
    .line 682
    .line 683
    move-result v4

    .line 684
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 685
    .line 686
    .line 687
    move-result v8

    .line 688
    goto/16 :goto_5

    .line 689
    .line 690
    :pswitch_1d
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 691
    .line 692
    .line 693
    move-result-object v3

    .line 694
    check-cast v3, Ljava/util/List;

    .line 695
    .line 696
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->l(Ljava/util/List;)I

    .line 697
    .line 698
    .line 699
    move-result v3

    .line 700
    if-lez v3, :cond_3

    .line 701
    .line 702
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 703
    .line 704
    if-eqz v4, :cond_e

    .line 705
    .line 706
    int-to-long v10, v11

    .line 707
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 708
    .line 709
    .line 710
    :cond_e
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 711
    .line 712
    .line 713
    move-result v4

    .line 714
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 715
    .line 716
    .line 717
    move-result v8

    .line 718
    goto/16 :goto_5

    .line 719
    .line 720
    :pswitch_1e
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 721
    .line 722
    .line 723
    move-result-object v3

    .line 724
    check-cast v3, Ljava/util/List;

    .line 725
    .line 726
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->y(Ljava/util/List;)I

    .line 727
    .line 728
    .line 729
    move-result v3

    .line 730
    if-lez v3, :cond_3

    .line 731
    .line 732
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 733
    .line 734
    if-eqz v4, :cond_f

    .line 735
    .line 736
    int-to-long v10, v11

    .line 737
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 738
    .line 739
    .line 740
    :cond_f
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 741
    .line 742
    .line 743
    move-result v4

    .line 744
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 745
    .line 746
    .line 747
    move-result v8

    .line 748
    goto/16 :goto_5

    .line 749
    .line 750
    :pswitch_1f
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 751
    .line 752
    .line 753
    move-result-object v3

    .line 754
    check-cast v3, Ljava/util/List;

    .line 755
    .line 756
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->n(Ljava/util/List;)I

    .line 757
    .line 758
    .line 759
    move-result v3

    .line 760
    if-lez v3, :cond_3

    .line 761
    .line 762
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 763
    .line 764
    if-eqz v4, :cond_10

    .line 765
    .line 766
    int-to-long v10, v11

    .line 767
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 768
    .line 769
    .line 770
    :cond_10
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 771
    .line 772
    .line 773
    move-result v4

    .line 774
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 775
    .line 776
    .line 777
    move-result v8

    .line 778
    goto/16 :goto_5

    .line 779
    .line 780
    :pswitch_20
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 781
    .line 782
    .line 783
    move-result-object v3

    .line 784
    check-cast v3, Ljava/util/List;

    .line 785
    .line 786
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->g(Ljava/util/List;)I

    .line 787
    .line 788
    .line 789
    move-result v3

    .line 790
    if-lez v3, :cond_3

    .line 791
    .line 792
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 793
    .line 794
    if-eqz v4, :cond_11

    .line 795
    .line 796
    int-to-long v10, v11

    .line 797
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 798
    .line 799
    .line 800
    :cond_11
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 801
    .line 802
    .line 803
    move-result v4

    .line 804
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 805
    .line 806
    .line 807
    move-result v8

    .line 808
    goto/16 :goto_5

    .line 809
    .line 810
    :pswitch_21
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 811
    .line 812
    .line 813
    move-result-object v3

    .line 814
    check-cast v3, Ljava/util/List;

    .line 815
    .line 816
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/j0;->i(Ljava/util/List;)I

    .line 817
    .line 818
    .line 819
    move-result v3

    .line 820
    if-lez v3, :cond_3

    .line 821
    .line 822
    iget-boolean v4, v0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 823
    .line 824
    if-eqz v4, :cond_12

    .line 825
    .line 826
    int-to-long v10, v11

    .line 827
    invoke-virtual {v2, v1, v10, v11, v3}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 828
    .line 829
    .line 830
    :cond_12
    invoke-static {v9}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 831
    .line 832
    .line 833
    move-result v4

    .line 834
    invoke-static {v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 835
    .line 836
    .line 837
    move-result v8

    .line 838
    goto/16 :goto_5

    .line 839
    .line 840
    :pswitch_22
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 841
    .line 842
    .line 843
    move-result-object v3

    .line 844
    check-cast v3, Ljava/util/List;

    .line 845
    .line 846
    const/4 v8, 0x0

    .line 847
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->s(ILjava/util/List;Z)I

    .line 848
    .line 849
    .line 850
    move-result v3

    .line 851
    :goto_6
    add-int/2addr v6, v3

    .line 852
    move v10, v8

    .line 853
    goto/16 :goto_8

    .line 854
    .line 855
    :pswitch_23
    const/4 v8, 0x0

    .line 856
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 857
    .line 858
    .line 859
    move-result-object v3

    .line 860
    check-cast v3, Ljava/util/List;

    .line 861
    .line 862
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->q(ILjava/util/List;Z)I

    .line 863
    .line 864
    .line 865
    move-result v3

    .line 866
    goto :goto_6

    .line 867
    :pswitch_24
    const/4 v8, 0x0

    .line 868
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 869
    .line 870
    .line 871
    move-result-object v3

    .line 872
    check-cast v3, Ljava/util/List;

    .line 873
    .line 874
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->h(ILjava/util/List;Z)I

    .line 875
    .line 876
    .line 877
    move-result v3

    .line 878
    goto :goto_6

    .line 879
    :pswitch_25
    const/4 v8, 0x0

    .line 880
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 881
    .line 882
    .line 883
    move-result-object v3

    .line 884
    check-cast v3, Ljava/util/List;

    .line 885
    .line 886
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->f(ILjava/util/List;Z)I

    .line 887
    .line 888
    .line 889
    move-result v3

    .line 890
    goto :goto_6

    .line 891
    :pswitch_26
    const/4 v8, 0x0

    .line 892
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 893
    .line 894
    .line 895
    move-result-object v3

    .line 896
    check-cast v3, Ljava/util/List;

    .line 897
    .line 898
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->d(ILjava/util/List;Z)I

    .line 899
    .line 900
    .line 901
    move-result v3

    .line 902
    goto :goto_6

    .line 903
    :pswitch_27
    const/4 v8, 0x0

    .line 904
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 905
    .line 906
    .line 907
    move-result-object v3

    .line 908
    check-cast v3, Ljava/util/List;

    .line 909
    .line 910
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->v(ILjava/util/List;Z)I

    .line 911
    .line 912
    .line 913
    move-result v3

    .line 914
    goto/16 :goto_3

    .line 915
    .line 916
    :pswitch_28
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 917
    .line 918
    .line 919
    move-result-object v3

    .line 920
    check-cast v3, Ljava/util/List;

    .line 921
    .line 922
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/j0;->c(ILjava/util/List;)I

    .line 923
    .line 924
    .line 925
    move-result v3

    .line 926
    goto/16 :goto_3

    .line 927
    .line 928
    :pswitch_29
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 929
    .line 930
    .line 931
    move-result-object v3

    .line 932
    check-cast v3, Ljava/util/List;

    .line 933
    .line 934
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 935
    .line 936
    .line 937
    move-result-object v4

    .line 938
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/j0;->p(ILjava/util/List;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 939
    .line 940
    .line 941
    move-result v3

    .line 942
    goto/16 :goto_3

    .line 943
    .line 944
    :pswitch_2a
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 945
    .line 946
    .line 947
    move-result-object v3

    .line 948
    check-cast v3, Ljava/util/List;

    .line 949
    .line 950
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/j0;->u(ILjava/util/List;)I

    .line 951
    .line 952
    .line 953
    move-result v3

    .line 954
    goto/16 :goto_3

    .line 955
    .line 956
    :pswitch_2b
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 957
    .line 958
    .line 959
    move-result-object v3

    .line 960
    check-cast v3, Ljava/util/List;

    .line 961
    .line 962
    const/4 v8, 0x0

    .line 963
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->a(ILjava/util/List;Z)I

    .line 964
    .line 965
    .line 966
    move-result v3

    .line 967
    goto :goto_6

    .line 968
    :pswitch_2c
    const/4 v8, 0x0

    .line 969
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 970
    .line 971
    .line 972
    move-result-object v3

    .line 973
    check-cast v3, Ljava/util/List;

    .line 974
    .line 975
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->f(ILjava/util/List;Z)I

    .line 976
    .line 977
    .line 978
    move-result v3

    .line 979
    goto/16 :goto_6

    .line 980
    .line 981
    :pswitch_2d
    const/4 v8, 0x0

    .line 982
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 983
    .line 984
    .line 985
    move-result-object v3

    .line 986
    check-cast v3, Ljava/util/List;

    .line 987
    .line 988
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->h(ILjava/util/List;Z)I

    .line 989
    .line 990
    .line 991
    move-result v3

    .line 992
    goto/16 :goto_6

    .line 993
    .line 994
    :pswitch_2e
    const/4 v8, 0x0

    .line 995
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 996
    .line 997
    .line 998
    move-result-object v3

    .line 999
    check-cast v3, Ljava/util/List;

    .line 1000
    .line 1001
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->k(ILjava/util/List;Z)I

    .line 1002
    .line 1003
    .line 1004
    move-result v3

    .line 1005
    goto/16 :goto_6

    .line 1006
    .line 1007
    :pswitch_2f
    const/4 v8, 0x0

    .line 1008
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1009
    .line 1010
    .line 1011
    move-result-object v3

    .line 1012
    check-cast v3, Ljava/util/List;

    .line 1013
    .line 1014
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->x(ILjava/util/List;Z)I

    .line 1015
    .line 1016
    .line 1017
    move-result v3

    .line 1018
    goto/16 :goto_6

    .line 1019
    .line 1020
    :pswitch_30
    const/4 v8, 0x0

    .line 1021
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1022
    .line 1023
    .line 1024
    move-result-object v3

    .line 1025
    check-cast v3, Ljava/util/List;

    .line 1026
    .line 1027
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->m(ILjava/util/List;Z)I

    .line 1028
    .line 1029
    .line 1030
    move-result v3

    .line 1031
    goto/16 :goto_6

    .line 1032
    .line 1033
    :pswitch_31
    const/4 v8, 0x0

    .line 1034
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1035
    .line 1036
    .line 1037
    move-result-object v3

    .line 1038
    check-cast v3, Ljava/util/List;

    .line 1039
    .line 1040
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->f(ILjava/util/List;Z)I

    .line 1041
    .line 1042
    .line 1043
    move-result v3

    .line 1044
    goto/16 :goto_6

    .line 1045
    .line 1046
    :pswitch_32
    const/4 v8, 0x0

    .line 1047
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1048
    .line 1049
    .line 1050
    move-result-object v3

    .line 1051
    check-cast v3, Ljava/util/List;

    .line 1052
    .line 1053
    invoke-static {v9, v3, v8}, Landroidx/datastore/preferences/protobuf/j0;->h(ILjava/util/List;Z)I

    .line 1054
    .line 1055
    .line 1056
    move-result v3

    .line 1057
    goto/16 :goto_3

    .line 1058
    .line 1059
    :pswitch_33
    and-int v3, v7, v14

    .line 1060
    .line 1061
    if-eqz v3, :cond_3

    .line 1062
    .line 1063
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1064
    .line 1065
    .line 1066
    move-result-object v3

    .line 1067
    check-cast v3, Landroidx/datastore/preferences/protobuf/b0;

    .line 1068
    .line 1069
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1070
    .line 1071
    .line 1072
    move-result-object v4

    .line 1073
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->t(ILandroidx/datastore/preferences/protobuf/b0;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 1074
    .line 1075
    .line 1076
    move-result v3

    .line 1077
    goto/16 :goto_3

    .line 1078
    .line 1079
    :pswitch_34
    and-int v3, v7, v14

    .line 1080
    .line 1081
    if-eqz v3, :cond_3

    .line 1082
    .line 1083
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1084
    .line 1085
    .line 1086
    move-result-wide v3

    .line 1087
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->S(IJ)I

    .line 1088
    .line 1089
    .line 1090
    move-result v3

    .line 1091
    goto/16 :goto_3

    .line 1092
    .line 1093
    :pswitch_35
    and-int v3, v7, v14

    .line 1094
    .line 1095
    if-eqz v3, :cond_3

    .line 1096
    .line 1097
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1098
    .line 1099
    .line 1100
    move-result v3

    .line 1101
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Q(II)I

    .line 1102
    .line 1103
    .line 1104
    move-result v3

    .line 1105
    goto/16 :goto_3

    .line 1106
    .line 1107
    :pswitch_36
    and-int v10, v7, v14

    .line 1108
    .line 1109
    if-eqz v10, :cond_3

    .line 1110
    .line 1111
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->O(IJ)I

    .line 1112
    .line 1113
    .line 1114
    move-result v3

    .line 1115
    goto/16 :goto_3

    .line 1116
    .line 1117
    :pswitch_37
    and-int v3, v7, v14

    .line 1118
    .line 1119
    if-eqz v3, :cond_3

    .line 1120
    .line 1121
    const/4 v8, 0x0

    .line 1122
    invoke-static {v9, v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->M(II)I

    .line 1123
    .line 1124
    .line 1125
    move-result v3

    .line 1126
    goto/16 :goto_3

    .line 1127
    .line 1128
    :pswitch_38
    and-int v3, v7, v14

    .line 1129
    .line 1130
    if-eqz v3, :cond_3

    .line 1131
    .line 1132
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1133
    .line 1134
    .line 1135
    move-result v3

    .line 1136
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->l(II)I

    .line 1137
    .line 1138
    .line 1139
    move-result v3

    .line 1140
    goto/16 :goto_3

    .line 1141
    .line 1142
    :pswitch_39
    and-int v3, v7, v14

    .line 1143
    .line 1144
    if-eqz v3, :cond_3

    .line 1145
    .line 1146
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1147
    .line 1148
    .line 1149
    move-result v3

    .line 1150
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->X(II)I

    .line 1151
    .line 1152
    .line 1153
    move-result v3

    .line 1154
    goto/16 :goto_3

    .line 1155
    .line 1156
    :pswitch_3a
    and-int v3, v7, v14

    .line 1157
    .line 1158
    if-eqz v3, :cond_3

    .line 1159
    .line 1160
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1161
    .line 1162
    .line 1163
    move-result-object v3

    .line 1164
    check-cast v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1165
    .line 1166
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 1167
    .line 1168
    .line 1169
    move-result v3

    .line 1170
    goto/16 :goto_3

    .line 1171
    .line 1172
    :pswitch_3b
    and-int v3, v7, v14

    .line 1173
    .line 1174
    if-eqz v3, :cond_3

    .line 1175
    .line 1176
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1177
    .line 1178
    .line 1179
    move-result-object v3

    .line 1180
    invoke-virtual {v0, v5}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1181
    .line 1182
    .line 1183
    move-result-object v4

    .line 1184
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/j0;->o(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 1185
    .line 1186
    .line 1187
    move-result v3

    .line 1188
    goto/16 :goto_3

    .line 1189
    .line 1190
    :pswitch_3c
    and-int v3, v7, v14

    .line 1191
    .line 1192
    if-eqz v3, :cond_3

    .line 1193
    .line 1194
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1195
    .line 1196
    .line 1197
    move-result-object v3

    .line 1198
    instance-of v4, v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1199
    .line 1200
    if-eqz v4, :cond_13

    .line 1201
    .line 1202
    check-cast v3, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1203
    .line 1204
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 1205
    .line 1206
    .line 1207
    move-result v3

    .line 1208
    goto/16 :goto_3

    .line 1209
    .line 1210
    :cond_13
    check-cast v3, Ljava/lang/String;

    .line 1211
    .line 1212
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->U(ILjava/lang/String;)I

    .line 1213
    .line 1214
    .line 1215
    move-result v3

    .line 1216
    goto/16 :goto_3

    .line 1217
    .line 1218
    :pswitch_3d
    and-int v3, v7, v14

    .line 1219
    .line 1220
    if-eqz v3, :cond_3

    .line 1221
    .line 1222
    const/4 v15, 0x1

    .line 1223
    invoke-static {v9, v15}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->e(IZ)I

    .line 1224
    .line 1225
    .line 1226
    move-result v3

    .line 1227
    goto/16 :goto_3

    .line 1228
    .line 1229
    :pswitch_3e
    and-int v3, v7, v14

    .line 1230
    .line 1231
    if-eqz v3, :cond_3

    .line 1232
    .line 1233
    const/4 v10, 0x0

    .line 1234
    invoke-static {v9, v10}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->n(II)I

    .line 1235
    .line 1236
    .line 1237
    move-result v3

    .line 1238
    :goto_7
    add-int/2addr v6, v3

    .line 1239
    goto :goto_8

    .line 1240
    :pswitch_3f
    const/4 v10, 0x0

    .line 1241
    and-int v8, v7, v14

    .line 1242
    .line 1243
    if-eqz v8, :cond_14

    .line 1244
    .line 1245
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->p(IJ)I

    .line 1246
    .line 1247
    .line 1248
    move-result v3

    .line 1249
    goto :goto_7

    .line 1250
    :pswitch_40
    const/4 v10, 0x0

    .line 1251
    and-int v3, v7, v14

    .line 1252
    .line 1253
    if-eqz v3, :cond_14

    .line 1254
    .line 1255
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 1256
    .line 1257
    .line 1258
    move-result v3

    .line 1259
    invoke-static {v9, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->w(II)I

    .line 1260
    .line 1261
    .line 1262
    move-result v3

    .line 1263
    goto :goto_7

    .line 1264
    :pswitch_41
    const/4 v10, 0x0

    .line 1265
    and-int v3, v7, v14

    .line 1266
    .line 1267
    if-eqz v3, :cond_14

    .line 1268
    .line 1269
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1270
    .line 1271
    .line 1272
    move-result-wide v3

    .line 1273
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Z(IJ)I

    .line 1274
    .line 1275
    .line 1276
    move-result v3

    .line 1277
    goto :goto_7

    .line 1278
    :pswitch_42
    const/4 v10, 0x0

    .line 1279
    and-int v3, v7, v14

    .line 1280
    .line 1281
    if-eqz v3, :cond_14

    .line 1282
    .line 1283
    invoke-virtual {v2, v1, v12, v13}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 1284
    .line 1285
    .line 1286
    move-result-wide v3

    .line 1287
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->y(IJ)I

    .line 1288
    .line 1289
    .line 1290
    move-result v3

    .line 1291
    goto :goto_7

    .line 1292
    :pswitch_43
    const/4 v10, 0x0

    .line 1293
    and-int v3, v7, v14

    .line 1294
    .line 1295
    if-eqz v3, :cond_14

    .line 1296
    .line 1297
    invoke-static {v9, v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->r(IF)I

    .line 1298
    .line 1299
    .line 1300
    move-result v3

    .line 1301
    goto :goto_7

    .line 1302
    :pswitch_44
    const/4 v10, 0x0

    .line 1303
    and-int v3, v7, v14

    .line 1304
    .line 1305
    if-eqz v3, :cond_14

    .line 1306
    .line 1307
    const-wide/16 v3, 0x0

    .line 1308
    .line 1309
    invoke-static {v9, v3, v4}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->j(ID)I

    .line 1310
    .line 1311
    .line 1312
    move-result v3

    .line 1313
    goto :goto_7

    .line 1314
    :cond_14
    :goto_8
    add-int/lit8 v5, v5, 0x3

    .line 1315
    .line 1316
    move/from16 v4, v16

    .line 1317
    .line 1318
    goto/16 :goto_0

    .line 1319
    .line 1320
    :cond_15
    iget-object v2, v0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 1321
    .line 1322
    invoke-virtual {v0, v2, v1}, Landroidx/datastore/preferences/protobuf/d0;->z(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;)I

    .line 1323
    .line 1324
    .line 1325
    move-result v2

    .line 1326
    add-int/2addr v6, v2

    .line 1327
    iget-boolean v2, v0, Landroidx/datastore/preferences/protobuf/d0;->f:Z

    .line 1328
    .line 1329
    if-eqz v2, :cond_16

    .line 1330
    .line 1331
    iget-object v0, v0, Landroidx/datastore/preferences/protobuf/d0;->p:Landroidx/datastore/preferences/protobuf/m;

    .line 1332
    .line 1333
    invoke-virtual {v0, v1}, Landroidx/datastore/preferences/protobuf/m;->c(Ljava/lang/Object;)Landroidx/datastore/preferences/protobuf/p;

    .line 1334
    .line 1335
    .line 1336
    move-result-object v0

    .line 1337
    invoke-virtual {v0}, Landroidx/datastore/preferences/protobuf/p;->l()I

    .line 1338
    .line 1339
    .line 1340
    move-result v0

    .line 1341
    add-int/2addr v6, v0

    .line 1342
    :cond_16
    return v6

    .line 1343
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final x0(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of p0, p2, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p2, Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p3, p1, p2}, Landroidx/datastore/preferences/protobuf/Writer;->d(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p2, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 12
    .line 13
    invoke-interface {p3, p1, p2}, Landroidx/datastore/preferences/protobuf/Writer;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final y(Ljava/lang/Object;)I
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    sget-object v2, Landroidx/datastore/preferences/protobuf/d0;->s:Lsun/misc/Unsafe;

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    move v4, v3

    .line 7
    move v5, v4

    .line 8
    :goto_0
    iget-object v6, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 9
    .line 10
    array-length v6, v6

    .line 11
    if-ge v4, v6, :cond_12

    .line 12
    .line 13
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->s0(I)I

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->r0(I)I

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->U(I)I

    .line 22
    .line 23
    .line 24
    move-result v8

    .line 25
    invoke-static {v6}, Landroidx/datastore/preferences/protobuf/d0;->V(I)J

    .line 26
    .line 27
    .line 28
    move-result-wide v9

    .line 29
    sget-object v6, Landroidx/datastore/preferences/protobuf/FieldType;->DOUBLE_LIST_PACKED:Landroidx/datastore/preferences/protobuf/FieldType;

    .line 30
    .line 31
    invoke-virtual {v6}, Landroidx/datastore/preferences/protobuf/FieldType;->id()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    if-lt v7, v6, :cond_0

    .line 36
    .line 37
    sget-object v6, Landroidx/datastore/preferences/protobuf/FieldType;->SINT64_LIST_PACKED:Landroidx/datastore/preferences/protobuf/FieldType;

    .line 38
    .line 39
    invoke-virtual {v6}, Landroidx/datastore/preferences/protobuf/FieldType;->id()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-gt v7, v6, :cond_0

    .line 44
    .line 45
    iget-object v6, p0, Landroidx/datastore/preferences/protobuf/d0;->a:[I

    .line 46
    .line 47
    add-int/lit8 v11, v4, 0x2

    .line 48
    .line 49
    aget v6, v6, v11

    .line 50
    .line 51
    const v11, 0xfffff

    .line 52
    .line 53
    .line 54
    and-int/2addr v6, v11

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    move v6, v3

    .line 57
    :goto_1
    const/4 v13, 0x0

    .line 58
    const/4 v14, 0x1

    .line 59
    const-wide/16 v11, 0x0

    .line 60
    .line 61
    packed-switch v7, :pswitch_data_0

    .line 62
    .line 63
    .line 64
    goto/16 :goto_4

    .line 65
    .line 66
    :pswitch_0
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    if-eqz v6, :cond_11

    .line 71
    .line 72
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    check-cast v6, Landroidx/datastore/preferences/protobuf/b0;

    .line 77
    .line 78
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->t(ILandroidx/datastore/preferences/protobuf/b0;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    :goto_2
    add-int/2addr v5, v6

    .line 87
    goto/16 :goto_4

    .line 88
    .line 89
    :pswitch_1
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    if-eqz v6, :cond_11

    .line 94
    .line 95
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 96
    .line 97
    .line 98
    move-result-wide v6

    .line 99
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->S(IJ)I

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    goto :goto_2

    .line 104
    :pswitch_2
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    if-eqz v6, :cond_11

    .line 109
    .line 110
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 111
    .line 112
    .line 113
    move-result v6

    .line 114
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Q(II)I

    .line 115
    .line 116
    .line 117
    move-result v6

    .line 118
    goto :goto_2

    .line 119
    :pswitch_3
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    if-eqz v6, :cond_11

    .line 124
    .line 125
    invoke-static {v8, v11, v12}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->O(IJ)I

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    goto :goto_2

    .line 130
    :pswitch_4
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    if-eqz v6, :cond_11

    .line 135
    .line 136
    invoke-static {v8, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->M(II)I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    goto :goto_2

    .line 141
    :pswitch_5
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    if-eqz v6, :cond_11

    .line 146
    .line 147
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->l(II)I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    goto :goto_2

    .line 156
    :pswitch_6
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    if-eqz v6, :cond_11

    .line 161
    .line 162
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->X(II)I

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    goto :goto_2

    .line 171
    :pswitch_7
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    if-eqz v6, :cond_11

    .line 176
    .line 177
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    check-cast v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 182
    .line 183
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 184
    .line 185
    .line 186
    move-result v6

    .line 187
    goto :goto_2

    .line 188
    :pswitch_8
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 189
    .line 190
    .line 191
    move-result v6

    .line 192
    if-eqz v6, :cond_11

    .line 193
    .line 194
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 199
    .line 200
    .line 201
    move-result-object v7

    .line 202
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/j0;->o(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 203
    .line 204
    .line 205
    move-result v6

    .line 206
    goto :goto_2

    .line 207
    :pswitch_9
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 208
    .line 209
    .line 210
    move-result v6

    .line 211
    if-eqz v6, :cond_11

    .line 212
    .line 213
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    instance-of v7, v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 218
    .line 219
    if-eqz v7, :cond_1

    .line 220
    .line 221
    check-cast v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 222
    .line 223
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 224
    .line 225
    .line 226
    move-result v6

    .line 227
    goto/16 :goto_2

    .line 228
    .line 229
    :cond_1
    check-cast v6, Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->U(ILjava/lang/String;)I

    .line 232
    .line 233
    .line 234
    move-result v6

    .line 235
    goto/16 :goto_2

    .line 236
    .line 237
    :pswitch_a
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    if-eqz v6, :cond_11

    .line 242
    .line 243
    invoke-static {v8, v14}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->e(IZ)I

    .line 244
    .line 245
    .line 246
    move-result v6

    .line 247
    goto/16 :goto_2

    .line 248
    .line 249
    :pswitch_b
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 250
    .line 251
    .line 252
    move-result v6

    .line 253
    if-eqz v6, :cond_11

    .line 254
    .line 255
    invoke-static {v8, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->n(II)I

    .line 256
    .line 257
    .line 258
    move-result v6

    .line 259
    goto/16 :goto_2

    .line 260
    .line 261
    :pswitch_c
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 262
    .line 263
    .line 264
    move-result v6

    .line 265
    if-eqz v6, :cond_11

    .line 266
    .line 267
    invoke-static {v8, v11, v12}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->p(IJ)I

    .line 268
    .line 269
    .line 270
    move-result v6

    .line 271
    goto/16 :goto_2

    .line 272
    .line 273
    :pswitch_d
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 274
    .line 275
    .line 276
    move-result v6

    .line 277
    if-eqz v6, :cond_11

    .line 278
    .line 279
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->Z(Ljava/lang/Object;J)I

    .line 280
    .line 281
    .line 282
    move-result v6

    .line 283
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->w(II)I

    .line 284
    .line 285
    .line 286
    move-result v6

    .line 287
    goto/16 :goto_2

    .line 288
    .line 289
    :pswitch_e
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 290
    .line 291
    .line 292
    move-result v6

    .line 293
    if-eqz v6, :cond_11

    .line 294
    .line 295
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 296
    .line 297
    .line 298
    move-result-wide v6

    .line 299
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Z(IJ)I

    .line 300
    .line 301
    .line 302
    move-result v6

    .line 303
    goto/16 :goto_2

    .line 304
    .line 305
    :pswitch_f
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 306
    .line 307
    .line 308
    move-result v6

    .line 309
    if-eqz v6, :cond_11

    .line 310
    .line 311
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->a0(Ljava/lang/Object;J)J

    .line 312
    .line 313
    .line 314
    move-result-wide v6

    .line 315
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->y(IJ)I

    .line 316
    .line 317
    .line 318
    move-result v6

    .line 319
    goto/16 :goto_2

    .line 320
    .line 321
    :pswitch_10
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 322
    .line 323
    .line 324
    move-result v6

    .line 325
    if-eqz v6, :cond_11

    .line 326
    .line 327
    invoke-static {v8, v13}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->r(IF)I

    .line 328
    .line 329
    .line 330
    move-result v6

    .line 331
    goto/16 :goto_2

    .line 332
    .line 333
    :pswitch_11
    invoke-virtual {p0, v1, v8, v4}, Landroidx/datastore/preferences/protobuf/d0;->I(Ljava/lang/Object;II)Z

    .line 334
    .line 335
    .line 336
    move-result v6

    .line 337
    if-eqz v6, :cond_11

    .line 338
    .line 339
    const-wide/16 v6, 0x0

    .line 340
    .line 341
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->j(ID)I

    .line 342
    .line 343
    .line 344
    move-result v6

    .line 345
    goto/16 :goto_2

    .line 346
    .line 347
    :pswitch_12
    iget-object v6, p0, Landroidx/datastore/preferences/protobuf/d0;->q:Landroidx/datastore/preferences/protobuf/z;

    .line 348
    .line 349
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v7

    .line 353
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->u(I)Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    move-result-object v9

    .line 357
    invoke-interface {v6, v8, v7, v9}, Landroidx/datastore/preferences/protobuf/z;->d(ILjava/lang/Object;Ljava/lang/Object;)I

    .line 358
    .line 359
    .line 360
    move-result v6

    .line 361
    goto/16 :goto_2

    .line 362
    .line 363
    :pswitch_13
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 364
    .line 365
    .line 366
    move-result-object v6

    .line 367
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 368
    .line 369
    .line 370
    move-result-object v7

    .line 371
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/j0;->j(ILjava/util/List;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 372
    .line 373
    .line 374
    move-result v6

    .line 375
    goto/16 :goto_2

    .line 376
    .line 377
    :pswitch_14
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    move-result-object v7

    .line 381
    check-cast v7, Ljava/util/List;

    .line 382
    .line 383
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->t(Ljava/util/List;)I

    .line 384
    .line 385
    .line 386
    move-result v7

    .line 387
    if-lez v7, :cond_11

    .line 388
    .line 389
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 390
    .line 391
    if-eqz v9, :cond_2

    .line 392
    .line 393
    int-to-long v9, v6

    .line 394
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 395
    .line 396
    .line 397
    :cond_2
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 398
    .line 399
    .line 400
    move-result v6

    .line 401
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 402
    .line 403
    .line 404
    move-result v8

    .line 405
    :goto_3
    add-int/2addr v6, v8

    .line 406
    add-int/2addr v6, v7

    .line 407
    goto/16 :goto_2

    .line 408
    .line 409
    :pswitch_15
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object v7

    .line 413
    check-cast v7, Ljava/util/List;

    .line 414
    .line 415
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->r(Ljava/util/List;)I

    .line 416
    .line 417
    .line 418
    move-result v7

    .line 419
    if-lez v7, :cond_11

    .line 420
    .line 421
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 422
    .line 423
    if-eqz v9, :cond_3

    .line 424
    .line 425
    int-to-long v9, v6

    .line 426
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 427
    .line 428
    .line 429
    :cond_3
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 430
    .line 431
    .line 432
    move-result v6

    .line 433
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 434
    .line 435
    .line 436
    move-result v8

    .line 437
    goto :goto_3

    .line 438
    :pswitch_16
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object v7

    .line 442
    check-cast v7, Ljava/util/List;

    .line 443
    .line 444
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->i(Ljava/util/List;)I

    .line 445
    .line 446
    .line 447
    move-result v7

    .line 448
    if-lez v7, :cond_11

    .line 449
    .line 450
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 451
    .line 452
    if-eqz v9, :cond_4

    .line 453
    .line 454
    int-to-long v9, v6

    .line 455
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 456
    .line 457
    .line 458
    :cond_4
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 459
    .line 460
    .line 461
    move-result v6

    .line 462
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 463
    .line 464
    .line 465
    move-result v8

    .line 466
    goto :goto_3

    .line 467
    :pswitch_17
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object v7

    .line 471
    check-cast v7, Ljava/util/List;

    .line 472
    .line 473
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->g(Ljava/util/List;)I

    .line 474
    .line 475
    .line 476
    move-result v7

    .line 477
    if-lez v7, :cond_11

    .line 478
    .line 479
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 480
    .line 481
    if-eqz v9, :cond_5

    .line 482
    .line 483
    int-to-long v9, v6

    .line 484
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 485
    .line 486
    .line 487
    :cond_5
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 488
    .line 489
    .line 490
    move-result v6

    .line 491
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 492
    .line 493
    .line 494
    move-result v8

    .line 495
    goto :goto_3

    .line 496
    :pswitch_18
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 497
    .line 498
    .line 499
    move-result-object v7

    .line 500
    check-cast v7, Ljava/util/List;

    .line 501
    .line 502
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->e(Ljava/util/List;)I

    .line 503
    .line 504
    .line 505
    move-result v7

    .line 506
    if-lez v7, :cond_11

    .line 507
    .line 508
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 509
    .line 510
    if-eqz v9, :cond_6

    .line 511
    .line 512
    int-to-long v9, v6

    .line 513
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 514
    .line 515
    .line 516
    :cond_6
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 517
    .line 518
    .line 519
    move-result v6

    .line 520
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 521
    .line 522
    .line 523
    move-result v8

    .line 524
    goto :goto_3

    .line 525
    :pswitch_19
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 526
    .line 527
    .line 528
    move-result-object v7

    .line 529
    check-cast v7, Ljava/util/List;

    .line 530
    .line 531
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->w(Ljava/util/List;)I

    .line 532
    .line 533
    .line 534
    move-result v7

    .line 535
    if-lez v7, :cond_11

    .line 536
    .line 537
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 538
    .line 539
    if-eqz v9, :cond_7

    .line 540
    .line 541
    int-to-long v9, v6

    .line 542
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 543
    .line 544
    .line 545
    :cond_7
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 546
    .line 547
    .line 548
    move-result v6

    .line 549
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 550
    .line 551
    .line 552
    move-result v8

    .line 553
    goto/16 :goto_3

    .line 554
    .line 555
    :pswitch_1a
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 556
    .line 557
    .line 558
    move-result-object v7

    .line 559
    check-cast v7, Ljava/util/List;

    .line 560
    .line 561
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->b(Ljava/util/List;)I

    .line 562
    .line 563
    .line 564
    move-result v7

    .line 565
    if-lez v7, :cond_11

    .line 566
    .line 567
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 568
    .line 569
    if-eqz v9, :cond_8

    .line 570
    .line 571
    int-to-long v9, v6

    .line 572
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 573
    .line 574
    .line 575
    :cond_8
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 576
    .line 577
    .line 578
    move-result v6

    .line 579
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 580
    .line 581
    .line 582
    move-result v8

    .line 583
    goto/16 :goto_3

    .line 584
    .line 585
    :pswitch_1b
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 586
    .line 587
    .line 588
    move-result-object v7

    .line 589
    check-cast v7, Ljava/util/List;

    .line 590
    .line 591
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->g(Ljava/util/List;)I

    .line 592
    .line 593
    .line 594
    move-result v7

    .line 595
    if-lez v7, :cond_11

    .line 596
    .line 597
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 598
    .line 599
    if-eqz v9, :cond_9

    .line 600
    .line 601
    int-to-long v9, v6

    .line 602
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 603
    .line 604
    .line 605
    :cond_9
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 606
    .line 607
    .line 608
    move-result v6

    .line 609
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 610
    .line 611
    .line 612
    move-result v8

    .line 613
    goto/16 :goto_3

    .line 614
    .line 615
    :pswitch_1c
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 616
    .line 617
    .line 618
    move-result-object v7

    .line 619
    check-cast v7, Ljava/util/List;

    .line 620
    .line 621
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->i(Ljava/util/List;)I

    .line 622
    .line 623
    .line 624
    move-result v7

    .line 625
    if-lez v7, :cond_11

    .line 626
    .line 627
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 628
    .line 629
    if-eqz v9, :cond_a

    .line 630
    .line 631
    int-to-long v9, v6

    .line 632
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 633
    .line 634
    .line 635
    :cond_a
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 636
    .line 637
    .line 638
    move-result v6

    .line 639
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 640
    .line 641
    .line 642
    move-result v8

    .line 643
    goto/16 :goto_3

    .line 644
    .line 645
    :pswitch_1d
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 646
    .line 647
    .line 648
    move-result-object v7

    .line 649
    check-cast v7, Ljava/util/List;

    .line 650
    .line 651
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->l(Ljava/util/List;)I

    .line 652
    .line 653
    .line 654
    move-result v7

    .line 655
    if-lez v7, :cond_11

    .line 656
    .line 657
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 658
    .line 659
    if-eqz v9, :cond_b

    .line 660
    .line 661
    int-to-long v9, v6

    .line 662
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 663
    .line 664
    .line 665
    :cond_b
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 666
    .line 667
    .line 668
    move-result v6

    .line 669
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 670
    .line 671
    .line 672
    move-result v8

    .line 673
    goto/16 :goto_3

    .line 674
    .line 675
    :pswitch_1e
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 676
    .line 677
    .line 678
    move-result-object v7

    .line 679
    check-cast v7, Ljava/util/List;

    .line 680
    .line 681
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->y(Ljava/util/List;)I

    .line 682
    .line 683
    .line 684
    move-result v7

    .line 685
    if-lez v7, :cond_11

    .line 686
    .line 687
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 688
    .line 689
    if-eqz v9, :cond_c

    .line 690
    .line 691
    int-to-long v9, v6

    .line 692
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 693
    .line 694
    .line 695
    :cond_c
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 696
    .line 697
    .line 698
    move-result v6

    .line 699
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 700
    .line 701
    .line 702
    move-result v8

    .line 703
    goto/16 :goto_3

    .line 704
    .line 705
    :pswitch_1f
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 706
    .line 707
    .line 708
    move-result-object v7

    .line 709
    check-cast v7, Ljava/util/List;

    .line 710
    .line 711
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->n(Ljava/util/List;)I

    .line 712
    .line 713
    .line 714
    move-result v7

    .line 715
    if-lez v7, :cond_11

    .line 716
    .line 717
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 718
    .line 719
    if-eqz v9, :cond_d

    .line 720
    .line 721
    int-to-long v9, v6

    .line 722
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 723
    .line 724
    .line 725
    :cond_d
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 726
    .line 727
    .line 728
    move-result v6

    .line 729
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 730
    .line 731
    .line 732
    move-result v8

    .line 733
    goto/16 :goto_3

    .line 734
    .line 735
    :pswitch_20
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-result-object v7

    .line 739
    check-cast v7, Ljava/util/List;

    .line 740
    .line 741
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->g(Ljava/util/List;)I

    .line 742
    .line 743
    .line 744
    move-result v7

    .line 745
    if-lez v7, :cond_11

    .line 746
    .line 747
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 748
    .line 749
    if-eqz v9, :cond_e

    .line 750
    .line 751
    int-to-long v9, v6

    .line 752
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 753
    .line 754
    .line 755
    :cond_e
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 756
    .line 757
    .line 758
    move-result v6

    .line 759
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 760
    .line 761
    .line 762
    move-result v8

    .line 763
    goto/16 :goto_3

    .line 764
    .line 765
    :pswitch_21
    invoke-virtual {v2, v1, v9, v10}, Lsun/misc/Unsafe;->getObject(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 766
    .line 767
    .line 768
    move-result-object v7

    .line 769
    check-cast v7, Ljava/util/List;

    .line 770
    .line 771
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/j0;->i(Ljava/util/List;)I

    .line 772
    .line 773
    .line 774
    move-result v7

    .line 775
    if-lez v7, :cond_11

    .line 776
    .line 777
    iget-boolean v9, p0, Landroidx/datastore/preferences/protobuf/d0;->i:Z

    .line 778
    .line 779
    if-eqz v9, :cond_f

    .line 780
    .line 781
    int-to-long v9, v6

    .line 782
    invoke-virtual {v2, v1, v9, v10, v7}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 783
    .line 784
    .line 785
    :cond_f
    invoke-static {v8}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->W(I)I

    .line 786
    .line 787
    .line 788
    move-result v6

    .line 789
    invoke-static {v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Y(I)I

    .line 790
    .line 791
    .line 792
    move-result v8

    .line 793
    goto/16 :goto_3

    .line 794
    .line 795
    :pswitch_22
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 796
    .line 797
    .line 798
    move-result-object v6

    .line 799
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->s(ILjava/util/List;Z)I

    .line 800
    .line 801
    .line 802
    move-result v6

    .line 803
    goto/16 :goto_2

    .line 804
    .line 805
    :pswitch_23
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 806
    .line 807
    .line 808
    move-result-object v6

    .line 809
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->q(ILjava/util/List;Z)I

    .line 810
    .line 811
    .line 812
    move-result v6

    .line 813
    goto/16 :goto_2

    .line 814
    .line 815
    :pswitch_24
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 816
    .line 817
    .line 818
    move-result-object v6

    .line 819
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->h(ILjava/util/List;Z)I

    .line 820
    .line 821
    .line 822
    move-result v6

    .line 823
    goto/16 :goto_2

    .line 824
    .line 825
    :pswitch_25
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 826
    .line 827
    .line 828
    move-result-object v6

    .line 829
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->f(ILjava/util/List;Z)I

    .line 830
    .line 831
    .line 832
    move-result v6

    .line 833
    goto/16 :goto_2

    .line 834
    .line 835
    :pswitch_26
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 836
    .line 837
    .line 838
    move-result-object v6

    .line 839
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->d(ILjava/util/List;Z)I

    .line 840
    .line 841
    .line 842
    move-result v6

    .line 843
    goto/16 :goto_2

    .line 844
    .line 845
    :pswitch_27
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 846
    .line 847
    .line 848
    move-result-object v6

    .line 849
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->v(ILjava/util/List;Z)I

    .line 850
    .line 851
    .line 852
    move-result v6

    .line 853
    goto/16 :goto_2

    .line 854
    .line 855
    :pswitch_28
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 856
    .line 857
    .line 858
    move-result-object v6

    .line 859
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/j0;->c(ILjava/util/List;)I

    .line 860
    .line 861
    .line 862
    move-result v6

    .line 863
    goto/16 :goto_2

    .line 864
    .line 865
    :pswitch_29
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 866
    .line 867
    .line 868
    move-result-object v6

    .line 869
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 870
    .line 871
    .line 872
    move-result-object v7

    .line 873
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/j0;->p(ILjava/util/List;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 874
    .line 875
    .line 876
    move-result v6

    .line 877
    goto/16 :goto_2

    .line 878
    .line 879
    :pswitch_2a
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 880
    .line 881
    .line 882
    move-result-object v6

    .line 883
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/j0;->u(ILjava/util/List;)I

    .line 884
    .line 885
    .line 886
    move-result v6

    .line 887
    goto/16 :goto_2

    .line 888
    .line 889
    :pswitch_2b
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 890
    .line 891
    .line 892
    move-result-object v6

    .line 893
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->a(ILjava/util/List;Z)I

    .line 894
    .line 895
    .line 896
    move-result v6

    .line 897
    goto/16 :goto_2

    .line 898
    .line 899
    :pswitch_2c
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 900
    .line 901
    .line 902
    move-result-object v6

    .line 903
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->f(ILjava/util/List;Z)I

    .line 904
    .line 905
    .line 906
    move-result v6

    .line 907
    goto/16 :goto_2

    .line 908
    .line 909
    :pswitch_2d
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 910
    .line 911
    .line 912
    move-result-object v6

    .line 913
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->h(ILjava/util/List;Z)I

    .line 914
    .line 915
    .line 916
    move-result v6

    .line 917
    goto/16 :goto_2

    .line 918
    .line 919
    :pswitch_2e
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 920
    .line 921
    .line 922
    move-result-object v6

    .line 923
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->k(ILjava/util/List;Z)I

    .line 924
    .line 925
    .line 926
    move-result v6

    .line 927
    goto/16 :goto_2

    .line 928
    .line 929
    :pswitch_2f
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 930
    .line 931
    .line 932
    move-result-object v6

    .line 933
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->x(ILjava/util/List;Z)I

    .line 934
    .line 935
    .line 936
    move-result v6

    .line 937
    goto/16 :goto_2

    .line 938
    .line 939
    :pswitch_30
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 940
    .line 941
    .line 942
    move-result-object v6

    .line 943
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->m(ILjava/util/List;Z)I

    .line 944
    .line 945
    .line 946
    move-result v6

    .line 947
    goto/16 :goto_2

    .line 948
    .line 949
    :pswitch_31
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 950
    .line 951
    .line 952
    move-result-object v6

    .line 953
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->f(ILjava/util/List;Z)I

    .line 954
    .line 955
    .line 956
    move-result v6

    .line 957
    goto/16 :goto_2

    .line 958
    .line 959
    :pswitch_32
    invoke-static {v1, v9, v10}, Landroidx/datastore/preferences/protobuf/d0;->K(Ljava/lang/Object;J)Ljava/util/List;

    .line 960
    .line 961
    .line 962
    move-result-object v6

    .line 963
    invoke-static {v8, v6, v3}, Landroidx/datastore/preferences/protobuf/j0;->h(ILjava/util/List;Z)I

    .line 964
    .line 965
    .line 966
    move-result v6

    .line 967
    goto/16 :goto_2

    .line 968
    .line 969
    :pswitch_33
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 970
    .line 971
    .line 972
    move-result v6

    .line 973
    if-eqz v6, :cond_11

    .line 974
    .line 975
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 976
    .line 977
    .line 978
    move-result-object v6

    .line 979
    check-cast v6, Landroidx/datastore/preferences/protobuf/b0;

    .line 980
    .line 981
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 982
    .line 983
    .line 984
    move-result-object v7

    .line 985
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->t(ILandroidx/datastore/preferences/protobuf/b0;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 986
    .line 987
    .line 988
    move-result v6

    .line 989
    goto/16 :goto_2

    .line 990
    .line 991
    :pswitch_34
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 992
    .line 993
    .line 994
    move-result v6

    .line 995
    if-eqz v6, :cond_11

    .line 996
    .line 997
    invoke-static {v1, v9, v10}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 998
    .line 999
    .line 1000
    move-result-wide v6

    .line 1001
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->S(IJ)I

    .line 1002
    .line 1003
    .line 1004
    move-result v6

    .line 1005
    goto/16 :goto_2

    .line 1006
    .line 1007
    :pswitch_35
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1008
    .line 1009
    .line 1010
    move-result v6

    .line 1011
    if-eqz v6, :cond_11

    .line 1012
    .line 1013
    invoke-static {v1, v9, v10}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 1014
    .line 1015
    .line 1016
    move-result v6

    .line 1017
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Q(II)I

    .line 1018
    .line 1019
    .line 1020
    move-result v6

    .line 1021
    goto/16 :goto_2

    .line 1022
    .line 1023
    :pswitch_36
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1024
    .line 1025
    .line 1026
    move-result v6

    .line 1027
    if-eqz v6, :cond_11

    .line 1028
    .line 1029
    invoke-static {v8, v11, v12}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->O(IJ)I

    .line 1030
    .line 1031
    .line 1032
    move-result v6

    .line 1033
    goto/16 :goto_2

    .line 1034
    .line 1035
    :pswitch_37
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1036
    .line 1037
    .line 1038
    move-result v6

    .line 1039
    if-eqz v6, :cond_11

    .line 1040
    .line 1041
    invoke-static {v8, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->M(II)I

    .line 1042
    .line 1043
    .line 1044
    move-result v6

    .line 1045
    goto/16 :goto_2

    .line 1046
    .line 1047
    :pswitch_38
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1048
    .line 1049
    .line 1050
    move-result v6

    .line 1051
    if-eqz v6, :cond_11

    .line 1052
    .line 1053
    invoke-static {v1, v9, v10}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 1054
    .line 1055
    .line 1056
    move-result v6

    .line 1057
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->l(II)I

    .line 1058
    .line 1059
    .line 1060
    move-result v6

    .line 1061
    goto/16 :goto_2

    .line 1062
    .line 1063
    :pswitch_39
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1064
    .line 1065
    .line 1066
    move-result v6

    .line 1067
    if-eqz v6, :cond_11

    .line 1068
    .line 1069
    invoke-static {v1, v9, v10}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 1070
    .line 1071
    .line 1072
    move-result v6

    .line 1073
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->X(II)I

    .line 1074
    .line 1075
    .line 1076
    move-result v6

    .line 1077
    goto/16 :goto_2

    .line 1078
    .line 1079
    :pswitch_3a
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1080
    .line 1081
    .line 1082
    move-result v6

    .line 1083
    if-eqz v6, :cond_11

    .line 1084
    .line 1085
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v6

    .line 1089
    check-cast v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1090
    .line 1091
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 1092
    .line 1093
    .line 1094
    move-result v6

    .line 1095
    goto/16 :goto_2

    .line 1096
    .line 1097
    :pswitch_3b
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1098
    .line 1099
    .line 1100
    move-result v6

    .line 1101
    if-eqz v6, :cond_11

    .line 1102
    .line 1103
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1104
    .line 1105
    .line 1106
    move-result-object v6

    .line 1107
    invoke-virtual {p0, v4}, Landroidx/datastore/preferences/protobuf/d0;->v(I)Landroidx/datastore/preferences/protobuf/i0;

    .line 1108
    .line 1109
    .line 1110
    move-result-object v7

    .line 1111
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/j0;->o(ILjava/lang/Object;Landroidx/datastore/preferences/protobuf/i0;)I

    .line 1112
    .line 1113
    .line 1114
    move-result v6

    .line 1115
    goto/16 :goto_2

    .line 1116
    .line 1117
    :pswitch_3c
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1118
    .line 1119
    .line 1120
    move-result v6

    .line 1121
    if-eqz v6, :cond_11

    .line 1122
    .line 1123
    invoke-static {v1, v9, v10}, Ll/lyj0;->E(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 1124
    .line 1125
    .line 1126
    move-result-object v6

    .line 1127
    instance-of v7, v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1128
    .line 1129
    if-eqz v7, :cond_10

    .line 1130
    .line 1131
    check-cast v6, Landroidx/datastore/preferences/protobuf/ByteString;

    .line 1132
    .line 1133
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->h(ILandroidx/datastore/preferences/protobuf/ByteString;)I

    .line 1134
    .line 1135
    .line 1136
    move-result v6

    .line 1137
    goto/16 :goto_2

    .line 1138
    .line 1139
    :cond_10
    check-cast v6, Ljava/lang/String;

    .line 1140
    .line 1141
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->U(ILjava/lang/String;)I

    .line 1142
    .line 1143
    .line 1144
    move-result v6

    .line 1145
    goto/16 :goto_2

    .line 1146
    .line 1147
    :pswitch_3d
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1148
    .line 1149
    .line 1150
    move-result v6

    .line 1151
    if-eqz v6, :cond_11

    .line 1152
    .line 1153
    invoke-static {v8, v14}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->e(IZ)I

    .line 1154
    .line 1155
    .line 1156
    move-result v6

    .line 1157
    goto/16 :goto_2

    .line 1158
    .line 1159
    :pswitch_3e
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1160
    .line 1161
    .line 1162
    move-result v6

    .line 1163
    if-eqz v6, :cond_11

    .line 1164
    .line 1165
    invoke-static {v8, v3}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->n(II)I

    .line 1166
    .line 1167
    .line 1168
    move-result v6

    .line 1169
    goto/16 :goto_2

    .line 1170
    .line 1171
    :pswitch_3f
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1172
    .line 1173
    .line 1174
    move-result v6

    .line 1175
    if-eqz v6, :cond_11

    .line 1176
    .line 1177
    invoke-static {v8, v11, v12}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->p(IJ)I

    .line 1178
    .line 1179
    .line 1180
    move-result v6

    .line 1181
    goto/16 :goto_2

    .line 1182
    .line 1183
    :pswitch_40
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1184
    .line 1185
    .line 1186
    move-result v6

    .line 1187
    if-eqz v6, :cond_11

    .line 1188
    .line 1189
    invoke-static {v1, v9, v10}, Ll/lyj0;->A(Ljava/lang/Object;J)I

    .line 1190
    .line 1191
    .line 1192
    move-result v6

    .line 1193
    invoke-static {v8, v6}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->w(II)I

    .line 1194
    .line 1195
    .line 1196
    move-result v6

    .line 1197
    goto/16 :goto_2

    .line 1198
    .line 1199
    :pswitch_41
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1200
    .line 1201
    .line 1202
    move-result v6

    .line 1203
    if-eqz v6, :cond_11

    .line 1204
    .line 1205
    invoke-static {v1, v9, v10}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 1206
    .line 1207
    .line 1208
    move-result-wide v6

    .line 1209
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->Z(IJ)I

    .line 1210
    .line 1211
    .line 1212
    move-result v6

    .line 1213
    goto/16 :goto_2

    .line 1214
    .line 1215
    :pswitch_42
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1216
    .line 1217
    .line 1218
    move-result v6

    .line 1219
    if-eqz v6, :cond_11

    .line 1220
    .line 1221
    invoke-static {v1, v9, v10}, Ll/lyj0;->C(Ljava/lang/Object;J)J

    .line 1222
    .line 1223
    .line 1224
    move-result-wide v6

    .line 1225
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->y(IJ)I

    .line 1226
    .line 1227
    .line 1228
    move-result v6

    .line 1229
    goto/16 :goto_2

    .line 1230
    .line 1231
    :pswitch_43
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1232
    .line 1233
    .line 1234
    move-result v6

    .line 1235
    if-eqz v6, :cond_11

    .line 1236
    .line 1237
    invoke-static {v8, v13}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->r(IF)I

    .line 1238
    .line 1239
    .line 1240
    move-result v6

    .line 1241
    goto/16 :goto_2

    .line 1242
    .line 1243
    :pswitch_44
    invoke-virtual {p0, v1, v4}, Landroidx/datastore/preferences/protobuf/d0;->C(Ljava/lang/Object;I)Z

    .line 1244
    .line 1245
    .line 1246
    move-result v6

    .line 1247
    if-eqz v6, :cond_11

    .line 1248
    .line 1249
    const-wide/16 v6, 0x0

    .line 1250
    .line 1251
    invoke-static {v8, v6, v7}, Landroidx/datastore/preferences/protobuf/CodedOutputStream;->j(ID)I

    .line 1252
    .line 1253
    .line 1254
    move-result v6

    .line 1255
    goto/16 :goto_2

    .line 1256
    .line 1257
    :cond_11
    :goto_4
    add-int/lit8 v4, v4, 0x3

    .line 1258
    .line 1259
    goto/16 :goto_0

    .line 1260
    .line 1261
    :cond_12
    iget-object v2, p0, Landroidx/datastore/preferences/protobuf/d0;->o:Landroidx/datastore/preferences/protobuf/l0;

    .line 1262
    .line 1263
    invoke-virtual {p0, v2, v1}, Landroidx/datastore/preferences/protobuf/d0;->z(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;)I

    .line 1264
    .line 1265
    .line 1266
    move-result v0

    .line 1267
    add-int/2addr v5, v0

    .line 1268
    return v5

    .line 1269
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final y0(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "TUT;TUB;>;TT;",
            "Landroidx/datastore/preferences/protobuf/Writer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Landroidx/datastore/preferences/protobuf/l0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0, p3}, Landroidx/datastore/preferences/protobuf/l0;->t(Ljava/lang/Object;Landroidx/datastore/preferences/protobuf/Writer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final z(Landroidx/datastore/preferences/protobuf/l0;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<UT:",
            "Ljava/lang/Object;",
            "UB:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/datastore/preferences/protobuf/l0<",
            "TUT;TUB;>;TT;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Landroidx/datastore/preferences/protobuf/l0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroidx/datastore/preferences/protobuf/l0;->h(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
