.class Ll/arx$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/arx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field private static a:Ll/arx;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/arx;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/arx;-><init>(Ll/arx$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/arx$c;->a:Ll/arx;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/arx;
    .locals 1

    .line 1
    sget-object v0, Ll/arx$c;->a:Ll/arx;

    .line 2
    .line 3
    return-object v0
.end method
