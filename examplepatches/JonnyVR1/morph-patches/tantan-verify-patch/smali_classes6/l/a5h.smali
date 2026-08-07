.class public final synthetic Ll/a5h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Lv/VImage;


# direct methods
.method public synthetic constructor <init>(Lv/VImage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a5h;->a:Lv/VImage;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5h;->a:Lv/VImage;

    invoke-static {p0}, Ll/b5h;->c(Lv/VImage;)V

    return-void
.end method
