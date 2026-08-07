.class public Ll/sw0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sw0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static INSTANCE:Ll/sw0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/sw0;

    .line 2
    .line 3
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, v2}, Ll/sw0;-><init>(Landroid/content/Context;Ll/sw0$a;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/sw0$b;->INSTANCE:Ll/sw0;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a()Ll/sw0;
    .locals 1

    .line 1
    sget-object v0, Ll/sw0$b;->INSTANCE:Ll/sw0;

    .line 2
    .line 3
    return-object v0
.end method
