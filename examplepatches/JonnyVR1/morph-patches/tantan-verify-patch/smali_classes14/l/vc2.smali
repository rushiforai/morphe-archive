.class public Ll/vc2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vc2$a;
    }
.end annotation


# static fields
.field public static final d:Ljava/lang/Object;

.field public static e:Ll/vc2;


# instance fields
.field public a:I

.field public final b:Landroid/content/Context;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/vc2$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vc2;->d:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/vc2;->a:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/vc2;->c:Ljava/util/List;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 15
    .line 16
    iput-object v0, p0, Ll/vc2;->b:Landroid/content/Context;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/vc2;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vc2;->c(I)V

    return-void
.end method

.method public static b()Ll/vc2;
    .locals 2

    .line 1
    sget-object v0, Ll/vc2;->e:Ll/vc2;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/vc2;->d:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/vc2;->e:Ll/vc2;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/vc2;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/vc2;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/vc2;->e:Ll/vc2;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/vc2;->e:Ll/vc2;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final synthetic c(I)V
    .locals 1

    .line 1
    const-class v0, Ll/vc2;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/vc2;->b:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/b7f0;->a(Landroid/content/Context;I)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public d(Ll/vc2$a;)V
    .locals 1
    .param p1    # Ll/vc2$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/vc2;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/vc2;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vc2;->e()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public e()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vc2;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-eqz v3, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Ll/vc2$a;

    .line 20
    .line 21
    invoke-interface {v3}, Ll/vc2$a;->getCount()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-gez v3, :cond_0

    .line 26
    .line 27
    move v3, v1

    .line 28
    :cond_0
    add-int/2addr v2, v3

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget v0, p0, Ll/vc2;->a:I

    .line 31
    .line 32
    if-eq v0, v2, :cond_2

    .line 33
    .line 34
    iput v2, p0, Ll/vc2;->a:I

    .line 35
    .line 36
    const-string v0, "unread_amount"

    .line 37
    .line 38
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    filled-new-array {v0}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "e_app_unread_airbubble"

    .line 51
    .line 52
    const-string v3, ""

    .line 53
    .line 54
    invoke-static {v1, v3, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Ll/uc2;

    .line 58
    .line 59
    invoke-direct {v0, p0, v2}, Ll/uc2;-><init>(Ll/vc2;I)V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x1

    .line 63
    invoke-static {v0, p0}, Ll/l51;->z(Ljava/lang/Runnable;Z)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method
