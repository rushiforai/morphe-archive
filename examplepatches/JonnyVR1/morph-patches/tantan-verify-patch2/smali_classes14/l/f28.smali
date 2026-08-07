.class public final synthetic Ll/f28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f28;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/f28;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/f28;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f28;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/f28;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/f28;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->e5(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
