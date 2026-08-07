.class public final synthetic Ll/uyi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uyi;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/uyi;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-boolean p3, p0, Ll/uyi;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uyi;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/uyi;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-boolean p0, p0, Ll/uyi;->c:Z

    invoke-static {v0, v1, p0}, Ll/rzi;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method
