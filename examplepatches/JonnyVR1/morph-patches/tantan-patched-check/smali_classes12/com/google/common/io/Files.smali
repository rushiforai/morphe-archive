.class public final Lcom/google/common/io/Files;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/Files$FilePredicate;,
        Lcom/google/common/io/Files$b;,
        Lcom/google/common/io/Files$c;
    }
.end annotation


# static fields
.field public static final a:Ll/ceg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ceg0<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/common/io/Files$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/common/io/Files$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/common/io/Files;->a:Ll/ceg0;

    .line 7
    .line 8
    return-void
.end method

.method public static varargs a(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;)Ll/kr3;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/common/io/Files$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/io/Files$b;-><init>(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;Ll/tki;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static b(Ljava/io/File;)Ll/lr3;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/common/io/Files$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/common/io/Files$c;-><init>(Ljava/io/File;Ll/tki;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static c(Ljava/io/File;Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    const-string v1, "Source %s and destination %s must be different"

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Ll/xn80;->l(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Lcom/google/common/io/Files;->b(Ljava/io/File;)Ll/lr3;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    new-array v0, v0, [Lcom/google/common/io/FileWriteMode;

    .line 18
    .line 19
    invoke-static {p1, v0}, Lcom/google/common/io/Files;->a(Ljava/io/File;[Lcom/google/common/io/FileWriteMode;)Ll/kr3;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/lr3;->a(Ll/kr3;)J

    .line 24
    .line 25
    .line 26
    return-void
.end method
