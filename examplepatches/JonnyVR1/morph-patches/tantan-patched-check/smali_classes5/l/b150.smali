.class public final synthetic Ll/b150;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ll/x150;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ll/x150;Ljava/util/List;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b150;->a:Ll/x150;

    iput-object p2, p0, Ll/b150;->b:Ljava/util/List;

    iput-object p3, p0, Ll/b150;->c:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/b150;->a:Ll/x150;

    iget-object v1, p0, Ll/b150;->b:Ljava/util/List;

    iget-object v2, p0, Ll/b150;->c:Ljava/util/Map;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Ll/x150;->z(Ll/x150;Ljava/util/List;Ljava/util/Map;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
