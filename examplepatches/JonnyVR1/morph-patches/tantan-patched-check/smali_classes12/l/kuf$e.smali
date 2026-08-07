.class Ll/kuf$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kuf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# static fields
.field private static INSTANCE:Ll/kuf;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/kuf;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/kuf;-><init>(Ll/kuf$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/kuf$e;->INSTANCE:Ll/kuf;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/kuf;
    .locals 1

    .line 1
    sget-object v0, Ll/kuf$e;->INSTANCE:Ll/kuf;

    .line 2
    .line 3
    return-object v0
.end method
