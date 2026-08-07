.class public Ll/r1d0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r1d0;->h(Ll/q4f;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/q4f;


# direct methods
.method public constructor <init>(Ll/q4f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r1d0$c;->a:Ll/q4f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    invoke-static {}, Ll/r1d0;->a()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ll/r1d0$c;->a:Ll/q4f;

    .line 5
    .line 6
    invoke-static {v0}, Ll/ssd0;->b(Ll/q4f;)Lorg/json/JSONObject;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/r1d0$c;->a:Ll/q4f;

    .line 11
    .line 12
    invoke-static {v1}, Ll/ssd0;->c(Ll/q4f;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {}, Ll/r1d0;->b()Ll/vpl;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    iget-object p0, p0, Ll/r1d0$c;->a:Ll/q4f;

    .line 29
    .line 30
    iget-wide v5, p0, Ll/q4f;->j:J

    .line 31
    .line 32
    const-string v7, "sc_logs"

    .line 33
    .line 34
    invoke-interface/range {v2 .. v7}, Ll/vpl;->c(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catch_0
    move-exception v0

    .line 39
    move-object p0, v0

    .line 40
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
