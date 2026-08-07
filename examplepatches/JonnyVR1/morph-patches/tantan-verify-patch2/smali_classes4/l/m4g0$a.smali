.class public Ll/m4g0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sw0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m4g0;->g(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:J

.field public final synthetic b:Ll/m4g0;


# direct methods
.method public constructor <init>(Ll/m4g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m4g0$a;->b:Ll/m4g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onBack()V
    .locals 5

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->APPQUIT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    iget-wide v3, p0, Ll/m4g0$a;->a:J

    .line 15
    .line 16
    sub-long/2addr v1, v3

    .line 17
    long-to-double v1, v1

    .line 18
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 19
    .line 20
    mul-double/2addr v1, v3

    .line 21
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    div-double/2addr v1, v3

    .line 27
    iput-wide v1, v0, Ll/q4f;->e:D

    .line 28
    .line 29
    invoke-static {v0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/i4g0;->d()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onFront()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/m4g0$a;->a:J

    .line 6
    .line 7
    new-instance p0, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->APPSTART:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 13
    .line 14
    iput-object v0, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 15
    .line 16
    invoke-static {p0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
