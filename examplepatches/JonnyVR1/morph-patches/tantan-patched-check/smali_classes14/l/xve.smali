.class public final synthetic Ll/xve;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:Ll/mwe;


# direct methods
.method public synthetic constructor <init>(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xve;->a:Ll/mwe;

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xve;->a:Ll/mwe;

    invoke-static {p0, p1, p2}, Ll/mwe;->n(Ll/mwe;Landroid/view/View;Z)V

    return-void
.end method
