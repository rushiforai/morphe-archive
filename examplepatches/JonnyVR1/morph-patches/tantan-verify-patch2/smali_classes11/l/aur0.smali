.class public final Ll/aur0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/itr0;


# instance fields
.field public final a:Ll/dfw0;

.field public final synthetic b:Ll/cur0;


# direct methods
.method public constructor <init>(Ll/cur0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/aur0;->b:Ll/cur0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/dfw0;

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    new-array v1, v0, [B

    .line 10
    .line 11
    invoke-direct {p1, v1, v0}, Ll/dfw0;-><init>([BI)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/aur0;->a:Ll/dfw0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ll/nnw0;Ll/ser0;Ll/gur0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    and-int/lit16 v0, v0, 0x80

    .line 13
    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    const/4 v0, 0x6

    .line 17
    invoke-virtual {p1, v0}, Ll/bgw0;->l(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x4

    .line 25
    div-int/2addr v0, v1

    .line 26
    const/4 v2, 0x0

    .line 27
    move v3, v2

    .line 28
    :goto_0
    if-ge v3, v0, :cond_3

    .line 29
    .line 30
    iget-object v4, p0, Ll/aur0;->a:Ll/dfw0;

    .line 31
    .line 32
    invoke-virtual {p1, v4, v1}, Ll/bgw0;->f(Ll/dfw0;I)V

    .line 33
    .line 34
    .line 35
    iget-object v4, p0, Ll/aur0;->a:Ll/dfw0;

    .line 36
    .line 37
    const/16 v5, 0x10

    .line 38
    .line 39
    invoke-virtual {v4, v5}, Ll/dfw0;->d(I)I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    const/4 v6, 0x3

    .line 44
    invoke-virtual {v4, v6}, Ll/dfw0;->m(I)V

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Ll/aur0;->a:Ll/dfw0;

    .line 48
    .line 49
    const/16 v6, 0xd

    .line 50
    .line 51
    if-nez v5, :cond_1

    .line 52
    .line 53
    invoke-virtual {v4, v6}, Ll/dfw0;->m(I)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-virtual {v4, v6}, Ll/dfw0;->d(I)I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    iget-object v5, p0, Ll/aur0;->b:Ll/cur0;

    .line 62
    .line 63
    invoke-static {v5}, Ll/cur0;->b(Ll/cur0;)Landroid/util/SparseArray;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-virtual {v5, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    if-nez v5, :cond_2

    .line 72
    .line 73
    iget-object v5, p0, Ll/aur0;->b:Ll/cur0;

    .line 74
    .line 75
    invoke-static {v5}, Ll/cur0;->b(Ll/cur0;)Landroid/util/SparseArray;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    new-instance v7, Ll/jtr0;

    .line 80
    .line 81
    new-instance v8, Ll/bur0;

    .line 82
    .line 83
    invoke-direct {v8, v5, v4}, Ll/bur0;-><init>(Ll/cur0;I)V

    .line 84
    .line 85
    .line 86
    invoke-direct {v7, v8}, Ll/jtr0;-><init>(Ll/itr0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v6, v4, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iget-object v4, p0, Ll/aur0;->b:Ll/cur0;

    .line 93
    .line 94
    invoke-static {v4}, Ll/cur0;->a(Ll/cur0;)I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    add-int/lit8 v5, v5, 0x1

    .line 99
    .line 100
    invoke-static {v4, v5}, Ll/cur0;->m(Ll/cur0;I)V

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    iget-object p0, p0, Ll/aur0;->b:Ll/cur0;

    .line 107
    .line 108
    invoke-static {p0}, Ll/cur0;->b(Ll/cur0;)Landroid/util/SparseArray;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0, v2}, Landroid/util/SparseArray;->remove(I)V

    .line 113
    .line 114
    .line 115
    :cond_4
    :goto_2
    return-void
.end method
