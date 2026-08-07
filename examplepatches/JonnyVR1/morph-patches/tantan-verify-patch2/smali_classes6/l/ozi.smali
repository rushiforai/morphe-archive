.class public final synthetic Ll/ozi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ozi;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ozi;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ozi;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/ozi;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, p0}, Ll/rzi;->C(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
