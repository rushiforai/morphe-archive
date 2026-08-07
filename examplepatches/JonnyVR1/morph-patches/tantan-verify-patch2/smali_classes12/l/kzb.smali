.class public Ll/kzb;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kzb$b;
    }
.end annotation


# instance fields
.field private a:Ll/txl;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/kzb$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kzb;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/kzb;
    .locals 1

    .line 1
    invoke-static {}, Ll/kzb$b;->a()Ll/kzb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static b()Ll/txl;
    .locals 1

    .line 1
    invoke-static {}, Ll/kzb;->a()Ll/kzb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/kzb;->a:Ll/txl;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/zph0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/zph0;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    invoke-static {}, Ll/kzb;->a()Ll/kzb;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Ll/kzb;->a:Ll/txl;

    .line 20
    .line 21
    return-object v0
.end method
