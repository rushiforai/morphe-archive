.class public Ll/ofq0$b;
.super Ll/kml0;
.source "SourceFile"


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
    iput-object p1, p0, Ll/ofq0$b;->a:Ll/ofq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kml0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$b;->a:Ll/ofq0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/ofq0;->z:Ll/iml0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ofq0;->f:Landroidx/appcompat/widget/ActionBarContainer;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
