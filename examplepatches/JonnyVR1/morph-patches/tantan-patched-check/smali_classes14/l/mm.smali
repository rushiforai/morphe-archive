.class public final synthetic Ll/mm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mm;->a:Ll/y20;

    iput-object p2, p0, Ll/mm;->b:Ljava/util/List;

    iput-object p3, p0, Ll/mm;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/mm;->a:Ll/y20;

    iget-object v1, p0, Ll/mm;->b:Ljava/util/List;

    iget-object v2, p0, Ll/mm;->c:Ljava/util/List;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Ll/sm;->M(Ll/y20;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
