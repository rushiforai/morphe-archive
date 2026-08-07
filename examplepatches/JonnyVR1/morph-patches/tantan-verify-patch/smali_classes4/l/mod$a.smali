.class public Ll/mod$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static INSTANCE:Ll/mod;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/mod;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mod;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/mod$a;->INSTANCE:Ll/mod;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Ll/mod;
    .locals 1

    .line 1
    sget-object v0, Ll/mod$a;->INSTANCE:Ll/mod;

    .line 2
    .line 3
    return-object v0
.end method
