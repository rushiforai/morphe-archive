.class Ll/n410$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qpr;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410;->g1()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$g;->a:Ll/n410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;IJ)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/n410$g;->a:Ll/n410;

    .line 2
    .line 3
    invoke-static {v0}, Ll/n410;->X(Ll/n410;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    new-instance v2, Ll/ad60;

    .line 9
    .line 10
    invoke-direct {v2, p1}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;)V

    .line 11
    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    const/4 v8, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    move v3, p2

    .line 17
    move-wide v6, p3

    .line 18
    invoke-virtual/range {v2 .. v8}, Ll/ad60;->d(IIIJI)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/n410$g;->a:Ll/n410;

    .line 22
    .line 23
    iget-object p0, p0, Ll/n410;->n:Lcom/immomo/moment/mediautils/e;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Lcom/immomo/moment/mediautils/e;->c(Ll/ad60;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    move-object p0, v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit v1

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method
