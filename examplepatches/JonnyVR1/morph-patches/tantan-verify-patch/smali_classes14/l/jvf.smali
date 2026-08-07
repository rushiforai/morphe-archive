.class public final synthetic Ll/jvf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/FacebookApi;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/FacebookApi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jvf;->a:Lcom/p1/mobile/putong/api/api/FacebookApi;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/api/FacebookApi;->j(Lcom/p1/mobile/putong/api/api/FacebookApi;Ljava/lang/Throwable;)V

    return-void
.end method
