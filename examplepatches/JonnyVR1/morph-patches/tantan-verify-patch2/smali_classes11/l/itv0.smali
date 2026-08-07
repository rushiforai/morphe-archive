.class public final Ll/itv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/itv0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/itv0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x1f

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/itv0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/itv0;->b:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v1, Ll/jtv0;

    .line 6
    .line 7
    invoke-direct {v1, v0, p0}, Ll/jtv0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
