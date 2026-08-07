.class public final synthetic Ll/w050;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Ll/x150;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/x150;Ljava/util/Map;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w050;->a:Ll/x150;

    iput-object p2, p0, Ll/w050;->b:Ljava/util/Map;

    iput-object p3, p0, Ll/w050;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/w050;->a:Ll/x150;

    iget-object v1, p0, Ll/w050;->b:Ljava/util/Map;

    iget-object v2, p0, Ll/w050;->c:Ljava/util/ArrayList;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Ll/x150;->d(Ll/x150;Ljava/util/Map;Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
