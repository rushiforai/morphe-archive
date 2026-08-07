.class public final synthetic Ll/ym80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/zm80;


# direct methods
.method public synthetic constructor <init>(Ll/zm80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ym80;->a:Ll/zm80;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ym80;->a:Ll/zm80;

    invoke-static {p0}, Ll/zm80;->K3(Ll/zm80;)V

    return-void
.end method
