.class public final synthetic Ll/lb50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mb50;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/OfficialAdvertData;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/mb50;Lcom/p1/mobile/putong/core/data/OfficialAdvertData;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lb50;->a:Ll/mb50;

    iput-object p2, p0, Ll/lb50;->b:Lcom/p1/mobile/putong/core/data/OfficialAdvertData;

    iput-object p3, p0, Ll/lb50;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lb50;->a:Ll/mb50;

    iget-object v1, p0, Ll/lb50;->b:Lcom/p1/mobile/putong/core/data/OfficialAdvertData;

    iget-object p0, p0, Ll/lb50;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Ll/mb50;->k(Ll/mb50;Lcom/p1/mobile/putong/core/data/OfficialAdvertData;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
