.class public final Ll/b8s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/f8s0;


# direct methods
.method public constructor <init>(Ll/f8s0;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/b8s0;->a:Landroid/view/View;

    .line 2
    .line 3
    iput-object p1, p0, Ll/b8s0;->b:Ll/f8s0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b8s0;->b:Ll/f8s0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b8s0;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/f8s0;->c(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
