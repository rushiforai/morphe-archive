.class public final Ll/xdj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kul;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xdj$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0018\u0000 \u00112\u00020\u0001:\u0001\u000bB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0006J\u001f\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0003\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/xdj;",
        "Ll/kul;",
        "<init>",
        "()V",
        "",
        "getX",
        "()F",
        "getY",
        "x",
        "y",
        "",
        "a",
        "(FF)V",
        "",
        "hasConfig",
        "()Z",
        "clear",
        "Companion",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/xdj$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static a:F

.field public static b:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/xdj$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/xdj$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/xdj;->Companion:Ll/xdj$a;

    .line 8
    .line 9
    const/high16 v0, -0x40800000    # -1.0f

    .line 10
    .line 11
    sput v0, Ll/xdj;->a:F

    .line 12
    .line 13
    sput v0, Ll/xdj;->b:F

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(FF)V
    .locals 0

    .line 1
    sput p1, Ll/xdj;->a:F

    .line 2
    .line 3
    sput p2, Ll/xdj;->b:F

    .line 4
    .line 5
    return-void
.end method

.method public clear()V
    .locals 0

    .line 1
    const/high16 p0, -0x40800000    # -1.0f

    .line 2
    .line 3
    sput p0, Ll/xdj;->a:F

    .line 4
    .line 5
    sput p0, Ll/xdj;->b:F

    .line 6
    .line 7
    return-void
.end method

.method public getX()F
    .locals 0

    .line 1
    sget p0, Ll/xdj;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public getY()F
    .locals 0

    .line 1
    sget p0, Ll/xdj;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public hasConfig()Z
    .locals 1

    .line 1
    sget p0, Ll/xdj;->a:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpl-float p0, p0, v0

    .line 5
    .line 6
    if-ltz p0, :cond_0

    .line 7
    .line 8
    sget p0, Ll/xdj;->b:F

    .line 9
    .line 10
    cmpl-float p0, p0, v0

    .line 11
    .line 12
    if-ltz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
