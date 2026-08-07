.class public final Ll/fsy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/zoy0;

.field public b:Z

.field public final c:Ll/esy0;

.field public d:Ll/hsy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/xry0;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zoy0;->c:Ll/zoy0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/fsy0;->a:Ll/zoy0;

    .line 7
    .line 8
    sget-object v0, Ll/esy0;->a:Ll/esy0;

    .line 9
    .line 10
    iput-object v0, p0, Ll/fsy0;->c:Ll/esy0;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Ll/fsy0;)Ll/zoy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsy0;->a:Ll/zoy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/fsy0;)Ll/esy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsy0;->c:Ll/esy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/fsy0;)Ll/hsy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsy0;->d:Ll/hsy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/fsy0;)Ll/xry0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsy0;->e:Ll/xry0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final c(Ll/zoy0;)Ll/fsy0;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fsy0;->a:Ll/zoy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d([Ll/wsu0;)Ll/fsy0;
    .locals 1

    .line 1
    new-instance v0, Ll/hsy0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/hsy0;-><init>([Ll/wsu0;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/fsy0;->d:Ll/hsy0;

    .line 7
    .line 8
    return-object p0
.end method

.method public final e()Ll/jty0;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/fsy0;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 6
    .line 7
    .line 8
    iput-boolean v1, p0, Ll/fsy0;->b:Z

    .line 9
    .line 10
    iget-object v0, p0, Ll/fsy0;->d:Ll/hsy0;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ll/hsy0;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    new-array v1, v1, [Ll/wsu0;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ll/hsy0;-><init>([Ll/wsu0;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/fsy0;->d:Ll/hsy0;

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/fsy0;->e:Ll/xry0;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Ll/xry0;

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ll/xry0;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/fsy0;->e:Ll/xry0;

    .line 35
    .line 36
    :cond_1
    new-instance v0, Ll/jty0;

    .line 37
    .line 38
    invoke-direct {v0, p0, v1}, Ll/jty0;-><init>(Ll/fsy0;Ll/ity0;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method
