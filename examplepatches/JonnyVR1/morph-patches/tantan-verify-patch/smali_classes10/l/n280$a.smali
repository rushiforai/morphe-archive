.class public Ll/n280$a;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n280;->M4(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/n280;


# direct methods
.method public constructor <init>(Ll/n280;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n280$a;->a:Ll/n280;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i(Ll/n280$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n280$a;->j()V

    return-void
.end method

.method private synthetic j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n280$a;->a:Ll/n280;

    .line 2
    .line 3
    iget-object v0, v0, Ll/n280;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/n280$a;->a:Ll/n280;

    .line 10
    .line 11
    iget-object p0, p0, Ll/n280;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public d(Ll/so0;)V
    .locals 3
    .param p1    # Ll/so0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/wo0;->d(Ll/so0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/n280$a;->a:Ll/n280;

    .line 5
    .line 6
    iget-object p1, p1, Ll/n280;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    new-instance v0, Ll/m280;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/m280;-><init>(Ll/n280$a;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v1, 0xc8

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method
