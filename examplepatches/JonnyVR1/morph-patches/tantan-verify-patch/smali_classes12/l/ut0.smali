.class public Ll/ut0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static f:Ll/ut0;


# instance fields
.field private a:Ljavax/net/ssl/SSLSocketFactory;

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/azm;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ut0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ut0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ut0;->f:Ll/ut0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ut0;->b:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Ll/ut0;->c:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/ut0;->d:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/ut0;->e:Ljava/util/List;

    .line 18
    .line 19
    return-void
.end method

.method public static a()Ll/ut0;
    .locals 1

    .line 1
    sget-object v0, Ll/ut0;->f:Ll/ut0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/azm;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ut0;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljavax/net/ssl/SSLSocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ut0;->a:Ljavax/net/ssl/SSLSocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ut0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ut0;->d:Z

    .line 2
    .line 3
    return p0
.end method
