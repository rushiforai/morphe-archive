.class public final Ljt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;B)V
    .registers 3

    iput-byte p2, p0, Ljt;->a:B

    iput-object p1, p0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Ljt;->a:B

    iget-object p0, p0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    return-object p0
.end method
