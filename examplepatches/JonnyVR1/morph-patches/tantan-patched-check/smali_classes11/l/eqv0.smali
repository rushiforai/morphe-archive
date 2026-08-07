.class public final Ll/eqv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/muu0;

.field public final c:Ljava/lang/String;

.field public final d:Ll/o7w0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/muu0;Ll/o7w0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eqv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/eqv0;->b:Ll/muu0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/eqv0;->d:Ll/o7w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/eqv0;->c:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/fqv0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/eqv0;->d:Ll/o7w0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/eqv0;->b:Ll/muu0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->f:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/eqv0;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v0, p0}, Ll/muu0;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v1}, Ll/muu0;->a()Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/fqv0;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0}, Ll/fqv0;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x11

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/dqv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dqv0;-><init>(Ll/eqv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/eqv0;->a:Ll/xvw0;

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
