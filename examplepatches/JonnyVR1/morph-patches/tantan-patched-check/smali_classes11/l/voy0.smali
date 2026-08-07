.class public final Ll/voy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/voy0;


# instance fields
.field public final a:Ll/toy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/voy0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/voy0;-><init>()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Ll/voy0;

    .line 14
    .line 15
    sget-object v1, Ll/toy0;->b:Ll/toy0;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/voy0;-><init>(Ll/toy0;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    sput-object v0, Ll/voy0;->b:Ll/voy0;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mpw0;->a:I

    .line 5
    .line 6
    const/16 v1, 0x1f

    .line 7
    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/voy0;->a:Ll/toy0;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/media/metrics/LogSessionId;)V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1f
    .end annotation

    .line 21
    new-instance v0, Ll/toy0;

    invoke-direct {v0, p1}, Ll/toy0;-><init>(Landroid/media/metrics/LogSessionId;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ll/voy0;->a:Ll/toy0;

    return-void
.end method

.method public constructor <init>(Ll/toy0;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/voy0;->a:Ll/toy0;

    return-void
.end method


# virtual methods
.method public final a()Landroid/media/metrics/LogSessionId;
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x1f
    .end annotation

    .line 1
    iget-object p0, p0, Ll/voy0;->a:Ll/toy0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/toy0;->a:Landroid/media/metrics/LogSessionId;

    .line 7
    .line 8
    return-object p0
.end method
