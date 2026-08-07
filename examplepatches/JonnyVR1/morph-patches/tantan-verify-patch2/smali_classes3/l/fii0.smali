.class public final synthetic Ll/fii0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fii0;->a:Ll/xc00;

    iput-object p2, p0, Ll/fii0;->b:Lv/navigationbar/VNavigationBar;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fii0;->a:Ll/xc00;

    iget-object p0, p0, Ll/fii0;->b:Lv/navigationbar/VNavigationBar;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Ll/kii0;->L(Ll/xc00;Lv/navigationbar/VNavigationBar;Landroid/graphics/Bitmap;)V

    return-void
.end method
