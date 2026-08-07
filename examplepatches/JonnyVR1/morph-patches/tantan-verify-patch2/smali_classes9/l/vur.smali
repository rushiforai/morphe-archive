.class public final synthetic Ll/vur;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/vur;->a:Z

    iput-object p2, p0, Ll/vur;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/vur;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/vur;->a:Z

    iget-object v1, p0, Ll/vur;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/vur;->c:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAnchorCheckAct;->Z1(ZLcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveVerificationCenter;)V

    return-void
.end method
