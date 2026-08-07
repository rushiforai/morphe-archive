.class public Ll/cwh0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cwh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static a:Ll/lxf;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/lxf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lxf;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cwh0$a;->a:Ll/lxf;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Ll/lxf;
    .locals 1

    .line 1
    sget-object v0, Ll/cwh0$a;->a:Ll/lxf;

    .line 2
    .line 3
    return-object v0
.end method
