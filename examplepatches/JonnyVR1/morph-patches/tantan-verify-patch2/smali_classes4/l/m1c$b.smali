.class public Ll/m1c$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m1c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static INSTANCE:Ll/m1c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/m1c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/m1c;-><init>(Ll/m1c$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/m1c$b;->INSTANCE:Ll/m1c;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/m1c;
    .locals 1

    .line 1
    sget-object v0, Ll/m1c$b;->INSTANCE:Ll/m1c;

    .line 2
    .line 3
    return-object v0
.end method
