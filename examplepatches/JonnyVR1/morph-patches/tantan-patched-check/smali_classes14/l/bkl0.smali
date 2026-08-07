.class public final synthetic Ll/bkl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ckl0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/ckl0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bkl0;->a:Ll/ckl0;

    iput-object p2, p0, Ll/bkl0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkl0;->a:Ll/ckl0;

    iget-object p0, p0, Ll/bkl0;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/ckl0;->l(Ll/ckl0;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method
