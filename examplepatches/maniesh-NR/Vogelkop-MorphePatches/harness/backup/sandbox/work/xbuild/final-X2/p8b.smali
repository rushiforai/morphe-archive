.class public final Lp8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic a:Lth6;

.field public final synthetic b:I

.field public final synthetic c:D

.field public final synthetic d:D

.field public final synthetic e:D

.field public final synthetic f:D

.field public final synthetic g:Ltn;


# direct methods
.method public constructor <init>(Ltn;Lth6;IDDDD)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lp8b;->a:Lth6;

    iput p3, p0, Lp8b;->b:I

    iput-wide p4, p0, Lp8b;->c:D

    iput-wide p6, p0, Lp8b;->d:D

    iput-wide p8, p0, Lp8b;->e:D

    iput-wide p10, p0, Lp8b;->f:D

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lp8b;->g:Ltn;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 16

    iget-object p1, p0, Lp8b;->a:Lth6;

    invoke-virtual {p1}, Lth6;->getCount()I

    move-result p2

    const/4 p4, 0x1

    sub-int/2addr p2, p4

    iget-object p5, p0, Lp8b;->g:Ltn;

    if-ne p3, p2, :cond_1f

    invoke-virtual {p5}, Ltn;->v()V

    iget-wide v6, p0, Lp8b;->e:D

    iget-wide v8, p0, Lp8b;->f:D

    iget-object v0, p0, Lp8b;->g:Ltn;

    iget v1, p0, Lp8b;->b:I

    iget-wide v2, p0, Lp8b;->c:D

    iget-wide v4, p0, Lp8b;->d:D

    invoke-virtual/range {v0 .. v9}, Ltn;->J(IDDDD)V

    return-void

    :cond_1f
    invoke-virtual {p1, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;

    iget-wide p0, p0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;->a:D

    iget-object p2, p5, Ltn;->d:Ljava/lang/Object;

    check-cast p2, Lga6;

    invoke-virtual {p2, p0, p1}, Lga6;->q(D)V

    invoke-virtual {p5}, Ltn;->v()V

    iput-boolean p4, p5, Ltn;->a:Z

    return-void
.end method
