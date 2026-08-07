.class public Ll/c1$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/c1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static INSTANCE:Ll/c1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/c1;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c1$b;->INSTANCE:Ll/c1;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Ll/c1;
    .locals 1

    .line 1
    sget-object v0, Ll/c1$b;->INSTANCE:Ll/c1;

    .line 2
    .line 3
    return-object v0
.end method
