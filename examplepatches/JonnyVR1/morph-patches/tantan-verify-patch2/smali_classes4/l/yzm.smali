.class public final synthetic Ll/yzm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zzm;

.field public final synthetic b:Ll/v0t;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:I

.field public final synthetic e:Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

.field public final synthetic f:Ljava/lang/Runnable;

.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(Ll/zzm;Ll/v0t;Landroid/view/View;ILcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;Ljava/lang/Runnable;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yzm;->a:Ll/zzm;

    iput-object p2, p0, Ll/yzm;->b:Ll/v0t;

    iput-object p3, p0, Ll/yzm;->c:Landroid/view/View;

    iput p4, p0, Ll/yzm;->d:I

    iput-object p5, p0, Ll/yzm;->e:Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    iput-object p6, p0, Ll/yzm;->f:Ljava/lang/Runnable;

    iput p7, p0, Ll/yzm;->g:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yzm;->a:Ll/zzm;

    iget-object v1, p0, Ll/yzm;->b:Ll/v0t;

    iget-object v2, p0, Ll/yzm;->c:Landroid/view/View;

    iget v3, p0, Ll/yzm;->d:I

    iget-object v4, p0, Ll/yzm;->e:Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    iget-object v5, p0, Ll/yzm;->f:Ljava/lang/Runnable;

    iget v6, p0, Ll/yzm;->g:I

    invoke-static/range {v0 .. v6}, Ll/zzm;->F(Ll/zzm;Ll/v0t;Landroid/view/View;ILcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;Ljava/lang/Runnable;I)V

    return-void
.end method
