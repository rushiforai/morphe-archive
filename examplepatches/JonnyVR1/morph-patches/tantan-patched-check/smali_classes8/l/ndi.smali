.class public final synthetic Ll/ndi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ll/pdi;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/pdi;ILcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ndi;->a:Ll/pdi;

    iput p2, p0, Ll/ndi;->b:I

    iput-object p3, p0, Ll/ndi;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ndi;->a:Ll/pdi;

    iget v1, p0, Ll/ndi;->b:I

    iget-object p0, p0, Ll/ndi;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1, p2}, Ll/pdi;->a(Ll/pdi;ILcom/p1/mobile/android/app/Act;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
