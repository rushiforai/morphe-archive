.class public final Ll/ayj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tgj0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/tgj0<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final b:Ll/tgj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tgj0<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ayj0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ayj0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ayj0;->b:Ll/tgj0;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()Ll/ayj0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/ayj0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/ayj0;->b:Ll/tgj0;

    .line 2
    .line 3
    check-cast v0, Ll/ayj0;

    .line 4
    .line 5
    return-object v0
.end method


# virtual methods
.method public a(Ljava/security/MessageDigest;)V
    .locals 0
    .param p1    # Ljava/security/MessageDigest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public b(Landroid/content/Context;Ll/u3d0;II)Ll/u3d0;
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/u3d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/u3d0<",
            "TT;>;II)",
            "Ll/u3d0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    return-object p2
.end method
