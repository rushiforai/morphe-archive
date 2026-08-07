.class public final synthetic Ll/y64;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/d74;


# direct methods
.method public synthetic constructor <init>(Ll/d74;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y64;->a:Ll/d74;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y64;->a:Ll/d74;

    invoke-static {p0}, Ll/d74;->T3(Ll/d74;)V

    return-void
.end method
