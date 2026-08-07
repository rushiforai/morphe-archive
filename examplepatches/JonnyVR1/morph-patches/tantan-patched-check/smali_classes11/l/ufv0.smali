.class public final synthetic Ll/ufv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/zfv0;

.field public final synthetic b:Ll/hpr;

.field public final synthetic c:Ll/hpr;

.field public final synthetic d:Ll/b7w0;

.field public final synthetic e:Ll/q6w0;

.field public final synthetic f:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Ll/zfv0;Ll/hpr;Ll/hpr;Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ufv0;->a:Ll/zfv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ufv0;->b:Ll/hpr;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ufv0;->c:Ll/hpr;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ufv0;->d:Ll/b7w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/ufv0;->e:Ll/q6w0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/ufv0;->f:Lorg/json/JSONObject;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ufv0;->a:Ll/zfv0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ufv0;->b:Ll/hpr;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ufv0;->c:Ll/hpr;

    .line 6
    .line 7
    iget-object v3, p0, Ll/ufv0;->d:Ll/b7w0;

    .line 8
    .line 9
    iget-object v4, p0, Ll/ufv0;->e:Ll/q6w0;

    .line 10
    .line 11
    iget-object v5, p0, Ll/ufv0;->f:Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/zfv0;->c(Ll/hpr;Ll/hpr;Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)Ll/ilu0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
