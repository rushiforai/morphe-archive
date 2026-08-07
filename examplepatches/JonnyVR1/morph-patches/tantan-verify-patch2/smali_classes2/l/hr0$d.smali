.class public Ll/hr0$d;
.super Ll/hr0$c;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hr0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final b:Landroid/view/Choreographer;

.field public final c:Landroid/view/Choreographer$FrameCallback;


# direct methods
.method public constructor <init>(Ll/hr0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hr0$c;-><init>(Ll/hr0$a;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/hr0$d;->b:Landroid/view/Choreographer;

    .line 9
    .line 10
    new-instance p1, Ll/hr0$d$a;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/hr0$d$a;-><init>(Ll/hr0$d;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/hr0$d;->c:Landroid/view/Choreographer$FrameCallback;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hr0$d;->b:Landroid/view/Choreographer;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hr0$d;->c:Landroid/view/Choreographer$FrameCallback;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
