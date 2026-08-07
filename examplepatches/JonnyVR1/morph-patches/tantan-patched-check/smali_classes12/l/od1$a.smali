.class public Ll/od1$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/od1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Z

.field final synthetic h:Ll/od1;


# direct methods
.method public constructor <init>(Ll/od1;ILl/g13;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/od1$a;->h:Ll/od1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3}, Ll/g13;->b()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput-boolean p1, p0, Ll/od1$a;->a:Z

    .line 11
    .line 12
    invoke-virtual {p3}, Ll/g13;->b()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput-boolean p1, p0, Ll/od1$a;->b:Z

    .line 17
    .line 18
    invoke-virtual {p3}, Ll/g13;->b()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput-boolean p1, p0, Ll/od1$a;->c:Z

    .line 23
    .line 24
    invoke-virtual {p3}, Ll/g13;->b()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput-boolean p1, p0, Ll/od1$a;->d:Z

    .line 29
    .line 30
    invoke-virtual {p3}, Ll/g13;->b()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput-boolean p1, p0, Ll/od1$a;->e:Z

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p3}, Ll/g13;->b()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput-boolean p1, p0, Ll/od1$a;->f:Z

    .line 43
    .line 44
    invoke-virtual {p3}, Ll/g13;->b()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput-boolean p1, p0, Ll/od1$a;->g:Z

    .line 49
    .line 50
    invoke-virtual {p0, p2, p3}, Ll/od1$a;->a(ILl/g13;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    :goto_0
    const/4 p0, 0x4

    .line 54
    invoke-virtual {p3, p0}, Ll/g13;->a(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {p3, p0}, Ll/g13;->a(I)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    const/16 p1, 0xf

    .line 66
    .line 67
    const/16 p2, 0x8

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    if-ne p0, p1, :cond_2

    .line 71
    .line 72
    invoke-virtual {p3, p2}, Ll/g13;->a(I)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    add-int/2addr p0, p1

    .line 77
    goto :goto_1

    .line 78
    :cond_2
    move p1, v0

    .line 79
    :goto_1
    const/16 v1, 0xff

    .line 80
    .line 81
    if-ne p1, v1, :cond_3

    .line 82
    .line 83
    const/16 p1, 0x10

    .line 84
    .line 85
    invoke-virtual {p3, p1}, Ll/g13;->a(I)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    add-int/2addr p0, p1

    .line 90
    :cond_3
    :goto_2
    if-lt v0, p0, :cond_4

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    invoke-virtual {p3, p2}, Ll/g13;->a(I)I

    .line 94
    .line 95
    .line 96
    add-int/lit8 v0, v0, 0x1

    .line 97
    .line 98
    goto :goto_2
.end method


# virtual methods
.method public a(ILl/g13;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    packed-switch p1, :pswitch_data_0

    .line 3
    .line 4
    .line 5
    move p1, v0

    .line 6
    goto :goto_0

    .line 7
    :pswitch_0
    const/4 p1, 0x4

    .line 8
    goto :goto_0

    .line 9
    :pswitch_1
    const/4 p1, 0x3

    .line 10
    goto :goto_0

    .line 11
    :pswitch_2
    const/4 p1, 0x2

    .line 12
    goto :goto_0

    .line 13
    :pswitch_3
    const/4 p1, 0x1

    .line 14
    :goto_0
    if-lt v0, p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v1, Ll/od1$b;

    .line 18
    .line 19
    iget-object v2, p0, Ll/od1$a;->h:Ll/od1;

    .line 20
    .line 21
    invoke-direct {v1, v2, p2}, Ll/od1$b;-><init>(Ll/od1;Ll/g13;)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
