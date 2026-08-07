.class public Ll/by10$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/by10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static final a:Ll/by10;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/by10;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/by10;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/by10$b;->a:Ll/by10;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a()Ll/by10;
    .locals 1

    .line 1
    sget-object v0, Ll/by10$b;->a:Ll/by10;

    return-object v0
.end method
