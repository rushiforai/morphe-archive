.class public final synthetic Ll/vl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/pej0;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vl;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/vl;->b:Ll/x20;

    iput-object p3, p0, Ll/vl;->c:Ll/pej0;

    iput-object p4, p0, Ll/vl;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vl;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/vl;->b:Ll/x20;

    iget-object v2, p0, Ll/vl;->c:Ll/pej0;

    iget-object p0, p0, Ll/vl;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0, p1}, Ll/sm;->w(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Ll/x20;Landroid/view/View;)V

    return-void
.end method
