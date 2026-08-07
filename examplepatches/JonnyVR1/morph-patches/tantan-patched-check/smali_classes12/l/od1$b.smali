.class public Ll/od1$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/od1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Z

.field public g:Z

.field public h:I

.field public i:Z

.field public j:I

.field public k:I

.field public l:I

.field public m:Z

.field public n:Z

.field final synthetic o:Ll/od1;


# direct methods
.method public constructor <init>(Ll/od1;Ll/g13;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/od1$b;->o:Ll/od1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ll/g13;->b()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput-boolean p1, p0, Ll/od1$b;->a:Z

    .line 11
    .line 12
    const/4 p1, 0x4

    .line 13
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Ll/od1$b;->b:I

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Ll/od1$b;->c:I

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Ll/od1$b;->d:I

    .line 31
    .line 32
    const/4 p1, 0x2

    .line 33
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Ll/od1$b;->e:I

    .line 38
    .line 39
    invoke-virtual {p2}, Ll/g13;->b()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput-boolean v0, p0, Ll/od1$b;->f:Z

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/g13;->b()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput-boolean v0, p0, Ll/od1$b;->g:Z

    .line 50
    .line 51
    iget-boolean v0, p0, Ll/od1$b;->f:Z

    .line 52
    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Ll/od1$b;->h:I

    .line 60
    .line 61
    invoke-virtual {p2}, Ll/g13;->b()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput-boolean v0, p0, Ll/od1$b;->i:Z

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p0, Ll/od1$b;->j:I

    .line 72
    .line 73
    :cond_0
    iget-boolean v0, p0, Ll/od1$b;->g:Z

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Ll/od1$b;->k:I

    .line 82
    .line 83
    invoke-virtual {p2, p1}, Ll/g13;->a(I)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Ll/od1$b;->l:I

    .line 88
    .line 89
    invoke-virtual {p2}, Ll/g13;->b()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    iput-boolean p1, p0, Ll/od1$b;->m:Z

    .line 94
    .line 95
    :cond_1
    invoke-virtual {p2}, Ll/g13;->b()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    iput-boolean p1, p0, Ll/od1$b;->n:Z

    .line 100
    .line 101
    return-void
.end method
