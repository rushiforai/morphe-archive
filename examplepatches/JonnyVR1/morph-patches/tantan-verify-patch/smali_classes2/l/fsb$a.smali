.class public Ll/fsb$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x0l0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fsb;->a(Ll/a7h0;Ll/gqy;Ll/mpy$a;ZZLl/hsb$b;)Ll/hsb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/x0l0<",
        "Ll/db5;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/fsb;


# direct methods
.method public constructor <init>(Ll/fsb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fsb$a;->a:Ll/fsb;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/db5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fsb$a;->b(Ll/db5;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Ll/db5;)I
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/db5;->getSizeInBytes()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
