.class public final Lb38;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"

# interfaces
.implements Lpkb;


# static fields
.field public static final synthetic d:I


# instance fields
.field public final b:Lypd;

.field public c:I


# direct methods
.method public constructor <init>(Lcom/opera/android/custom_views/StylingImageButton;Lypd;)V
    .registers 4

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lb38;->b:Lypd;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lyk4;

    const/16 v0, 0x14

    invoke-direct {p2, p0, v0}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final getGroupId()I
    .registers 1

    iget p0, p0, Lb38;->c:I

    return p0
.end method
