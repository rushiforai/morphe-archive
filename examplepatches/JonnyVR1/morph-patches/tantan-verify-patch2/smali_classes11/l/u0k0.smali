.class public final synthetic Ll/u0k0;
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

    iput-boolean p1, p0, Ll/u0k0;->a:Z

    iput-object p2, p0, Ll/u0k0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/u0k0;->a:Z

    iget-object p0, p0, Ll/u0k0;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/data/UpdateApiResult;

    invoke-static {v0, p0, p1}, Ll/d1k0;->c(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/UpdateApiResult;)V

    return-void
.end method
