.class public final synthetic Ll/c8d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c8d;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/c8d;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/c8d;->c:Z

    iput p4, p0, Ll/c8d;->d:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c8d;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/c8d;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean v2, p0, Ll/c8d;->c:Z

    iget p0, p0, Ll/c8d;->d:I

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->s8(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZI)V

    return-void
.end method
