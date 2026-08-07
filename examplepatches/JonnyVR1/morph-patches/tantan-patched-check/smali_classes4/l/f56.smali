.class public final synthetic Ll/f56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/g56;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/g56;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f56;->a:Ll/g56;

    iput-object p2, p0, Ll/f56;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f56;->a:Ll/g56;

    iget-object p0, p0, Ll/f56;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/g56;->O(Ll/g56;Landroid/view/View;)V

    return-void
.end method
