.class public Ll/f950$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f950;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/f950;


# direct methods
.method public constructor <init>(Ll/f950;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f950$a;->a:Ll/f950;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f950$a;->a:Ll/f950;

    .line 2
    .line 3
    iget-object v0, v0, Ll/f950;->a:Ljava/util/Queue;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/f950$a;->a:Ll/f950;

    .line 10
    .line 11
    iget v2, v1, Ll/f950;->b:I

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-ge v0, v2, :cond_0

    .line 15
    .line 16
    iget v1, v1, Ll/f950;->c:I

    .line 17
    .line 18
    sub-int/2addr v1, v0

    .line 19
    :goto_0
    if-ge v3, v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/f950$a;->a:Ll/f950;

    .line 22
    .line 23
    iget-object v2, v0, Ll/f950;->a:Ljava/util/Queue;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/f950;->b()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v2, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v1, v1, Ll/f950;->c:I

    .line 36
    .line 37
    if-le v0, v1, :cond_1

    .line 38
    .line 39
    sub-int/2addr v0, v1

    .line 40
    :goto_1
    if-ge v3, v0, :cond_1

    .line 41
    .line 42
    iget-object v1, p0, Ll/f950$a;->a:Ll/f950;

    .line 43
    .line 44
    iget-object v1, v1, Ll/f950;->a:Ljava/util/Queue;

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    return-void
.end method
