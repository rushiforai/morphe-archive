.class public final Ll/cvk0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cvk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final a:Ll/cvk0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/cvk0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/cvk0;-><init>(Ll/dvk0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/cvk0$a;->a:Ll/cvk0;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a()Ll/cvk0;
    .locals 1

    .line 1
    sget-object v0, Ll/cvk0$a;->a:Ll/cvk0;

    return-object v0
.end method
