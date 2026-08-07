.class Ll/guq0$e;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/guq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field a:Ljava/io/File;

.field b:J

.field c:J

.field d:Lcom/apm/lite/CrashType;

.field e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/File;JLcom/apm/lite/CrashType;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/guq0$e;->c:J

    .line 7
    .line 8
    iput-object p1, p0, Ll/guq0$e;->a:Ljava/io/File;

    .line 9
    .line 10
    iput-wide p2, p0, Ll/guq0$e;->b:J

    .line 11
    .line 12
    iput-object p4, p0, Ll/guq0$e;->d:Lcom/apm/lite/CrashType;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/guq0$e;->e:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/apm/lite/CrashType;)V
    .locals 2

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Ll/guq0$e;->b:J

    iput-wide v0, p0, Ll/guq0$e;->c:J

    iput-object p1, p0, Ll/guq0$e;->a:Ljava/io/File;

    iput-object p2, p0, Ll/guq0$e;->d:Lcom/apm/lite/CrashType;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Ll/guq0$e;->e:Ljava/lang/String;

    return-void
.end method
