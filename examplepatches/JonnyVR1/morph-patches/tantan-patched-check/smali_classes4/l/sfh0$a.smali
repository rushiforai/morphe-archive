.class public Ll/sfh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e2m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sfh0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/tel;

.field public b:Ll/yfl;

.field public c:Ll/ik4;

.field public d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public e:Z

.field public f:Lcom/p1/mobile/putong/core/newui/home/d;

.field public g:Z


# direct methods
.method public constructor <init>(Ll/tel;Ll/yfl;Ll/ik4;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/sfh0$a;->g:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/sfh0$a;->a:Ll/tel;

    .line 8
    .line 9
    iput-object p2, p0, Ll/sfh0$a;->b:Ll/yfl;

    .line 10
    .line 11
    iput-object p3, p0, Ll/sfh0$a;->c:Ll/ik4;

    .line 12
    .line 13
    iput-object p4, p0, Ll/sfh0$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 14
    .line 15
    iput-boolean p5, p0, Ll/sfh0$a;->e:Z

    .line 16
    .line 17
    iget-boolean p1, p1, Ll/tel;->g:Z

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/yfl;->r0()Ll/f1g0;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p3, p5, p1, p4, p2}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;->d(Ll/ik4;ZZLcom/p1/mobile/putong/core/data/SwipeDirection;Ll/f1g0;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/sfh0$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 28
    .line 29
    return-void
.end method
