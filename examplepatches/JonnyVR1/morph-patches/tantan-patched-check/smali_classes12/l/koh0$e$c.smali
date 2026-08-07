.class Ll/koh0$e$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/koh0$e;->e(FDLl/aje;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:D

.field final synthetic c:Ll/aje;

.field final synthetic d:F

.field final synthetic e:Ll/koh0$e;


# direct methods
.method public constructor <init>(Ll/koh0$e;IDLl/aje;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/koh0$e$c;->e:Ll/koh0$e;

    .line 2
    .line 3
    iput p2, p0, Ll/koh0$e$c;->a:I

    .line 4
    .line 5
    iput-wide p3, p0, Ll/koh0$e$c;->b:D

    .line 6
    .line 7
    iput-object p5, p0, Ll/koh0$e$c;->c:Ll/aje;

    .line 8
    .line 9
    iput p6, p0, Ll/koh0$e$c;->d:F

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/koh0$e$c;->e:Ll/koh0$e;

    .line 2
    .line 3
    invoke-static {v0}, Ll/koh0$e;->a(Ll/koh0$e;)Ll/loh0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Ll/koh0$e$c;->a:I

    .line 8
    .line 9
    iget-wide v2, p0, Ll/koh0$e$c;->b:D

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3}, Ll/loh0;->d(ID)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/koh0$e$c;->c:Ll/aje;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/aje;->b()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget v1, p0, Ll/koh0$e$c;->a:I

    .line 21
    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget p0, p0, Ll/koh0$e$c;->d:F

    .line 27
    .line 28
    const/high16 v2, 0x3f800000    # 1.0f

    .line 29
    .line 30
    add-float/2addr p0, v2

    .line 31
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "SDKResource"

    .line 40
    .line 41
    const-string v1, "%s process: %d  itemPercent: %s"

    .line 42
    .line 43
    invoke-static {v0, v1, p0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
