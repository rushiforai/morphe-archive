.class public final synthetic Ll/rcd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rcd;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/rcd;->b:Z

    iput p3, p0, Ll/rcd;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rcd;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/rcd;->b:Z

    iget p0, p0, Ll/rcd;->c:I

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->t3(Ljava/lang/String;ZILl/uxj0;)V

    return-void
.end method
