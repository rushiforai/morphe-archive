.class public Ll/yil0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yil0;->t3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/yil0;


# direct methods
.method public constructor <init>(Ll/yil0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yil0$a;->a:Ll/yil0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/yil0$a;->a:Ll/yil0;

    .line 2
    .line 3
    invoke-static {p1, p3}, Ll/yil0;->H0(Ll/yil0;I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/yil0$a;->a:Ll/yil0;

    .line 7
    .line 8
    invoke-static {p0, p4}, Ll/yil0;->G0(Ll/yil0;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    return-void
.end method
