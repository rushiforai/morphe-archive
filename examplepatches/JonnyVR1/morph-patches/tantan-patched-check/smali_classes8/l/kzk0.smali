.class public final synthetic Ll/kzk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VScroll_Fill_BottomAligned;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lv/VScroll_Fill_BottomAligned;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kzk0;->a:Lv/VScroll_Fill_BottomAligned;

    iput-object p2, p0, Ll/kzk0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kzk0;->a:Lv/VScroll_Fill_BottomAligned;

    iget-object p0, p0, Ll/kzk0;->b:Landroid/view/View;

    invoke-static {v0, p0}, Lv/VScroll_Fill_BottomAligned;->e(Lv/VScroll_Fill_BottomAligned;Landroid/view/View;)V

    return-void
.end method
