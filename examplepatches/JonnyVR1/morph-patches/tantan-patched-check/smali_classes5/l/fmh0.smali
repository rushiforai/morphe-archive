.class public final synthetic Ll/fmh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fmh0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/fmh0;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/fmh0;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fmh0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/fmh0;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/fmh0;->c:Ll/x20;

    check-cast p1, Ljava/lang/Boolean;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1, p2}, Ll/imh0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
