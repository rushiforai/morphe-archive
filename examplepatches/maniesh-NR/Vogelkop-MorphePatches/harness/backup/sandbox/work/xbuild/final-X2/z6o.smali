.class public final Lz6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Lcom/google/android/material/button/MaterialButton;

.field public final c:Ly6o;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/google/android/material/button/MaterialButton;Ly6o;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz6o;->a:Landroid/view/View;

    iput-object p2, p0, Lz6o;->b:Lcom/google/android/material/button/MaterialButton;

    iput-object p3, p0, Lz6o;->c:Ly6o;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lz6o;->a:Landroid/view/View;

    return-object p0
.end method
