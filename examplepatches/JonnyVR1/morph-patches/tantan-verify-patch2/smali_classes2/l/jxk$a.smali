.class Ll/jxk$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jxk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static a:Ll/jxk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/jxk;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/jxk;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/jxk$a;->a:Ll/jxk;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Ll/jxk;
    .locals 1

    .line 1
    sget-object v0, Ll/jxk$a;->a:Ll/jxk;

    .line 2
    .line 3
    return-object v0
.end method
