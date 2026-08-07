.class public final synthetic Ll/qsh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/ush;


# direct methods
.method public synthetic constructor <init>(Ll/ush;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qsh;->a:Ll/ush;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsh;->a:Ll/ush;

    invoke-static {p0}, Ll/ush;->x(Ll/ush;)V

    return-void
.end method
