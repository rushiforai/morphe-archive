.class public final Lzop;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcpp;


# static fields
.field public static final c:Ljava/lang/Object;


# instance fields
.field public volatile a:Lcpp;

.field public volatile b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lzop;->c:Ljava/lang/Object;

    return-void
.end method

.method public static a(Lcpp;)Lcpp;
    .registers 3

    instance-of v0, p0, Lzop;

    if-eqz v0, :cond_5

    return-object p0

    :cond_5
    new-instance v0, Lzop;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v1, Lzop;->c:Ljava/lang/Object;

    iput-object v1, v0, Lzop;->b:Ljava/lang/Object;

    iput-object p0, v0, Lzop;->a:Lcpp;

    return-object v0
.end method


# virtual methods
.method public final zza()Ljava/lang/Object;
    .registers 6

    const-string v0, "Scoped provider was invoked recursively returning different results: "

    iget-object v1, p0, Lzop;->b:Ljava/lang/Object;

    sget-object v2, Lzop;->c:Ljava/lang/Object;

    if-ne v1, v2, :cond_43

    monitor-enter p0

    :try_start_9
    iget-object v1, p0, Lzop;->b:Ljava/lang/Object;

    if-ne v1, v2, :cond_3d

    iget-object v1, p0, Lzop;->a:Lcpp;

    invoke-interface {v1}, Lcpp;->zza()Ljava/lang/Object;

    move-result-object v1

    iget-object v3, p0, Lzop;->b:Ljava/lang/Object;

    if-eq v3, v2, :cond_38

    if-eq v3, v1, :cond_38

    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " & "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ". This is likely due to a circular dependency."

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_38
    iput-object v1, p0, Lzop;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lzop;->a:Lcpp;

    :cond_3d
    monitor-exit p0

    return-object v1

    :goto_3f
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_9 .. :try_end_40} :catchall_41

    throw v0

    :catchall_41
    move-exception v0

    goto :goto_3f

    :cond_43
    return-object v1
.end method
