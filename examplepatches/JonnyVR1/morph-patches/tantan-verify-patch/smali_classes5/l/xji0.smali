.class public final synthetic Ll/xji0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xji0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/xji0;->b:Lcom/p1/mobile/android/app/Dialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xji0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/xji0;->b:Lcom/p1/mobile/android/app/Dialog;

    invoke-static {v0, p0}, Ll/zki0;->s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;)V

    return-void
.end method
