.class public final synthetic Ll/dsk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/dsk;->a:Z

    iput-object p2, p0, Ll/dsk;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/dsk;->a:Z

    iget-object p0, p0, Ll/dsk;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/data/MobileRespInfo;

    invoke-static {v0, p0, p1}, Ll/qtk;->t0(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/MobileRespInfo;)V

    return-void
.end method
