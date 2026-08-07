.class public final synthetic Ll/pai0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mai0$c;

.field public final synthetic b:Ll/bqq;

.field public final synthetic c:Landroid/graphics/Bitmap;

.field public final synthetic d:Lv/navigationbar/VNavigationBar;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/mai0$c;Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pai0;->a:Ll/mai0$c;

    iput-object p2, p0, Ll/pai0;->b:Ll/bqq;

    iput-object p3, p0, Ll/pai0;->c:Landroid/graphics/Bitmap;

    iput-object p4, p0, Ll/pai0;->d:Lv/navigationbar/VNavigationBar;

    iput-object p5, p0, Ll/pai0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pai0;->a:Ll/mai0$c;

    iget-object v1, p0, Ll/pai0;->b:Ll/bqq;

    iget-object v2, p0, Ll/pai0;->c:Landroid/graphics/Bitmap;

    iget-object v3, p0, Ll/pai0;->d:Lv/navigationbar/VNavigationBar;

    iget-object p0, p0, Ll/pai0;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/mai0$c;->b(Ll/mai0$c;Ll/bqq;Landroid/graphics/Bitmap;Lv/navigationbar/VNavigationBar;Ljava/lang/String;)V

    return-void
.end method
