.class public final synthetic Ll/dl3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dl3;->a:Lcom/p1/mobile/android/app/Dialog;

    iput-object p2, p0, Ll/dl3;->b:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dl3;->a:Lcom/p1/mobile/android/app/Dialog;

    iget-object p0, p0, Ll/dl3;->b:Ll/l4g0;

    invoke-static {v0, p0}, Ll/hl3;->j(Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V

    return-void
.end method
