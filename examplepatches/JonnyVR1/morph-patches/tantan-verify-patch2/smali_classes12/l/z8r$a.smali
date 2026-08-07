.class public Ll/z8r$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z8r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/Float;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ljava/util/concurrent/Executor;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/z8r;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/z8r;

    .line 2
    .line 3
    iget-object v1, p0, Ll/z8r$a;->a:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object p0, p0, Ll/z8r$a;->b:Ljava/util/concurrent/Executor;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p0, v2}, Ll/z8r;-><init>(Ljava/lang/Float;Ljava/util/concurrent/Executor;Ll/ear0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method
