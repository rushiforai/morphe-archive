.class public abstract Landroidx/core/app/JobIntentService$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/app/JobIntentService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "h"
.end annotation


# instance fields
.field public final a:Landroid/content/ComponentName;

.field public b:Z

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/core/app/JobIntentService$h;->a:Landroid/content/ComponentName;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/content/Intent;)V
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/core/app/JobIntentService$h;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Landroidx/core/app/JobIntentService$h;->b:Z

    .line 7
    .line 8
    iput p1, p0, Landroidx/core/app/JobIntentService$h;->c:I

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v0, p0, Landroidx/core/app/JobIntentService$h;->c:I

    .line 12
    .line 13
    if-ne v0, p1, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string v0, " is different than previous "

    .line 17
    .line 18
    iget p0, p0, Landroidx/core/app/JobIntentService$h;->c:I

    .line 19
    .line 20
    const-string v1, "Given job ID "

    .line 21
    .line 22
    invoke-static {v1, p1, v0, p0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method
