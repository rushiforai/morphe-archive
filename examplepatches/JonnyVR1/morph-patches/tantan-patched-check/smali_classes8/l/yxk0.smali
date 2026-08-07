.class public final synthetic Ll/yxk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lv/VFrame_Shadow;


# direct methods
.method public synthetic constructor <init>(Lv/VFrame_Shadow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yxk0;->a:Lv/VFrame_Shadow;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yxk0;->a:Lv/VFrame_Shadow;

    invoke-static {p0, p1}, Lv/VFrame_Shadow;->a(Lv/VFrame_Shadow;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
