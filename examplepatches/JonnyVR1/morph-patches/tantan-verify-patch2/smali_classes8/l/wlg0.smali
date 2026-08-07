.class public final Ll/wlg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t4f$b;


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "LoggingEventListener"

    .line 5
    .line 6
    iput-object v0, p0, Ll/wlg0;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final create(Ll/ry3;)Ll/t4f;
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Ll/bxg0;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/bxg0;

    .line 12
    .line 13
    invoke-interface {p1}, Ll/ry3;->request()Ll/x1d0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-class v1, Ll/t4f;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ll/x1d0;->j(Ljava/lang/Class;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ll/t4f;

    .line 24
    .line 25
    new-instance v1, Ll/wsg0;

    .line 26
    .line 27
    invoke-direct {v1, v0, p1}, Ll/wsg0;-><init>(Ll/bxg0;Ll/t4f;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/wlg0;->a:Ljava/lang/String;

    .line 31
    .line 32
    iget-object p1, v1, Ll/wsg0;->a:Ll/cpg0;

    .line 33
    .line 34
    iput-object p0, p1, Ll/cpg0;->a:Ljava/lang/String;

    .line 35
    .line 36
    return-object v1
.end method
