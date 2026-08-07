.class public final Ll/gp3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0013\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\r\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u0003J\r\u0010\u000c\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000c\u0010\u0003J\u0015\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0007H\u0002\u00a2\u0006\u0004\u0008\r\u0010\t\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/gp3;",
        "",
        "<init>",
        "()V",
        "",
        "e",
        "()Z",
        "Lrx/c;",
        "g",
        "()Lrx/c;",
        "",
        "f",
        "h",
        "i",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/gp3;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/gp3;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gp3;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/gp3;->INSTANCE:Ll/gp3;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lkotlin/Unit;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    const-string v0, "BuzzLiveSoHelper"

    .line 4
    .line 5
    const-string v1, "loadMomoCVSDK suc"

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    return-object p0
.end method

.method public static b(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "prepareLiveSo error "

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v1, "BuzzLiveSoHelper"

    .line 22
    .line 23
    invoke-virtual {v0, v1, p0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static c(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static d(Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 3

    .line 1
    sget-object v0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "prepareLiveSo "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "BuzzLiveSoHelper"

    .line 18
    .line 19
    invoke-virtual {v0, v2, v1}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string p0, "prepareLiveSo isAllSuccess "

    .line 29
    .line 30
    invoke-virtual {v0, v2, p0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method public final e()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->Companion:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;->a()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "b_live"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->q(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final f()V
    .locals 4

    .line 1
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->Companion:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;->a()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x2

    .line 8
    const/4 v1, 0x0

    .line 9
    const-string v2, "b_live"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {p0, v2, v3, v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->w(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;ZILjava/lang/Object;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/cp3;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/cp3;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/dp3;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/dp3;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1, v3}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final g()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/gp3;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/gp3;->i()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/ep3;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/ep3;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/fp3;

    .line 27
    .line 28
    invoke-direct {v1, v0}, Ll/fp3;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method public final h()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/gp3;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "BuzzLiveSoHelper"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 10
    .line 11
    const-string v0, "prepareLiveSo, but already loaded"

    .line 12
    .line 13
    invoke-virtual {p0, v1, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/wzx;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v2, "android.permission.CAMERA"

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    const-string v4, "android.permission.RECORD_AUDIO"

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x2

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    new-array v0, v6, [Ljava/lang/String;

    .line 31
    .line 32
    aput-object v4, v0, v5

    .line 33
    .line 34
    aput-object v2, v0, v3

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v0, 0x3

    .line 38
    new-array v0, v0, [Ljava/lang/String;

    .line 39
    .line 40
    aput-object v4, v0, v5

    .line 41
    .line 42
    aput-object v2, v0, v3

    .line 43
    .line 44
    const-string v2, "android.permission.READ_EXTERNAL_STORAGE"

    .line 45
    .line 46
    aput-object v2, v0, v6

    .line 47
    .line 48
    :goto_0
    array-length v2, v0

    .line 49
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, [Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 62
    .line 63
    const-string v0, "prepareLiveSo, but permission not had all"

    .line 64
    .line 65
    invoke-virtual {p0, v1, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    sget-object v0, Ll/qn3;->INSTANCE:Ll/qn3;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/qn3;->r()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    sget-object p0, Ll/xa2;->INSTANCE:Ll/xa2;

    .line 78
    .line 79
    const-string v0, "prepareLiveSo, but getMemojiBuzzUsed false"

    .line 80
    .line 81
    invoke-virtual {p0, v1, v0}, Ll/xa2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    invoke-virtual {p0}, Ll/gp3;->f()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final i()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->Companion:Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader$a;->a()Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x2

    .line 8
    const/4 v1, 0x0

    .line 9
    const-string v2, "b_live"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-static {p0, v2, v3, v0, v1}, Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;->t(Lcom/tantanapp/sharedlibrary/loader/SharedLibraryLoader;Ljava/lang/String;ZILjava/lang/Object;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
