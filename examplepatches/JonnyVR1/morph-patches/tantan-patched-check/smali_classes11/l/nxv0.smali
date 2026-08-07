.class public final Ll/nxv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Landroid/content/Context;

.field public final c:Ll/ubs0;


# direct methods
.method public constructor <init>(Ll/ubs0;Ll/xvw0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nxv0;->c:Ll/ubs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nxv0;->a:Ll/xvw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/nxv0;->b:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x2d

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/mxv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mxv0;-><init>(Ll/nxv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/nxv0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
