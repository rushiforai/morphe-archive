.class public Ll/kkn0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/kkn0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/kkn0;


# direct methods
.method public constructor <init>(Ll/kkn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kkn0$a;->a:Ll/kkn0;

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
    iget-object v0, p0, Ll/kkn0$a;->a:Ll/kkn0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/kkn0;->M(Ll/kkn0;)Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/kkn0$a;->a:Ll/kkn0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/kkn0;->M(Ll/kkn0;)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
