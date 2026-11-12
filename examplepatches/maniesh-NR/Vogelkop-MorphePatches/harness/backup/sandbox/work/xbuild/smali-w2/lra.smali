.class public final Llra;
.super Lqff;
.source "SourceFile"


# instance fields
.field public final a:Lz4o;

.field public volatile b:Lorb;

.field public volatile c:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lz4o;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llra;->a:Lz4o;

    return-void
.end method


# virtual methods
.method public final b(Lpzh;[B)V
    .registers 4

    :try_start_0
    new-instance p1, Lorb;

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p2}, Ljava/lang/String;-><init>([B)V

    invoke-direct {p1, v0}, Lorb;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Llra;->b:Lorb;
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_c} :catch_11
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_c} :catch_d

    return-void

    :catch_d
    move-exception p1

    iput-object p1, p0, Llra;->c:Ljava/lang/Throwable;

    goto :goto_14

    :catch_11
    move-exception p1

    iput-object p1, p0, Llra;->c:Ljava/lang/Throwable;

    :goto_14
    return-void
.end method

.method public final c(Ljava/lang/String;Z)V
    .registers 3

    iget-object p0, p0, Llra;->a:Lz4o;

    invoke-virtual {p0, p1, p2}, Lz4o;->Y(Ljava/lang/String;Z)V

    return-void
.end method

.method public final d(Lpzh;[B)Z
    .registers 3

    iget-object p0, p0, Llra;->a:Lz4o;

    invoke-virtual {p0, p1, p2}, Lz4o;->Z(Lpzh;[B)Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final e(Lpzh;[B)V
    .registers 5

    iget-object p2, p0, Llra;->c:Ljava/lang/Throwable;

    const/4 v0, 0x0

    if-eqz p2, :cond_11

    iget-object p1, p0, Llra;->a:Lz4o;

    iget-object p0, p0, Llra;->c:Ljava/lang/Throwable;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0, v0}, Lz4o;->Y(Ljava/lang/String;Z)V

    return-void

    :cond_11
    iget-object p2, p0, Llra;->b:Lorb;

    if-nez p2, :cond_1e

    iget-object p0, p0, Llra;->a:Lz4o;

    const/4 p1, 0x1

    const-string p2, "handleData never called"

    invoke-virtual {p0, p2, p1}, Lz4o;->Y(Ljava/lang/String;Z)V

    return-void

    :cond_1e
    :try_start_1e
    iget-object p2, p0, Llra;->a:Lz4o;

    iget-object v1, p0, Llra;->b:Lorb;

    invoke-virtual {p2, p1, v1}, Lz4o;->c0(Lpzh;Lorb;)V
    :try_end_25
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_25} :catch_26

    return-void

    :catch_26
    move-exception p1

    iget-object p0, p0, Llra;->a:Lz4o;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lz4o;->Y(Ljava/lang/String;Z)V

    return-void
.end method

.method public final f(Lpzh;[B)Z
    .registers 3

    iget-object p0, p0, Llra;->a:Lz4o;

    invoke-virtual {p0, p1, p2}, Lz4o;->b0(Lpzh;[B)Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method
