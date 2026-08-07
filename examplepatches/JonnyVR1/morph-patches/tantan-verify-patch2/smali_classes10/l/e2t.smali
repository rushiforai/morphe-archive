.class public final synthetic Ll/e2t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/f2t;


# direct methods
.method public synthetic constructor <init>(Ll/f2t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e2t;->a:Ll/f2t;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e2t;->a:Ll/f2t;

    invoke-static {p0}, Ll/f2t;->a(Ll/f2t;)V

    return-void
.end method
