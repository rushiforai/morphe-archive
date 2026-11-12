.class public final Lxg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbtj;


# instance fields
.field public final a:Llld;

.field public b:Lo93;

.field public c:Lmim;

.field public d:Z

.field public final e:Ljl4;


# direct methods
.method public constructor <init>()V
    .registers 3

    new-instance v0, Llld;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Llld;-><init>(B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lxg5;->a:Llld;

    new-instance v0, Ljl4;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Ljl4;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lxg5;->e:Ljl4;

    return-void
.end method


# virtual methods
.method public final I()V
    .registers 5

    iget-object v0, p0, Lxg5;->b:Lo93;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, 0x1

    iput-boolean v1, p0, Lxg5;->d:Z

    const/4 v1, 0x0

    :try_start_9
    sget-object v2, Lhjm;->b:Lhjm;

    const/4 v3, 0x3

    invoke-virtual {v0, v2, v3}, Lo93;->b(Lhjm;I)V
    :try_end_f
    .catchall {:try_start_9 .. :try_end_f} :catchall_12

    iput-boolean v1, p0, Lxg5;->d:Z

    return-void

    :catchall_12
    move-exception v0

    iput-boolean v1, p0, Lxg5;->d:Z

    throw v0
.end method

.method public final z(Lo93;Lmim;)I
    .registers 6

    instance-of v0, p1, Lglj;

    if-eqz v0, :cond_8

    move-object v0, p1

    check-cast v0, Lglj;

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    if-nez v0, :cond_d

    const/4 p0, 0x3

    return p0

    :cond_d
    iput-object p2, p0, Lxg5;->c:Lmim;

    iget-object p2, p0, Lxg5;->b:Lo93;

    if-eqz p2, :cond_15

    const/4 p0, 0x2

    return p0

    :cond_15
    iput-object p1, p0, Lxg5;->b:Lo93;

    iget-object p2, p0, Lxg5;->e:Ljl4;

    iput-object p2, p1, Lo93;->b:Lkjm;

    new-instance p2, Laof;

    invoke-virtual {v0}, Lglj;->g()Lgsj;

    move-result-object v0

    new-instance v1, Lwg5;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lwg5;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, v0, v1}, Laof;-><init>(Lgsj;Lwg5;)V

    iget-object p0, p0, Lxg5;->a:Llld;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lt0g;

    invoke-virtual {p0, p2}, Lt0g;->setValue(Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method
