.class Ll/du10$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c5g0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/du10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field final synthetic a:Ll/du10;


# direct methods
.method private constructor <init>(Ll/du10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10$h;->a:Ll/du10;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/du10;Ll/du10$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/du10$h;-><init>(Ll/du10;)V

    return-void
.end method


# virtual methods
.method public playStateChanged(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/du10$h;->a:Ll/du10;

    .line 2
    .line 3
    invoke-static {v0}, Ll/du10;->X(Ll/du10;)Ll/c5g0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/du10$h;->a:Ll/du10;

    .line 10
    .line 11
    invoke-static {p0}, Ll/du10;->X(Ll/du10;)Ll/c5g0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Ll/c5g0$a;->playStateChanged(IZ)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
