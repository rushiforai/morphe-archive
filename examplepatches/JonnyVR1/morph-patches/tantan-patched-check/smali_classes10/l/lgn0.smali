.class public final synthetic Ll/lgn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Ll/ngn0;


# direct methods
.method public synthetic constructor <init>(Ll/ngn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lgn0;->a:Ll/ngn0;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lgn0;->a:Ll/ngn0;

    invoke-static {p0}, Ll/ngn0;->A(Ll/ngn0;)V

    return-void
.end method
