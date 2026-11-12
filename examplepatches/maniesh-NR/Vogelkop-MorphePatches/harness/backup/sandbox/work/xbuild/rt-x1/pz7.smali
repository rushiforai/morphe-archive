.class public final Lpz7;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcq3;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcq3;Lhy7;)V
    .registers 5

    iget-object v0, p1, Lcq3;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/hype/emoji/EmojiTextView;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lpz7;->b:Lcq3;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Ljf7;

    const/16 v1, 0x9

    invoke-direct {v0, p0, p2, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
