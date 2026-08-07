.class public Ll/snc0$a;
.super Ll/pn50;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/snc0;->j(Landroid/view/View;Ljava/util/List;ZLcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>(Landroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snc0$a;->b:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/pn50;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/pn50;->b(II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/snc0$a;->b:Landroid/widget/PopupWindow;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
