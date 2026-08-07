.class public Lcom/tencent/liteav/beauty/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static A:Z

.field private static B:Z

.field private static C:Z

.field private static D:Z

.field private static E:Z

.field private static a:Lcom/tencent/liteav/beauty/a;

.field private static b:Landroid/content/Context;

.field private static c:Z

.field private static d:Z

.field private static e:Z

.field private static f:Z

.field private static g:Z

.field private static h:Z

.field private static i:Z

.field private static j:Z

.field private static k:Z

.field private static l:Z

.field private static m:Z

.field private static n:Z

.field private static o:Z

.field private static p:Z

.field private static q:Z

.field private static r:Z

.field private static s:Z

.field private static t:Z

.field private static u:Z

.field private static v:Z

.field private static w:Z

.field private static x:Z

.field private static y:Z

.field private static z:Z


# instance fields
.field private F:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "ReportDuaManage"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static a()Lcom/tencent/liteav/beauty/a;
    .locals 1

    .line 35
    sget-object v0, Lcom/tencent/liteav/beauty/a;->a:Lcom/tencent/liteav/beauty/a;

    if-nez v0, :cond_0

    .line 36
    new-instance v0, Lcom/tencent/liteav/beauty/a;

    invoke-direct {v0}, Lcom/tencent/liteav/beauty/a;-><init>()V

    sput-object v0, Lcom/tencent/liteav/beauty/a;->a:Lcom/tencent/liteav/beauty/a;

    .line 37
    :cond_0
    sget-object v0, Lcom/tencent/liteav/beauty/a;->a:Lcom/tencent/liteav/beauty/a;

    return-object v0
.end method

.method private h()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "resetReportState"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->c:Z

    .line 10
    .line 11
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->d:Z

    .line 12
    .line 13
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->e:Z

    .line 14
    .line 15
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->f:Z

    .line 16
    .line 17
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->g:Z

    .line 18
    .line 19
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->h:Z

    .line 20
    .line 21
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->i:Z

    .line 22
    .line 23
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->j:Z

    .line 24
    .line 25
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->k:Z

    .line 26
    .line 27
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->l:Z

    .line 28
    .line 29
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->m:Z

    .line 30
    .line 31
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->n:Z

    .line 32
    .line 33
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->C:Z

    .line 34
    .line 35
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->o:Z

    .line 36
    .line 37
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->p:Z

    .line 38
    .line 39
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->q:Z

    .line 40
    .line 41
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->r:Z

    .line 42
    .line 43
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->s:Z

    .line 44
    .line 45
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->t:Z

    .line 46
    .line 47
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->u:Z

    .line 48
    .line 49
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->v:Z

    .line 50
    .line 51
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->w:Z

    .line 52
    .line 53
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->x:Z

    .line 54
    .line 55
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->y:Z

    .line 56
    .line 57
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->z:Z

    .line 58
    .line 59
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->A:Z

    .line 60
    .line 61
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->B:Z

    .line 62
    .line 63
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->D:Z

    .line 64
    .line 65
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->E:Z

    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/a;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sput-object p1, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 9
    .line 10
    sget-boolean p1, Lcom/tencent/liteav/beauty/a;->c:Z

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 15
    .line 16
    const-string p1, "reportSDKInit"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    const-string v0, "reportSDKInit!"

    .line 25
    .line 26
    const/16 v1, 0x4b1

    .line 27
    .line 28
    invoke-static {p0, v1, p1, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    const/4 p0, 0x1

    .line 32
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->c:Z

    .line 33
    .line 34
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/tencent/liteav/beauty/a;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "reportBeautyDua"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 13
    .line 14
    const/16 v1, 0x4b2

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v1, v2, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->d:Z

    .line 22
    .line 23
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/tencent/liteav/beauty/a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "reportWhiteDua"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 13
    .line 14
    const/16 v1, 0x4b3

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v1, v2, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->e:Z

    .line 22
    .line 23
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/tencent/liteav/beauty/a;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "reportRuddyDua"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 13
    .line 14
    const/16 v1, 0x4b4

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v1, v2, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->f:Z

    .line 22
    .line 23
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/tencent/liteav/beauty/a;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "reportFilterImageDua"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 13
    .line 14
    const/16 v1, 0x4b8

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v1, v2, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->j:Z

    .line 22
    .line 23
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/tencent/liteav/beauty/a;->l:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "reportSharpDua"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 13
    .line 14
    const/16 v1, 0x4ba

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v1, v2, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->l:Z

    .line 22
    .line 23
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/tencent/liteav/beauty/a;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/beauty/a;->F:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "reportWarterMarkDua"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/tencent/liteav/beauty/a;->b:Landroid/content/Context;

    .line 13
    .line 14
    const/16 v1, 0x4bc

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p0, v1, v2, v0}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    sput-boolean p0, Lcom/tencent/liteav/beauty/a;->n:Z

    .line 22
    .line 23
    return-void
.end method
