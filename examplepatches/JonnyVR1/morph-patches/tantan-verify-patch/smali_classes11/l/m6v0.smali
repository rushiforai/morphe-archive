.class public final synthetic Ll/m6v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kbw0;


# instance fields
.field public final synthetic a:Lorg/json/JSONObject;

.field public final synthetic b:Ll/s4t0;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;Ll/s4t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m6v0;->a:Lorg/json/JSONObject;

    .line 5
    .line 6
    iput-object p2, p0, Ll/m6v0;->b:Ll/s4t0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, Ljava/io/InputStream;

    .line 2
    .line 3
    new-instance v0, Ll/t7v0;

    .line 4
    .line 5
    new-instance v1, Ljava/io/InputStreamReader;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/h8v0;->a(Ljava/io/Reader;)Ll/h8v0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v1, p0, Ll/m6v0;->a:Lorg/json/JSONObject;

    .line 15
    .line 16
    iget-object p0, p0, Ll/m6v0;->b:Ll/s4t0;

    .line 17
    .line 18
    invoke-direct {v0, p1, v1, p0}, Ll/t7v0;-><init>(Ll/h8v0;Lorg/json/JSONObject;Ll/s4t0;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method
