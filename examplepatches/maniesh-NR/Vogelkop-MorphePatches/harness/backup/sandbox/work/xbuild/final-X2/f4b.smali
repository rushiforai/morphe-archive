.class public final Lf4b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:J

.field public static final synthetic f:I


# instance fields
.field public final a:Lvg4;

.field public final b:Ld4b;

.field public final c:Ld4b;

.field public final d:Ld4b;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x1e

    sget-object v1, Lun7;->h:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lf4b;->e:J

    return-void
.end method

.method public constructor <init>(Lvg4;Ld4b;Ld4b;Ld4b;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf4b;->a:Lvg4;

    iput-object p2, p0, Lf4b;->b:Ld4b;

    iput-object p3, p0, Lf4b;->c:Ld4b;

    iput-object p4, p0, Lf4b;->d:Ld4b;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 5

    iget-object p0, p0, Lf4b;->c:Ld4b;

    invoke-virtual {p0}, Ld4b;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-lez p0, :cond_27

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long p0, v2, v0

    if-ltz p0, :cond_27

    sub-long/2addr v2, v0

    sget-wide v0, Lf4b;->e:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    cmp-long p0, v2, v0

    if-ltz p0, :cond_27

    const/4 p0, 0x1

    return p0

    :cond_27
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Z
    .registers 2

    iget-object v0, p0, Lf4b;->a:Lvg4;

    invoke-virtual {v0}, Lvg4;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lf4b;->b:Ld4b;

    invoke-virtual {v0}, Ld4b;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lf4b;->d:Ld4b;

    invoke-virtual {v0}, Ld4b;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lf4b;->a()Z

    move-result p0

    if-eqz p0, :cond_32

    const/4 p0, 0x1

    return p0

    :cond_32
    const/4 p0, 0x0

    return p0
.end method
