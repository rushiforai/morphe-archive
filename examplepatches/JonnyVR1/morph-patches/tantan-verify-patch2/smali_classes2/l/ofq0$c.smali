.class public Ll/ofq0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lml0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ofq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ofq0;


# direct methods
.method public constructor <init>(Ll/ofq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ofq0$c;->a:Ll/ofq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$c;->a:Ll/ofq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
