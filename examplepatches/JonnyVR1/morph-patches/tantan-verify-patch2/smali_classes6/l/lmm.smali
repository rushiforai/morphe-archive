.class public final synthetic Ll/lmm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/omm;


# direct methods
.method public synthetic constructor <init>(Ll/omm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lmm;->a:Ll/omm;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lmm;->a:Ll/omm;

    invoke-static {p0}, Ll/omm;->c(Ll/omm;)V

    return-void
.end method
