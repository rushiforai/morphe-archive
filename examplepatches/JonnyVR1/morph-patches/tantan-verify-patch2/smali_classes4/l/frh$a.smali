.class public Ll/frh$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e2m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/frh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public e:Z

.field public f:Lcom/p1/mobile/putong/core/newui/home/d;

.field public g:Ll/ttl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;ZLl/ttl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/frh$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    iput-object p3, p0, Ll/frh$a;->b:Landroid/view/View;

    .line 9
    .line 10
    iput-object p4, p0, Ll/frh$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 11
    .line 12
    iput-boolean p5, p0, Ll/frh$a;->e:Z

    .line 13
    .line 14
    iput-object p6, p0, Ll/frh$a;->g:Ll/ttl;

    .line 15
    .line 16
    const-string p1, "p_poi_nearby_card"

    .line 17
    .line 18
    invoke-static {p2, p1, p5, p4}, Ll/brh;->a(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/SwipeDirection;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/frh$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 23
    .line 24
    return-void
.end method
