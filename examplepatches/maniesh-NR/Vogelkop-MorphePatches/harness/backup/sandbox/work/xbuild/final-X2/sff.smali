.class public Lsff;
.super Lg3k;
.source "SourceFile"


# instance fields
.field public final f:Lrff;

.field public g:Z

.field public final h:Z

.field public final i:Lz7;


# direct methods
.method public constructor <init>(Lz7;Lt9f;)V
    .registers 5

    iget-object v0, p1, Lz7;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lg3k;-><init>(Ljava/lang/String;Lt9f;I)V

    new-instance p2, Lrff;

    invoke-direct {p2}, Lrff;-><init>()V

    iput-object p2, p0, Lsff;->f:Lrff;

    iput-object p1, p0, Lsff;->i:Lz7;

    iget-boolean p1, p1, Lz7;->f:Z

    iput-boolean p1, p0, Lsff;->h:Z

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/String;)V
    .registers 3

    iget-boolean v0, p0, Lsff;->g:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lsff;->g:Z

    invoke-virtual {p0, p1, v0}, Lsff;->h(Ljava/lang/String;Z)V

    return-void
.end method

.method public final d(Lpzh;[B)V
    .registers 7

    iget-boolean v0, p0, Lsff;->g:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lsff;->g:Z

    iget v1, p1, Lpzh;->d:I

    const/16 v2, 0xc8

    iget-object v3, p0, Lsff;->f:Lrff;

    if-ne v1, v2, :cond_1d

    :try_start_10
    invoke-virtual {v3, p1, p2}, Lrff;->e(Lpzh;[B)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_13} :catch_14

    return-void

    :catch_14
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lsff;->h(Ljava/lang/String;Z)V

    return-void

    :cond_1d
    const/16 v2, 0xca

    if-ne v1, v2, :cond_25

    invoke-virtual {v3, p1, p2}, Lrff;->a(Lpzh;[B)V

    return-void

    :cond_25
    const/16 v2, 0x19c

    if-ne v1, v2, :cond_2f

    invoke-virtual {v3, p1, p2}, Lrff;->f(Lpzh;[B)Z

    move-result v1

    if-nez v1, :cond_35

    :cond_2f
    invoke-virtual {v3, p1, p2}, Lrff;->d(Lpzh;[B)Z

    move-result p2

    if-eqz p2, :cond_36

    :cond_35
    return-void

    :cond_36
    iget p1, p1, Lpzh;->d:I

    const/16 p2, 0x190

    if-lt p1, p2, :cond_41

    const/16 p2, 0x1f4

    if-ge p1, p2, :cond_41

    const/4 v0, 0x0

    :cond_41
    const-string p1, "Bad response"

    invoke-virtual {p0, p1, v0}, Lsff;->h(Ljava/lang/String;Z)V

    return-void
.end method

.method public e(Lfvh;)V
    .registers 2

    iget-object p0, p0, Lsff;->i:Lz7;

    invoke-virtual {p0, p1}, Lz7;->c(Lfvh;)V

    return-void
.end method

.method public final f(Lvzh;Lpzh;)[B
    .registers 3

    invoke-virtual {p1}, Lvzh;->bytes()[B

    move-result-object p1

    iget-object p0, p0, Lsff;->f:Lrff;

    invoke-virtual {p0, p2, p1}, Lrff;->b(Lpzh;[B)V

    return-object p1
.end method

.method public h(Ljava/lang/String;Z)V
    .registers 4

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p1, :cond_6

    const-string p1, ""

    :cond_6
    iget-object p0, p0, Lsff;->f:Lrff;

    invoke-virtual {p0, p1, p2}, Lrff;->c(Ljava/lang/String;Z)V

    return-void
.end method
