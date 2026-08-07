.class public final Ll/dmr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[Ll/inr0;

.field public b:Ll/sqr0;
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
    new-array p1, p1, [Ll/inr0;

    .line 5
    .line 6
    iput-object p1, p0, Ll/dmr0;->a:[Ll/inr0;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/dmr0;->d:I

    .line 10
    .line 11
    return-void
.end method
