.class public final Ll/ka5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# static fields
.field public static a:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public intercept(Ll/azm$a;)Ll/i5d0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/azm$a;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p0}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "Putong-Client-Version-Expires-At"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "-1"

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p1, "Putong-Client-Latest-Version-Path"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sput-object p1, Ll/ka5;->a:Ljava/lang/String;

    .line 31
    .line 32
    new-instance p1, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Lcom/tantanapp/common/network/ApiExcep$ClientExpired;-><init>(Ll/i5d0;)V

    .line 35
    .line 36
    .line 37
    throw p1
.end method
