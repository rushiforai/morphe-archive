.class public Ll/ynh$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ynh;->F0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ynh;


# direct methods
.method public constructor <init>(Ll/ynh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ynh$a;->a:Ll/ynh;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ynh$a;->a:Ll/ynh;

    .line 5
    .line 6
    invoke-static {p0}, Ll/ynh;->z0(Ll/ynh;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
