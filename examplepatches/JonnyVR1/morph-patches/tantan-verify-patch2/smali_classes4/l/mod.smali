.class public Ll/mod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x2f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mod$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()Ll/mod;
    .locals 1

    .line 1
    invoke-static {}, Ll/mod$a;->a()Ll/mod;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "default"

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ll/m4f;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/gson/Gson;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/gson/Gson;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/m4f;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getFormat()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {v0, v1}, Ll/m4f;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ll/m4f;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method
