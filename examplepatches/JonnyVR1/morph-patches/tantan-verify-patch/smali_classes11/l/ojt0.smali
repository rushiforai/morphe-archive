.class public final Ll/ojt0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/ojt0;

.field public static final c:Ljava/lang/String;

.field public static final d:Ll/mhy0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final a:Ll/akr0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/aht0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/aht0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/aht0;->e()Ll/ojt0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/ojt0;->b:Ll/ojt0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/16 v1, 0x24

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/ojt0;->c:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v0, Ll/rft0;->a:Ll/rft0;

    .line 22
    .line 23
    sput-object v0, Ll/ojt0;->d:Ll/mhy0;

    .line 24
    .line 25
    return-void
.end method

.method public synthetic constructor <init>(Ll/akr0;Ll/hit0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ojt0;->a:Ll/akr0;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/ojt0;)Ll/akr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojt0;->a:Ll/akr0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Ll/ojt0;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Ll/ojt0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ojt0;->a:Ll/akr0;

    .line 14
    .line 15
    iget-object p1, p1, Ll/ojt0;->a:Ll/akr0;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/akr0;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojt0;->a:Ll/akr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/akr0;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
