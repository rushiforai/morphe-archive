.class Ll/as4$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/as4;->j(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Ll/as4;


# direct methods
.method public constructor <init>(Ll/as4;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/as4$b;->b:Ll/as4;

    .line 2
    .line 3
    iput-object p2, p0, Ll/as4$b;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/as4$b;->b:Ll/as4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/as4;->e(Ll/as4;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/as4$b;->b:Ll/as4;

    .line 10
    .line 11
    invoke-static {v0}, Ll/as4;->c(Ll/as4;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-lt v0, v1, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/as4$b;->b:Ll/as4;

    .line 19
    .line 20
    invoke-static {v0}, Ll/as4;->c(Ll/as4;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v2, p0, Ll/as4$b;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    sub-int/2addr v2, v1

    .line 31
    if-gt v0, v2, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/as4$b;->b:Ll/as4;

    .line 34
    .line 35
    invoke-static {v0}, Ll/as4;->g(Ll/as4;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/as4$b;->b:Ll/as4;

    .line 42
    .line 43
    invoke-static {v0}, Ll/as4;->h(Ll/as4;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v0, p0, Ll/as4$b;->b:Ll/as4;

    .line 48
    .line 49
    invoke-static {v0}, Ll/as4;->c(Ll/as4;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v2, p0, Ll/as4$b;->a:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    sub-int/2addr v2, v1

    .line 60
    if-le v0, v2, :cond_0

    .line 61
    .line 62
    iget-object v0, p0, Ll/as4$b;->b:Ll/as4;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {v0, v1}, Ll/as4;->f(Ll/as4;Z)Z

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-void
.end method
