.class public final Lub2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Landroid/content/pm/PackageManager;

.field public final c:Li16;

.field public final d:Lob2;


# direct methods
.method public constructor <init>(Lumi;Landroid/content/pm/PackageManager;Li16;Lob2;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lub2;->a:Lumi;

    iput-object p2, p0, Lub2;->b:Landroid/content/pm/PackageManager;

    iput-object p3, p0, Lub2;->c:Li16;

    iput-object p4, p0, Lub2;->d:Lob2;

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1
    :try_end_9
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_9} :catch_35
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_9} :catch_30

    if-eqz v1, :cond_c

    move-object p0, v1

    :cond_c
    :try_start_c
    new-instance v1, Lugb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, p0}, Lugb;-><init>(Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_14} :catch_16
    .catch Ljava/net/URISyntaxException; {:try_start_c .. :try_end_14} :catch_35
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_14} :catch_30

    const/4 v1, 0x1

    goto :goto_17

    :catch_16
    const/4 v1, 0x0

    :goto_17
    if-eqz v1, :cond_28

    :try_start_19
    new-instance v1, Lugb;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, p0}, Lugb;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lugb;->b()Lugb;

    move-result-object p0

    iget-object p0, p0, Lugb;->a:Ljava/lang/String;

    return-object p0

    :cond_28
    const-string p0, "Failed requirement."

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_30
    .catch Ljava/net/URISyntaxException; {:try_start_19 .. :try_end_30} :catch_35
    .catch Ljava/lang/IllegalStateException; {:try_start_19 .. :try_end_30} :catch_30

    :catch_30
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v0

    :catch_35
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v0
.end method
