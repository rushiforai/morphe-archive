.class public Lv/navigationbar/VNavigationTabLayout$TabView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/navigationbar/VNavigationTabLayout$TabView;->j(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lv/navigationbar/VNavigationTabLayout$TabView;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$a;->b:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 2
    .line 3
    iput-object p2, p0, Lv/navigationbar/VNavigationTabLayout$TabView$a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView$a;->b:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 10
    .line 11
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView$a;->a:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p1, p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->h(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
