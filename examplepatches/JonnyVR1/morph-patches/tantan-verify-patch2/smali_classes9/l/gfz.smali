.class public final synthetic Ll/gfz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ffz$d;

.field public final synthetic b:Landroid/graphics/Rect;

.field public final synthetic c:Landroid/view/MotionEvent;


# direct methods
.method public synthetic constructor <init>(Ll/ffz$d;Landroid/graphics/Rect;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gfz;->a:Ll/ffz$d;

    iput-object p2, p0, Ll/gfz;->b:Landroid/graphics/Rect;

    iput-object p3, p0, Ll/gfz;->c:Landroid/view/MotionEvent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gfz;->a:Ll/ffz$d;

    iget-object v1, p0, Ll/gfz;->b:Landroid/graphics/Rect;

    iget-object p0, p0, Ll/gfz;->c:Landroid/view/MotionEvent;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Ll/ffz$d;->a(Ll/ffz$d;Landroid/graphics/Rect;Landroid/view/MotionEvent;Landroid/view/View;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
