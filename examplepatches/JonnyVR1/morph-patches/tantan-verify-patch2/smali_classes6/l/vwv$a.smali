.class public Ll/vwv$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lpw;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vwv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vwv;


# direct methods
.method public constructor <init>(Ll/vwv;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vwv$a;->a:Ll/vwv;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/vwv$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/vwv$a$a;-><init>(Ll/vwv$a;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vwv$a;->a:Ll/vwv;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vwv;->d:Landroid/app/Activity;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/vwv$a;->a:Ll/vwv;

    .line 12
    .line 13
    iget-object v0, v0, Ll/vwv;->d:Landroid/app/Activity;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    new-instance v0, Ljava/io/File;

    .line 22
    .line 23
    iget-object v1, p0, Ll/vwv$a;->a:Ll/vwv;

    .line 24
    .line 25
    invoke-static {v1}, Ll/vwv;->X(Ll/vwv;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    cmp-long v0, v0, v2

    .line 45
    .line 46
    if-gtz v0, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 52
    :goto_1
    iget-object v1, p0, Ll/vwv$a;->a:Ll/vwv;

    .line 53
    .line 54
    invoke-static {v1}, Ll/vwv;->Y(Ll/vwv;)Ll/a0m;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_2

    .line 63
    .line 64
    iget-object v1, p0, Ll/vwv$a;->a:Ll/vwv;

    .line 65
    .line 66
    invoke-static {v1}, Ll/vwv;->Y(Ll/vwv;)Ll/a0m;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object p0, p0, Ll/vwv$a;->a:Ll/vwv;

    .line 71
    .line 72
    invoke-static {p0}, Ll/vwv;->X(Ll/vwv;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    xor-int/lit8 v2, v0, 0x1

    .line 77
    .line 78
    invoke-interface {v1, p0, v2}, Ll/l4m$a;->c(Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    :cond_2
    if-eqz v0, :cond_3

    .line 82
    .line 83
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 84
    .line 85
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->s2:I

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    return-void
.end method
