.class public final synthetic Ll/toh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/fph;


# direct methods
.method public synthetic constructor <init>(Ll/fph;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/toh;->a:Ll/fph;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/toh;->a:Ll/fph;

    invoke-static {p0}, Ll/fph;->x(Ll/fph;)V

    return-void
.end method
