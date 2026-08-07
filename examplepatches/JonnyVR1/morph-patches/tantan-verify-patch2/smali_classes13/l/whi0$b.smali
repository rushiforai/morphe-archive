.class public Ll/whi0$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/whi0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static final INSTANCE:Ll/whi0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/whi0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/whi0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/whi0$b;->INSTANCE:Ll/whi0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a()Ll/whi0;
    .locals 1

    .line 1
    sget-object v0, Ll/whi0$b;->INSTANCE:Ll/whi0;

    return-object v0
.end method
