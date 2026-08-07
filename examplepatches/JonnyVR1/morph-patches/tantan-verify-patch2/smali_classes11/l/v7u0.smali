.class public final Ll/v7u0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Ll/v2u0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/n6u0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/n6u0;-><init>(Ll/hau0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/v7u0;->a:Ll/v2u0;

    .line 8
    .line 9
    return-void
.end method

.method public static a()Ll/v2u0;
    .locals 1

    .line 1
    sget-object v0, Ll/v7u0;->a:Ll/v2u0;

    .line 2
    .line 3
    return-object v0
.end method
