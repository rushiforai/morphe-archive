.class public final synthetic Ll/g7y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g7y;->a:Lcom/p1/mobile/android/app/Act;

    iput-boolean p2, p0, Ll/g7y;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g7y;->a:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/g7y;->b:Z

    invoke-static {v0, p0}, Ll/l7y;->a(Lcom/p1/mobile/android/app/Act;Z)V

    return-void
.end method
