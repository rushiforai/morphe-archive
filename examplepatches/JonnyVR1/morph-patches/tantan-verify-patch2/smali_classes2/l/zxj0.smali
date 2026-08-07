.class public Ll/zxj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y4d0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/y4d0<",
        "TZ;TZ;>;"
    }
.end annotation


# static fields
.field private static final a:Ll/zxj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zxj0<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/zxj0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zxj0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/zxj0;->a:Ll/zxj0;

    .line 7
    .line 8
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

.method public static b()Ll/y4d0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/y4d0<",
            "TZ;TZ;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zxj0;->a:Ll/zxj0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(Ll/u3d0;Ll/u560;)Ll/u3d0;
    .locals 0
    .param p1    # Ll/u3d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u3d0<",
            "TZ;>;",
            "Ll/u560;",
            ")",
            "Ll/u3d0<",
            "TZ;>;"
        }
    .end annotation

    .line 1
    return-object p1
.end method
