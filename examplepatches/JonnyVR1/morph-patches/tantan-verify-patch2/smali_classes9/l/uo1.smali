.class public final synthetic Ll/uo1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(ZLandroid/widget/TextView;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/uo1;->a:Z

    iput-object p2, p0, Ll/uo1;->b:Landroid/widget/TextView;

    iput-object p3, p0, Ll/uo1;->c:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/uo1;->a:Z

    iget-object v1, p0, Ll/uo1;->b:Landroid/widget/TextView;

    iget-object p0, p0, Ll/uo1;->c:Landroid/widget/FrameLayout;

    invoke-static {v0, v1, p0}, Ll/yo1;->e(ZLandroid/widget/TextView;Landroid/widget/FrameLayout;)V

    return-void
.end method
