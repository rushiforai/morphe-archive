.class public final Llj8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lre5;


# instance fields
.field public final a:Landroid/view/ViewGroup;

.field public final b:Ln4l;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Ln4l;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llj8;->a:Landroid/view/ViewGroup;

    iput-object p2, p0, Llj8;->b:Ln4l;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Llj8;->a:Landroid/view/ViewGroup;

    return-object p0
.end method
