.class public final Ll/sov0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ll/ebt0;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/ebt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sov0;->a:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-object p2, p0, Ll/sov0;->b:Ll/ebt0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->B2:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    iget-object v0, p0, Ll/sov0;->b:Ll/ebt0;

    .line 26
    .line 27
    iget-object p0, p0, Ll/sov0;->a:Ljava/util/concurrent/Executor;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/ebt0;->k()Ll/hpr;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Ll/rov0;->a:Ll/rov0;

    .line 34
    .line 35
    invoke-static {v0, v1, p0}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method
