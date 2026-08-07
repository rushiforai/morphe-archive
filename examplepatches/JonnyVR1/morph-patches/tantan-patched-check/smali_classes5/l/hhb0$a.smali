.class public Ll/hhb0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hhb0;->K()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/hhb0;


# direct methods
.method public constructor <init>(Ll/hhb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hhb0$a;->a:Ll/hhb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hhb0$a;->a:Ll/hhb0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hhb0;->l(Ll/hhb0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/hhb0$a;->a:Ll/hhb0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/hhb0;->o:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
