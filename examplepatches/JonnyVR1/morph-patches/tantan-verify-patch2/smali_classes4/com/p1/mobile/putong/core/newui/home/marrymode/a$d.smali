.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;->b:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "red_dot_state"

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p1, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    filled-new-array {p1}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "e_marriage_event_home_entrance"

    .line 15
    .line 16
    const-string v1, "p_marriage_home"

    .line 17
    .line 18
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;->b:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->d:Landroid/view/View;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$d;->b:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/f4x;->H0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
