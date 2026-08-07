.class public interface abstract Ll/esf;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:Ll/esf;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/dsf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/dsf;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/esf;->a:Ll/esf;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c()[Ll/zrf;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/zrf;

    .line 3
    .line 4
    return-object v0
.end method


# virtual methods
.method public a(Landroid/net/Uri;Ljava/util/Map;)[Ll/zrf;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)[",
            "Ll/zrf;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/esf;->b()[Ll/zrf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract b()[Ll/zrf;
.end method
