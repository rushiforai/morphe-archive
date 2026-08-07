.class public Ll/eul0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eul0;->N0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/eul0;


# direct methods
.method public constructor <init>(Ll/eul0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eul0$c;->a:Ll/eul0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eul0$c;->a:Ll/eul0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/eul0;->F(Ll/eul0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/eul0$c;->a:Ll/eul0;

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/eul0;->Q(Ll/eul0;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
