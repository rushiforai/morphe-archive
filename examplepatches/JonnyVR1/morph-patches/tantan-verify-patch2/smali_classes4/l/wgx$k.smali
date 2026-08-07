.class public Ll/wgx$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wgx;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/wgx;


# direct methods
.method public constructor <init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wgx$k;->b:Ll/wgx;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wgx$k;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wgx$k;->b:Ll/wgx;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wgx$k;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p0, v1}, Ll/wgx;->a(Lcom/p1/mobile/android/app/Act;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
