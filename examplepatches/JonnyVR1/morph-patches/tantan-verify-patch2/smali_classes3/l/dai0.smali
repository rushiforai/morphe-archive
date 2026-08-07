.class public final synthetic Ll/dai0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bqq;

.field public final synthetic b:Lv/navigationbar/VNavigationBar;


# direct methods
.method public synthetic constructor <init>(Ll/bqq;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dai0;->a:Ll/bqq;

    iput-object p2, p0, Ll/dai0;->b:Lv/navigationbar/VNavigationBar;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dai0;->a:Ll/bqq;

    iget-object p0, p0, Ll/dai0;->b:Lv/navigationbar/VNavigationBar;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Ll/mai0;->K(Ll/bqq;Lv/navigationbar/VNavigationBar;Landroid/graphics/Bitmap;)V

    return-void
.end method
