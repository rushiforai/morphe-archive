.class public final Ll/tpu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ll/fks0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/tpu0;->a:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/tpu0;->b:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Ll/tpu0;->c:Ljava/lang/String;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Ll/tpu0;->d:Ll/fks0;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ll/fks0;)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Ll/tpu0;->a:I

    iput-object p1, p0, Ll/tpu0;->b:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Ll/tpu0;->c:Ljava/lang/String;

    iput-object p2, p0, Ll/tpu0;->d:Ll/fks0;

    return-void
.end method
