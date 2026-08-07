.class public final synthetic Ll/whm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kkm;

.field public final synthetic b:Ljava/lang/Exception;

.field public final synthetic c:Z

.field public final synthetic d:Landroid/graphics/Bitmap;

.field public final synthetic e:Ll/kkm$b;


# direct methods
.method public synthetic constructor <init>(Ll/kkm;Ljava/lang/Exception;ZLandroid/graphics/Bitmap;Ll/kkm$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/whm;->a:Ll/kkm;

    iput-object p2, p0, Ll/whm;->b:Ljava/lang/Exception;

    iput-boolean p3, p0, Ll/whm;->c:Z

    iput-object p4, p0, Ll/whm;->d:Landroid/graphics/Bitmap;

    iput-object p5, p0, Ll/whm;->e:Ll/kkm$b;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/whm;->a:Ll/kkm;

    iget-object v1, p0, Ll/whm;->b:Ljava/lang/Exception;

    iget-boolean v2, p0, Ll/whm;->c:Z

    iget-object v3, p0, Ll/whm;->d:Landroid/graphics/Bitmap;

    iget-object p0, p0, Ll/whm;->e:Ll/kkm$b;

    invoke-static {v0, v1, v2, v3, p0}, Ll/xhm;->a(Ll/kkm;Ljava/lang/Exception;ZLandroid/graphics/Bitmap;Ll/kkm$b;)V

    return-void
.end method
