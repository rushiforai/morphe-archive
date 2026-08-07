.class public final synthetic Ll/ckf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ekf;


# direct methods
.method public synthetic constructor <init>(Ll/ekf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ckf;->a:Ll/ekf;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ckf;->a:Ll/ekf;

    invoke-static {p0, p1}, Ll/ekf;->r(Ll/ekf;Landroid/view/View;)V

    return-void
.end method
