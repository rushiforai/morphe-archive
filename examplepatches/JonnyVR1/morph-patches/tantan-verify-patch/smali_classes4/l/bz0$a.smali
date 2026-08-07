.class Ll/bz0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bz0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static final INSTANCE:Ll/bz0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/bz0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bz0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/bz0$a;->INSTANCE:Ll/bz0;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Ll/bz0;
    .locals 1

    .line 1
    sget-object v0, Ll/bz0$a;->INSTANCE:Ll/bz0;

    .line 2
    .line 3
    return-object v0
.end method
