.class public final Lsi5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lua6;


# instance fields
.field public final synthetic a:B

.field public b:J

.field public final c:Ljava/lang/Object;

.field public final synthetic d:Lxi5;


# direct methods
.method public constructor <init>(Lxi5;B)V
    .registers 3

    iput-byte p2, p0, Lsi5;->a:B

    packed-switch p2, :pswitch_data_20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsi5;->d:Lxi5;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsi5;->c:Ljava/lang/Object;

    return-void

    :pswitch_12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsi5;->d:Lxi5;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsi5;->c:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_12
    .end packed-switch
.end method


# virtual methods
.method public final d(Lta6;)V
    .registers 9

    iget-byte v0, p0, Lsi5;->a:B

    const-wide/16 v1, 0x0

    packed-switch v0, :pswitch_data_30

    check-cast p1, Lwi5;

    iget-object v0, p0, Lsi5;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_c
    iget-wide v3, p1, Lwi5;->d:J

    iget-wide v5, p0, Lsi5;->b:J

    add-long/2addr v3, v5

    iput-wide v3, p1, Lwi5;->d:J

    iput-wide v1, p0, Lsi5;->b:J

    monitor-exit v0

    return-void

    :goto_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_c .. :try_end_18} :catchall_19

    throw p0

    :catchall_19
    move-exception p0

    goto :goto_17

    :pswitch_1b
    check-cast p1, Lri5;

    iget-object v0, p0, Lsi5;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_20
    iget-wide v3, p1, Lri5;->d:J

    iget-wide v5, p0, Lsi5;->b:J

    add-long/2addr v3, v5

    iput-wide v3, p1, Lri5;->d:J

    iput-wide v1, p0, Lsi5;->b:J

    monitor-exit v0

    return-void

    :goto_2b
    monitor-exit v0
    :try_end_2c
    .catchall {:try_start_20 .. :try_end_2c} :catchall_2d

    throw p0

    :catchall_2d
    move-exception p0

    goto :goto_2b

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method

.method public final e(Ljava/util/GregorianCalendar;)Lta6;
    .registers 2

    iget-byte p0, p0, Lsi5;->a:B

    packed-switch p0, :pswitch_data_12

    new-instance p0, Lwi5;

    invoke-direct {p0, p1}, Lta6;-><init>(Ljava/util/Calendar;)V

    return-object p0

    :pswitch_b
    new-instance p0, Lri5;

    invoke-direct {p0, p1}, Lta6;-><init>(Ljava/util/Calendar;)V

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method

.method public final f(Ljava/lang/String;)Lta6;
    .registers 8

    iget-byte p0, p0, Lsi5;->a:B

    const/4 v0, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-string v4, "/"

    packed-switch p0, :pswitch_data_54

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lwi5;

    aget-object v3, p0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aget-object v2, p0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    aget-object v1, p0, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-direct {p1, v3, v2, v1}, Lta6;-><init>(III)V

    iput-wide v4, p1, Lwi5;->d:J

    return-object p1

    :pswitch_2f
    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lri5;

    aget-object v3, p0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    aget-object v2, p0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    aget-object v1, p0, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-direct {p1, v3, v2, v1}, Lta6;-><init>(III)V

    iput-wide v4, p1, Lri5;->d:J

    return-object p1

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method

.method public final i(Lta6;)Ljava/lang/String;
    .registers 7

    iget-byte p0, p0, Lsi5;->a:B

    const-string v0, "/"

    packed-switch p0, :pswitch_data_5e

    check-cast p1, Lwi5;

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget p0, p1, Lta6;->a:I

    iget v1, p1, Lta6;->b:I

    iget v2, p1, Lta6;->c:I

    iget-wide v3, p1, Lwi5;->d:J

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_32
    check-cast p1, Lri5;

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget p0, p1, Lta6;->a:I

    iget v1, p1, Lta6;->b:I

    iget v2, p1, Lta6;->c:I

    iget-wide v3, p1, Lri5;->d:J

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
