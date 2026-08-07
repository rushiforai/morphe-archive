.class Ll/b3i0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b3i0;->h(Ljava/lang/String;IIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/graphics/Bitmap;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ll/b3i0;


# direct methods
.method public constructor <init>(Ll/b3i0;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b3i0$a;->c:Ll/b3i0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/b3i0$a;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iput-object p3, p0, Ll/b3i0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b3i0$a;->c:Ll/b3i0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b3i0$a;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iget-object p0, p0, Ll/b3i0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/b3i0;->a(Ll/b3i0;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
