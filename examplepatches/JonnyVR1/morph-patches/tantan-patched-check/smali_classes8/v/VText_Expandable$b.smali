.class public Lv/VText_Expandable$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VText_Expandable;->onMeasure(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VText_Expandable;


# direct methods
.method public constructor <init>(Lv/VText_Expandable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VText_Expandable$b;->a:Lv/VText_Expandable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VText_Expandable$b;->a:Lv/VText_Expandable;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object p0, p0, Lv/VText_Expandable$b;->a:Lv/VText_Expandable;

    .line 8
    .line 9
    iget-object p0, p0, Lv/VText_Expandable;->a:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    sub-int/2addr v1, p0

    .line 16
    invoke-static {v0, v1}, Lv/VText_Expandable;->f(Lv/VText_Expandable;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
