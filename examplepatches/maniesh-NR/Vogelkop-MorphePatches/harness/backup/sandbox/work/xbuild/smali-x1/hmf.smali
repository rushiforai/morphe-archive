.class public final Lhmf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/View;

.field public final c:Lcom/google/android/material/checkbox/MaterialCheckBox;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/google/android/material/checkbox/MaterialCheckBox;B)V
    .registers 4

    iput-byte p3, p0, Lhmf;->a:B

    iput-object p1, p0, Lhmf;->b:Landroid/view/View;

    iput-object p2, p0, Lhmf;->c:Lcom/google/android/material/checkbox/MaterialCheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lhmf;->a:B

    iget-object p0, p0, Lhmf;->b:Landroid/view/View;

    return-object p0
.end method
