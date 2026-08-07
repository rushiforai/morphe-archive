.class Ll/b7y$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b7y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field private static a:Ll/b7y;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/b7y;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/b7y;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/b7y$c;->a:Ll/b7y;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Ll/b7y;
    .locals 1

    .line 1
    sget-object v0, Ll/b7y$c;->a:Ll/b7y;

    .line 2
    .line 3
    return-object v0
.end method
