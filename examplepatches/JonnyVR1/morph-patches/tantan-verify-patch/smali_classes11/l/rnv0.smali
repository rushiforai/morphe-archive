.class public final Ll/rnv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/hpr;

.field public final b:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Ll/hpr;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rnv0;->a:Ll/hpr;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rnv0;->b:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rnv0;->a:Ll/hpr;

    .line 2
    .line 3
    sget-object v1, Ll/qnv0;->a:Ll/qnv0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/rnv0;->b:Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
