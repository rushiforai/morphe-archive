.class public final synthetic Ll/u4i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/b5i;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/b5i;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u4i;->a:Ll/b5i;

    iput-object p2, p0, Ll/u4i;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u4i;->a:Ll/b5i;

    iget-object p0, p0, Ll/u4i;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/b5i;->b(Ll/b5i;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
