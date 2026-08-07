.class public Ll/kd2;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kd2;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Ll/kd2;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kd2;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic l(Ll/kd2;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kd2;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/kd2;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jwu;->z(Ljava/lang/String;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/id2;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/id2;-><init>(Ll/kd2;Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/jd2;

    .line 16
    .line 17
    invoke-direct {v2, p0, p1}, Ll/jd2;-><init>(Ll/kd2;Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "reqCheck"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/lbl0;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
