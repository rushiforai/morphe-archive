.class Ll/nvq0$a;
.super Ll/tsq0$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nvq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic c:Ll/nvq0;


# direct methods
.method public constructor <init>(Ll/nvq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nvq0$a;->c:Ll/nvq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tsq0$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "10052"

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 1

    .line 1
    const-string v0, "exec== mUploadJob"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/nvq0$a;->c:Ll/nvq0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/nvq0;->e(Ll/nvq0;)Ll/wvq0;

    .line 9
    .line 10
    .line 11
    return-void
.end method
