.class Ll/c950$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/c950;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static a:Ll/c950;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/c950;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/c950;-><init>(Ll/c950$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/c950$b;->a:Ll/c950;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/c950;
    .locals 1

    .line 1
    sget-object v0, Ll/c950$b;->a:Ll/c950;

    .line 2
    .line 3
    return-object v0
.end method
