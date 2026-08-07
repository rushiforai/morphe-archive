.class public Ll/m4g0$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m4g0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# static fields
.field private static final INSTANCE:Ll/m4g0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/m4g0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/m4g0;-><init>(Ll/m4g0$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/m4g0$e;->INSTANCE:Ll/m4g0;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/m4g0;
    .locals 1

    .line 1
    sget-object v0, Ll/m4g0$e;->INSTANCE:Ll/m4g0;

    .line 2
    .line 3
    return-object v0
.end method
