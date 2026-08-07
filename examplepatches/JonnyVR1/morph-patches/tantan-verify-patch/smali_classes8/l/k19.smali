.class public final synthetic Ll/k19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x19;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/x19;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k19;->a:Ll/x19;

    iput-object p2, p0, Ll/k19;->b:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    iput-object p3, p0, Ll/k19;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k19;->a:Ll/x19;

    iget-object v1, p0, Ll/k19;->b:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    iget-object p0, p0, Ll/k19;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Ll/x19;->d(Ll/x19;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
