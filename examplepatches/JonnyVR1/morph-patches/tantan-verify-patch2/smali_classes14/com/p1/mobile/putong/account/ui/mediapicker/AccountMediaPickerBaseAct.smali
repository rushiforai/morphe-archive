.class public Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;
.super Lcom/p1/mobile/putong/account/AccountBaseAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct$a;
    }
.end annotation


# static fields
.field public static h:Ljava/lang/String; = "selected_image"

.field public static i:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Picture;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public static j:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Video;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public static k:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/Media;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public c:Ll/uyh0;

.field public d:Ll/uyh0;

.field public e:Ll/uyh0;

.field public f:I

.field public g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ys;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ys;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->i:Ll/qcj;

    .line 7
    .line 8
    new-instance v0, Ll/zs;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/zs;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->j:Ll/qcj;

    .line 14
    .line 15
    new-instance v0, Ll/at;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/at;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->k:Ll/qcj;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/AccountBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uyh0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/uyh0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->c:Ll/uyh0;

    .line 10
    .line 11
    new-instance v0, Ll/uyh0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/uyh0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->d:Ll/uyh0;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->c:Ll/uyh0;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->e:Ll/uyh0;

    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->f:I

    .line 24
    .line 25
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/mediapicker/AccountMediaPickerBaseAct;->g:Ljava/util/Map;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/data/Video;)Ljava/io/File;
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/data/Picture;)Ljava/io/File;
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/data/Media;)Ljava/io/File;
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
