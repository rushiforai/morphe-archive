.class public Ll/r230$i;
.super Ll/zq0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r230;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
.end annotation


# instance fields
.field public e:I


# direct methods
.method public constructor <init>(Ll/yq0;I)V
    .locals 0
    .param p1    # Ll/yq0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/zq0;-><init>(Ll/yq0;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/r230$i;->e:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getLoopCount()I
    .locals 0

    .line 1
    iget p0, p0, Ll/r230$i;->e:I

    .line 2
    .line 3
    return p0
.end method
