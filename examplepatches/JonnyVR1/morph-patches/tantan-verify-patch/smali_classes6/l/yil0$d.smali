.class public Ll/yil0$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yil0;->T3(ZZZJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z

.field public final synthetic c:Ll/yil0;


# direct methods
.method public constructor <init>(Ll/yil0;IZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yil0$d;->c:Ll/yil0;

    .line 2
    .line 3
    iput p2, p0, Ll/yil0$d;->a:I

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/yil0$d;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/yil0$d;->c:Ll/yil0;

    .line 2
    .line 3
    iget v0, p0, Ll/yil0$d;->a:I

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/yil0$d;->b:Z

    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Ll/yil0;->R0(Ll/yil0;IZ)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/yil0$d;->c:Ll/yil0;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p0, p1}, Ll/yil0;->I0(Ll/yil0;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
