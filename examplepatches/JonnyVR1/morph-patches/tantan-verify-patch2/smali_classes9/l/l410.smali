.class public final synthetic Ll/l410;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/m410;


# direct methods
.method public synthetic constructor <init>(Ll/m410;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l410;->a:Ll/m410;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l410;->a:Ll/m410;

    invoke-static {p0}, Ll/m410;->a(Ll/m410;)V

    return-void
.end method
