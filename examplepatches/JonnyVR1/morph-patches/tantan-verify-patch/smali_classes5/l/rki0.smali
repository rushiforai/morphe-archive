.class public final synthetic Ll/rki0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/VerificationCenter;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/putong/core/data/VerificationCenter;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rki0;->a:Lcom/p1/mobile/android/app/Dialog;

    iput-object p2, p0, Ll/rki0;->b:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    iput-object p3, p0, Ll/rki0;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rki0;->a:Lcom/p1/mobile/android/app/Dialog;

    iget-object v1, p0, Ll/rki0;->b:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    iget-object p0, p0, Ll/rki0;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0}, Ll/zki0;->p(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/putong/core/data/VerificationCenter;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
