.class public Ll/nwq0$c;
.super Ll/nwq0$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nwq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic f:Ll/nwq0;


# direct methods
.method public constructor <init>(Ll/nwq0;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/nwq0$c;->f:Ll/nwq0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/nwq0$e;-><init>(Ll/nwq0;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "Total FD Count:"

    .line 7
    .line 8
    iput-object v0, p0, Ll/nwq0$e;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Ll/nwq0;->c(Ll/nwq0;)Ll/nwq0$b;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/nwq0$b;->c()Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/j5r0;->C(Ljava/io/File;)Ljava/io/File;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/nwq0$e;->a:Ljava/io/File;

    .line 23
    .line 24
    const-string p1, ":"

    .line 25
    .line 26
    iput-object p1, p0, Ll/nwq0$e;->c:Ljava/lang/String;

    .line 27
    .line 28
    const/4 p1, -0x2

    .line 29
    iput p1, p0, Ll/nwq0$e;->d:I

    .line 30
    .line 31
    return-void
.end method
