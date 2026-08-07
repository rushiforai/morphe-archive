.class public final synthetic Ll/nfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/pfk;


# direct methods
.method public synthetic constructor <init>(Ll/pfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nfk;->a:Ll/pfk;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nfk;->a:Ll/pfk;

    invoke-static {p0}, Ll/pfk;->c(Ll/pfk;)V

    return-void
.end method
