.class public final Lvlo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lylo;


# static fields
.field public static final c:Ljava/lang/Object;


# instance fields
.field public volatile a:Lylo;

.field public volatile b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lvlo;->c:Ljava/lang/Object;

    return-void
.end method

.method public static b(Lylo;)Lvlo;
    .registers 3

    instance-of v0, p0, Lvlo;

    if-eqz v0, :cond_7

    check-cast p0, Lvlo;

    return-object p0

    :cond_7
    new-instance v0, Lvlo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v1, Lvlo;->c:Ljava/lang/Object;

    iput-object v1, v0, Lvlo;->b:Ljava/lang/Object;

    iput-object p0, v0, Lvlo;->a:Lylo;

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Lvlo;->b:Ljava/lang/Object;

    sget-object v1, Lvlo;->c:Ljava/lang/Object;

    if-ne v0, v1, :cond_43

    const-string v0, "Scoped provider was invoked recursively returning different results: "

    monitor-enter p0

    :try_start_9
    iget-object v2, p0, Lvlo;->b:Ljava/lang/Object;

    if-ne v2, v1, :cond_3d

    iget-object v2, p0, Lvlo;->a:Lylo;

    invoke-interface {v2}, Lylo;->a()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lvlo;->b:Ljava/lang/Object;

    if-eq v3, v1, :cond_38

    if-eq v3, v2, :cond_38

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " & "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ". This is likely due to a circular dependency."

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_38
    iput-object v2, p0, Lvlo;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lvlo;->a:Lylo;
    :try_end_3d
    .catchall {:try_start_9 .. :try_end_3d} :catchall_41

    :cond_3d
    monitor-exit p0

    return-object v2

    :goto_3f
    :try_start_3f
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_41

    throw v0

    :catchall_41
    move-exception v0

    goto :goto_3f

    :cond_43
    return-object v0
.end method
