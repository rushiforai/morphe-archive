.class public Ll/zxq0$b;
.super Ll/zxq0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zxq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zxq0$c;-><init>(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "VmSize:"

    .line 5
    .line 6
    iput-object p1, p0, Ll/zxq0$c;->b:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "\\s+"

    .line 9
    .line 10
    iput-object p1, p0, Ll/zxq0$c;->c:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, -0x1

    .line 13
    iput p1, p0, Ll/zxq0$c;->d:I

    .line 14
    .line 15
    return-void
.end method
