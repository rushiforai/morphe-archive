.class public final Ltech/sud/runtime/component/g/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ltech/sud/runtime/component/g/f;

.field public static final b:Ltech/sud/runtime/component/g/f;


# instance fields
.field private final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ltech/sud/runtime/component/g/f;

    .line 2
    .line 3
    const-string v1, "tableDirectory"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ltech/sud/runtime/component/g/f;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ltech/sud/runtime/component/g/f;->a:Ltech/sud/runtime/component/g/f;

    .line 9
    .line 10
    new-instance v0, Ltech/sud/runtime/component/g/f;

    .line 11
    .line 12
    const-string v1, "name"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ltech/sud/runtime/component/g/f;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ltech/sud/runtime/component/g/f;->b:Ltech/sud/runtime/component/g/f;

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltech/sud/runtime/component/g/f;->c:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ljava/lang/String;)Ltech/sud/runtime/component/g/f;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ltech/sud/runtime/component/g/f;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/g/f;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    const-string p0, "A TrueType font table name must not be null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 16
    iget-object p0, p0, Ltech/sud/runtime/component/g/f;->c:Ljava/lang/String;

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Ltech/sud/runtime/component/g/f;

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
    check-cast p1, Ltech/sud/runtime/component/g/f;

    .line 12
    .line 13
    iget-object p0, p0, Ltech/sud/runtime/component/g/f;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Ltech/sud/runtime/component/g/f;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/g/f;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/g/f;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
