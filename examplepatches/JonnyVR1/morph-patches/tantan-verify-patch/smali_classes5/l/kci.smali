.class public final synthetic Ll/kci;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kci;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/kci;->b:Lcom/p1/mobile/putong/data/User;

    iput p3, p0, Ll/kci;->c:I

    iput-boolean p4, p0, Ll/kci;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kci;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/kci;->b:Lcom/p1/mobile/putong/data/User;

    iget v2, p0, Ll/kci;->c:I

    iget-boolean p0, p0, Ll/kci;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/pci;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;IZ)V

    return-void
.end method
