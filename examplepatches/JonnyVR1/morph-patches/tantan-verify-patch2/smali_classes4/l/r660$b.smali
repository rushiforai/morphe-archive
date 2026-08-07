.class public Ll/r660$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r660;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static INSTANCE:Ll/r660;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/r660;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/r660;-><init>(Ll/r660$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/r660$b;->INSTANCE:Ll/r660;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/r660;
    .locals 1

    .line 1
    sget-object v0, Ll/r660$b;->INSTANCE:Ll/r660;

    .line 2
    .line 3
    return-object v0
.end method
