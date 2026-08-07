.class public Ll/wgx$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wgx;->L(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ll/wgx;


# direct methods
.method public constructor <init>(Ll/wgx;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wgx$j;->c:Ll/wgx;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wgx$j;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Ll/wgx$j;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wgx$j;->c:Ll/wgx;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wgx$j;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wgx$j;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/wgx;->u(Ll/wgx;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
