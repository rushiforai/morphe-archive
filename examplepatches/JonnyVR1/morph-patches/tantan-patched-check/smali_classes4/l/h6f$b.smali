.class public Ll/h6f$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h6f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static INSTANCE:Ll/h6f;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/h6f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/h6f;-><init>(Ll/h6f$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/h6f$b;->INSTANCE:Ll/h6f;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a()Ll/h6f;
    .locals 1

    .line 1
    sget-object v0, Ll/h6f$b;->INSTANCE:Ll/h6f;

    .line 2
    .line 3
    return-object v0
.end method
