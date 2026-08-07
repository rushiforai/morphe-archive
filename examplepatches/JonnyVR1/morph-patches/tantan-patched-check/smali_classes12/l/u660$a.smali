.class Ll/u660$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u660;->i(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/u660$d;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Ll/u660$d;

.field final synthetic g:Ll/u660;


# direct methods
.method public constructor <init>(Ll/u660;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/u660$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/u660$a;->g:Ll/u660;

    .line 2
    .line 3
    iput-object p2, p0, Ll/u660$a;->a:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Ll/u660$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/u660$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Ll/u660$a;->d:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Ll/u660$a;->e:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p7, p0, Ll/u660$a;->f:Ll/u660$d;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/u660$a;->g:Ll/u660;

    .line 2
    .line 3
    invoke-static {v0}, Ll/u660;->a(Ll/u660;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/u660$c;

    .line 23
    .line 24
    iget-object v3, p0, Ll/u660$a;->g:Ll/u660;

    .line 25
    .line 26
    iget-object v4, p0, Ll/u660$a;->a:Landroid/content/Context;

    .line 27
    .line 28
    iget-object v5, p0, Ll/u660$a;->b:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v6, p0, Ll/u660$a;->c:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v7, p0, Ll/u660$a;->d:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v8, p0, Ll/u660$a;->e:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v9, v2, Ll/u660$c;->b:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v10, v2, Ll/u660$c;->c:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v11, v2, Ll/u660$c;->d:[B

    .line 41
    .line 42
    invoke-virtual/range {v3 .. v11}, Ll/u660;->g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iget-object v4, p0, Ll/u660$a;->f:Ll/u660$d;

    .line 47
    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    if-eqz v4, :cond_0

    .line 53
    .line 54
    iget v3, v2, Ll/u660$c;->a:I

    .line 55
    .line 56
    iget-object v5, v2, Ll/u660$c;->b:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v2, v2, Ll/u660$c;->c:Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {v4, v3, v5, v2}, Ll/u660$d;->b(ILjava/lang/String;Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    if-eqz v4, :cond_0

    .line 65
    .line 66
    iget v3, v2, Ll/u660$c;->a:I

    .line 67
    .line 68
    iget-object v5, v2, Ll/u660$c;->b:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v2, v2, Ll/u660$c;->c:Ljava/lang/String;

    .line 71
    .line 72
    const-string v6, ""

    .line 73
    .line 74
    invoke-interface {v4, v3, v5, v2, v6}, Ll/u660$d;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-nez v2, :cond_0

    .line 79
    .line 80
    :cond_2
    iget-object v0, p0, Ll/u660$a;->f:Ll/u660$d;

    .line 81
    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    iget-object p0, p0, Ll/u660$a;->g:Ll/u660;

    .line 85
    .line 86
    invoke-static {p0}, Ll/u660;->a(Ll/u660;)Ljava/util/ArrayList;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    invoke-interface {v0, p0, v1}, Ll/u660$d;->c(II)V

    .line 95
    .line 96
    .line 97
    :cond_3
    return-void
.end method
