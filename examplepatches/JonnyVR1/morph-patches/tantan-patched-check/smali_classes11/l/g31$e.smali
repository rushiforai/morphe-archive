.class public final Ll/g31$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g31;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation


# instance fields
.field public final a:[Ll/zej0;

.field public b:Lcom/google/android/exoplayer2/k;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array p1, p1, [Ll/zej0;

    .line 5
    .line 6
    iput-object p1, p0, Ll/g31$e;->a:[Ll/zej0;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/g31$e;->d:I

    .line 10
    .line 11
    return-void
.end method
