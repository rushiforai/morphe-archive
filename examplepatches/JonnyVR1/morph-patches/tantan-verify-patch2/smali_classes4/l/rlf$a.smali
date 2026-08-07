.class public Ll/rlf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rlf;->c0(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rlf;


# direct methods
.method public constructor <init>(Ll/rlf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rlf$a;->a:Ll/rlf;

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
    .locals 8

    .line 1
    iget-object v0, p0, Ll/rlf$a;->a:Ll/rlf;

    .line 2
    .line 3
    iget-object v0, v0, Ll/rlf;->p:Lv/VEditText;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/rlf$a;->a:Ll/rlf;

    .line 10
    .line 11
    iget-object v0, p0, Ll/rlf;->p:Lv/VEditText;

    .line 12
    .line 13
    const/4 p0, 0x2

    .line 14
    new-array v7, p0, [F

    .line 15
    .line 16
    fill-array-data v7, :array_0

    .line 17
    .line 18
    .line 19
    const-string v1, "alpha"

    .line 20
    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    const-wide/16 v4, 0x1e

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
