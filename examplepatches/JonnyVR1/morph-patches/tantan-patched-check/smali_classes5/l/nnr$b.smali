.class public Ll/nnr$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nnr;->A(Landroid/view/Menu;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:J

.field public final synthetic b:Ll/nnr;


# direct methods
.method public constructor <init>(Ll/nnr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nnr$b;->b:Ll/nnr;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/nnr$b;->a:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x3e8

    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/nnr$b;->a:J

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p0, Ll/nnr$b;->b:Ll/nnr;

    .line 29
    .line 30
    invoke-static {p0}, Ll/nnr;->n(Ll/nnr;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->yk(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
