.class public final synthetic Ll/ol;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/pej0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ol;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ol;->b:Ll/x20;

    iput-object p3, p0, Ll/ol;->c:Ll/pej0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ol;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/ol;->b:Ll/x20;

    iget-object p0, p0, Ll/ol;->c:Ll/pej0;

    invoke-static {v0, v1, p0, p1}, Ll/sm;->O(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Landroid/view/View;)V

    return-void
.end method
