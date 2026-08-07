.class public final synthetic Ll/hn40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ln40;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/ln40;Ljava/util/List;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hn40;->a:Ll/ln40;

    iput-object p2, p0, Ll/hn40;->b:Ljava/util/List;

    iput-object p3, p0, Ll/hn40;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hn40;->a:Ll/ln40;

    iget-object v1, p0, Ll/hn40;->b:Ljava/util/List;

    iget-object p0, p0, Ll/hn40;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Ll/ln40;->a(Ll/ln40;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
