.class public Ll/ikj0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yee0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ikj0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/hg60;

.field public final synthetic b:Ll/ikj0;


# direct methods
.method public constructor <init>(Ll/ikj0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ikj0$a;->b:Ll/ikj0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/hg60;

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ll/hg60;-><init>([B)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/ikj0$a;->a:Ll/hg60;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Ll/ig60;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ll/ig60;->H()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    and-int/lit16 v0, v0, 0x80

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_1
    const/4 v0, 0x6

    .line 19
    invoke-virtual {p1, v0}, Ll/ig60;->V(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/ig60;->a()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x4

    .line 27
    div-int/2addr v0, v1

    .line 28
    const/4 v2, 0x0

    .line 29
    move v3, v2

    .line 30
    :goto_0
    if-ge v3, v0, :cond_4

    .line 31
    .line 32
    iget-object v4, p0, Ll/ikj0$a;->a:Ll/hg60;

    .line 33
    .line 34
    invoke-virtual {p1, v4, v1}, Ll/ig60;->k(Ll/hg60;I)V

    .line 35
    .line 36
    .line 37
    iget-object v4, p0, Ll/ikj0$a;->a:Ll/hg60;

    .line 38
    .line 39
    const/16 v5, 0x10

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Ll/hg60;->h(I)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    iget-object v5, p0, Ll/ikj0$a;->a:Ll/hg60;

    .line 46
    .line 47
    const/4 v6, 0x3

    .line 48
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 49
    .line 50
    .line 51
    iget-object v5, p0, Ll/ikj0$a;->a:Ll/hg60;

    .line 52
    .line 53
    const/16 v6, 0xd

    .line 54
    .line 55
    if-nez v4, :cond_2

    .line 56
    .line 57
    invoke-virtual {v5, v6}, Ll/hg60;->r(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-virtual {v5, v6}, Ll/hg60;->h(I)I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    iget-object v5, p0, Ll/ikj0$a;->b:Ll/ikj0;

    .line 66
    .line 67
    invoke-static {v5}, Ll/ikj0;->d(Ll/ikj0;)Landroid/util/SparseArray;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    if-nez v5, :cond_3

    .line 76
    .line 77
    iget-object v5, p0, Ll/ikj0$a;->b:Ll/ikj0;

    .line 78
    .line 79
    invoke-static {v5}, Ll/ikj0;->d(Ll/ikj0;)Landroid/util/SparseArray;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    new-instance v6, Ll/zee0;

    .line 84
    .line 85
    new-instance v7, Ll/ikj0$b;

    .line 86
    .line 87
    iget-object v8, p0, Ll/ikj0$a;->b:Ll/ikj0;

    .line 88
    .line 89
    invoke-direct {v7, v8, v4}, Ll/ikj0$b;-><init>(Ll/ikj0;I)V

    .line 90
    .line 91
    .line 92
    invoke-direct {v6, v7}, Ll/zee0;-><init>(Ll/yee0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v5, v4, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    iget-object v4, p0, Ll/ikj0$a;->b:Ll/ikj0;

    .line 99
    .line 100
    invoke-static {v4}, Ll/ikj0;->k(Ll/ikj0;)I

    .line 101
    .line 102
    .line 103
    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_4
    iget-object p1, p0, Ll/ikj0$a;->b:Ll/ikj0;

    .line 107
    .line 108
    invoke-static {p1}, Ll/ikj0;->l(Ll/ikj0;)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    const/4 v0, 0x2

    .line 113
    if-eq p1, v0, :cond_5

    .line 114
    .line 115
    iget-object p0, p0, Ll/ikj0$a;->b:Ll/ikj0;

    .line 116
    .line 117
    invoke-static {p0}, Ll/ikj0;->d(Ll/ikj0;)Landroid/util/SparseArray;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0, v2}, Landroid/util/SparseArray;->remove(I)V

    .line 122
    .line 123
    .line 124
    :cond_5
    :goto_2
    return-void
.end method

.method public c(Ll/h0j0;Ll/bsf;Ll/jkj0$d;)V
    .locals 0

    .line 1
    return-void
.end method
