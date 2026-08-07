.class public Ll/yfw$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yfw;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/yfw;


# direct methods
.method public constructor <init>(Ll/yfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yfw$f;->a:Ll/yfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yfw$f;->a:Ll/yfw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/yfw;->b:Landroidx/core/widget/NestedScrollView;

    .line 4
    .line 5
    const/16 v0, 0x82

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroidx/core/widget/NestedScrollView;->q(I)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
