.class public final Ll/yw5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# instance fields
.field public final a:Ll/rg50;


# direct methods
.method public constructor <init>(Ll/rg50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yw5;->a:Ll/rg50;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public intercept(Ll/azm$a;)Ll/i5d0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Ll/tmc0;

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/tmc0;->request()Ll/x1d0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/tmc0;->d()Ll/oij0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0}, Ll/x1d0;->g()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-string v3, "GET"

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    xor-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    invoke-virtual {v1, p1, v2}, Ll/oij0;->k(Ll/azm$a;Z)Ll/n6f;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, v0, v1, p1}, Ll/tmc0;->c(Ll/x1d0;Ll/oij0;Ll/n6f;)Ll/i5d0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
