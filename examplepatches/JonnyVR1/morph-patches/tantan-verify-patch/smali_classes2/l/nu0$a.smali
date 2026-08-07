.class public Ll/nu0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lzq$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nu0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/nu0;


# direct methods
.method public constructor <init>(Ll/nu0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nu0$a;->a:Ll/nu0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public superDispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nu0$a;->a:Ll/nu0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nu0;->superDispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
