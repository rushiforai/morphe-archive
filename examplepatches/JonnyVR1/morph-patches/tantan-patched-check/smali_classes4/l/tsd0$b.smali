.class public Ll/tsd0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tsd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static INSTANCE:Ll/tsd0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/tsd0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/tsd0;-><init>(Ll/tsd0$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/tsd0$b;->INSTANCE:Ll/tsd0;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/tsd0;
    .locals 1

    .line 1
    sget-object v0, Ll/tsd0$b;->INSTANCE:Ll/tsd0;

    .line 2
    .line 3
    return-object v0
.end method
