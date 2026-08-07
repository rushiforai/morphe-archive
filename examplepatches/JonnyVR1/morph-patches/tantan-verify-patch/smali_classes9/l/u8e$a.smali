.class public Ll/u8e$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u8e;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

.field public final synthetic c:Ll/u8e;


# direct methods
.method public constructor <init>(Ll/u8e;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u8e$a;->c:Ll/u8e;

    .line 2
    .line 3
    iput-object p2, p0, Ll/u8e$a;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    iput-object p3, p0, Ll/u8e$a;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/u8e$a;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/u8e$a;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 p2, 0x2

    .line 16
    if-ne p1, p2, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/u8e$a;->c:Ll/u8e;

    .line 19
    .line 20
    iget-object p0, p0, Ll/u8e$a;->b:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/u8e;->e(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
