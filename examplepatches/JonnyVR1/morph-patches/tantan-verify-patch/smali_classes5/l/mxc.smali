.class public final synthetic Ll/mxc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Z

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mxc;->a:Lcom/p1/mobile/android/app/Act;

    iput-boolean p2, p0, Ll/mxc;->b:Z

    iput p3, p0, Ll/mxc;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mxc;->a:Lcom/p1/mobile/android/app/Act;

    iget-boolean v1, p0, Ll/mxc;->b:Z

    iget p0, p0, Ll/mxc;->c:I

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Ei(Lcom/p1/mobile/android/app/Act;ZILjava/lang/String;)V

    return-void
.end method
