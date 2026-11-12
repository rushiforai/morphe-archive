.class public final Lwm9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/widget/LinearLayout;

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final d:Landroid/widget/LinearLayout;

.field public final e:Llwk;

.field public final f:Lcom/google/android/material/button/MaterialButton;

.field public final g:Llwk;

.field public final h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final i:Llwk;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;Llwk;Lcom/google/android/material/button/MaterialButton;Llwk;Lcom/opera/android/ui/catalog/widget/OperaListItem;Llwk;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwm9;->a:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lwm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p3, p0, Lwm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p4, p0, Lwm9;->d:Landroid/widget/LinearLayout;

    iput-object p5, p0, Lwm9;->e:Llwk;

    iput-object p6, p0, Lwm9;->f:Lcom/google/android/material/button/MaterialButton;

    iput-object p7, p0, Lwm9;->g:Llwk;

    iput-object p8, p0, Lwm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p9, p0, Lwm9;->i:Llwk;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lwm9;->a:Landroid/widget/LinearLayout;

    return-object p0
.end method
