.class public Ll/a210$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/a210;->h1(Landroid/view/SurfaceView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/SurfaceView;

.field public final synthetic b:Ll/a210;


# direct methods
.method public constructor <init>(Ll/a210;Landroid/view/SurfaceView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/a210$b;->b:Ll/a210;

    .line 2
    .line 3
    iput-object p2, p0, Ll/a210$b;->a:Landroid/view/SurfaceView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a210$b;->b:Ll/a210;

    .line 2
    .line 3
    invoke-virtual {p0, p3, p4}, Ll/a210;->C(II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a210$b;->b:Ll/a210;

    .line 2
    .line 3
    iget-object p0, p0, Ll/a210$b;->a:Landroid/view/SurfaceView;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Ll/a210;->j1(Landroid/view/SurfaceHolder;Landroid/view/SurfaceView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method
