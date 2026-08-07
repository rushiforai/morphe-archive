.class public Ll/pt40;
.super Ll/k4;
.source "SourceFile"


# instance fields
.field public a:Ll/y4m;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/k4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xpq0;

    .line 5
    .line 6
    invoke-static {}, Ll/yge;->b()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/xpq0;-><init>(Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/pt40;->a:Ll/y4m;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Ll/y4m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pt40;->a:Ll/y4m;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;ZLl/y4m$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
