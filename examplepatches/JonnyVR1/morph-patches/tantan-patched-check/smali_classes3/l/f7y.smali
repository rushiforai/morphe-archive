.class public final synthetic Ll/f7y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f7y;->a:Lcom/p1/mobile/android/app/Act;

    iput-boolean p2, p0, Ll/f7y;->b:Z

    iput-boolean p3, p0, Ll/f7y;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f7y;->a:Lcom/p1/mobile/android/app/Act;

    iget-boolean v1, p0, Ll/f7y;->b:Z

    iget-boolean p0, p0, Ll/f7y;->c:Z

    invoke-static {v0, v1, p0}, Ll/l7y;->b(Lcom/p1/mobile/android/app/Act;ZZ)V

    return-void
.end method
