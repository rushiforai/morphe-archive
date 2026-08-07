.class public Ll/tzs$b;
.super Ll/cej;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tzs;->k()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tzs;


# direct methods
.method public constructor <init>(Ll/tzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tzs$b;->a:Ll/tzs;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cej;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d(Landroid/view/MotionEvent;)V
    .locals 0
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/tzs$b;->a:Ll/tzs;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tzs;->d:Landroid/view/GestureDetector;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method
