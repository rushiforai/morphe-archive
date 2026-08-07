.class public final synthetic Ll/r2e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/abe0;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/abe0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2e0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/r2e0;->b:Ll/abe0;

    iput-object p3, p0, Ll/r2e0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r2e0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/r2e0;->b:Ll/abe0;

    iget-object p0, p0, Ll/r2e0;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, v1, p0, p1}, Ll/s2e0;->e(Lcom/p1/mobile/android/app/Act;Ll/abe0;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
