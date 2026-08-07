.class public Lv/VList_Horizontal$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VList_Horizontal;->n()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VList_Horizontal;


# direct methods
.method public constructor <init>(Lv/VList_Horizontal;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VList_Horizontal$a;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal$a;->a:Lv/VList_Horizontal;

    .line 2
    .line 3
    invoke-static {p0}, Lv/VList_Horizontal;->b(Lv/VList_Horizontal;)Landroid/view/GestureDetector;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
