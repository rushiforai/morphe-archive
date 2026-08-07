.class public Ll/w5j$a;
.super Ll/ygj0$f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w5j;->v(Ljava/lang/Object;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/graphics/Rect;

.field public final synthetic b:Ll/w5j;


# direct methods
.method public constructor <init>(Ll/w5j;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w5j$a;->b:Ll/w5j;

    .line 2
    .line 3
    iput-object p2, p0, Ll/w5j$a;->a:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/ygj0$f;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/ygj0;)Landroid/graphics/Rect;
    .locals 0
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/w5j$a;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method
