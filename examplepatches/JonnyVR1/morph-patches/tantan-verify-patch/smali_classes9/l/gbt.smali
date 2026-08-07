.class public final synthetic Ll/gbt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hbt;


# direct methods
.method public synthetic constructor <init>(Ll/hbt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gbt;->a:Ll/hbt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gbt;->a:Ll/hbt;

    check-cast p1, Landroid/view/WindowManager$LayoutParams;

    invoke-static {p0, p1}, Ll/hbt;->a(Ll/hbt;Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method
