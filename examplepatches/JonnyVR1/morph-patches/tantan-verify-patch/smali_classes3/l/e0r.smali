.class public final synthetic Ll/e0r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/f0r;


# direct methods
.method public synthetic constructor <init>(Ll/f0r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0r;->a:Ll/f0r;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e0r;->a:Ll/f0r;

    invoke-static {p0}, Ll/f0r;->a(Ll/f0r;)V

    return-void
.end method
