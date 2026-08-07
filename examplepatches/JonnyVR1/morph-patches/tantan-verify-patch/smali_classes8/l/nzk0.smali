.class public final synthetic Ll/nzk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:Lv/VSearchBar;


# direct methods
.method public synthetic constructor <init>(Lv/VSearchBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nzk0;->a:Lv/VSearchBar;

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nzk0;->a:Lv/VSearchBar;

    invoke-static {p0, p1, p2}, Lv/VSearchBar;->a(Lv/VSearchBar;Landroid/view/View;Z)V

    return-void
.end method
