.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/a$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->l(Lcom/p1/mobile/putong/core/newui/home/marrymode/MarrModeProfileCardView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$h;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$h;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f4x;->S0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->H3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
