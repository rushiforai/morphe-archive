.class public Ll/cf80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/fyb;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/cf80;->a:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/fyb;)Ll/cf80;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cf80;->e:Ll/fyb;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(F)Ll/cf80;
    .locals 0

    .line 1
    iput p1, p0, Ll/cf80;->c:F

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/cf80;
    .locals 0

    .line 1
    iput p1, p0, Ll/cf80;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/util/ArrayList;)Ll/cf80;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ll/cf80;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cf80;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
