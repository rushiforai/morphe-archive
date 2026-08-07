.class public final Ll/nsg0;
.super Ll/vog0;
.source "SourceFile"


# static fields
.field public static final f:Ljava/lang/String;


# instance fields
.field public final e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/nsg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/nsg0;->f:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/olg0;)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, Ll/vog0;-><init>(Ll/olg0;)V

    .line 2
    .line 3
    .line 4
    const/16 p2, 0x14

    .line 5
    .line 6
    iput p2, p0, Ll/vog0;->a:I

    .line 7
    .line 8
    new-instance p2, Ljava/io/File;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "sud/mgp/sudapp"

    .line 15
    .line 16
    invoke-direct {p2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/nsg0;->e:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final b(Ll/uug0;Ljava/io/File;)Ljava/lang/Object;
    .locals 2

    .line 1
    const-string p2, "SUDRealSudGamePackageManager"

    .line 2
    .line 3
    const-string v0, "processDownloadPackage"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Ll/mlg0;

    .line 9
    .line 10
    invoke-direct {p2}, Ll/mlg0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p1, Ll/uug0;->f:J

    .line 18
    .line 19
    iget-object v0, p0, Ll/vog0;->b:Ll/olg0;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/olg0;->g(Ll/uug0;)V

    .line 22
    .line 23
    .line 24
    iget-wide v0, p1, Ll/uug0;->a:J

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Ll/vog0;->e(J)V

    .line 27
    .line 28
    .line 29
    return-object p2
.end method

.method public final h(Ljava/lang/String;Ljava/lang/Object;Ll/bxg0;Ll/klg0;)V
    .locals 1

    .line 1
    instance-of p0, p2, Ll/mlg0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string p2, "onDownloadSuccess path="

    .line 8
    .line 9
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "SUDRealSudGamePackageManager"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Ll/nsg0;->f:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p0, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p4, p1, p3}, Ll/klg0;->b(Ljava/lang/String;Ll/bxg0;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const/4 p0, -0x1

    .line 46
    const-string p1, "extendInfo empty"

    .line 47
    .line 48
    invoke-interface {p4, p0, p1, p3}, Ll/klg0;->e(ILjava/lang/String;Ll/bxg0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final k(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsg0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
