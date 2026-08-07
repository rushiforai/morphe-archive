.class public final synthetic Ll/gvo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/hvo;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/hvo;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gvo;->a:Ljava/util/List;

    iput-object p2, p0, Ll/gvo;->b:Ll/hvo;

    iput-object p3, p0, Ll/gvo;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/gvo;->a:Ljava/util/List;

    iget-object v1, p0, Ll/gvo;->b:Ll/hvo;

    iget-object v2, p0, Ll/gvo;->c:Ljava/util/List;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Ll/hvo;->f(Ljava/util/List;Ll/hvo;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
