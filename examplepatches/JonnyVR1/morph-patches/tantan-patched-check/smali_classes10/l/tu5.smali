.class public final synthetic Ll/tu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/widget/PopupWindow;

.field public final synthetic b:Ll/uu5;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/PopupWindow;Ll/uu5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tu5;->a:Landroid/widget/PopupWindow;

    iput-object p2, p0, Ll/tu5;->b:Ll/uu5;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tu5;->a:Landroid/widget/PopupWindow;

    iget-object p0, p0, Ll/tu5;->b:Ll/uu5;

    invoke-static {v0, p0}, Ll/uu5;->b(Landroid/widget/PopupWindow;Ll/uu5;)V

    return-void
.end method
